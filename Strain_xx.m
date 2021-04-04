%% Strain - xx

strain_xx = zeros(M,N);
iter = 1;
for j = 1:N-1
    for i = 1:M-1
        if iter == 1
            strs = strain_centre(iter,1);
            strain_xx(i,j) = strain_xx(i,j)+strs;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/2;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/2;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/4;
        elseif iter == M-1
            strs = strain_centre(iter,1);
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs;
            strain_xx(i,j) = strain_xx(i,j)+strs/2;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/2;
        elseif iter == (N-2)*(M-1)+1
            strs = strain_centre(iter,1);
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs;
            strain_xx(i,j) = strain_xx(i,j)+strs/2;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/2;
        elseif iter == (N-1)*(M-1)
            strs = strain_centre(iter,1);
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs;
            strain_xx(i,j) = strain_xx(i,j)+strs/4;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/2;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/2;
        elseif iter == 2:M-2
            strs = strain_centre(iter,1);
            strain_xx(i,j) = strain_xx(i,j)+strs/2;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/2;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/4;
        elseif iter == M:M-1:(N-2)*(M-1)
            strs = strain_centre(iter,1);
            strain_xx(i,j) = strain_xx(i,j)+strs/2;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/2;
            strain_xx(i,j) = strain_xx(i,j)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/4;
        elseif iter == (N-2)*(M-1)+2:(N-1)*(M-1)-1
            strs = strain_centre(iter,1);
            strain_xx(i,j) = strain_xx(i,j)+strs/4;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/2;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/2;
        elseif iter == (2*(M-1)):(M-1):((N-1)*(M-1)-2)
            strs = strain_centre(iter,1);
            strain_xx(i,j) = strain_xx(i,j)+strs/4;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/2;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/2;
        else
            strs = strain_centre(iter,1);
            strain_xx(i,j) = strain_xx(i,j)+strs/4;
            strain_xx(i+1,j) = strain_xx(i+1,j)+strs/4;
            strain_xx(i+1,j+1) = strain_xx(i+1,j+1)+strs/4;
            strain_xx(i,j+1) = strain_xx(i,j+1)+strs/4;
        end        
        iter = iter + 1;
    end
end

%% Plot

figure;
contourf(X,Y,strain_xx,'edgecolor','none');
