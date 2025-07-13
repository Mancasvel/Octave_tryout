

%%%% example exam


%% ejercicio 1
F = 440;
A = 0.75;
T = 2.5;

Fs = F/A;
N = T* Fs;
f = F/Fs;
n = 0:N-1;

a = A * cos(2* pi * f * n);


%% ejercicio 3

s = 0:0.07:1;
maxi = 0;
mini = 1;

L  = 7;

step = (maxi-mini)/(L-1);

q = round((s-mini)/step)*step - mini;

plot(q);

%%ejercicio 4

L = 101;
n = 0: L-1;
F = 400;
Fs = 2000;

M = (L-1)/2;
f = F/Fs;

h = 2* f * sinc(2*f * (n -M));

H = uint8(abs(fft(h)));

plot(H);
