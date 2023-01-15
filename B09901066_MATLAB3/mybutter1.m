%%
%--------------------1a---------------------%
T_s = 1/20;
plot_ = true;
x =zeros(1,100);
for i=1:100
   x(i) = cos(2*pi*(i-1)*T_s); 
end
if(plot_)
    figure(1)
    plot(x);
    xlabel('n');
    ylabel('x[n]');
    title('Plot of x[n], Problem 1.a')
end
%%
%-------------------1bcde-------------------%
L_1=3; %filter order
L_2=7;
f_c_1=0.05; %cutoff frequency
f_c_2=0.5;

[b_1,a_1] = butter(L_1, f_c_1);
[H_1,w] = freqz(b_1,a_1,1000);
[b_2,a_2] = butter(L_2, f_c_1);
[H_2,w] = freqz(b_2,a_2,1000);
[b_3,a_3] = butter(L_1, f_c_2);
[H_3,w] = freqz(b_3,a_3,1000);

P_1 = angle(H_1);
P_2 = angle(H_2);
P_3 = angle(H_3);

y_1=filter(b_1,a_1,x);
y_2=filter(b_2,a_2,x);
y_3=filter(b_3,a_3,x);

if(plot_)
    figure(2)
    set(gcf,'position',[400,180,800,600])
    subplot(3,3,1)
    plot(w, 20*log10(abs(H_1)));
    title('Amplitude Response, f_c=0.05, L=3')
    ylabel('abs(H)(dB)');
    xlabel('w');
    subplot(3,3,4)
    plot(w, 20*log10(abs(H_2)));
    title('Amplitude Response, f_c=0.05, L=7')
    ylabel('abs(H)(dB)');
    xlabel('w');
    subplot(3,3,7)
    plot(w, 20*log10(abs(H_3)));
    title('Amplitude Response, f_c=0.5, L=3')
    xlabel('w');
    ylabel('abs(H)(dB)');
    
    subplot(3,3,2)
    plot(w, P_1/pi*180);
    title('Phase Response, f_c=0.05, L=3')
    ylabel('Phase(deg)');
    xlabel('w');
    subplot(3,3,5)
    plot(w, P_2/pi*180);
    title('Phase Response, f_c=0.05, L=7')
    ylabel('Phase(deg)');
    xlabel('w');
    subplot(3,3,8)
    plot(w, P_3/pi*180);
    title('Phase Response, f_c=0.5, L=3')
    ylabel('Phase(deg)');
    xlabel('w');

    subplot(3,3,3)
    plot(y_1);
    title('y[n], f_c=0.05, L=3')
    ylabel('y[n]');
    xlabel('n');
    subplot(3,3,6)
    plot(y_2);
    title('y[n], f_c=0.05, L=7')
    ylabel('y[n]');
    xlabel('n');
    subplot(3,3,9)
    plot(y_3);
    title('y[n], f_c=0.5, L=3')
    ylabel('y[n]');
    xlabel('n');
end