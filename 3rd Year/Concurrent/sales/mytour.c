/*
 * Concurrent Systems
 * The Travelling Salesperson
 * John Sinclair 16325734 & Sanil Gupta 18322581
 * 
 * compile: gcc-10 -Wall -fopenmp sales.c mytour.c -o sales
 * run: ./sales <n>
 * 
 * OpenMP Utilities used:
 * #pragma omp
 *    parallel for
 *    omp_get_max_threads()
 *    parallel shared()
 *    for
 * 
 * Approach:
 * - initialised visited array with parr for loop
 * - defined an array of structs with an index for each thread
 * - ran the inner for loop in parallel where each thread had access to the shared arr
 * - when parr for completed got the index of the closest city from the shared arr
 * 
 * Results:
 * n = 50k
 * sequential - 22.2 mln ms - baseline
 * w/ 4 threads
 * parallel w/ pfor visited init - 20.5 mln ms - ~8% reduction
 * parallel w/ struct - 9.8 mln ms - ~56% reduction
 * w/ max threads
 * parallel w/ struct - 9.7 mln ms - ~57% reduction
 * 
 * n = 100k
 * sequential - 78 mln ms - baseline
 * w/ 4 threads
 * parallel w/ struct - 42.5 mln ms - ~46% reduction
 * w/ max threads
 * parallel w/ struct - 36.2 mln ms - ~54% reduction
 */

#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <omp.h>
#include <emmintrin.h>
#include <xmmintrin.h>
#include <alloca.h>
#include "mytour.h"

float square(float x)
{
  return x * x;
}

float distance(const point cities[], int i, int j)
{
  return sqrt(square(cities[i].x - cities[j].x) +
              square(cities[i].y - cities[j].y));
}

void parallel(const point cities[], int tour[], int ncities)
{
  int i, j;
  char *visited = alloca(ncities);
  int ThisPt = 0;
  int endtour = 0;

#pragma omp parallel for
  for (i = 0; i < ncities; i++)
    visited[i] = 0;

  ThisPt = ncities - 1;
  visited[ncities - 1] = 1;
  tour[endtour++] = ncities - 1;

  // define array of tvals
  typedef struct
  {
    float dist;
    int loc;
    char pad[128];
  } tvals;
  int num_threads = omp_get_max_threads(); //4;
  tvals *sharedinfo = alloca(num_threads * sizeof(tvals));

  for (i = 1; i < ncities; i++)
  {
#pragma omp parallel shared(sharedinfo)
    {
      int id = omp_get_thread_num();
      sharedinfo[id].dist = DBL_MAX;
#pragma omp for
      for (j = 0; j < ncities - 1; j++)
      {
        if (!visited[j])
        {
          if (distance(cities, ThisPt, j) < sharedinfo[id].dist)
          {
            sharedinfo[id].dist = distance(cities, ThisPt, j);
            sharedinfo[id].loc = j;
          }
        }
      }
    }

    int closest_city = -1;
    float closest_dist = DBL_MAX;
    for (int k = 0; k < num_threads; k++)
    {
      if (sharedinfo[k].dist < closest_dist)
      {
        closest_city = sharedinfo[k].loc;
        closest_dist = sharedinfo[k].dist;
      }
    }
    tour[endtour++] = closest_city;
    visited[closest_city] = 1;
    ThisPt = closest_city;
  }
}

void sequential(const point cities[], int tour[], int ncities)
{
  int i, j;
  char *visited = alloca(ncities);
  int ThisPt, ClosePt = 0;
  float CloseDist;
  int endtour = 0;

  for (i = 0; i < ncities; i++)
    visited[i] = 0;

  ThisPt = ncities - 1;
  visited[ncities - 1] = 1;
  tour[endtour++] = ncities - 1;

  for (i = 1; i < ncities; i++)
  {
    CloseDist = DBL_MAX;
    for (j = 0; j < ncities - 1; j++)
    {
      if (!visited[j])
      {
        if (distance(cities, ThisPt, j) < CloseDist)
        {
          CloseDist = distance(cities, ThisPt, j);
          ClosePt = j;
        }
      }
    }
    tour[endtour++] = ClosePt;
    visited[ClosePt] = 1;
    ThisPt = ClosePt;
  }
}

void my_tour(const point cities[], int tour[], int ncities)
{
  // if (ncities > 10000)
  parallel(cities, tour, ncities);
  // else
  // sequential(cities, tour, ncities);
}