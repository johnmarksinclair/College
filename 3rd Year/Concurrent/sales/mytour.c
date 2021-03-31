#include "mytour.h"

void my_tour(const point cities[], int tour[], int ncities)
{
  simple_find_tour(cities, tour, ncities);
  // convert cities to 2d array
  // return tsp(cities, tour, 0, ncities, 0, 0, 0);
}

// int tsp(int cities[][], int tour[], int currentPos, int ncities, int count, int cost, int ans)
// {
//   if (count == ncities && cities[currentPos][0] > 0)
//   {
//     if (ans > cost + cities[currentPos][0])
//     {
//       ans = cost + cities[currentPos][0];
//     }
//     return ans;
//   }

//   for (int i = 0; i < ncities; i++)
//   {
//     if (tour[i] == 0 && cities[currentPos][i] > 0)
//     {
//       tour[i] = 1;
//       ans = tsp(cities, tour, i, ncities, count + 1, cost + cities[currentPos][i], ans);
//       tour[i] = 0;
//     }
//   }

//   return ans;
// }