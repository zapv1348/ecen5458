%Zachary Vogel
%HW2 ECEN 5458
%Problem 2
%created on 2/7/2016

Ts=0.1;
D=zpk([0],[-.5,-1/3],2,Ts);
[A,B,C,D]=zp2ss([0],[-.5,-1/3],2)
