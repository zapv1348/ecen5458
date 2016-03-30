%Zachary Vogel
%ecen 5458
%Problem 3 on homework 5

M1=20;
m2=1;
k=32;
b=0.3;

num=[b/(M1*m2) k/(M1*m2)];
den=[1 b*(1/M1+1/m2) k*(1/M1+1/m2) 0 0];
Gs=tf(num,den);
damp(Gs);
sys=ss(Gs);
sysd=c2d(sys,0.2);

A=[-b/M1 -k/M1 b/M1 k/M1;1 0 0 0;b/m2 k/m2 -b/m2 -k/m2;0 0 1 0];
B=[1/M1;0;0;0];
C=[0 0 0 1];
D=0;

sys1=ss(A,B,C,D)
sys1d=c2d(sys,0.2)