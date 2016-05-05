program search
		real(8):: h, diffk, dk, phi, phi0, phi1, phiold, con, k
		integer:: n, I


		n=100
		h=1.0/n
		diffk=0.00001
		k=1
		dk=1
		phi0=0.01
		phi1=0.01
		con=(k*h)**2/12
		do i=1,n-1
			phi=2*(1-5*con)*phi1/(1+con)-phi0
			phi0=phi1
			phi1=phi
		end do
		phiold=phi1
        write(*,*) phiold
        do while(abs(dk)>diffk)
			k=k+dk
			phi0=0.01
			phi1=0.01

			con=(k*h)**2/12
			do i=1,n-1
				phi=2*(1-5*con)*phi1/(1+con)-phi0
				phi0=phi1
				phi1=phi
			end do
			if(phiold*phi1<0)then
				k=k-dk
				dk=dk/2
            end if
            write(*,*) k,phi1
		end do
		write(*,*)k
		end 
