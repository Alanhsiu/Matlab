%%
%------------2a-----------%
M = 1000;
f_1 = 100;
T_S = 0.002;
plot_ = true;
x = zeros(1,1000);

for i=1:M
    x(i) = cos(2*pi*(i-1)*T_S)+2*cos(2*pi*f_1*(i-1)*T_S);
end

%%
%------------2b--------------%
% 
[b_1,a_1]=butter(16,0.1,"low");
y_1 = filter(b_1, a_1, x);

%%
%%---------2c-----------------%
Wn=[0.25,0.5];
[b_2,a_2]=butter(8,Wn,"bandpass");
y_2 = filter(b_2, a_2, x);
%%
%----------plot--------------%
if(plot_)
    figure(1)
    subplot(3,1,1);
    plot(x);
    xlabel('n');
    ylabel('x[n]');
    title('Plot of x[n], Problem 2.a')

    subplot(3,1,2);
    plot(y_1);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem 2.b')

    subplot(3,1,3);
    plot(y_2);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem 2.c')
end