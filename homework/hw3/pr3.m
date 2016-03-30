%Zachary Vogel
%Problem 3
%ecen 5458
%2/24/2016

close all
%zs=tf([1 -0.75],[0.1 0.15],0.25);
%zs=tf([1.25 -1],[0.35 -0.1],0.25);
%zs=tf([9 -7],[1.8 0.2],0.25);
%zs=tf([8.6214 -6.6214],[1.76214 0.23786],0.25);
%zs=tf([1 -exp(-0.25)],[10 -10*exp(-2.5)],0.25);
%zs=tf([2 -1+exp(-2.5)],[1 -exp(-2.5)],0.25);
zs=tf([-1-exp(-2.5)+18+.25 0.75*exp(-2.5)-9],[0.25 -0.25*exp(-2.5)],0.25);
%pzmap(zs)
r=exp(3*0.25*1i);
evalfr(zs,r)
w=0.1:10/(100-0.1):100;
%figure
l=freqresp(zs,exp(1i*w*0.25));
l1=abs(l(1,1,:));
l2=squeeze(l1);
%w=0.1:length(l)/(100-0.1):100;
%loglog(w,l2)
%title('frequency vs magnitude')
%xlabel('frequency')
%ylabel('magnitude')
l1=squeeze(l);
l2=atan(-imag(l1(:))./real(l1(:)));
%bode(zs,w)
%figure
%semilogx(w,l2)
%title('frequency vs phase')
%xlabel('frequency')
%ylabel('phase in radians')