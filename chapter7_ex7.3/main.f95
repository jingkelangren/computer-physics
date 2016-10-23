program example121
implicit none
integer:: i, ite
integer,parameter:: N=25
real(8):: h, dt, dth, exact, x, t, az, ap,w
real(8),dimension(0:N)::alpha,beta,gamma,Phi
open(10,file="result.txt")
h=1.0/N
dt=0.005
dth=dt/h**2
write(*,*)"please input w!"
read(*,*) w
!初始化
t=0
phi(0)=0
phi(n)=0
do i=1,n-1
	x=i*h
	phi(i)=exp(-20*(x-0.5)**2)-exp(-20*(x-1.5)**2)-exp(-20*(x+0.5)**2)
end do
!求alpha和gamma
	ap=-dth*(1-w)		!A+-的值
	az=1.0+2*dth*(1-w)	!A0的值
	alpha(N-1)=0
	gamma(N-1)=-1.0/az
	do i=N-1,1,-1
		alpha(i-1)=gamma(i)*ap
		gamma(i-1)=-1.0/(az+ap*alpha(i-1))
	end do
do ite=1,100    !演化
	beta(N-1)=0     !求beta
	do i=N-1,1,-1
		beta(i-1)=gamma(i)*(ap*beta(i)-(phi(i)+dth*w*(phi(i+1)+phi(i-1)-2*phi(i))))
	end do

	phi(0)=0     !求phi
	do i=0,N-1
		Phi(i+1)=alpha(i)*phi(i)+beta(i)
	end do
	if(ite==8)then
	    t=ite*dt
	    write(*,*)"iteration=",ite
	    do i=1,n-1
	          x=i*h
	          exact=(exp(-20*(x-0.5)**2/(1+80*t))-exp(-20*(x-1.5)**2/(1+80*t))-exp(-20*(x+0.5)**2/(1+80*t)))/sqrt(1+80*t)
	          write(10,*)i,phi(i),exact
	    end do
	end if
end do
close(10)
end
