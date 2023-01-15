%%
%--------------part 1------------------%
%----------------(a)-----------------%
N_1 = 500;
N = 2*N_1+1;
T = 100;
n = linspace(-N_1, N_1, N);
x = zeros(1, N);
T_s = T/N_1;

plot_ = true;

for i=1:N
    x(i) = sinc(2*n(i)*T_s);
end
if(plot_)
    figure(1)
    plot(n,x);
    xlabel('n');
    ylabel('x[n]');
    title('Plot of x_1[n], Problem a')
end

%%
%----------------(b)-----------------%
X = abs(fftshift(fft(x)));
P = 2*pi*n/1001;  %the interval

if(plot_)
   figure(2)
   plot(P, X);
   xlabel('\omega');
   ylabel('fft x[n]');
   title('Plot of fft x[n], Problem b')
end
%%
%----------------(c)-----------------%
X_k = zeros(1, N);
for k=1:N
    for j=1:N
        X_k(k) = X_k(k) + x(j)* exp(1i*-(2*pi/N)*(j-1)*(k-1));
    end
end
X_k = circshift(abs(X_k), N_1);

if(plot_)
   figure(3)
   plot(P, X_k);
   xlabel('\omega');
   ylabel('X_k[n]');
   title('Plot of X_k[n], Problem c')
end
%%
%---------------part 2----------------%
%-----------------(d)-----------------%
T_w = T/2;
w = zeros(1, N);

for i=1:N
    w(i) = Hanning(-N_1, i*T/N_1, T_w, T/N_1);
end

if(plot_)
    figure(4)
    plot(n,w);
    xlabel('n');
    ylabel('w[n]');
    title('Plot of w[n], Problem d')
end
%%
%------------------(e)-----------------%
y = zeros(1, N);
for i=1:N
    y(i) = x(i)*w(i);
end
if(plot_)
    figure(5)
    plot(n,y);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem e')
end
%%
%------------------(f)------------------%
Y = abs(fftshift(fft(y)));

if(plot_)
   figure(6)
   plot(P, Y);
   xlabel('\omega');
   ylabel('fft y[n]');
   title('Plot of fft y[n], Problem f')
end
%%
%----------function declaration----------%
function a = Hanning(start, x, T_w,T_s)
    if abs(start*T_s+x)<=T_w/2
        a = 1/2*(1+cos(2*pi*abs(start*T_s+x)/T_w));
    else
        a = 0;
    end
end