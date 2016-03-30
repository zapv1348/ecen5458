%Zachary Vogel
%HW2 ECEN 5458
%Problem 4 (h)(e)

T=0.05;
Gs=tf([T^2],[4 0 0],'InputDelay',1)
%Gs=(exp(s*T/2))/(s^2)
Gz=c2d(Gs,T)

T=0.5;
Gs=tf([T^2],[4 0 0],'InputDelay',1)
%Gs=(exp(s*T/2))/(s^2)
Gz=c2d(Gs,T)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             