clc;
clear all;
syms x;
n = input('number of data : ');
f = zeros(n);
for v = 1 : 1 : n
    prompt = strcat('enter x',string(v), ' : ');
    a(v) = input(prompt);
    prompt = strcat('enter y',string(v), ' : ');
    f(v,1) = input(prompt);
end
for v = 2 : 1 : n
    for w = 2 : 1 :v
        temp = (f(v , w -1) - f(v-1 , w-1)) / (a(v) - a(v-w+1));
        f(v , w ) = temp;
    end
end
p = sym(f(1,1));
for v = 2 : 1 : n
    temp = 1;
    for w = 1 : 1 : v-1
        temp = temp * (x - a(w));
    end
    p = p + temp * f(v,v);
end
disp('newton polynomial : ');
disp(p);
disp('expanded polynomial : ');
disp(expand(p));
o = input ( 'enter inner number : ');
disp('answer is : ');
disp(subs(p , x , o));