function [Res] = isNotMand(C,Depth)
Res=0;
z=zeros(1,Depth);
for t=2:Depth
   z(t)=C+z(t-1)^2;
   if (abs(z(t))>=2)
       Res=t;
      return; 
   end
end
end

