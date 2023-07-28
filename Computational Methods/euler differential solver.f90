REAL FUNCTION f(x,y)
    IMPLICIT NONE
    REAL, INTENT(IN)::x,y
    f=x*y
END FUNCTION f
PROGRAM euler
    implicit NONE
    REAL :: f
    INTEGER, PARAMETER :: n=6
    REAL,DIMENSION(n) :: x,y
    INTEGER ::i
    real :: xeval=0.1
    double precision ::h
    h=0.2
    x(1)=0
    y(1)=1.
    
    do i=1,n-1
        x(i+1)=x(i)+h
        y(i+1)=y(i)+h*f(x(i),y(i))
        write(*,*)x(i),y(i)
    end do
    
end PROGRAM euler
    

