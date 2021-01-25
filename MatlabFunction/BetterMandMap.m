function [Res] = BetterMandMap(Width,Height,Scale,Iter)
z=zeros(1,Iter);
z(1)=complex(0,0);
H=Height+1;W=Width+1;
Map=int16(zeros(H,W));
Res=zeros(Height,Width);
if max(size(Scale))~=2
    error('向量Scale的尺寸错误：必须为2个复数')
end
Re=linspace(real(Scale(1)),real(Scale(2)),W);
Im=linspace(imag(Scale(1)),imag(Scale(2)),H);
%%C取值从-2-2i~2+2i
%r->Im,c->Re
count=0;
TotalPro=W*H;
for r=1:H
    for c=1:W
        C=complex(Re(c),Im(r));
        if(abs(C)<=0.25)
            continue;
        end
        for t=2:Iter
            z(t)=C+z(t-1)^2;
            if(abs(z(t))>=2)
                Map(r,c)=t;
                break;
            end
        end
        if(~mod(W*r+c,TotalPro/100))
            fprintf(repmat('\b',1,count));
            count=fprintf('计算进行中：%s',strcat(num2str((W*r+c)/TotalPro*100),'%'));
        end
    end
end

for r=1:Height 
    for c=1:W
       Res(r,c)=mean(Map(r:(r+1),c:(c+1))); 
    end
end

fprintf(repmat('\b',1,count));
fprintf('计算完成\n')
end

