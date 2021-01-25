#include <iostream>

#include <fstream>
#include <cstring>
#include <iomanip>
#include <windows.h>
using namespace std;
#include "Mandelbrot.h"

int main(int argc, char** argv) {
	system("CLS");
	system("color 8F");
	SetConsoleTitle("计算曼德勃罗集");
	unsigned short FrameStart=0,FrameEnd=5280;
	cout<<"起始帧：";cin>>FrameStart;
	cout<<"终止帧：";cin>>FrameEnd;
	short f=FrameStart;
	
	/////////// 
	//cout<<"Rua"<<endl;
	
	Complex const Center(0.360539287937597d,0.120468233770377d);
	Complex z[3001];
	
	const unsigned short Width=1920,Height=1080;
	const unsigned int Total=Width*Height;
	
	long double *Ratio=linspace(0,55,5280);
	Exp2(Ratio,5280);
	
	unsigned short *Depth=ceilLinspace(30,3000,5280);
	
	Complex Scale[2];
	GetScale(Center,Width,Height,Ratio[f-1],Scale);
	
	long double Re[Width];
	linspace(Scale[0].real,Scale[1].real,Width,Re);
	long double Im[Height];
	linspace(Scale[0].imag,Scale[1].imag,Height,Im);
	
	unsigned short Map[1080],Age;
	////unsigned short Map,Age;
	
	Complex C;
	
	char FileName[80]="MandRes";
	num2str(FrameStart,FileName+strlen(FileName));
	strcat(FileName,"-");
	num2str(FrameEnd,FileName+strlen(FileName));
	strcat(FileName,".Frame");
	//cout<<FileName<<endl;
	/////////////////
	
	fstream ofile;
	ofile.open(FileName,ios::out|ios::binary);
	cout<<"已创建文件"<<FileName<<endl;
	short r=0,c=0;
	
	char FrameName[20]="Frame";
	//FrameName+5;
	
	/*unsigned short Test=127;
	ofile.write((char*)&Test,2);
	ofile.close();
	return 0;*/
	
	const float invTotal=100.0d/(Width);
	
	/////////进入主循环///////////
	for(f=FrameStart;f<=FrameEnd;f++)
	{
	num2str(f,FrameName+5);
	ofile.write(FrameName,9);
	
	cout<<FrameName;
	cout<<"；放大倍率：";
	cout<<setw(8)<<Ratio[f-1];
	cout<<"；迭代深度："<<Depth[f]<<endl;
	//计算这一帧的Re、Im、Scale
	GetScale(Center,Width,Height,Ratio[f-1],Scale);
	linspace(Scale[0].real,Scale[1].real,Width,Re);
	linspace(Scale[0].imag,Scale[1].imag,Height,Im);
		
	for(c=0;c<Width;c++){
		if (!(c%32))cout<<'\r'<<c+1<<"/1920     ";
	for(r=0;r<Height;r++)
	{
		
		C.real=Re[c];
		C.imag=Im[r];
		Map[r]=0;
	for(Age=1;Age<Depth[f];Age++)
	{
		//cout<<"rua!";
		iterate(z[Age],z[Age-1],C);
		if(Abs2(z[Age]))
		{
			Map[r]=Age;
			////Map=Age;
			//cout<<"rue";
			break;
		}
	}
	////ofile.write((char*)&Map,sizeof(Map));
	//计算出深度
	
	
	}
	ofile.write((char*)Map,sizeof(Map));
	}
	cout<<'\r';	
	}
	ofile.close();
	cout<<'\r'<<FileName<<"计算完成"<<endl;
	system("pause"); 
	//cout<<"Rue"<<endl;
	return 0;
}

///////////////////////////////
/*
function Scale = GetScale(Center,Width,Height,ratio)
w=1/2/ratio;
h=Height/Width*(1/2/ratio);
Scale=[complex(-w,-h),complex(w,h)];
Scale=Scale+Center;
end

function [Map] = MandMap(Width,Height,Scale,Iter)
z=zeros(1,Iter);
z(1)=complex(0,0);
Map=zeros(Height,Width);

if max(size(Scale))~=2
    error('向量Scale的尺寸错误：必须为2个复数')
end
Re=linspace(real(Scale(1)),real(Scale(2)),Width);
Im=linspace(imag(Scale(1)),imag(Scale(2)),Height);
%%C取值从-2-2i~2+2i
%r->Im,c->Re
count=0;
TotalPro=Width*Height;
for r=1:Height
    for c=1:Width
        C=complex(Re(c),Im(r));
        if(abs(C)<=0.25)
            continue;
        end
        for t=2:Iter
            z(t)=C+z(t-1)^2;
            if(abs(z(t))>=2)
                Map(r,c)=t;
                break;
            end
        end
        if(~mod(Width*r+c,TotalPro/100))
            fprintf(repmat('\b',1,count));
            count=fprintf('计算进行中：%s',strcat(num2str((Width*r+c)/TotalPro*100),'%'));
        end
    end
end
fprintf(repmat('\b',1,count));
fprintf('计算完成\n')
end


*/
///////////////////////////////

