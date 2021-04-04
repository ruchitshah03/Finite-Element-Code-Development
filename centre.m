%% Post-processing at centre of each element

% This code generates the value of strain (all 3 componenets),.....
% ..... stress (all 3 componenets), and von-Mises stress at .....
% ..... the centre of each element.

for k = 1:elements
    eta = 0;
    eps = 0;
    xyele = [Xele(k,:); Yele(k,:)]';
    J = (1/4)*[eta-1 1-eta 1+eta -eta-1; eps-1 -eps-1 1+eps 1-eps]*xyele;
    detJ = abs(det(J));
    Hstar = inv(J)*(1/4)*[eta-1 1-eta 1+eta -eta-1; eps-1 -eps-1 1+eps 1-eps];
    H = [Hstar(1,1) 0 Hstar(1,2) 0 Hstar(1,3) 0 Hstar(1,4) 0; 0 Hstar(2,1) 0 Hstar(2,2) 0 Hstar(2,3) 0 Hstar(2,4); Hstar(2,1) Hstar(1,1) Hstar(2,2) Hstar(1,2) Hstar(2,3) Hstar(1,3) Hstar(2,4) Hstar(1,4)];
    strain_centre(k,:) = H*d(k,:)';
    stress_centre(k,:) = D*strain_centre(k,:)';
end
for k = 1: elements
    sigma_VM(k) = sqrt(((stress_centre(k,1)-stress_centre(k,2))^2 + stress_centre(k,1)^2 + stress_centre(k,2)^2 + 6 * stress_centre(k,3)^2)/2);
end