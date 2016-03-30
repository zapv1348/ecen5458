close all
Hz=zpk(-3,[0 .5],5,-1)
step(Hz)
figure
impulse(Hz)