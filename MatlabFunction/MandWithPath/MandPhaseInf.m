function [] = MandPhaseInf(Seq,type)
New=atan(abs(Seq.Content)).*exp(angle(Seq.Content)*1i);
plot(real(New),imag(New),type)
xlim([-pi/2,pi/2]);
ylim([-pi/2,pi/2]);
xlabel('real')
ylabel('imag')
U=linspace(-pi,pi,360);
hold on
plot(pi/2*cos(U),pi/2*sin(U),'r-')
hold off
end

