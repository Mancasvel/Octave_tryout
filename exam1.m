%% =================================================================
%% EXAM1.M - Ejercicios Avanzados de Procesamiento Digital de Señales
%% =================================================================

%% =================================================================
%% 1. SÍNTESIS PARAMÉTRICA DE AUDIO
%% =================================================================

function audioSynthesis()
    printf("=== Síntesis paramétrica de audio ===\n");
    
    % Ejercicio 1: Síntesis básica
    F = 440; A = 0.75; T = 2.5;
    Fs = 8000;  % Frecuencia de muestreo estándar
    
    f = F/Fs; N = T*Fs; n = 0:N-1;
    audio_440 = A * cos(2*pi*f*n);
    
    % Ejercicio extra: Síntesis con diferentes parámetros
    F2 = 500; T2 = 4; Fs2 = 5400;
    f2 = F2/Fs2; N2 = T2*Fs2; n2 = 0:N2-1;
    audio_500 = cos(2*pi*f2*n2);
    
    % Síntesis con 250 Hz
    F3 = 250; T3 = 4; Fs3 = 2800;
    f3 = F3/Fs3; N3 = T3*Fs3; n3 = 0:N3-1;
    audio_250 = cos(2*pi*f3*n3);
    
    % Guardar archivos
    audiowrite("synth_440.wav", audio_440, Fs);
    audiowrite("synth_500.wav", audio_500, Fs2);
    audiowrite("synth_250.wav", audio_250, Fs3);
    
    printf("Sintetizadas: 440Hz, 500Hz, 250Hz\n");
end

%% =================================================================
%% 2. CUANTIZACIÓN DE SEÑALES
%% =================================================================

function quantizationDemo()
    printf("=== Demostración de cuantización ===\n");
    
    % Ejercicio 3: Cuantización de secuencia
    s = 0:0.07:1;
    L = 7;  % Niveles de cuantización
    
    % Cuantización uniforme
    s_min = min(s); s_max = max(s);
    step = (s_max - s_min)/(L-1);
    s_quantized = round((s - s_min)/step) * step + s_min;
    
    % Cuantización de audio
    if exist("audio.wav", "file")
        audio = audioread("audio.wav");
        L_audio = 16;  % 16 niveles
        
        audio_min = min(audio); audio_max = max(audio);
        step_audio = (audio_max - audio_min)/(L_audio-1);
        audio_quantized = round((audio - audio_min)/step_audio) * step_audio + audio_min;
        
        audiowrite("audio_quantized.wav", audio_quantized, 8000);
        printf("Audio cuantizado a %d niveles\n", L_audio);
    end
    
    % Visualizar
    figure;
    subplot(2,1,1); plot(s); title('Señal Original');
    subplot(2,1,2); plot(s_quantized); title('Señal Cuantizada');
end

%% =================================================================
%% 3. DISEÑO DE FILTROS AVANZADOS
%% =================================================================

function advancedFilters()
    printf("=== Filtros avanzados ===\n");
    
    % Ejercicio 4: Filtro FIR paso-bajo
    L = 101; F = 400; Fs = 2000;
    n = 0:L-1; M = (L-1)/2;
    fc = F/Fs;
    
    % Diseño del filtro
    h = 2*fc * sinc(2*fc*(n-M));
    
    % Respuesta en frecuencia
    H = fft(h, 512);
    magnitude = abs(H);
    
    % Filtro paso-alto (inversión)
    h_highpass = -h;
    h_highpass(M+1) = 1 + h_highpass(M+1);
    
    % Análisis de sistemas por ecuación en diferencias
    N = 64;
    impulse = [1, zeros(1, N-1)];
    b = [3, 0, -1, 0, 0, 3];  % Numerador
    a = [1, -1];              % Denominador
    
    h_system = filter(b, a, impulse);
    H_system = fft(h_system);
    
    printf("Filtro FIR L=%d, Fc=%d Hz diseñado\n", L, F);
    printf("Sistema por ecuación en diferencias analizado\n");
    
    % Visualizar
    figure;
    subplot(2,2,1); plot(h); title('Filtro Paso-Bajo');
    subplot(2,2,2); plot(magnitude); title('Respuesta en Frecuencia');
    subplot(2,2,3); plot(h_highpass); title('Filtro Paso-Alto');
    subplot(2,2,4); plot(abs(H_system)); title('Sistema por Ecuación');
end

%% =================================================================
%% 4. PROCESAMIENTO DIGITAL DE IMÁGENES
%% =================================================================

