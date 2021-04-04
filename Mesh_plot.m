%% Plot of deformed and undeformed mesh
Xold = X;
Yold = Y;
iter = 1;
for i = 1:2:2*M*N-1
    X(iter) = X(iter)+100000*U(i);
    Y(iter) = Y(iter)+100000*U(i+1);
    iter = iter+1;
end
Xnew = X;
Ynew = Y;
X = Xold;
Y = Yold;

figure;
plot(X,Y,'k-',X',Y','k-');
hold on;
plot(Xnew,Ynew,'r',Xnew',Ynew','r');

hold on;
plot(-X,Y,'k-',-X',Y','k-');
hold on;
plot(-Xnew,Ynew,'r',-Xnew',Ynew','r');

hold on;
plot(X,-Y,'k-',X',-Y','k-');
hold on;
plot(Xnew,-Ynew,'r',Xnew',-Ynew','r');

hold on;
plot(-X,-Y,'k-',-X',-Y','k-');
hold on;
plot(-Xnew,-Ynew,'r',-Xnew',-Ynew','r');
