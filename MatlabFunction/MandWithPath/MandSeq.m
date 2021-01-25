function [Mandel] = MandSeq(C,Length)
Mandel=struct("Age",int32(0),"C",C,"Length",Length,"Content",zeros(1,Length));
for i=2:Length
    Mandel.Content(i)=Mandel.Content(i-1)^2+C;
    if(~Mandel.Age&&(abs(Mandel.Content(i))>2))
       Mandel.Age=int32(i-1); 
    end
end
end

