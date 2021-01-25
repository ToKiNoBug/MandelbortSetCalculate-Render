function [Pic] = MandClassicRender(Map,CSpace)
%%Color
Height=size(Map);
Width=Height(2);
Height=Height(1);



Pic=zeros(Height,Width,3);
%CSpace(1,1:3)=[0,0,0];%256*3
Color=zeros(1,1,3);

TotalPro=Width*Height;
count=0;

for r=1:Height
    for c=1:Width
        if(Map(r,c))
            Color(1)=CSpace(Map(r,c),1);
            Color(2)=CSpace(Map(r,c),2);
            Color(3)=CSpace(Map(r,c),3);
            Pic(r,c,:)=Color;            
        else
            Pic(r,c,:)=zeros(1,1,3);
        end
    end
    fprintf(repmat('\b',1,count));
    count=fprintf('渲染进行中：%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
end
fprintf(repmat('\b',1,count));
fprintf('渲染完成\n')
imagesc(Pic)
end

