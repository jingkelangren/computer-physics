!numerical quadrature with the simpson rules
    !integrate t^(-2/3)(1-t)^(-1/3) from 0 to 1, the result is 2pi/3^(1/2)
    !using trapezoidal and simpson's rule respectly
program ex1_3    
implicit none 
    real:: x1,x2,h1,h2,a,b,c
    real:: ans1,ans2,ans,error
    real,external::f1,f2
    real,parameter::pi=3.1415
    real:: exact=2*pi/3**(0.5)
    integer :: i=1
    integer,parameter ::N=100000
   
    write(*,*) "please input c!"
    read(*,*) c
    if(c<0 .or. c>1) then
        write(*,*)"input error"
        stop
    end if 
    
    a=c**(1./3.)
    b=(1-c)**(1./3.)
    h1=a/real(N)
    h2=b/real(N)
    ans1=h1/3.*(f1(0.,h1)+f1(a,h1))
    ans2=h2/3.*(f2(0.,h2)+f2(b,h2))
    !trapezoidal method
    do i=1,N-1
        x1=real(i)*h1
        x2=real(i)*h2
        if (mod(i,2)==0) then
            ans1=ans1+2./3.*f1(x1,h1)
            ans2=ans2+2./3.*f2(x2,h2)
        else 
            ans1=ans1+4./3.*f1(x1,h1)
            ans2=ans2+4./3.*f2(x2,h2)
        end if
        
    end do
    
    ans=ans1+ans2
    error=abs(ans-exact)
    write(*,*) ans
    write(*,*)  error
    
    stop
    end program
    
    real function f1(x,h1)
    implicit none 
    real:: x,h1
    f1=h1*3.*((1-x**3.)**(-1./3.))
    return
    end function
    
    
real function f2(x,h2)
    implicit none 
    real:: x,h2
    f2=h2*(1-x**3.)**(-2./3.)*3.*x
    return
    end function