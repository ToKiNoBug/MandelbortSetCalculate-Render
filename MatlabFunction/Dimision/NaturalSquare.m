function [S] = NaturalSquare(Scale,Width,Height)
%计算曼德勃罗集的面积，以推测分维
if max(size(Scale))~=2
    error('向量Scale的尺寸错误：必须为2个复数')
end
Re=linspace(real(Scale(1)),real(Scale(2)),Width);
Im=linspace(imag(Scale(1)),imag(Scale(2)),Height);
%%C取值从-2-2i~2+2i
%r->Im,c->Re
count=0;
S.Square=0;
S.r=Re(2)-Re(1);
TotalPro=Width*Height;
for r=1:Height
    for c=1:Width
        C=complex(Re(c),Im(r));
        if(abs(C)>=1)
           S.Square=S.Square+1; 
        end
        
        
    end
    fprintf(repmat('\b',1,count));
    count=fprintf('计算进行中：%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
end
fprintf(repmat('\b',1,count));
fprintf('计算完成\n');
% S.Square=S.Square/TotalPro;
end

