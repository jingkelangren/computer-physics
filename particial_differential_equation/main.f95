program example125
	implicit none
	integer:: i,ite
	integer,parameter:: N=20
	real(8):: h,dt,dth,x,pt,ps,E,norm,ap,az
	real(8),dimension(0:n):: phi,alpha,beta,gamma
    h=1.0/N
    dt=0.0015
    dth=dt/h**2
    !��phi��ʼ��
	phi(0)=0
	phi(n)=0
	do i=1,n-1
		x=i*h
		phi(i)=x*(1.0-x)
	end do
    !��phi���й�һ��
	norm=0.0
	do i=1,n
		norm=norm+phi(i)**2
	end do
	norm=1.0/sqrt(norm*h)
	do i=1,n
		phi(i)=phi(i)*norm
	end do

!��alpha��gamma
	ap=-dth		!A+-��ֵ
	az=1.0+2*dth	!A0��ֵ
	alpha(N-1)=0
	gamma(N-1)=-1.0/az
	do i=N-1,1,-1
		alpha(i-1)=gamma(i)*ap
		gamma(i-1)=-1.0/(az+ap*alpha(i-1))
	end do


    do ite=1,60  !�ݻ�
        beta(N-1)=0     !��beta
	do i=N-1,1,-1
		beta(i-1)=gamma(i)*(ap*beta(i)-phi(i))
	end do

	phi(0)=0     !��phi
	do i=0,N-1
		Phi(i+1)=alpha(i)*phi(i)+beta(i)
	end do


		norm=0.0    !��phi���й�һ��
		do i=1,n
			norm=norm+phi(i)**2
		end do
		norm=1.0/sqrt(norm*h)
		do i=1,n
			phi(i)=phi(i)*norm
		end do
		E=0    !��������
		do i=1,N
			E=E+(Phi(i)-phi(i-1))**2/h
		end do
		if(mod(ite,4)==0)write(*,*)ite, E
	end do
end

