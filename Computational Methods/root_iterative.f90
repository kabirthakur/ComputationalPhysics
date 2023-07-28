
REAL FUNCTION f1(x)             !polynomial function
    IMPLICIT NONE
    REAL, INTENT(IN)::x
    REAL :: z
    z=1./7
    
    f1=(8+2*(x**4)-x)**(z)
    
END FUNCTION f1

REAL FUNCTION f2(x)             !polynomial function
    IMPLICIT NONE
    REAL, INTENT(IN)::x
    REAL :: z
    z=1./5
    
    f2=(3*(x**2)-3*x+1)**z
    
END FUNCTION f2

PROGRAM root
    IMPLICIT NONE
    REAL :: f2
    REAL :: x=0. !initial guess
    REAL :: temp,fxp1
    INTEGER :: i
    DO i=0,200  !200 iteration by default
        temp=f2(x)
        x=temp
        fxp1=f2(temp)
!        WRITE(*,*) fxp1 !for printing all iterations
        IF(fxp1==temp) THEN     !precision to all significant digits
            exit
        END IF
        
     END DO
    
    WRITE(*,100)i+1
    100 FORMAT ('', "Number of iterations : ", I3)
    WRITE(*,200)fxp1
    200 FORMAT ('', "root : ",ES15.8)
END PROGRAM root

