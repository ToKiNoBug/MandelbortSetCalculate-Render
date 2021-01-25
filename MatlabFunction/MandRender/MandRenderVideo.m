function [fCount,Map,Pic]=MandRenderVideo(FileName,FrameRange,v)
%[fCount]=MandRenderVideo(FileName,FrameRange,VideoWriter)
%每帧有Frame+4个char，共4147209个字符
fCount=0;
fid=fopen(FileName,'rb');
if(fid<=0)
    return;
end


Map=zeros(1080,1920);

% FrameNum=FrameRange(1);

for f=FrameRange(1):FrameRange(2)

    %识别文件头
    [isFrame]=fread(fid,9,'char');
    isFrame=char(isFrame');
    if(~strcmp(isFrame(1:5),"Frame"))
        disp(isFrame)
        error('识别不到文件头')
    end
    %识别成功，输出这一帧
    disp(isFrame)
    
    
    [Map,eleCount]=fread(fid,[1080,1920],'ushort');
    if(eleCount~=2073600)
        error('无法读入这一帧')
    end
    
    
    
    Pic=MandDistRender(Map);
    
%     return;
    
    fCount=fCount+1;
    
    v.writeVideo(Pic)
    
    if(~mod(f-1,10))
        imagesc(Pic);
        drawnow
    end
end

fclose(fid);
disp('该视频片段渲染完成')
close('all');
end