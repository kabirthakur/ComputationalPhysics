REAL FUNCTION f(x)
    IMPLICIT NONE
    REAL, INTENT(IN)::x
    f=1/(1+x)
END FUNCTION f

PROGRAM trap
    IMPLICIT NONE
    INTEGER, PARAMETER :: n=5
    REAL,DIMENSION(n) :: x
    REAL :: f
    REAL :: h,sum=0
    REAL :: a=0.,b=5.
    INTEGER ::i
    h=(b-a)/n
   
    x(1)=a
    x(n)=b
    sum=f(a)+f(b)
    DO i=1,n-1
        x(i)=a+i*h
        sum=sum+2*(f(x(i)))
write(*,*)i,x(i)
    END DO
    sum=(h/2)*sum
    WRITE(*,*)sum
END PROGRAM trap
    

