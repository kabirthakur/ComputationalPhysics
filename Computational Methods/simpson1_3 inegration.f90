REAL FUNCTION f(x)
    IMPLICIT NONE
    REAL, INTENT(IN)::x
    f=LOG(x)
END FUNCTION f

PROGRAM simp1_3
    IMPLICIT NONE
    INTEGER, PARAMETER :: n=6
    REAL,DIMENSION(n) :: x
    REAL :: f
    REAL :: h,sum=0
    REAL :: a=1.,b=1.6
    INTEGER ::i
    h=(b-a)/n

    x(1)=a
    x(n)=b
    sum=f(a)+f(b)
    
    do i=1,n-1
        x(i)=a+i*h
        if (MOD(i,2)==1)then
            sum=sum+4*(f(x(i)))
        else
            sum=sum+2*(f(x(i)))
        end if
    end do

    sum=(h/3)*sum
    WRITE(*,*)sum
END PROGRAM simp1_3
