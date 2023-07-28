program differentiation
    implicit none
    integer,parameter :: n=7
    real :: f,h,sum=0
    real,dimension(n)::x,fx,fxd,fxd2
    integer :: i
    x=(/0.25,0.375,0.5,0.625,0.75,0.875,1./)
    fx=(/1.1035000,1.0260000,0.9250000,0.7966000,0.6363000,0.4393000,0.200000/)
    do i=1,n
        if(i+1>n) exit
        fxd(i)=(fx(i+1)-fx(i))/((x(i+1)-x(i)))
        write(*,*)i,fxd(i)
    end do
    
    do i=1,n
        if(i+1>n) then
            exit
        else if((i-1)==0) then
            cycle
        else
            fxd2(i)=(fx(i-1)-2*(fx(i))+(fx(i)))/((x(i+1)-x(i))**2)
        WRITE(*,*)i,fxd2(i)
        end if
    end do
        
    
end program differentiation
    
