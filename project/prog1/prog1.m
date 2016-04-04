%Zachary Vogel and Kaitlyn Garifi
%Code for Progress Report on ECEN 5458 Project
%Created on 2/16/2016
%last edited on 3/10/2016
%Need model, canonical state space form
%Simulink model
%sims
%Freq response, root locus, impulse response

close all

format long g

syms s;
OM1=200*pi;
OM2=2000*pi;
g=2000;
Zet1=0.0796;
Zet2=0.05;

a=[g*OM1^2*OM2^2];
b=[1 2*Zet1*OM1+2*Zet2*OM2 4*Zet1*Zet2*OM1*OM2+OM1^2+OM2^2 OM2^2*2*Zet1*OM1+OM1^2*2*Zet2*OM2 OM1^2*OM2^2];
Gs1=tf([g*OM1^2],[1 2*Zet1*OM1 OM1^2]);
Gs2=tf([OM2^2],[1 2*Zet2*OM2 OM2^2]);
Gs=Gs1*Gs2;

%bode(Gs)
%figure
%rlocus(Gs)
%figure 
%impulse(Gs)

Gz=c2d(Gs,10^-4);
%bode(Gz)
%sisotool(Gz)
sys=ss(tf(a,b));
%csys=canon(Gs,'modal')
%dsys=canon(Gs,'companion')
%[A1,B1,C1,T,k]=ctrbf(A,B,C)

%notch filter for 200 pi Hz
f1=cos(pi*200/10^4);
r=0.3;
n1z=tf([1 -2*f1 1],[1 -2*r*f1 r^2],10^-4);

%second attempt
n1s=tf([1 0 (200*pi)^2],[1 2*200*pi 700^2]);
n1z=c2d(n1s,10^-4);

%notch filter for 2000 pi Hz
f2=cos(2000*pi/10^4);
n2z=tf([1 -2*f2 1],[1 -r*2*f2 r^2],10^-4);

%second attempt
n2s=tf([1 0 (3000*pi)^2],[1 2*3000*pi 7000^2]);
n2z=c2d(n2s,10^-4);


%bode(n1z*n2z)
Gz1=n1z*n2z*Gz;
%figure
%bode(Gz1)
%rlocus(Gz1)
%sisotool(Gz1)
%figure
%step(feedback(0.002*Gz1,1))
%sisotool(Gz1)

%using Ackermans to get matrices that give desired poles for A-BK A-LC
%use rlocus to figure uot where you want the poles of both.
%rlocus(Gz)
sysog=ss(Gz);
%K1=acker(sysog.a,sysog.b,[0.5 0.2+.3*1i 0.2-.3*1i -0.6])
%L1=acker(sysog.a',sysog.c',[0.5 0.4+0.5*1i 0.4-0.51i -0.7])'



%converting to state space 
sys1=c2d(sys,10^-4,'zoh');
notch1=ss(n1z);
notch2=ss(n2z);
sysf=notch1*notch2*sys1;
csys=canon(sysf,'modal');
dsys=canon(sysf,'companion');

%calculation of necessary settling time
%given a write speed of 1 GB/hr
speed=1*10^9;
%find speed per second
sps=speed/3600;
%now assume we can write 4 bytes per touch
sps1=sps/4;

%Ts=0.007
%4.6/Ts=zeta*omegan=sigma=657
%pick zeta=0.5
%omegan=920
%920*10^-4=0.0920
%
%actual calculated K2, L2
%exp(-657*10^(-4))=0.9364117
%K2=acker(sysog.a,sysog.b,[0.5 0.5+0.5j 0.5-0.5j 0.8])
K2=place(sysog.a,sysog.b,[0.5 0.5+0.5j 0.5-0.5j 0.8])
%4.6/Ts=zeta*omegan=460
%pick zeta=0.7
%omegan=657.14
%657*10^-4=0.064714

%L2=acker(sysog.a',sysog.c',[0.6 0.7+0.2j 0.7-0.2j 0.9])'
L2=place(sysog.a',sysog.c',[0.6 0.7+0.2j 0.7-0.2j 0.9])'