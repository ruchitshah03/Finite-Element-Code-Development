%% Stress - xy

stress_xy = zeros(M,N);
iter = 1;
for j = 1:N-1
    for i = 1:M-1
        if iter == 1
            strs = stress_centre(iter,3);
            stress_xy(i,j) = stress_xy(i,j)+strs;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/2;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/2;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/4;
        elseif iter == M-1
            strs = stress_centre(iter,3);
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs;
            stress_xy(i,j) = stress_xy(i,j)+strs/2;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/2;
        elseif iter == (N-2)*(M-1)+1
            strs = stress_centre(iter,3);
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs;
            stress_xy(i,j) = stress_xy(i,j)+strs/2;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/2;
        elseif iter == (N-1)*(M-1)
            strs = stress_centre(iter,3);
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs;
            stress_xy(i,j) = stress_xy(i,j)+strs/4;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/2;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/2;
        elseif iter == 2:M-2
            strs = stress_centre(iter,3);
            stress_xy(i,j) = stress_xy(i,j)+strs/2;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/2;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/4;
        elseif iter == M:M-1:(N-2)*(M-1)
            strs = stress_centre(iter,3);
            stress_xy(i,j) = stress_xy(i,j)+strs/2;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/2;
            stress_xy(i,j) = stress_xy(i,j)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/4;
        elseif iter == (N-2)*(M-1)+2:(N-1)*(M-1)-1
            strs = stress_centre(iter,3);
            stress_xy(i,j) = stress_xy(i,j)+strs/4;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/2;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/2;
        elseif iter == (2*(M-1)):(M-1):((N-1)*(M-1)-2)
            strs = stress_centre(iter,3);
            stress_xy(i,j) = stress_xy(i,j)+strs/4;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/2;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/2;
        else
            strs = stress_centre(iter,3);
            stress_xy(i,j) = stress_xy(i,j)+strs/4;
            stress_xy(i+1,j) = stress_xy(i+1,j)+strs/4;
            stress_xy(i+1,j+1) = stress_xy(i+1,j+1)+strs/4;
            stress_xy(i,j+1) = stress_xy(i,j+1)+strs/4;
        end        
        iter = iter + 1;
    end
end

%% Plot

figure;
contourf(X,Y,stress_xy,'edgecolor','none');