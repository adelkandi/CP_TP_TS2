%Clean
clc;
clear all;
close all;

% Inputs:
pas = input('Donner la valeur de pas: ');
fs=100; 
N=0:1/fs:17-1/fs; 
t1 = -8:pas:16;
T0=8;
f0=1/T0;
t2= N-4; 
w0=2*pi*f0;

% Signal x(t):
x = - square(pi*2*t2*f0)+square(2*w0*N);  % Train d'impulsions avec la fonction square
x(x<0)=0;
x(x>0)=1; 

%Série de Fourier avec int() function qui calcule les integral :
which int
syms t
syms n
k=20; 
n=1:k;
a0=(2/T0)*(int(1,t,0,2));
an=(2/T0)*(int(1*cos(n*w0*t),t,0,2));
bn=(2/T0)*(int(1*sin(n*w0*t),t,0,2));

X=a0/2;
for i=1:k
    X=X+an(i)*cos(i*w0*N)+bn(i)*sin(i*w0*N);
end

% Plot Graphs: 
F = plot(N,x);
set(F(1),'linewidth',1.3)
xlabel('Temps(s)');
ylabel('Amplitude');
title('Signal x(t) avec série de Fourier');
hold on

Z = plot(N,X,'r');
set(Z(1),'linewidth',1.6)
grid on
