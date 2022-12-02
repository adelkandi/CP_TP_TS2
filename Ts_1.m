% Clean:
clc
clear all 
close all 

% Inputs:
N=('Donner la valeur de N');
pas=input('Donner les valeur de pas: ');

t = -8:pas:16;
T0=8;
f0=1/T0;
t2= t-4; 
w0=2*pi*f0;

% Signal x(t):
x = - square(pi*2*t2*f0)+square(2*w0*t);  % Train d'impulsions avec la fonction square
x(x<0)=0;
x(x>0)=1; 


% plot signal x(t):
subplot(2,1,1)
plot(t,x,'r');
axis([-8 16 -0.5 1.5])
ylabel('Amplitude');
xlabel('Temps (s)');
title('Signal x(t)')
grid on 



% Séries de Fourier:

% Coefficient de Fourier:
%an=(sin(2*n*w0)/(4*n*w0));
%bn=((-cos(2*n*w)+1)/(4*n*w));
%a0= 1/4*n*w0;

 
k = input('Donner la valeur de k:'); % k : Taux de distortion 
n=2.5;
a0=1/4*n*w0;
X=a0/2;
for n=1:k
    a0=1/4*n*w0;
    an=(sin(2*n*w0)/(4*n*w0));
    bn=((-cos(2*n*w0)+1)/(4*n*w0));
    X=X+an*cos(n*w0*t)+bn*sin(n*w0*t);
end

%Plot generated X(t) signal:
subplot(2,1,2)
axis([-8 16 -0.5 1.5])
plot(t,X)
ylabel('Amplitude');
xlabel('Temps (s)');
title('Train  impulsions périodique X(t) avec séries de Fourier: ')
grid on 

%End

