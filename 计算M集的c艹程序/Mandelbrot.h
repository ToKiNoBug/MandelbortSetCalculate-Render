#include <cmath>
class Complex
{
	public:
		Complex(long double Re=0,long double Im=0)
		{
			real=Re;imag=Im;
		}
		long double real;
		long double imag;
};

/*
inline long double Abs2(Complex &z);


long double *linspace(long double Start,long double End,unsigned int Count);
void linspace(long double Start,long double End,unsigned int Count,long double *Res);

unsigned short*ceilLinspace(long double Start,long double End,unsigned int Count);

void Exp2(long double *A,unsigned int Count);

void GetScale(Complex Center,unsigned short Width,unsigned short Height,long double ratio,Complex Res[2]);

void num2str(unsigned int A,char Res[4]);

*/
//unsigned short mAge(Complex C,unsigned MaxAge); 

////////////////




inline bool Abs2(Complex &z)
{
	return ((z.real*z.real+z.imag*z.imag)>4.0d);
}

long double *linspace(long double Start,long double End,unsigned int Count)
{
	static long double *Res=new long double[Count];
	long double step=(End-Start)/(Count-1);
	for(int i=0;i<Count;i++)
	Res[i]=Start+step*i;
	Res[Count-1]=End;
	return Res;
}

unsigned short*ceilLinspace(long double Start,long double End,unsigned int Count)
{
	static unsigned short *Res=new unsigned short[Count];
	long double step=(End-Start)/(Count-1);
	for(int i=0;i<Count;i++)
	Res[i]=ceil(Start+step*i);
	return Res;
}

void Exp2(long double *A,unsigned int Count)
{
	long double Temp=log(2.0d);
	for(int i=0;i<Count;i++)
	A[i]=exp(Temp*A[i]);
	return;
}

inline void GetScale(Complex Center,unsigned short Width,unsigned short Height,long double ratio,Complex Res[2])
{
	long double w=0.5/ratio;
	long double h=w*Height/Width;
	Res[0].real=Center.real-w;
	Res[0].imag=Center.imag-h;
	Res[1].real=Center.real+w;
	Res[1].imag=Center.imag+h;
	return;
}

inline void num2str(unsigned int A,char Res[4])
{
	char Temp=0;
	for(int i=0;i<=3;i++)
	{
		Res[3-i]=A%10+'0';
		A/=10;
	}
	return;
}

inline void linspace(long double Start,long double End,unsigned int Count,long double *Res)
{
	long double step=(End-Start)/(Count-1);
	for(int i=0;i<Count;i++)
	Res[i]=Start+step*i;
	Res[Count-1]=End;
	return;
}


inline void iterate(Complex &z1,Complex &z0,Complex &C)
{
	z1.real=z0.real*z0.real-z0.imag*z0.imag+C.real;
	z1.imag=z0.real*z0.imag*2.0d+C.imag;
	return;
}
/*
inline unsigned short mAge(Complex C,unsigned MaxAge)
{
	cout<<C.real<<'+'<<C.imag<<"i\n";
	static Complex z[3000];
	//if(abs2(C)<=0.0625d)return 0;
	
	cout<<"rua!\n";
	for(int i=1;i<=MaxAge;i++)
	{
		
		iterate(z[i],z[i-1]);
		cout<<z[i].real<<'+'<<z[i].imag<<"i\n";
		if(abs(z[i])>=4.0d)
		return i;
	}
	return 0;
}*/
