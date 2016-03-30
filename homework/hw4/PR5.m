%Zachary Vogel
%Problem 5
% homework 4
%ecen 5458

Hz1=tf([1 -.5 -.5],[1 0 0],1)
rlocus(Hz1)
figure
Hz=tf([.5 .5],[1 0 0],1)
step(Hz)