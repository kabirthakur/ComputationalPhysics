PROGRAM gauss_jordan
	implicit none
	integer :: n
	real,dimension(:,:),allocatable :: a,iden
	real,dimension(:,:),allocatable :: b,c
	integer :: i,j,k
	real :: lamda

	open(3,file='matrix.txt',status='old',action='read')
	read(3,*)n
	allocate(a(n,n),b(n,n),iden(n,n),c(n,n))
	do i=1,n
		read(3,*)a(i,:)
	end do
	iden=0.
	b=a
	do i=1,n
		iden(i,i)=1.
	end do
	do i=1,n
		WRITE(*,*)(a(i,j),j=1,n)
	end do
	do i=1,n
		do j=1,n
			if (i==j) then
				if(a(i,i)/=1)then
					lamda=1/a(i,i)
					a(j,:)=a(j,:)*lamda
					iden(j,:)=iden(j,:)*lamda
				end if
			else
			!if(i/=j)then
				lamda=a(j,i)/a(i,i)
				a(j,:)=a(j,:)-lamda*a(i,:)
				iden(j,:)=iden(j,:)-lamda*iden(i,:)
			end if
		end do
	end do
	WRITE(*,*)'A inverse is'
	do i=1,n
		WRITE(*,*)(iden(i,j),j=1,n)
	end do
	WRITE(*,*)'final form of A matrix'

	do i=1,n
		WRITE(*,*)(a(i,j),j=1,n)
	end do
	
	WRITE(*,*)"Checking is answer is correct"
	c=MATMUL(iden,b)
	do i=1,n
	WRITE(*,*)(c(i,j),j=1,n)
	end do
end program gauss_jordan
