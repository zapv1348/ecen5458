%Zachary vogel
%Hw 3 ecen 5458
%Lucy pao digital control
% do stuff like a g


%greater than or equal
zet1=0.45;
%greater than or equal to
omegan=3.6;
%greater than or equal to
omegzet=1.84;

T=0.1;
%T=0.25;
%T=0.75;

omegan_max=2*pi/(T*sqrt(1-zet1^2))
zet_max=sqrt((2*pi/(omegan*T))^2-1)


z=zet1:0.01:17.4;
y=zeros(length(z),1);
for j=1:length(z)
    y(j)=exp(-z(j)*omegan*T)*exp(1i*omegan*sqrt(1-z(j)^2)*T);
end

plot(real(y),imag(y))
hold on
o=3.6:0.01:70.35;
p=zeros(length(o),1);
for j=1:length(o)
    p(j)=exp(-zet1*o(j)*T)*exp(1i*o(j)*sqrt(1-zet1^2)*T);
end

th=0:0.01:6.28;
r=zeros(length(th));
for j=1:length(th);
    r(j)=exp(-1.84*T)*exp(1i*th(j));
end
plot(real(p),imag(p))
plot(real(y),-imag(y))
plot(real(p),-imag(p))
plot(real(r),imag(r))


axis([-1 1 -1 1])