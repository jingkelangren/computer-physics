function [error]=numerical_quadrature(c)
% numerical quadrature with the Trapezoidal 
   % integrate t^(-23)(1-t)^(-13) from 0 to 1, the result is 2pi3^(12)
    %using trapezoidal and simpson's rule respectly 
N=1000;
exact=2*pi/3^0.5;
c=input('please input c:');
if (c<0)||(c>1)    
    disp('input error')
    return
end
 a=c^(1./3.);
 b=(1-c)^(1./3.);
 h1=a/real(N);
 h2=b/real(N);
 ans1=h1/2.*(f(0.,h1)+f(a,h1));
 ans2=h2/2.*(g(0.,h2)+g(b,h2));
 
 for i=1:N-1
     x1=h1*real(i);
     x2=h2*real(i);
     ans1=ans1+f(x1,h1);
     ans2=ans2+g(x2,h2);
 end
 ans=ans1+ans2;
 error=ans-exact;
 fprintf('the answer is %f\n',ans)
 fprintf('the error is %f\n',error)
 return 
end
 
 function y2=g(x,h)
 y2=h*(1-x^3)^(-2./3.)*3*x;
 end
 function y1=f(x,h)
 y1=h*3.*(1-x^3)^(-1./3.);
 end
 



 

 
