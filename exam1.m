

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


%%ejercicio 5

imagen = imread("nostalgia2.jpg");

imagen_grey = imagen(:,:,2);

imagen_aux = im2double(imagen);

imagen_grey2 = mean(imagen_aux, 3);


h = hist(imagen_grey, 0:255);
histograma_15 = h(15);
plot(h);
disp(histograma_15);

imagen_bn = rgb2gray(imagen);

%% para binarizar imagen
umbral = 0.5;                               % 2. umbral (ajustable)
imagen_bn = imagen_grey > umbral;          % 3. binarización: True (1) o False (0)


%% tarea 3 exam 2

s = [1, zeros(1, 53)];
x = [3, 0, -2, 0, 0, 3];
y = [1, -1];

%% 1 hacer filter
h = filter(x, y, s);

%% 2 hacer fft
t3_h = fft(h);






%% Ejercicio 2 examen 2

x = [-2,4, -4,5, 1];
N = length(x); %% longitud funcion
k = 0: N-1;    %% los distintos valores
n0 = 2;        %% desplazamiento x[n-2]

t2_y = exp(-1i*2*pi * k * n0/N) .*fft(x); %% funcion de e multiplicacion punto fft(x)


