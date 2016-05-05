function k=eigenvalue()
clear;clc
    n=100;
    h=1.0/n;
    error=0.00001;
    k=1;
    dk=1;
    phi0=0.01;
    phi1=0.01;
    con=(k*h)^2./12.;
      for i=1:n-1
        phi=2.*(1-5.*con)*phi1/(1+con)-phi0;
        phi0=phi1;
        phi1=phi;
    end
    phiold=phi1;
 while abs(dk)>error
        k=k+dk;
        phi0=0.01;
        phi1=0.01;
        con=(k*h)^2./12.;
        for i=1:n-1
        phi=2.*(1-5.*con)*phi1/(1+con)-phi0;
        phi0=phi1;
        phi1=phi;
        end
        if phiold*phi1<0 
            k=k-dk;
            dk=dk/2;
        end
       disp('iteration',ite)
       E=0;
       do i=2,N
    end
    
end



  
    