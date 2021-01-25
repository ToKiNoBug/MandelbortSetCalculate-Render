function Scale = vpaGetScale(Center,Width,Height,ratio,Accu)
w=vpa(1/2,Accu);
w=w/ratio;
h=Height/Width*(1/2/ratio);
Scale=[-w-h*1i,w+h*1i];
Scale=Scale+Center;
end

