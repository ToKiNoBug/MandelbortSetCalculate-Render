C=0.360539287937597 + 0.120468233770377i;
%2^0~2^44��ÿ2��Ŵ�1����60fps����88�룬5280֡
Scale=2.^linspace(0,44,5280);
Depth=ceil(linspace(30,3000,5280));
v=VideoWriter('D:\Mand561-620.avi');
v.FrameRate=60;
v.open();
for f=561:620
   disp(strcat('��',num2str(f),'֡����5280֡���Ŵ��ʣ�',num2str(Scale(f)),'����������ȣ�',num2str(Depth(f))))
   Map=MandMap(1920,1080,GetScale(C,16,9,Scale(f)),Depth(f));
   Pic=MandSinRender(Map);
   drawnow;
   v.writeVideo(Pic)
end
v.close();