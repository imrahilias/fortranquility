.PHONY: all clean

all: corran

clean:
	rm corran fibonacci.dat fibonacci.png gauss_fibonacci.png gauss_lincon.png gauss_rng.png lincon.dat lincon.png rng.dat rng.png

corran: corran.f90 corran.gp
	gfortran -Og -Wall -fimplicit-none -fcheck=all -fbacktrace -o corran corran.f90
	./corran
	gnuplot corran.gp
