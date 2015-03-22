#!/bin/bash
# a simple command to profile a benchmark
echo m2s --si-config config/$2 --si-sim detailed m2s-bench-amdapp-2.5-si/$1/$1 --load m2s-bench-amdapp-2.5-si/$1/$1_Kernels.bin -q
m2s --si-config config/$2 --si-sim detailed "m2s-bench-amdapp-2.5-si/$1/$1" --load $1_Kernels.bin -q
gprof /usr/local/bin/m2s gmon.out | gprof2dot/gprof2dot.py | dot -Teps -o "$3".eps
rm gmon.out
mv "$3".eps profile
