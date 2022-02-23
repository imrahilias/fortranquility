! never trust a random number. test different random number generators:
! - linear congruence generator
! - fibonacci random number generator
! - standard random_number generator
! convert random number pairs to gauss pairs (x,y coordinates) via
! box-muller algorithm; plot 2d correlations.
! moritz siegel

program corran

  implicit none
  integer, parameter :: p=selected_real_kind(16), xd=1000
  integer, parameter :: b=43, d=28, m=100000 ! historical bad example: b=279, d=23456, m=1000
  integer :: c,x, r0, r01, r02, r(xd)
  real(kind=p), parameter :: pi=dacos(-1.d0)
  real(kind=p), dimension(xd) :: r1, r2, r3, e1, e2
  real(kind=p) :: omega, rho

  open(unit=1, file="lincon.dat")
  open(unit=2, file="fibonacci.dat")
  open(unit=3, file="rng.dat")

  call random_seed()

  do c=1,3
     select case (c)
     case ( 1 )
        r1 = lincon(43)
        r2 = lincon(26)
        r3 = lincon(52)        
     case ( 2 )
        r1 = fibonacci( 17, 99 )
        r2 = fibonacci( 22, 24 )
        r3 = fibonacci( 45, 26 )
     case ( 3 )
        call random_number(r1)
        call random_number(r2)
        call random_number(r3)
     end select

     call boxmuller()

     write(c,*) ( r1(x), r2(x), r3(x), e1(x), e2(x), new_line('a'), x=1,xd )
  end do

contains

  ! box muller alg: gauss random numbers from pairs of rand num
  subroutine boxmuller()    
    do x=1,xd 
       omega = 2*pi*r1(x)
       rho = -2*log(r2(x))
       e1(x) = sqrt(rho)*cos(omega)
       e2(x) = sqrt(rho)*sin(omega)
    end do
  end subroutine boxmuller

  ! linear congruence generator
  function lincon(r0)
    implicit none
    integer :: x, r0, r(xd)
    real(kind=p) :: lincon(xd)
    r(1) = modulo(r0*b + d,m)
    do x=2,xd
       r(x) = modulo(r(x-1)*b + d,m)
    end do
    lincon = real(r,kind=p) / real(m,kind=p)
  end function lincon

  ! fibonacci random number generator
  function fibonacci(r01, r02)
    implicit none
    integer :: x, r01, r02, r(xd)
    real(kind=p) :: fibonacci(xd)
    r(1) = modulo(r01 + r02, m)
    r(2) = modulo(r(1) + r02, m)
    do x=3,xd
       r(x) = modulo(r(x-2) + r(x-1),m)
    end do
    fibonacci = real(r,kind=p) / real(m,kind=p)
  end function fibonacci

end program corran
