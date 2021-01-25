%NaturalMand

C=0.360539287937597 + 0.120468233770377i;
t1=tic;
Map1=MandMap(1920,1080,GetScale(C,16,9,2^2),60);
t2=tic;
dt=t2-t1;
disp(strcat('循环算法用时：',num2str(dt)))

t1=tic;
Map2=QuickMandMap(1920,1080,GetScale(C,16,9,2^2),60);
t2=tic;
dt=t2-t1;
disp(strcat('矩阵算法用时：',num2str(dt)))

Same=min(min(Map1==Map2));

if(Same)
    disp('两种算法结果相同')
else
    disp('两种算法结果不同')
end