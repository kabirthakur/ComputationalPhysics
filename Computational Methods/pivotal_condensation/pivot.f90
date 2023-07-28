PROGRAM pivot
    IMPLICIT NONE
    INTEGER :: n
    REAL, DIMENSION(:,:),allocatable :: a
    INTEGER :: i,j
    REAL :: lamda,det=1

	open(3,file='matrix.txt',status='old',action='read')
	read(3,*)n
	allocate(a(n,n))
	do i=1,n
		read(3,*)a(i,:)
	end do
	WRITE(*,*)"Matrix A "
	do i=1,n
		WRITE(*,*)(a(i,j),j=1,n)
	end do

!Condensation

	do i=1,n-1
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
	
	
	open(1, file = 'data.txt', status = 'old')
	do i=1,n
    		write(1,100)(a(i,j),j=1,n)
    		100 FORMAT ('',10F10.4)
    	end do
    	WRITE(1,*)det
end program pivot
