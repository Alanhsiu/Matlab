%%
%--------a--------------%
%a=[500,-500,285,-74,10];
%b=[250,250,-187.5,-125,62.5];
b=0.09*conv(conv([1,-1],[1,-1]),conv([1,1],[1,1]));
a=conv(conv([1,-0.3-0.4i],[1,-0.3+0.4i]),conv([1,-0.1-0.1i],[1,-0.1+0.1i]));
figure
set(gcf,'position',[400,140,1000,600]);
subplot(2,4,1);
zplane(b,a);
title('poles and zeros of H(z), (a)');
%%
%-------b--------------%
[r,p,k]=residuez(b, a);
n=0:1:20;
h1=r(1)*p(1).^(n)+r(2)*p(2).^(n)+r(3)*p(3).^(n)+r(4)*p(4).^(n);
h1(1)=h1(1)+k;
h=real(h1);
subplot(2,4,2);
stem(n,h);
xlabel('n');
title('h[n],(b)');
%%
%-------c------------%
[H, w]=freqz(b,a,1000);
subplot(2,4,3);
plot(w,abs(H));
xlabel('\omega');
title('magnitude(H(z)), (c)');

subplot(2,4,4);
plot(w,angle(H)/pi*180);
xlabel('\omega')
ylabel('phase(deg)')
title('angle(H(z)), (c)');

%%
%-------d------------%
z=[1,1,-1,-1];
p=[0.3+0.4i,0.3-0.4i,0.1+0.1i,0.1-0.1i];
k=0.09;
sos=zp2sos(z,p,k);
%%
%-------e-------------%
[H1,w1]=freqz([0.09,0.18,0.09],[1,-0.2,0.02],1000);
[H2,w2]=freqz([1,-2,1],[1,-0.6,0.25],1000);
subplot(2,4,5);
plot(w1, abs(H1));
xlabel('\omega');
title('magnitude(H_1(z)), (e)');

subplot(2,4,6);
plot(w2, abs(H2));
xlabel('\omega');
title('magnitude(H_2(z)), (e)');

subplot(2,4,7);
plot(w1,abs(H1).*abs(H2));
xlabel('\omega');
title('magnitude(H_1(z))*magnitude(H_2(z)), (e)');
%%
%--------f------------%
x=zeros(1,21);
x(1)=1;
y=filter(b,a,x);
subplot(2,4,8);
stem(n,y);
xlabel('n');
title('y[n],(f)');