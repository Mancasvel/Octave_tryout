% Ejercicio sobre señal de audio 1 -> Ejercicio Simple

F = 440;  %Frecuencia señal
A = 0.12; % Amplitud
T = 2.5;  % Duration
Fs = 11000; % Sampling frequency

f = F/Fs; % normalized frequency
N = Fs* T; %Number of samples
n = 0: N-1; % Domain

% Generacion de la señal

t1_audio = A * cos(2*pi*f*n); %señal = Amplitud * coseno(2pif * n)


%Crear señal senoidal (usando coseno) de N=19 f = 0.45 y fase inicial 2.27

f = 0.45; % normalized frequency
N = 19;
A = 1;
inicial = 2.27;

n = 0: N-1;

t1_cos = A* cos(2*pi*f*n + inicial);



%Crea una señal senoidal de audio F= 250 d = 4 Fs = 2800

A = 1; %amplitud es 1 por defecto
F = 250;
Fs = 2800;
T = 4;

f = F/Fs;
N = Fs * T;
n = 0: N-1;

t2_audio = A * cos(2*pi*f*n);



%% Señal senoidal F= 500 T= 4 Fs= 5400

F= 500;
Fs= 5400;
T= 4;
A = 1; % 1 por defecto

f = F/Fs;
N = T*Fs;
n = 0 : N-1;

t2_audio_2 = A * cos(2*pi*f*n);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ejercicio Delta

%% para funciones function salida = nombreFuncion(entrada)
function y = t1_delta(n)
  %% definimos en la funcion delta que es 1 para n==0
  y = (n == 0);
 endfunction;

 function y = t1_y(n)
   y = t1_delta(n-3);
 endfunction;


function ejercicioDelta()
   n = [0, 3, 2];

   res_delta = t1_delta(n);
   res_y = t1_y(n);

   %% para convertirlo a double
   double_res_delta = double(res_delta);
   double_res_y = double(res_y);

   disp(double_res_delta);
   disp(double_res_y);

 endfunction


 %%%% Funcion delta con L = 9 (longitud del pulso)

 %% nota: si no se ejecuta aqui, luego no se puede ejecutar en terminal

 function y = t1_pulso(n)
   L = 9;
   y = (n>=0) & (n<L);
 endfunction

 function y = t1_y1(n)
   y = t1_pulso(n-3);
 endfunction

 function res_ej_delta1()
  n = [-3,0,1];

  res_pulso = t1_pulso(n);
  res_y = t1_y1(n);

  double_pulso = double(res_pulso);
  double_y = double(res_y);

  disp(double_pulso);
  disp(double_y);

endfunction


%%%%%%%%%%%%%%%%%%%%%Numeros imaginarios
%% Para representar numero imaginario sea i o j se representa con 1i por que i es una variable normal

%% Para octava superior es F*2 y octava inferior F/2


F = 440;
Fs = 8000;
T = 2;
A = 1;

f = F/Fs;
N = Fs* T;
n = 0: N-1;

t2_audio_3 = A * cos(2* pi * f * n );

f_up = F*2;
f_down = F/2;

t2_audio_desplazado_superior = A * cos(2*pi * f_up *n);
t2_inferior = A* cos(2* pi * f_down * n);


[x, Fs] = audioread("four.wav");

audiowrite("fourUp.wav", x, Fs*2);
audiowrite("fourDown.wav", x, Fs/2);



%% Resolucion espectral Fs= 1900 cuando se cogen N = 168

Fs = 1900;
N = 168;

%Resolucion espectral es igual Todos los samples / numero ciclos
t3_resolucion = Fs/N; %% en hercios
fres = 1/N;           %% en ciclos/ muestra



%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Convoluciones%%%%%%%%%%%%%%%%%%%%%%%%

% enunciado respuesta impulsiva:
% respuesta impulsiva h[n] = [-1,0,-3, -1], salida cuando x[n] = [-1,1, -3, 2]
% hacer convolucion de las dos listas

h = [-1, 0, -3, -1];
x = [-1, 1, -3, 2];

%% primero input y luego la respuesta
y = conv(x, h);

%% piden calcular los primeros 13 valores, entonces metemos 0s
%% primero los valores de la convolucion y luego los ceros que faltan para llegar a 13
t2_xout = [y, zeros(1, 13 -length(y))];



%%%%Ejercicio respuesta impulsiva mas complicado:
%% a partir de ecuacion donde se pasan y a la izquierda del igual y las x a la derecha

N = 64;
x = [1, zeros(1, N-1)];         % Paso 1: impulso

b = [3, 0, -1, 0, 0, 3];        % coeficientes entrada x[n]
a = [1, -1];                    % coeficientes salida y[n]

h = filter(b, a, x);            % Paso 2: respuesta al impulso

H = fft(h);                     % Paso 3: respuesta en frecuencia (compleja)
mag_H = abs(H);                 % Paso 4: magnitud = lo que ves y puedes graficar


%%%%%Convolucion circular

%% formula : ifft(fft(x) .* fft(y)) = x[n] ⊛ y[n]
%% reminder: a .* b   →   [1*4, 2*5, 3*6]  →  [4, 10, 18]

%%convolucion circular para x[n] y y[n]


x = [3, 3, -2, 3, -4];
y = [-1, 3, -4, 0, -1];

%% 1 -> Hacemmos fft
fourx = fft(x);
foury = fft(y);

%%  2 -> Multiplicamos las dos con punto
conv = fourx.*foury;

