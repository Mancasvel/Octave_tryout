%% =================================================================
%% EXAMPLE1.M - Fundamentos de Procesamiento Digital de Señales
%% =================================================================

%% =================================================================
%% 1. GENERACIÓN DE SEÑALES BÁSICAS
%% =================================================================

function generateBasicSignals()
    printf("=== Generando señales básicas ===\n");
    
    % Parámetros base
    F = 440; Fs = 11000; T = 2.5; A = 0.12;
    
    % Señal senoidal básica
    f = F/Fs; N = Fs*T; n = 0:N-1;
    audio_basic = A * cos(2*pi*f*n);
    
    % Señal con fase inicial
    audio_phase = A * cos(2*pi*0.45*(0:18) + 2.27);
    
    % Octavas (superior e inferior)
    audio_up = A * cos(2*pi*(F*2/Fs)*n);
    audio_down = A * cos(2*pi*(F/2/Fs)*n);
    
    % Guardar archivos de audio
    audiowrite("basic_tone.wav", audio_basic, Fs);
    audiowrite("octave_up.wav", audio_up, Fs);
    audiowrite("octave_down.wav", audio_down, Fs);
    
    printf("Señales generadas y guardadas\n");
end

%% =================================================================
%% 2. FUNCIONES DE SEÑALES DISCRETAS
%% =================================================================

% Delta de Dirac discreta
function y = delta(n)
    y = (n == 0);
end

% Pulso rectangular
function y = pulso(n, L = 9)
    y = (n >= 0) & (n < L);
end

% Escalón unitario
function y = escalon(n)
    y = (n >= 0);
end

% Señal delta desplazada
function y = delta_shifted(n, delay = 3)
    y = delta(n - delay);
end

% Ejemplo de uso de funciones discretas
function testDiscreteSignals()
    printf("=== Probando señales discretas ===\n");
    
    n = -5:10;
    
    % Probar funciones
    d = delta(n);
    p = pulso(n);
    u = escalon(n);
    ds = delta_shifted(n);
    
    % Mostrar resultados
    printf("Delta en n=0: %d\n", d(n==0));
    printf("Pulso L=9: longitud = %d\n", sum(p));
    printf("Escalón: primeros valores = [%s]\n", num2str(u(1:5)));
end

%% =================================================================
%% 3. CONVOLUCIÓN
%% =================================================================

function demoConvolution()
    printf("=== Demostración de convolución ===\n");
    
    % Convolución lineal
    h = [-1, 0, -3, -1];
    x = [-1, 1, -3, 2];
    y_linear = conv(x, h);
    
    % Convolución circular
    x_circ = [3, 3, -2, 3, -4];
    y_circ = [-1, 3, -4, 0, -1];
    y_circular = ifft(fft(x_circ) .* fft(y_circ));
    
    printf("Convolución lineal: [%s]\n", num2str(y_linear));
    printf("Convolución circular: [%s]\n", num2str(real(y_circular)));
    
    % Visualizar
    figure;
    subplot(2,1,1); stem(y_linear); title('Convolución Lineal');
    subplot(2,1,2); stem(real(y_circular)); title('Convolución Circular');
end

%% =================================================================
%% 4. ANÁLISIS ESPECTRAL
%% =================================================================

function spectralAnalysis()
    printf("=== Análisis espectral ===\n");
    
    % Parámetros
    Fs = 1900; N = 168; n = 0:N-1;
    
    % Señal compuesta
    x = escalon(n) + 2*cos(2*pi*0.25*n) + 3*cos(2*pi*0.40*n);
    
    % Análisis FFT
    X = fft(x);
    magnitude = abs(X);
    
    % Resolución espectral
    res_hz = Fs/N;
    res_norm = 1/N;
    
    printf("Resolución espectral: %.2f Hz, %.4f ciclos/muestra\n", res_hz, res_norm);
    
    % Visualizar
    figure;
    subplot(2,1,1); plot(n, x); title('Señal en tiempo'); xlabel('n');
    subplot(2,1,2); plot(magnitude); title('Magnitud FFT'); xlabel('k');
end

%% =================================================================
%% 5. FILTROS BÁSICOS
%% =================================================================

function basicFilters()
    printf("=== Filtros básicos ===\n");
    
    % Respuesta impulsiva por ecuación en diferencias
    N = 64;
    impulse = [1, zeros(1, N-1)];
    b = [3, 0, -1, 0, 0, 3];  % Numerador
    a = [1, -1];              % Denominador
    
    h = filter(b, a, impulse);
    H = fft(h);
    
    % Filtro paso-bajo ideal
    L = 101; F = 400; Fs = 2000;
    n = 0:L-1; M = (L-1)/2;
    fc = F/Fs;
    
    h_lpf = 2*fc * sinc(2*fc*(n-M));
    H_lpf = abs(fft(h_lpf, 512));
    
    printf("Filtro diseñado: L=%d, Fc=%d Hz\n", L, F);
    
    % Visualizar
    figure;
    subplot(2,2,1); stem(h(1:20)); title('Respuesta Impulsiva');
    subplot(2,2,2); plot(abs(H)); title('Respuesta en Frecuencia');
    subplot(2,2,3); plot(h_lpf); title('Filtro Paso-Bajo');
    subplot(2,2,4); plot(H_lpf); title('Respuesta Paso-Bajo');
end

%% =================================================================
%% 6. REMUESTREO (DIEZMADO E INTERPOLACIÓN)
%% =================================================================

function resamplingDemo()
    printf("=== Demostración de remuestreo ===\n");
    
    % Señal original
    N = 100; n = 0:N-1;
    x = cos(2*pi*n/10);
    
    % Diezmado (D=3)
    D = 3;
    x_decimated = x(1:D:end);
    
    % Interpolación (I=2)
    I = 2;
    x_upsampled = zeros(1, length(x)*I);
    x_upsampled(1:I:end) = x;
    
    printf("Señal original: %d muestras\n", length(x));
    printf("Después diezmado: %d muestras\n", length(x_decimated));
    printf("Después interpolación: %d muestras\n", length(x_upsampled));
    
    % Visualizar
    figure;
    subplot(3,1,1); plot(x); title('Señal Original');
    subplot(3,1,2); plot(x_decimated); title('Diezmado (D=3)');
    subplot(3,1,3); plot(x_upsampled); title('Interpolado (I=2)');
end

%% =================================================================
%% 7. FUNCIÓN PRINCIPAL - EJECUTAR TODOS LOS EJEMPLOS
%% =================================================================

function runAllExamples()
    printf("\n=== EJECUTANDO TODOS LOS EJEMPLOS ===\n\n");
    
    generateBasicSignals();
    testDiscreteSignals();
    demoConvolution();
    spectralAnalysis();
    basicFilters();
    resamplingDemo();
    
    printf("\n=== TODOS LOS EJEMPLOS COMPLETADOS ===\n");
end

%% Ejecutar automáticamente al cargar
runAllExamples();
