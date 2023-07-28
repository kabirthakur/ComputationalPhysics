PROGRAM gauss_siedel
    IMPLICIT NONE
    integer, parameter :: n=4
    real, dimension(n,n) :: a
    real, dimension(n) :: b,x,y
    real,dimension(600) :: error=0
    integer :: i,j,k=1,sum=0,flag=0,iter,max_iter=200
    real :: temp,eval,e=0.5E-6

    !initial values
    a=reshape((/13,2,3,2,5,12,-4,1,-3,1,10,-3,1,-4,1,9/),(/4,4/))
    b=(/18,13,29,31/)
    x=(/0,0,0,0/)


    !check for diagonal dominance
    
    do i=1,n
        do j=1,n
            if(i/=j) then
                sum=sum+a(i,j)
            end if
        if(ABS(a(i,i))>ABS(sum)) then
            flag=flag+1
        end if
        end do
    end do

    if(flag==n) then
        write(*,*)"Matrix is diagonally dominant"
    end if
    
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
            if(iter>3)then
                eval=ABS(error(iter-3)-error(iter))
                
                    if(eval<e) then
                        write(*,*)"exiting after iterations ",iter
                        write(*,*)eval
                        exit
                    end if
            end if
    end do
    
    write(*,*)x
    
end program gauss_siedel
