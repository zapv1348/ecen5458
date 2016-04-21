%stuff

Gz1=zpk(-1,[1 1],1/(25*42),0.2)
Dz=zpk(-1.0446,[-2.9089-2.5724i,-2.9089+2.5724i],-2514.9,0.2)

sys1=Gz1*Dz

sys2=feedback(Dz*Gz1,1)

rlocus(sys1)'m in an airport 'm in an airport 'm in an airport 