function [C,Age,Ratio] = FindLongAge(Haji,maxAge,Length,Ratio)
C=zeros(1,Length);
Age=zeros(1,Length);
C(1)=Haji;
Age(1)=isNotMand(Haji,maxAge);
Range=zeros(3,3);
RAge=zeros(3,3);
for t=2:Length
    %Range(2,2)=C(t);
    for r=1:3
        for c=1:3
            Range(r,c)=C(t-1)+complex(c-2,r-2)/Ratio;
            RAge(r,c)=isNotMand(Range(r,c),maxAge);
        end
    end
    if(~max(max(RAge)))
       error('Failed') 
    end
    %找到第一个迭代最长的点
    AgeMax=max(max(RAge));
    
        for pos=1:9
            c=mod(pos,3)+1;
            r=ceil(pos/3);
            if(RAge(r,c)>=AgeMax)
               C(t)=Range(r,c); 
               break;
            end
        end
    if(Age(t)<Age(t-1))
       C=C(1:t);
       Age=Age(1:t);
       disp('Ended')
       return;
    end
    
    Age(t)=AgeMax;
    Ratio=Ratio/2;
end
disp(C(Length))
disp(Age(Length))
end

