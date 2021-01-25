function [Pic] = MandRender(Map,CSpace,Depth)
%%Color
Height=size(Map);
Width=Height(2);
Height=Height(1);
Cindex=zeros(Height,Width);
u=size(CSpace);
if(u(1)~=256||u(2)~=3)
    error('��ɫ�б�ĳߴ���󣺱���Ϊ256*3')
end

%��Map��[0,Max]����Ϊ[1,256]
if Depth<=0
    Depth=max(max(Map));
end
%Max=max(max(Map));
Cindex=floor(255*Map/Depth)+1;
Cindex(Cindex>256)=256;

Pic=zeros(Height,Width,3);
%CSpace(1,1:3)=[0,0,0];%256*3
Color=zeros(1,1,3);

TotalPro=Width*Height;
count=0;

for r=1:Height
    for c=1:Width
        Color(1)=CSpace(Cindex(r,c),1);
        Color(2)=CSpace(Cindex(r,c),2);
        Color(3)=CSpace(Cindex(r,c),3);
        Pic(r,c,:)=Color;
        if(~mod(Width*r+c,TotalPro/100))
            fprintf(repmat('\b',1,count));
            count=fprintf('��Ⱦ�����У�%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
        end
    end
end
fprintf(repmat('\b',1,count));
fprintf('��Ⱦ���\n')
imagesc(Pic)
end

