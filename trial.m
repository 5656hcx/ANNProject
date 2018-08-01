%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  trial solution for Q2  %
%    (steepest descent)   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  network parameters  %

A = 0; 
N = 10; 
H = 6; 
x = 0:2/(N-1):2; 

learning_rate = 0.01;
num_iteration = 1000;
err_precision = 1e-1;

w = randn(H,1);
b = zeros(H,1);
v = randn(1,H);

grad_w = zeros(H,1);
grad_b = zeros(H,1);
grad_v = zeros(1,H);

% trainning process %

for loop=1:num_iteration
    for i=1:H
        temp_w = sym('w',[H,1]);
        temp_b = sym('b',[H,1]);
        temp_v = sym('v',[1,H]);

        for j=1:H
            if j~=i
                temp_w = subs(temp_w,temp_w(j),w(j));
                temp_b = subs(temp_b,temp_b(j),b(j));
                temp_v = subs(temp_v,temp_v(j),v(j));
            end
        end

        grad_w(i) = subs(diff(costFunction(x,temp_w,b,v),temp_w(i)),temp_w(i),w(i));
        grad_b(i) = subs(diff(costFunction(x,w,temp_b,v),temp_b(i)),temp_b(i),b(i));
        grad_v(i) = subs(diff(costFunction(x,w,b,temp_v),temp_v(i)),temp_v(i),v(i));
    end
    
    w = w - learning_rate * grad_w;
    b = b - learning_rate * grad_b; 
    v = v - learning_rate * grad_v; 
    
    if costFunction(x,w,b,v) < err_precision
        break;
    end
    
end

%  output illustration %

predict_x = 0:2/9:2;
[cost,result] = costFunction(predict_x,w,b,v);

plot(predict_x,result .* (predict_x),'r-o');
hold on;
plot(predict_x,analytic(predict_x), 'b-o');
disp(cost);