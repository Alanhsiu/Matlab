%MATLAB1
%-----------------------------------------
N_1 = 39;
N_2 = 39;
x_1 = zeros(N_1,1);
x_2 = zeros(N_2,1);
plot = true;
%------------------a-----------------------
for i=1:20
    x_1(i) = i;
end
for i=21:39
    x_1(i) = 40-i;
end

for i=1:N_2
    x_2(i) = step(i-1)-step(i-11);
end

if(plot)
    figure(1)
    stem(x_1);
    xlabel('n');
    ylabel('x_1[n]');
    title('Plot of x_1[n], Problem a')
    figure(2)
    stem(x_2);
    xlabel('n');
    ylabel('x_2[n]');
    title('Plot of x_2[n], Problem a')
%-------------------b-----------------------
    x_3 = conv(x_1, x_2);
    figure(3)
    stem(x_3);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem b')
end
%-------------------c-----------------------
M_1 = zeros(N_1*2-1,N_2);
for j=1:N_2
    for i=1:N_1
        M_1(i+j-1,j) = x_1(i);
    end
end

% x_2_append = zeros(N_1+N_2-1,1);
% for i=1:N_2
%     x_2_append(i) = x_2(i);
% end

x_4 = M_1*x_2;

if(plot)
    figure(4)
    stem(x_4);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem c')
end
%--------------------d1-----------------------
N_1 = 5;
N_2 = 5;
x_5 = zeros(N_1,1);
x_6 = zeros(N_2,1);

for i=1:3
    x_5(i) = 3^i*step(i);
end

for i=1:5
    x_6(i) = 2^i*step(i);
end

if(plot)
    figure(5)
    stem(x_5);
    xlabel('n');
    ylabel('x_1[n]');
    title('Plot of x_1[n], Problem d')
    figure(6)
    stem(x_6);
    xlabel('n');
    ylabel('x_2[n]');
    title('Plot of x_2[n], Problem d')
%--------------------d2----------------------
    x_7 = conv(x_5, x_6);
    figure(7)
    stem(x_7);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem d')
end
%--------------------d3----------------------
M_2 = zeros(N_1*2-1,N_2);
for j=1:N_2
    for i=1:N_1
        M_2(i+j-1,j) = x_5(i);
    end
end

% x_5_append = zeros(N_1+N_2-1,1);
% for i=1:N_2
%     x_5_append(i) = x_6(i);
% end

x_8 = M_2*x_6;

if(plot)
    figure(8)
    stem(x_8);
    xlabel('n');
    ylabel('y[n]');
    title('Plot of y[n], Problem d')
end
%------------------function declaration------------------
function u = step(x)
    if(x>=0)
        u=1;
    else
        u=0;
    end
end