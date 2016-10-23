function k=secant_method()
clear;clc
    n=100;
    h=1.0/n;
    error=0.00001;
    k0=1;
    k1=2;
    phi0=0.01;
    phi1=0.01;
    con=(k*h)^2./12.;
      for i=1:n-1
        phi=2.*(1-5.*con)*phi1/(1+con)-phi0;
        phi0=phi1;
        phi1=phi;
    end
    phiold=phi1;
 while abs(k2-k1)>error
        k2=k1-(k1-k0)*
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
       
    end
    
end



  
    