function [C] = FindComplex(r,c,Scale,Width,Height)
Re=linspace(real(Scale(1)),real(Scale(2)),Width);
Im=linspace(imag(Scale(1)),imag(Scale(2)),Height);
C=complex(Re(c),Im(r));
end

