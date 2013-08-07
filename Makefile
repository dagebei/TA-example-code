# Makefile for TA example

COV_CC=cov-translate --run-compile --dir ./cov-int-dir cc
COV_CXX=cov-translate --run-compile --dir ./cov-int-dir cc

CC=xlc
CXX=xlc++

cov_all: cov_calc1 cov_calc2

all: calc1 calc2

run: calc1 calc2
  echo 123 456 + 2 / = | ./calc1
	echo 123 + 456 / 2   | ./calc2

cov_calc1: calc1.cpp
	$(COV_CXX) calc1.cpp -o calc1
cov_calc2: calc2.c
	$(COV_CC) calc2.c -o calc2

calc1: calc1.cpp
	$(CXX) calc1.cpp -o $@
calc2: calc2.c
	$(CC) calc2.c -o $@

clean:
	rm -f *.o calc1 calc2
