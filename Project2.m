clear; close all; clc;

% elliptical hole steel plate
% has 2 axis of symmetry
% considering one quarter of the geometry

% geometric properties
length = 1;
breadth = 1;
width = 1;
a = 0.1;
b = 0.1;

% code for analysis of variation of minor axis b
% ct = 1;
% diff = (0.2-0.01)/12;
% for b = 0.01:diff:0.2
%     clearvars -except ct a b Stress_max Stress_C b_val 
% b = 0.1;    % varies from 0.2 to 0.01

% material properties
E = 210E9;
mu = 0.3;

% elastic matrix
D = (E/((1+mu)*(1-2*mu)))*[1-mu, mu, 0; mu, 1-mu, 0; 0, 0, ((1-2*mu)/2)];

%% MESHING

% code for mesh convergence study
% for t = 1:10
%     clearvars -except U_max U_min ele_t t a b E mu D 
%     M = t*6;
%     N = t*6 + 1;
    
M = 32;          % number of circumferential nodes
N = 31;          % number of radial nodes

theta = linspace(0,pi/2,N);
u = linspace(0,1,M)';
Ra = a.*u + (1-u).*min(1./abs(sin(theta)), 1./abs(cos(theta)));
Rb = b.*u + (1-u).*min(1./abs(sin(theta)), 1./abs(cos(theta)));
X = Ra.*cos(theta);
Y = Rb.*sin(theta);

% Mesh plot
figure;
plot(X,Y,'k-',X',Y','k-');

%%
% arranging nodes according to the element number

elements = (M-1)*(N-1);     % total number of elements
ele = 1;
for j = 1:N-1
    for i = 1:M-1
        x1 = X(i,j);
        x2 = X(i,j+1);
        x3 = X(i+1,j+1);
        x4 = X(i+1,j);
        y1 = Y(i,j);
        y2 = Y(i,j+1);
        y3 = Y(i+1,j+1);
        y4 = Y(i+1,j);
        Xele(ele,:) = [x1 x2 x3 x4];
        Yele(ele,:) = [y1 y2 y3 y4];
        ele = ele +1;
    end
end

%% FEM
run('FEM.m');

% end for the mesh convergence study and variation of b study
% end