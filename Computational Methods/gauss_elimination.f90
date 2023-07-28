PROGRAM gausselim
    IMPLICIT NONE
    INTEGER,PARAMETER :: n=3
    REAL, DIMENSION(n,n) :: a
    REAL, DIMENSION(n) :: b
    INTEGER :: i,j,m
    REAL :: lamda,det=1,x

    a=reshape((/1.,1.,3.,4.,1.,-1.,-1.,-6.,-1./),(/3,3/))
    b=(/-5.,-12.,4./)

    do i=1,n
        do j=i+1,n
            if (a(j,i)/=0) then
                lamda=a(j,i)/a(i,i)
                a(j,:)=a(j,:)-lamda*a(i,:)
                b(j)=b(j)-lamda*b(i)
            end if
        end do
    end do

    WRITE(*,*)"Matrix A condensed form"
    do i=1,n
        WRITE(*,*)(a(i,j),j=1,n)
    end do

!back substitution
    b(n)=b(n)/a(n,n)

   DO i=n-1,1,-1
        m=i+1
        x=dot_product(a(i,m:n),b(m:n))
      
        b(i) = (b(i) - x)/a(i,i)
        
    END DO
    
    WRITE(*,*)b
end program gausselim


