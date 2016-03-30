%Zachary Vogel
%Problem 3 Homework 4
%ECEN 5458 Digital Control
close all

Gs=zpk([],[0 -1 -2],2);
Gz=c2d(Gs,0.05,'zoh')
K=2.558;

margin(Gz)

[re,im,w]=nyquist(Gz);
im=squeeze(im);
re=squeeze(re);
w=squeeze(w);
for i=1:length(im)-1
   if ~(isequal(sign(im(i)),sign(im(i+1))))
       s=i
   end
end
(w(s)+w(s+1))/2;
magnitude=(abs(re(s)+im(s))+abs(re(s+1)+im(s+1)))/2;
K=1/magnitude

figure
ls=tf([1 -.9925],[1 -.9993],-1)
margin(ls)