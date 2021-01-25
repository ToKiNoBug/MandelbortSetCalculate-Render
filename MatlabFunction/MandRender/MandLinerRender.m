function [Pic] = MandLinerRender(Map)

Height=size(Map);
Width=Height(2);
Height=Height(1);

%将Map从[0,Max]调整为[1,256]
Conv=logical(Map);
Max=ceil(max(max(Map(Conv))));
Min=floor(min(min(Map(Conv))));
Cindex=zeros(Height,Width);
Cindex(Conv)=round(Map(Conv)-Min)+1;

%Max=max(max(Map));
CSpace=hot(Max-Min+1);
% Cindex=round(atan(2.5*Map/Depth)*512/pi)+1;
Pic=zeros(Height,Width,3);
%CSpace(1,1:3)=[0,0,0];%256*3
% Pic(:,:,1)=CSpace(Cindex,1);
% Pic(:,:,2)=CSpace(Cindex,2);
% Pic(:,:,3)=CSpace(Cindex,3);
% Pic(Map==0,:)=1;
Color=zeros(1,1,3);
TotalPro=Width*Height;
count=0;

for r=1:Height
    for c=1:Width
        if(Map(r,c))
%             Cindex=1+mod(Map(r,c),256);
            Color(1)=CSpace(Cindex(r,c),1);
            Color(2)=CSpace(Cindex(r,c),2);
            Color(3)=CSpace(Cindex(r,c),3);
        else
            Color=zeros(1,1,3)+1;
        end
        
        Pic(r,c,:)=Color;
        if(~mod(Width*r+c,TotalPro/100))
            fprintf(repmat('\b',1,count));
            count=fprintf('渲染进行中：%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
        end
    end
end
fprintf(repmat('\b',1,count));
fprintf('渲染完成\n')
% imagesc(Pic)
end

