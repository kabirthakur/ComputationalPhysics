PROGRAM gauss_siedel
	IMPLICIT NONE
	integer :: n
	real*8, dimension(:,:),allocatable :: a,a_new
	real*8, dimension(:),allocatable :: b,x,dummyc
	real*8, dimension(:), allocatable :: x1,x2,x3
	real*8,dimension(600) :: error=0
	integer :: er,nswap,l,i,j,k=1,sum=0,flag=0,iter,max_iter=200
	real :: dummy,cas,temp
	real*8 :: eval,e=0.5E-14


	open(3,file='matrix.txt',status='old',action='read')
	read(3,*)n
	allocate(a(n,n),b(n),x(n),a_new(n,n),dummyc(n))

	dummyc=0
	a_new=0
	do i=1,n
		read(3,*)a(i,:)
	end do
	read(3,*)b(:)
	read(3,*)x(:)	
	!check for diagonal dominance
    	do i=1,n
		WRITE(*,*)(a(i,j),j=1,n)
	end do
	do i=1,n
		do j=1,n
			if(i/=j) then
				sum=sum+a(i,j)
			end if
		end do
		if(ABS(a(i,i))>ABS(sum)) then
			flag=flag+1
		end if
	end do

	if(flag==n) then
		write(*,*)"Matrix is diagonally dominant"
	else 
		write(*,*)"Matrix is not diagonally dominant"
		do i=1,n
			dummy=MAXVAL(a(:,i))
			do j=1,n	
				if(a(j,i)==dummy) then					
					dummyc(i)=j
					!WRITE(*,*)j
				end if
			end do
		end do
		do i=1,n
			l=dummyc(i)
			a_new(:,l)=a(:,i)
			if(l/=i) then
				nswap=nswap+1
			end if
		end do 
		if(MOD(nswap,2)==0)then
			WRITE(*,*)"sign of det unchanged"
		else 
			WRITE(*,*)"Neg sign added to det"
		end if
		do i=1,n
			WRITE(*,*)(a_new(i,j),j=1,n)
		end do
		a=a_new						
	end if
    	er=4
	do iter=1,max_iter
		do i=1,n
			temp=0
			do j=1,n
				if(i/=j) then
				temp=temp+a(i,j)*x(j)
				end if
			end do
			x(i)=(1/a(i,i))*(b(i)-temp)
			error(k)=x(i)

			k=k+1
			
		end do
		
		if(iter>1)then
			eval=(ABS(error(er-3)-error(er)))
			
			er=er+3

			if(eval<e)then
			write(*,*)"exiting after iterations ",iter,eval
			exit
			end if
		end if
	end do

	allocate(x1(iter),x3(iter),x2(iter))

    	open(1, file = 'data.txt', status = 'old')
    	k=1
    	do i=1,iter
		x1(i)=error(k)
		x2(i)=error(k+1)
		x3(i)=error(k+2)
		k=k+3
    	end do
    	do i=1,iter
    		write(1,*)i,x1(i),x2(i),x3(i)
    	end do
    	
end program gauss_siedel
