reset
unset key
set size square
#set pm3d
#set view map
set hidden3d
#set cbr [1e-5:]
#set xrange [-10000:10000]
#set yrange [-10000:10000]
#set xlabel 'x'
#set ylabel 'y'
set term png size 1920,1080
set out 'lincon.png'
sp 'lincon.dat' u 1:2:3

reset
unset key
set size square
#set pm3d
#set view map
set hidden3d
#set cbr [1e-5:]
#set xrange [-10000:10000]
#set yrange [-10000:10000]
#set xlabel 'x'
#set ylabel 'y'
set term png size 1920,1080
set out 'fibonacci.png'
sp 'fibonacci.dat' u 1:2:3

reset
unset key
set size square
#set pm3d
#set view map
set hidden3d
#set cbr [1e-5:]
#set xrange [-10000:10000]
#set yrange [-10000:10000]
#set xlabel 'x'
#set ylabel 'y'
set term png size 1920,1080
set out 'rng.png'
sp 'rng.dat' u 1:2:3

reset
unset key
set size square
#set pm3d
#set view map
set hidden3d
#set cbr [1e-5:]
#set xrange [-10000:10000]
#set yrange [-10000:10000]
#set xlabel 'x'
#set ylabel 'y'
set term png size 1920,1080
set out 'lincon_2d_correlation.png'
p 'lincon.dat' u 4:5

reset
unset key
set size square
#set pm3d
#set view map
set hidden3d
#set cbr [1e-5:]
#set xrange [-10000:10000]
#set yrange [-10000:10000]
#set xlabel 'x'
#set ylabel 'y'
set term png size 1920,1080
set out 'fibonacci_2d_correlation.png'
p 'fibonacci.dat' u 4:5

reset
unset key
set size square
#set pm3d
#set view map
set hidden3d
#set cbr [1e-5:]
#set xrange [-10000:10000]
#set yrange [-10000:10000]
#set xlabel 'x'
#set ylabel 'y'
set term png size 1920,1080
set out 'rng_2d_correlation.png'
p 'rng.dat' u 4:5