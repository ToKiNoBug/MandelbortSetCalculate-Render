function [] = MandPhase(MandSeq,type)
plot(real(MandSeq.Content),imag(MandSeq.Content),type)
xlabel('real')
ylabel('imag')
end

