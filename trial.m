A = 0;                  %φ(0) = 0
N = 10;                 %number of input
H = 3;                  %number of hidden nodes
x = 0:2/(N-1):2;        %input vector

w = randn(N,1);         %weight for input
b = zeros(N,1);         %bias
v = randn(1,N);         %weight for output

learning_rate = 0.01;
num_iteration = 1;

grad_w = zeros(N,1);
grad_b = zeros(N,1);
grad_v = zeros(1,N);

for loop = 1:num_iteration
    
    [error,result] = costFunction(x,w,b,v,H,N);
    %求w,b,v的梯度, 到底他妈在里外求?
    
    w = w - learning_rate * grad_w;
    b = b - learning_rate * grad_b;
    v = v - learning_rate * grad_v;
end

plot(x,result .* x,'r-*');
hold on;
plot(x,analytic(x), 'b-*');
disp(error);