%% 3 -> Hacemos la inversa de fft sobre la conv
t3_conv = ifft(conv);

plot(t3_conv);


%%%% ejercicio extra conv circular en una funcion

function convCircular()
x =[-3, -1, 4, 4, 2];
y  = [-1, 5, -4, 1, -1];

%%fft de ambas

fftx = fft(x);
ffty = fft(y);

%% multiplicacion punto

conv = fftx .* ffty;

%% inversa de fft

t3_conv_2 = ifft(conv);

plot(t3_conv_2);

endfunction

%%%%%%%%%Calcular modulo fft

%% dificultad: funcion tiene el escalon unitario


N = 23;
n = 0: N-1;

%% hacemos la funcion u[n] donde si n>= 0 es 1
u = ones(0, N-1);

%%% Definimos la funcion a partir del enunciado

x = u + 2 * cos(2* pi * 0.25 * n) + 3 * cos(2*pi* 0.40 * n);

%%Queremos modulo de la fft, hacemos fft y luego abs

fftx = fft(x);
t3_x = abs(fftx);

plot(t3_x);

%%%%CUANTIZACION SEÑAL

audio = audioread("audio.wav");
L = 10;

maxi = max(audio);
mini = min(audio);
step = (maxi - mini) /(L -1);

t1_cuant = round((audio -mini) /step) * step + mini;




%% cuantizar secuencia s = 0:0.07:1 en rango [0,1] con 7 niveles y asignar en q

s = 0:0.07:1;
levels = 7;

q = round(s * niveles)/niveles;

%% si el rango fuera de [2, 5] y 8 niveles

s = 0:0.07:1;
levels = 8;

a = 2;
b = 5;
step = (b -a);
q1 = round((s-a) * niveles /step) * step / niveles + a;



%%%%FILTROS

%% filtro paso baja L = 101, F = 400 y Fs = 2000 y queremos h y  modulo espectral H.
L = 101;
F = 400;
Fs = 2000;

n = 0: L-1;
Nyq = Fs/2;

fc = F/ Nyq;

%% Calcular el centro

m = L-1/2;
% El filtro ideal es 2*f_c * sinc(2*f_c*(n - m)), desplazando para centrar en m

h = 2 * fc * sinc(2*fc* (n-m));




%% si fuera paso alta se invierte

h1 = -h;
h1(m + 1)= 1- h(m+1);


%% Calculamos el valor absoluto con la fft y con 512 puntos de resolucion
H = abs(fft(h,512));

plot(H);


%%% Diezmado e Interpolacion

%% diezmado de 0 a 100 con filtro aliasing D = 3

N = 100;
n = 0:N-1;
D = 3;


%% 1 calculamos x con cos (por usar alguna), punto medio M, y fc
x = cos(n);
M = floor(N/2);
fc = 1 / (2*D); %% frecuencia corte para evitar aliasing

filtro = 2*fc* sinc(2*fc* (n-M)); %% filtro antialiasing
x_filtrada = conv(x,filtro);      %% aplica filtro a x
t4_xout = x_filtrada(1:D:end);    %% devuelve el array saltando D elementos


%%% Interpolacion
I = 2;
N = 10;
n = 0:N-1;

x = cos(n);
M = floor(N/2);
fc = 1/(2*I);

filtro = 2*fc * sinc(2 * fc * (n -M));
x_interpolada = zeros(1, length(x)*I); %% crear array vacio con (0)
x_interpolada(1:I:end) = x;            %% colocamos valor de x cada I posiciones
t4_xout = conv(x_interpolada, filtro);      %% aplica filtro a x_interpolada


%% extra interpolacion

N = 20;
I = 4;
n = 0: N-1;

x = sin(2*pi*n/10);
M = floor(N/2);
fc = 1/(2*I);

filtro = 2 * fc * sinc(2*fc * (n - M ));
zeros_signal = zeros(1, length(x)* I);
zeros_signal(1:I:end) = x;
t77_out = conv(zeros_signal,filtro);


%%%%%%%%%%%%%%IMAGENES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Convertir imagen a monocroma

%% a verde

imagen_color = imread("nostalgia2.jpg");

%% (fila, columna, canal)
t5_gris = imagen_color(:,:,2); %% rgb so 2 y green

imshow(t5_gris);



%%% ECUALIZAR IMAGENES

%% ecualiza imagen nostalgia2

imagen = imread("nostalgia2.jpg");


%% calculamos histograma

histograma = hist(imagen(:), 0:255);

%%%% 2 -> Calculamos CDF funcion distribucion acumulativa

cdf  = cumsum(histograma); %% hacemos el cumsum sobre el histograma
cdf = cdf / max(cdf);     %% normalizada para valores entre 0 y 1


%%%% 3 -> aplicar ecualizcion (asignar nuevo nivel de brillo)

t6_ecualizada = uint8(cdf(double(imagen) + 1) * 255);

imshow(t6_ecualizada);


%%% Calcular histograma imagen y dar la cantidad de pixeles con nivel de gris = 15


imagen_grey = rgb2gray(imagen); %% imagen de rgb a gris o imagen(:, :, 2)

histograma = hist(imagen_grey(:), 0:255); %% calcular histograma (:) y de 0:255

cantidad = histograma(16); %% ponemos el valor que queremos saber de input

plot(histograma);




%% Imagen monocroma con iluminacion media


t4_gris_3 = mean(imagen_color, 3)/255;
imshow(t4_gris_3);