function imageProcessing()
    printf("=== Procesamiento digital de imágenes ===\n");
    
    if !exist("nostalgia2.jpg", "file")
        printf("Archivo nostalgia2.jpg no encontrado\n");
        return;
    end
    
    % Cargar imagen
    imagen = imread("nostalgia2.jpg");
    
    % Conversión a escala de grises (múltiples métodos)
    imagen_grey_green = imagen(:,:,2);                    % Canal verde
    imagen_grey_avg = mean(im2double(imagen), 3);         % Promedio
    imagen_grey_std = rgb2gray(imagen);                   % Función estándar
    imagen_grey_weighted = imagen(:,:,1)*0.3 + imagen(:,:,2)*0.6 + imagen(:,:,3)*0.1;
    
    % Análisis de histograma
    histograma = hist(imagen_grey_std(:), 0:255);
    pixels_nivel_15 = histograma(16);  % Nivel 15 (índice 16)
    
    % Binarización
    umbral = 0.5;
    imagen_binaria = imagen_grey_avg > umbral;
    
    % Ecualización de histograma
    cdf = cumsum(histograma);
    cdf = cdf / max(cdf);
    imagen_ecualizada = uint8(cdf(double(imagen_grey_std) + 1) * 255);
    
    % Cuantización en espacio HLS
    if exist("rgb2hls", "file")
        hls = rgb2hls(imagen);
        h_quantized = floor(hls(:,:,1) / (360/8));  % 8 niveles de matiz
        l_quantized = floor(hls(:,:,2) / 0.2);      % 5 niveles de luminancia
        s_quantized = floor(hls(:,:,3) / 0.17);     % 6 niveles de saturación
        
        mask = (h_quantized == 0) & (l_quantized == 3) & (s_quantized == 1);
        printf("Píxeles con H=0, L=3, S=1: %d\n", sum(mask(:)));
    end
    
    printf("Píxeles con nivel de gris 15: %d\n", pixels_nivel_15);
    
    % Visualizar
    figure;
    subplot(2,3,1); imshow(imagen); title('Original');
    subplot(2,3,2); imshow(imagen_grey_std); title('Escala de Grises');
    subplot(2,3,3); imshow(imagen_binaria); title('Binarizada');
    subplot(2,3,4); imshow(imagen_ecualizada); title('Ecualizada');
    subplot(2,3,5); plot(histograma); title('Histograma');
    subplot(2,3,6); imshow(imagen_grey_weighted); title('Ponderada');
end

%% =================================================================
%% 5. ANÁLISIS ESPECTRAL Y DESPLAZAMIENTO TEMPORAL
%% =================================================================

function spectralAnalysisAdvanced()
    printf("=== Análisis espectral avanzado ===\n");
    
    % Ejercicio 2 examen 2: Desplazamiento temporal en frecuencia
    x = [-2, 4, -4, 5, 1];
    N = length(x);
    k = 0:N-1;
    n0 = 2;  % Desplazamiento x[n-2]
    
    % Propiedad de desplazamiento temporal
    X = fft(x);
    X_shifted = exp(-1j*2*pi*k*n0/N) .* X;
    
    % Verificación con desplazamiento circular
    x_shifted_time = circshift(x, n0);
    X_shifted_verify = fft(x_shifted_time);
    
    % Resolución espectral con diferentes parámetros
    Fs = 1900; N_spec = 168;
    resolucion_hz = Fs/N_spec;
    resolucion_norm = 1/N_spec;
    
    printf("Desplazamiento temporal aplicado: n0=%d\n", n0);
    printf("Resolución espectral: %.2f Hz, %.4f ciclos/muestra\n", resolucion_hz, resolucion_norm);
    
    % Visualizar
    figure;
    subplot(2,2,1); stem(x); title('Señal Original');
    subplot(2,2,2); stem(abs(X)); title('Magnitud FFT Original');
    subplot(2,2,3); stem(x_shifted_time); title('Desplazada en Tiempo');
    subplot(2,2,4); stem(abs(X_shifted)); title('Desplazada en Frecuencia');
end

%% =================================================================
%% 6. FUNCIONES DE SEÑALES DISCRETAS AVANZADAS
%% =================================================================

% Función pulso con parámetros
function y = pulso_advanced(n, L = 9)
    y = (n >= 0) & (n < L);
end

% Función delta desplazada
function y = delta_shifted_advanced(n, delay = 3)
    y = (n == delay);
end

% Función de prueba avanzada
function discreteSignalsAdvanced()
    printf("=== Señales discretas avanzadas ===\n");
    
    n = [-3, 0, 1, 3, 5];
    
    % Probar funciones
    pulso_result = pulso_advanced(n);
    delta_result = delta_shifted_advanced(n);
    
    printf("Pulso en n=[-3,0,1,3,5]: [%s]\n", num2str(double(pulso_result)));
    printf("Delta en n=3: [%s]\n", num2str(double(delta_result)));
end

%% =================================================================
%% 7. FUNCIÓN PRINCIPAL - EJECUTAR TODOS LOS EJERCICIOS
%% =================================================================

function runAllExercises()
    printf("\n=== EJECUTANDO TODOS LOS EJERCICIOS AVANZADOS ===\n\n");
    
    audioSynthesis();
    quantizationDemo();
    advancedFilters();
    imageProcessing();
    spectralAnalysisAdvanced();
    discreteSignalsAdvanced();
    
    printf("\n=== TODOS LOS EJERCICIOS COMPLETADOS ===\n");
end

%% Ejecutar automáticamente al cargar
runAllExercises();









