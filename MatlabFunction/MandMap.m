function [Map] = MandMap(Width,Height,Scale,Iter)
z=zeros(1,Iter);
z(1)=complex(0,0);
Map=zeros(Height,Width);

if max(size(Scale))~=2
    error('向量Scale的尺寸错误：必须为2个复数')
end
Re=linspace(real(Scale(1)),real(Scale(2)),Width);
Im=linspace(imag(Scale(1)),imag(Scale(2)),Height);
%%C取值从-2-2i~2+2i
%r->Im,c->Re
count=0;
TotalPro=Width*Height;
for r=1:Height
    for c=1:Width
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
    end
    fprintf(repmat('\b',1,count));
    count=fprintf('计算进行中：%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
end
fprintf(repmat('\b',1,count));
fprintf('计算完成\n')
end

