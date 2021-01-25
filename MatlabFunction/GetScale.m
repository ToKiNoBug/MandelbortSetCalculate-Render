function Scale = GetScale(Center,Width,Height,ratio)
w=1/2/ratio;
h=Height/Width*(1/2/ratio);
Scale=[complex(-w,-h),complex(w,h)];
Scale=Scale+Center;
end

