PROGRAM eigen
    implicit none
    integer,parameter :: n=3
    real,dimension(n,n) :: a
    real,dimension(n) :: x,er,ev
    integer :: i,j,max_iter=200,iter
    real :: temp,e=0.5E-6,lamda
    
    a=reshape((/1,4,6,-3,4,3,2,-1,5/),(/3,3/))
    x=1.
    
    do iter=1,max_iter
        do i=1,n
            temp=0
            do j=1,n
                temp=temp+a(i,j)*x(j)
            end do
            ev(i)=temp
        end do
        x=ev
        lamda=MAXVAL(x)
        x=x/lamda
        er(iter)=lamda

        if(iter>1 .AND. ABS(er(iter)-(er(iter-1)))<e)then
            exit
        end if
    end do
write (*,*)'iterations',iter
write (*,*)'Largest eigenvalue ',lamda
write (*,*)'Eigevector ',x

end program eigen
