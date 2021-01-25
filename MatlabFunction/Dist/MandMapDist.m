function [Dist] = MandMapDist(Map)


Conv=logical(Map);
Min=min(min(Map(Conv)));
Cindex=Map;
Cindex(Conv)=Cindex(Conv)-Min+1;

Min=1;
Max=max(max(Cindex(Conv)));

tbl=tabulate(Cindex(Conv));
x=ceil(linspace(Min,Max,10));
y=zeros(1,10);
for i=1:10
down=max(x(i),x(1));
up=min(x(10),x(i));
u=down:(up);
y(i)=sum(tbl(u,2));
end

bar(x,y);

Dist=struct("x",x,"y",y,"TBL",tbl);

end

