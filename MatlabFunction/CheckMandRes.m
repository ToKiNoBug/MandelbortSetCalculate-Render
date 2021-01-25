%Check MandRes
fclose('all');
fid=fopen('D:\游戏\Chaos\Mandelbrot\MandRes3241-3540.Frame');
if(fid<=0)
    fclose('all');
   error('打开文件失败') 
end


% isFrame=char(zeros(1,9));
% Skip=2*1920*1080=4147200;
FrameList=int16(zeros(1,3540-3240));

for i=1:270
    isFrame=fread(fid,9,'uchar');
    isFrame=char(isFrame');
    if(~strcmp(isFrame(1:5),"Frame"))
        disp(isFrame)
        error('识别不到文件头')
    end
    FrameList(i)=int16(str2double(isFrame(6:9)));
    
    fseek(fid,4147200,'cof');    
end
fclose(fid);
plot(FrameList(logical(FrameList)))