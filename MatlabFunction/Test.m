%NaturalMand

C=0.360539287937597 + 0.120468233770377i;
t1=tic;
Map1=MandMap(1920,1080,GetScale(C,16,9,2^2),60);
t2=tic;
dt=t2-t1;
disp(strcat('ѭ���㷨��ʱ��',num2str(dt)))

t1=tic;
Map2=QuickMandMap(1920,1080,GetScale(C,16,9,2^2),60);
t2=tic;
dt=t2-t1;
disp(strcat('�����㷨��ʱ��',num2str(dt)))

Same=min(min(Map1==Map2));

if(Same)
    disp('�����㷨�����ͬ')
else
    disp('�����㷨�����ͬ')
end