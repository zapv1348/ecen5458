%Zachary Vogel
%ECEN 5458
%HW2 Problem 9

K=8.0537;
T=0.1;
Gs=tf([1],[1 0.4 0]);
Us=tf([1],[1 0]);
Gz=c2d(Gs,0.1);
Uz1=c2d(Us,T);
Uz=tf([1 0],[1 -1],T);
%sisotool(Uz1*feedback(Gz,1))
sys=ss(feedback(Gz,1))
step(sys);
rlocus(Gz)

%rlocus(Ys)
%sisotool(feedback(Gz,1))
%rlocus(Gz)
%rlocus(GZ1)
%step(GZ1)

a=exp(-0.4*T);
b=25/4*(a-1)+2.5*T;
c=25/4*(1-a)-2.5*T*a;

options=optimoptions('fsolve','MaxIter',1000);

fsolve(@myfun,0.8,options)