%% 用松弛迭代法求解如下二维椭圆偏微分方程:

%% 问题
%%
% 
% $$\begin{array}{l} - [\frac{{{\partial ^2}}}{{\partial {x^2}}} + \frac{{{\partial ^2}}}{{\partial {y^2}}}]\varphi  = S(x,y)\\
% S(x,y) = 2xy\\\varphi (0,y) = \varphi (x,0) = 0\\\varphi (1,y) = \varphi (x,1) = 0\end{array}$$
% 


%%
%                  
                    clear;clc;
                    N=100;
                    h=1./N;
                    w=1.5;
                    for i=1:N+1
                        for j=1:N+1
                            x=(i-1)*h;
                             y=(j-1)*h;
                             s(i,j)=2.*x*y;
                             phi(i,j)=0.;
                        end
                    end
                     for  ite=1:1000
                         for i=2:N  % notice that this time the range of i is different from the previous one due to the boundary limit.
                             for j=2:N
                                 phi(i,j)=(1-w)*phi(i,j)+w/4.*(phi(i+1,j)+phi(i-1,j)+phi(i,j+1)+phi(i,j-1)+h^2.*s(i,j));
                             end
                         end
                         if mod(ite-1,20)==0
                             disp('Iteration');
                             disp(ite);
                             E=0;
                             for i=2:N
                                 for j=2:N
                                     E=E+((phi(i,j)-phi(i-1,j))^2.+(phi(i,j)-phi(i,j-1))^2.)/2.-h^2.*s(i,j)*phi(i,j);
                                 end
                             end
                             disp('Energy');
                             disp(E);
                         end
                     end
                 
%% plot the figure of    $\varphi$
%%
        figure;
       [xx,yy] = meshgrid(1:N+1,1:N+1);
       axis([1,N,1,N]);
        plot3(xx,yy,phi)
        
       
