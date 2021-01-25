%Check MandRes
fclose('all');
fid=fopen('D:\��Ϸ\Chaos\Mandelbrot\MandRes3241-3540.Frame');
if(fid<=0)
    fclose('all');
   error('���ļ�ʧ��') 
end


% isFrame=char(zeros(1,9));
% Skip=2*1920*1080=4147200;
FrameList=int16(zeros(1,3540-3240));

for i=1:270
    isFrame=fread(fid,9,'uchar');
    isFrame=char(isFrame');
    if(~strcmp(isFrame(1:5),"Frame"))
        disp(isFrame)
        error('ʶ�𲻵��ļ�ͷ')
    end
    FrameList(i)=int16(str2double(isFrame(6:9)));
    
    fseek(fid,4147200,'cof');    
end
fclose(fid);
plot(FrameList(logical(FrameList)))