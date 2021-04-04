%% FEM code

% code to find the global displacement vector
% the result will be used for the post processing

%% Stiffness Matrix Calculation

% considering 2 Gauss points
w = [1; 1];
eps = [-1/sqrt(3); 1/sqrt(3)];
eta = [-1/sqrt(3); 1/sqrt(3)];

% Ke = elemental stiffness matrix
% K = global stiffness matrix
% L = scatter matrix
% Kall = cell of all the elemental stiffness matrix
% Lall = cell of all the elemental scatter matrix
K = zeros(2*M*N, 2*M*N);
n=1;
iter = 1;
for k = 1:elements
    Ke = 0;
    for i = 1:2
        for j = 1:2
            xyele = [Xele(k,:); Yele(k,:)]';
            J = (1/4)*[eta(i)-1 1-eta(i) 1+eta(i) -eta(i)-1; eps(j)-1 -eps(j)-1 1+eps(j) 1-eps(j)]*xyele;
            detJ = abs(det(J));
            Hstar = inv(J)*(1/4)*[eta(i)-1 1-eta(i) 1+eta(i) -eta(i)-1; eps(j)-1 -eps(j)-1 1+eps(j) 1-eps(j)];
            H = [Hstar(1,1) 0 Hstar(1,2) 0 Hstar(1,3) 0 Hstar(1,4) 0; 0 Hstar(2,1) 0 Hstar(2,2) 0 Hstar(2,3) 0 Hstar(2,4); Hstar(2,1) Hstar(1,1) Hstar(2,2) Hstar(1,2) Hstar(2,3) Hstar(1,3) Hstar(2,4) Hstar(1,4)];
            Ke = Ke + w(i)*w(j)*detJ*H'*D*H;
        end
    end
    n1 = [n,n+1];
    n2 = [(2*M)+n,(2*M)+n+1];
    n3 = [(2*M)+n+2, (2*M)+n+3];
    n4 = [n+2,n+3];
    dof = [n1; n2; n3; n4];
    L = zeros(8,2*M*N);
    L(1,dof(1)) = 1;
    L(2,dof(5)) = 1;
    L(3,dof(2)) = 1;
    L(4,dof(6)) = 1;
    L(5,dof(3)) = 1;
    L(6,dof(7)) = 1;
    L(7,dof(4)) = 1;
    L(8,dof(8)) = 1;
    Lall{k} = L;
    K = K + L'*Ke*L;
    Kall{k} = Ke;
    if iter == M-1
        n = n+4;
        iter = 1;
    else
        n = n+2;
        iter = iter + 1;
    end
end

%% Force vector
force = (200E3/((N-1)/2));  % (200 MPa * 2 * 10E-3 = 0.400 MN = 400E3 N    400E3/2 = 200E3 divided into number of top elements)

for i = 1:elements
    fel = zeros(8,1);
    fele{i} = fel;
end
f = zeros(2*M*N,1);
for i = (elements/2)+1:M-1:elements
    fe = zeros(8,1);
    fe(2) = force/2;
    fe(4) = force/2;
    fele{i} = fe;
    f = f + Lall{i}'*fe;
end

%% Displacement vector
fixed_dof = union([2:2:2*M],[((N-1)*M)*2+1:2:2*N*M]);
all_dof = [1:2*M*N];
free_dof = setdiff(all_dof,fixed_dof);

U(free_dof,:) = K(free_dof,free_dof)\f(free_dof,:);

d = [];
for k = 1:elements
    L_elem = Lall{k};
    dis_ele = L_elem*U;
    d = [d; dis_ele'];
end

%%%%%%%%--------------------------------------------%%%%%%%%%%%%
disp(elements);
disp(max(U));
disp(min(U));

%%
% code used when to perform mesh convergence study and variation of b study

% run('centre.m');
% run('Stress_yy');

% Stress_max(ct) = max(max(stress_yy));
% Stress_C(ct) = stress_yy(M,1);
% b_val(ct) = b;
% ct = ct + 1;

% U_max(t) = max(U);
% U_min(t) = min(U);
% ele_t(t) = elements;
