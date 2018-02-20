
%%Matthew Soltesz
%ME3165-308
clear;
clc;
h=.75;
n=100;
dy=h/n;
L=.1;
rho=2000;
u=zeros(n+1,5);
u(1,:)=0;
u(n+1,:)=.01;
dpdx=[-10 -8 0 5 15];
mu=2.9e-4;
b=ones(n,5)*-2;
d=ones(n,length(dpdx))*dy^2*(1/mu).*dpdx;
a=ones(n,5)*1;
c=ones(n,5)*1;
for z=1:5
d(n,z)=d(n,z)-u(n+1,z);
for k=2:n
m=a(k,z)/(b(k-1,z));
b(k,z)=b(k,z)-m*c(k-1,z);
d(k,z)=d(k,z)-m*(d(k-1,z));
end
u(n,z)=d(n,z)/b(n,z);
for k=n-1:-1:5
u(k,z)=(d(k,z)-c(k,z)*u(k+1,z))/b(k,z);
end
end
figure
plot(u,linspace(0,z,n+1))
title('flow between pipes')
xlabel('v in m/s')
ylabel('nodes')
legend('dpdx=5','dpdp=x4','dpdx=3', 'dpdx=2', 'dpdx=1')
ren=rho*L/mu.*u;
