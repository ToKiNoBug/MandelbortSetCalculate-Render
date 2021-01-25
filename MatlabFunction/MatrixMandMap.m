function [Map] = MatrixMandMap(Width,Height,Scale,Iter)
% z=zeros(1,Iter);
% z(1)=complex(0,0);
Map=zeros(Height,Width);

if max(size(Scale))~=2
    error('����Scale�ĳߴ���󣺱���Ϊ2������')
end
Re=linspace(real(Scale(1)),real(Scale(2)),Width);
Im=linspace(imag(Scale(1)),imag(Scale(2)),Height);
Im=Im';
%%Cȡֵ��-2-2i~2+2i
%r->Im,c->Re
%Im����������Re��������
count=0;
% TotalPro=Width*Height;
C=repmat(Re,Height,1)+1i*repmat(Im,1,Width);
z=zeros(Height,Width);
Conver=logical(z);
%Conver�������������1Ϊδ������0������
%New�����������ĸ���������һ�ε���������뱾�ε������

for age=1:Iter
   Conver=(abs(z)<2);
   z(Conver)=z(Conver).*z(Conver)+C(Conver); 
   Map(xor(Conver,(abs(z)<2)))=age;
%    fprintf(repmat('\b',1,count));
%    count=fprintf('��������У�%s',strcat(num2str(100*age/Iter),'%'));
end
Map(abs(z)<2)=0;

% for r=1:Height
%     for c=1:Width
%         C=complex(Re(c),Im(r));
%         if(abs(C)<=0.25)
%             continue;
%         end
%         for t=2:Iter
%             z(t)=C+z(t-1)^2;
%             if(abs(z(t))>=2)
%                 Map(r,c)=t;
%                 break;
%             end
%         end
%         if(~mod(Width*r+c,TotalPro/100))
%             fprintf(repmat('\b',1,count));
%             count=fprintf('��������У�%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
%         end
%     end
% end
% fprintf(repmat('\b',1,count));
fprintf('�������\n')
end

