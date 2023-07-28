PROGRAM gauss_jordan
    implicit none
    integer,parameter :: n=4
    real,dimension(n,n) :: a,iden
    real,dimension(n) :: b
    integer :: i,j,k
    real :: lamda
    
    a=reshape((/1,1,-2,1,3,-4,3,-3,-4/),(/3,3/))
    b=(/9,13,40/)
    iden=0.
    do i=1,n
        iden(i,i)=1.
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
end program gauss_jordan
