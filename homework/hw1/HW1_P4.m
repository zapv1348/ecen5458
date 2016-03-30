%Zachary Vogel
%1/27/2015
%ECEN 5458
%Problem 4
%Part B
T=1/5;
%T=1/10;
%T=1/20;

a=-165.9708;
b=4.5136;
c=-4.2864;

Ds=tf([1 a],[1 b]);
Gs=tf([1],[1 0 0]);
Ghs=tf([2/T],[1 2/T]);

sys=feedback(Ds*Gs*Ghs,1);
pole(sys);

%Part C
a=zeros(4,100);

for i=1:100
   T=1/i;
   Ghs=tf([2/T],[1 2/T]);
   sys=feedback(Ds*Gs*Ghs,1);
   a(:,i)=pole(sys);
end
figure
plot(real(a(1,:)),imag(a(1,:)),real(a(2,:)),imag(a(2,:)),real(a(3,:)),imag(a(3,:)),real(a(4,:)),imag(a(4,:)))
hold on
scatter(real(a(1,1)),imag(a(1,1)),'+')
scatter(real(a(2,1)),imag(a(2,1)),'+')
scatter(real(a(3,1)),imag(a(3,1)),'+')
scatter(real(a(4,1)),imag(a(4,1)),'+')
scatter(real(a(1,end)),imag(a(1,end)),'*')
scatter(real(a(2,end)),imag(a(2,end)),'*')
scatter(real(a(3,end)),imag(a(3,end)),'*')
scatter(real(a(4,end)),imag(a(4,end)),'*')
axis([-100 10 -7 7])
title('Locus of Poles of system \omega=1:100')
xlabel('the + indicates i=1, the * indicates i=100')



%Part E
sys=Ds*Gs;
bode(sys)
s=tf('s');

for i=1:5:25
    sys=Ds*Gs*exp(-s*T/2);
    figure
    bode(sys) 
end