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
T = 2s;
A = 1;

f = F/Fs;
N = Fs* T;
n = 0: N-1;

t2_audio_3 = A * cos(2* pi * f * n );

F_up = F*2;
F_down = F/2;

t2_audio_desplazado_superior = A * cos(2*pi * f_up *n);
t2_inferior = A* cos(2* pi * f_down * n);


[x, Fs] = audioread("four.wav");

audiowrite("fourUp.wav", x, Fs*2);
audiowrite("fourDown.wav", x, Fs/2);



%% Resolucion espectral Fs= 1900 cuando se cogen N = 168

Fs = 1900;
N = 168;

%Resolucion espectral es igual Todos los samples / numero ciclos
t3_resolucion = Fs/N;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Convoluciones%%%%%%%%%%%%%%%%%%%%%%%%

% enunciado respuesta impulsiva:
% respuesta impulsiva h[n] = [-1,0,-3, -1], salida cuando x[n] = [-1,1, -3, 2]
% hacer convolucion de las dos listas

h = [-1, 0, -3, -1];
x = [-1, 1, -3, 2];

%% primero input y luego la respuesta
convolucion = conv(x, h);

%% piden calcular los primeros 13 valores, entonces metemos 0s
%% primero los valores de la convolucion y luego los ceros que faltan para llegar a 13
t2_xout = [convolucion, zeros(1, 13 -length(convolucion))];



%%%%Ejercicio respuesta impulsiva mas complicado:
%% a partir de ecuacion donde se pasan y a la izquierda del igual y las x a la derecha

N = 84;                            % Número de muestras que deseas
b = [3, 0, -1, 0, 0, 3];           % Coeficientes del numerador
a = [1, -1];                       % Coeficientes del denominador

x = [1, zeros(1, N-1)];           % delta[n]
h = filter(b, a, x);             % Respuesta impulsiva
H = fft(h);                      % Respuesta en frecuencia (compleja)

t4_H = abs(H);                   % Magnitud de la respuesta en frecuencia






