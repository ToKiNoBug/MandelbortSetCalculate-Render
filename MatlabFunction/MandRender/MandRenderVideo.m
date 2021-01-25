function [fCount,Map,Pic]=MandRenderVideo(FileName,FrameRange,v)
%[fCount]=MandRenderVideo(FileName,FrameRange,VideoWriter)
%ÿ֡��Frame+4��char����4147209���ַ�
fCount=0;
fid=fopen(FileName,'rb');
if(fid<=0)
    return;
end


Map=zeros(1080,1920);

% FrameNum=FrameRange(1);

for f=FrameRange(1):FrameRange(2)

    %ʶ���ļ�ͷ
    [isFrame]=fread(fid,9,'char');
    isFrame=char(isFrame');
    if(~strcmp(isFrame(1:5),"Frame"))
        disp(isFrame)
        error('ʶ�𲻵��ļ�ͷ')
    end
    %ʶ��ɹ��������һ֡
    disp(isFrame)
    
    
    [Map,eleCount]=fread(fid,[1080,1920],'ushort');
    if(eleCount~=2073600)
        error('�޷�������һ֡')
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
disp('����ƵƬ����Ⱦ���')
close('all');
end