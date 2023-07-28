PROGRAM pivot
    IMPLICIT NONE
    INTEGER,PARAMETER :: n=3
    REAL, DIMENSION(n,n) :: a
    INTEGER :: i,j
    REAL :: lamda,det=1
!Matrix initialisation
 !   DO i=1,n
 !       DO j=1,n
 !           a(i,j)=100*i+2*j-3*j
 !       END DO
 !   END DO
    a=reshape((/4,-2,1,-2,4,-2,1,-2,4 /),(/3,3/))

!Writing the original matrix

    WRITE(*,*)"Matrix A "
    do i=1,n
        WRITE(*,*)(a(i,j),j=1,n)
    end do

!Condensation

    do i=1,n
        do j=i+1,n
            if (a(j,i)/=0) then
                lamda=a(j,i)/a(i,i)
                a(j,:)=a(j,:)-lamda*a(i,:)
            end if
        end do
    end do

!print condensed matrix

    WRITE(*,*)"Matrix A condensed form"
    do i=1,n
        WRITE(*,*)(a(i,j),j=1,n)
    end do

!calculate determinant

    do i=1,n
        det=det*a(i,i)
    end do
    WRITE(*,300)det
    300 FORMAT ('Determinant of the matrix is ', 8F6.3)

end program pivot
