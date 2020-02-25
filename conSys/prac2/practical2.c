#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "cond.c"
// Global Variables
int acc_flag = 0; // 0 for producer, 1 for consumer
pthread_cond_t con_var = PTHREAD_COND_INITIALIZER;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
// We want threads to be "working" for less than a second
int work (int ms, struct timespec *ts) {
    ts->tv_sec = 0;
    ts->tv_nsec = 1000 * ms;
    nanosleep(ts,NULL);
    return 0;
}
// timespecs for producer and consumer
struct timespec tsP,tsC;
int pnum;  // number updated when producer runs.
int csum;  // sum computed using pnum when consumer runs.
int (*pred)(int); // predicate indicating number to be consumed

int produceT() {
  scanf("%d",&pnum); // read a number from stdin
  return pnum;
}

void *Produce(void *a) {
  int p;
  p=1;
  while (p) {
    printf("@P-WORK\n");
    work(100,&tsP); // "work" for 100ms
    printf("@P-READY\n");
    pthread_mutex_lock(&mutex);
    while(acc_flag == 1) {
      pthread_cond_wait(&con_var, &mutex);
    }
    p = produceT();
    acc_flag = 1;
    pthread_cond_signal(&con_var);
    pthread_mutex_unlock(&mutex);
    printf("@PRODUCED %d\n",p);
  }
  printf("@P-EXIT\n");
  pthread_exit(NULL);
}

int consumeT() {
  if ( pred(pnum) ) { csum += pnum; }
  return pnum;
}

void *Consume(void *a) {
  int p;
  p=1;
  while (p) {
    printf("@C-WORK\n");
    work(50+100*(rand()%3),&tsC); // "work" for 50ms, 150ms, or 250ms
    printf("@C-READY\n");
    pthread_mutex_lock(&mutex);
    while(acc_flag == 0) {
      pthread_cond_wait(&con_var, &mutex);
    }
    acc_flag = 0;
    p = consumeT();
    pthread_cond_signal(&con_var);
    pthread_mutex_unlock(&mutex);
    printf("@CONSUMED %d\n",csum);
  }
  printf("@C-EXIT\n");
  pthread_exit(NULL);
}

int main (int argc, const char * argv[]) {
  // the current number predicate
  static pthread_t prod,cons;
	long rc;
  pred = &cond1;
  if (argc>1) {
    if      (!strncmp(argv[1],"2",10)) { pred = &cond2; }
    else if (!strncmp(argv[1],"3",10)) { pred = &cond3; }
  }
  pnum = 999;
  csum=0;
  srand(time(0));
  printf("@P-CREATE\n");
 	rc = pthread_create(&prod,NULL,Produce,(void *)0);
	if (rc) {
			printf("@P-ERROR %ld\n",rc);
			exit(-1);
	}
  printf("@C-CREATE\n");
 	rc = pthread_create(&cons,NULL,Consume,(void *)0);
	if (rc) {
			printf("@C-ERROR %ld\n",rc);
			exit(-1);
	}
  printf("@P-JOIN\n");
  pthread_join( prod, NULL);
  printf("@C-JOIN\n");
  pthread_join( cons, NULL);
  printf("@CSUM=%d.\n",csum);
  return 0;
}
