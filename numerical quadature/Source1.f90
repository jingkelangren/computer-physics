!numerical quadrature with the Trapezoidal 
    !integrate t^(-2/3)(1-t)^(-1/3) from 0 to 1, the result is 2pi/3^(1/2)
    !using trapezoidal and simpson's rule respectly
program ex1_3
implicit none 
    real :: x,h1,h2,f,c
    real:: ans1=0.,ans2=0.,ans,error
    real,external::f1,f2
    integer :: i=1
    integer,parameter ::N=1000
    real,parameter::pi=3.1415
    real:: exact=2*pi/3**(0.5)
    
    write(*,*) "please input c!"
    read(*,*) c
    if(c<0 .or. c>1) then
        write(*,*)"input error"
        stop
    end if 
    h1=(c**(1./3.))/N
    h2=(1-c)**(1./3.)/N
    
    !trapezoidal method
    do i=1,N-1
        
        ans1=h1*f1(i*h1)+ans1
        ans2=h2*f2(i*h2)+ans2
        
    end do
    ans1=ans1+h1/2.*(f1(0.)+f1(c**(1./3.)))
    ans2=ans2+h2/2.*(f2(0.)+f2((1-c)**(1./3.)))
    
    ans=ans1+ans2
    error=ans-exact
    write(*,"('the ans with the trapezoidal is ',f5.2)") ans
    write(*,"('while the error is',f5.2 )") error
    
    stop 
    end program 
        
        
    
real function f1(x)
    implicit none 
    real:: x
    f1=3*((1-x**3.)**(-1./3.))
    return
    end function
    
    
real function f2(x)
    implicit none 
    real:: x
    f2=(1-x**3.)**(-2./3.)*3*x**(5./3.)
    return
    end function
    
    
    