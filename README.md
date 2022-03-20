# Parallel LIPP
LIPP is a recent learned index from the paper,
> Jiacheng Wu, Yong Zhang, Shimin Chen, Yu Chen, Jin Wang, Chunxiao Xing: Updatable Learned Index with Precise Positions. Proc. VLDB Endow. 14(8): 1276-1288 (2021).

However, LIPP is only implemented in single thread mode. In this assignment, you will add LIPP support for concurrency (multi-thread).

## Getting Started
In any CSE linux machine, run
```
# allocate 16 cores
srun -A csci4160 -p csci4160 -c 16 --cpu_bind=socket -B 1:24 --pty bash
# get the environment
scl enable devtoolset-8 bash
```
Inside the repo folder
```
bash build.sh
```
to build the executable and run the test cases via
```
bash run.sh <1-3>
```
for testcases 1, 2, and 3.
Each test case use different dataset evaluated on 2, 4, 8, 16 threads with 200 million operations (half lookup and half insertion).

## Tasks
Work on src/core/lipp.h
1. Parallelize LIPP basic operations (function at(), insert()) using src/core/concurrency.h.
2. Parallelize LIPP adjustment phase.
3. Integrate epoch-based memory reclaimation, included as class member ebr. In particular, use ebr->scheduleForDeletion() to schedule a data structure for deletion.

You should make sure the index return the correct result by uncommenting line 201-204 in src/benchmark/benchmark.cpp. This has performance impacts so comment it back when benchmarking.
