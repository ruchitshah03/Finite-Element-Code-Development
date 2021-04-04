%% Stress - yy

stress_yy = zeros(M,N);
iter = 1;
for j = 1:N-1
    for i = 1:M-1
        if iter == 1
            strs = stress_centre(iter,2);
            stress_yy(i,j) = stress_yy(i,j)+strs;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/2;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/2;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/4;
        elseif iter == M-1
            strs = stress_centre(iter,2);
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs;
            stress_yy(i,j) = stress_yy(i,j)+strs/2;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/2;
        elseif iter == (N-2)*(M-1)+1
            strs = stress_centre(iter,2);
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs;
            stress_yy(i,j) = stress_yy(i,j)+strs/2;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/2;
        elseif iter == (N-1)*(M-1)
            strs = stress_centre(iter,2);
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs;
            stress_yy(i,j) = stress_yy(i,j)+strs/4;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/2;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/2;
        elseif iter == 2:M-2
            strs = stress_centre(iter,2);
            stress_yy(i,j) = stress_yy(i,j)+strs/2;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/2;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/4;
        elseif iter == M:M-1:(N-2)*(M-1)
            strs = stress_centre(iter,2);
            stress_yy(i,j) = stress_yy(i,j)+strs/2;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/2;
            stress_yy(i,j) = stress_yy(i,j)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/4;
        elseif iter == (N-2)*(M-1)+2:(N-1)*(M-1)-1
            strs = stress_centre(iter,2);
            stress_yy(i,j) = stress_yy(i,j)+strs/4;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/2;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/2;
        elseif iter == (2*(M-1)):(M-1):((N-1)*(M-1)-2)
            strs = stress_centre(iter,2);
            stress_yy(i,j) = stress_yy(i,j)+strs/4;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/2;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/2;
        else
            strs = stress_centre(iter,2);
            stress_yy(i,j) = stress_yy(i,j)+strs/4;
            stress_yy(i+1,j) = stress_yy(i+1,j)+strs/4;
            stress_yy(i+1,j+1) = stress_yy(i+1,j+1)+strs/4;
            stress_yy(i,j+1) = stress_yy(i,j+1)+strs/4;
        end        
        iter = iter + 1;
    end
end

%% Plot

figure;
contourf(X,Y,stress_yy,'edgecolor','none');
% hold on;
% contourf(-X,Y,stress_yy,'edgecolor','none');
% hold on;
% contourf(-X,-Y,stress_yy,'edgecolor','none');
% hold on;
% contourf(X,-Y,stress_yy,'edgecolor','none');
% axis([-0.3 0.3 -0.3 0.3])