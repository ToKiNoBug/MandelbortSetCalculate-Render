function [Map,Pic] =EzMand(Width,Height,Scale,Depth,CSpace)
z=zeros(1,Depth);
z(1)=complex(0,0);
Map=zeros(Height,Width);

if max(size(Scale))~=2
    error('向量Scale的尺寸错误：必须为2个复数')
end
Re=linspace(real(Scale(1)),real(Scale(2)),Width);
Im=linspace(imag(Scale(1)),imag(Scale(2)),Height);
%%C取值从-2-2i~2+2i
%r->Im,c->Re

for r=1:Height
    for c=1:Width
        C=complex(Re(c),Im(r));
        
        for t=2:Depth
            z(t)=C+z(t-1)^2;
            if(abs(z(t))>=2)
                Map(r,c)=t;
                break;
            end
        end
    end
end



%Cindex=zeros(Height,Width);
u=size(CSpace);
if(u(1)~=256||u(2)~=3)
    error('颜色列表的尺寸错误：必须为256*3')
end

%将Map从[0,Max]调整为[1,256]
%Max=max(max(Map));
Cindex=floor(255*Map/Depth)+1;
Cindex(Cindex>256)=256;

Pic=zeros(Height,Width,3);
%CSpace(1,1:3)=[0,0,0];%256*3
Color=zeros(1,1,3);



for r=1:Height
    for c=1:Width
        Color(1)=CSpace(Cindex(r,c),1);
        Color(2)=CSpace(Cindex(r,c),2);
        Color(3)=CSpace(Cindex(r,c),3);
        Pic(r,c,:)=Color;
        
    end
end

imagesc(Pic)

end

