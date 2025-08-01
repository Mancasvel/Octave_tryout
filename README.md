# 🎵 Procesamiento de Señales en Octave - Ejercicios y Experimentos

[![Octave](https://img.shields.io/badge/Octave-5.2+-blue.svg)](https://octave.org/)
[![MATLAB](https://img.shields.io/badge/MATLAB-Compatible-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Este repositorio contiene una colección estructurada y comentada de **ejercicios prácticos en GNU Octave** relacionados con el **Procesamiento Digital de Señales**, desarrollados para el estudio de la asignatura *Procesamiento de Señales Multimedia* de 3º del Grado en Ingeniería Informática - Ingeniería del Software (Universidad de Sevilla).

---

## 📋 Tabla de Contenidos

- [🎯 Objetivo del Proyecto](#-objetivo-del-proyecto)
- [🚀 Inicio Rápido](#-inicio-rápido)
- [📦 Estructura del Repositorio](#-estructura-del-repositorio)
- [📁 Descripción de Archivos](#-descripción-de-archivos)
- [🧠 Conceptos Teóricos Aplicados](#-conceptos-teóricos-aplicados)
- [💡 Ejemplos de Uso](#-ejemplos-de-uso)
- [🔧 Instalación y Requisitos](#-instalación-y-requisitos)
- [📚 Recursos Adicionales](#-recursos-adicionales)
- [🤝 Contribución](#-contribución)
- [⚠️ Troubleshooting](#️-troubleshooting)

---

## 🎯 Objetivo del Proyecto

El objetivo principal de este repositorio es **entender y aplicar los conceptos clave del procesamiento digital de señales** mediante ejemplos prácticos y bien explicados. Los ejercicios cubren desde conceptos básicos hasta aplicaciones avanzadas, incluyendo:

- 🔊 **Síntesis y manipulación de audio**
- 📊 **Análisis espectral y transformadas**
- 🎛️ **Diseño y análisis de filtros**
- 🖼️ **Fundamentos de procesamiento de imágenes**
- 🔄 **Convolución y sistemas LTI**

---

## 🚀 Inicio Rápido

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/Octave_tryout.git
cd Octave_tryout

# Abrir Octave
octave
```

### 🎯 Ejecutar Ejemplos Básicos
```octave
# Ejecutar todos los fundamentos automáticamente
>> run('example1.m')

# Ejecutar ejercicios avanzados
>> run('exam1.m')

# Ejecutar funciones específicas
>> generateBasicSignals()    % Síntesis de audio
>> demoConvolution()         % Demostración de convolución
>> imageProcessing()         % Procesamiento de imágenes
```

### 🎵 Reproducir Audio Generado
```octave
# Audio original
>> [y, Fs] = audioread('four.wav');
>> sound(y, Fs)

# Audio sintetizado (generado automáticamente)
>> [y, Fs] = audioread('basic_tone.wav');
>> sound(y, Fs)

# Octavas generadas
>> [y_up, Fs] = audioread('octave_up.wav');
>> [y_down, Fs] = audioread('octave_down.wav');
>> sound(y_up, Fs*2)      % Octava superior
>> sound(y_down, Fs/2)    % Octava inferior
```

---

## 📦 Estructura del Repositorio

```
Octave_tryout/
├── 📄 README.md              # Este archivo
├── 🎵 Audio Files/
│   ├── audio.wav            # Audio de prueba original
│   ├── four.wav             # Audio base para experimentos
│   ├── fourUp.wav           # Audio con frecuencia elevada (octava superior)
│   └── fourDown.wav         # Audio con frecuencia reducida (octava inferior)
├── 🔬 Scripts de Ejercicios/
│   ├── example1.m           # Ejercicios fundamentales y funciones básicas
│   └── exam1.m              # Ejercicios de evaluación y casos prácticos
└── 🖼️ Recursos/
    └── nostalgia2.jpg       # Imagen para procesamiento digital
```

---

## 📁 Descripción de Archivos

### 🎯 Scripts Principales

#### `example1.m`
**Archivo principal con fundamentos de DSP - Completamente reorganizado**

**Estructura modular:**
1. **Generación de señales básicas** - Síntesis de tonos, octavas, archivos de audio
2. **Funciones de señales discretas** - Delta, pulso, escalón, desplazamientos
3. **Convolución** - Lineal y circular con visualización
4. **Análisis espectral** - FFT, resolución espectral, señales compuestas
5. **Filtros básicos** - Respuesta impulsiva, filtros paso-bajo ideales
6. **Remuestreo** - Diezmado e interpolación con ejemplos prácticos
7. **Función principal** - Ejecuta todos los ejemplos automáticamente

**Funciones optimizadas:**
```octave
generateBasicSignals()      % Síntesis de audio con múltiples frecuencias
testDiscreteSignals()       % Prueba de señales discretas básicas
demoConvolution()           % Demostración completa de convolución
spectralAnalysis()          % Análisis FFT con visualización
basicFilters()              % Diseño y análisis de filtros
resamplingDemo()            % Diezmado e interpolación
runAllExamples()            % Ejecuta todos los ejemplos
```

#### `exam1.m`
**Ejercicios avanzados - Completamente restructurado**

**Estructura avanzada:**
1. **Síntesis paramétrica de audio** - Múltiples frecuencias, formatos de salida
2. **Cuantización de señales** - Uniforme, audio, visualización comparativa
3. **Diseño de filtros avanzados** - FIR, paso-alto, sistemas por ecuaciones
4. **Procesamiento digital de imágenes** - Múltiples métodos de conversión, histogramas, ecualización
5. **Análisis espectral avanzado** - Desplazamiento temporal, propiedades de la FFT
6. **Señales discretas avanzadas** - Funciones parametrizadas y testing
7. **Función principal** - Ejecuta todos los ejercicios automáticamente

**Funciones avanzadas:**
```octave
audioSynthesis()            % Síntesis con múltiples parámetros
quantizationDemo()          % Cuantización de señales y audio
advancedFilters()           % Filtros FIR y análisis de sistemas
imageProcessing()           % Procesamiento completo de imágenes
spectralAnalysisAdvanced()  % Análisis espectral con desplazamientos
discreteSignalsAdvanced()   % Funciones de señales parametrizadas
runAllExercises()           % Ejecuta todos los ejercicios
```

### 🎵 Archivos de Audio

| Archivo | Descripción | Uso |
|---------|-------------|-----|
| `audio.wav` | Audio de prueba original | Experimentos básicos |
| `four.wav` | Audio base para transformaciones | Referencia para comparaciones |
| `fourUp.wav` | Audio con frecuencia duplicada | Demostración de octava superior |
| `fourDown.wav` | Audio con frecuencia reducida | Demostración de octava inferior |

### 🖼️ Recursos Multimedia

- **`nostalgia2.jpg`**: Imagen utilizada para demostrar conceptos básicos de procesamiento digital de imágenes, incluyendo conversión a escala de grises, análisis de histogramas y binarización.

---

## 🧠 Conceptos Teóricos Aplicados

### 🔊 Procesamiento de Audio Digital

#### Síntesis de Señales
```octave
% Generación de tono senoidal
F = 440;        % Frecuencia fundamental (Hz)
Fs = 11000;     % Frecuencia de muestreo (Hz)
T = 2.5;        % Duración (segundos)
A = 0.12;       % Amplitud

f = F/Fs;                    % Frecuencia normalizada
N = Fs * T;                  % Número de muestras
n = 0:N-1;                   % Vector de índices

signal = A * cos(2*pi*f*n);  % Señal cosenoidal
```

#### Manipulación de Frecuencia
- **Octava superior**: `F_up = F * 2`
- **Octava inferior**: `F_down = F / 2`
- **Cambio de tono por resampling**: Modificar `Fs` en `audiowrite()`

### 📊 Análisis Espectral

#### Transformada Rápida de Fourier (FFT)
```octave
% Análisis espectral básico
x = [señal_temporal];
X = fft(x);                % Transformada
magnitude = abs(X);        % Magnitud
phase = angle(X);          % Fase
```

#### Resolución Espectral
```octave
Fs = 1900;                 % Frecuencia de muestreo
N = 168;                   % Longitud de la señal
resolucion_Hz = Fs/N;      % Resolución en Hz
resolucion_norm = 1/N;     % Resolución normalizada
```

### 🎛️ Sistemas LTI y Filtrado

#### Respuesta Impulsiva
```octave
% Diseño de filtro por ecuación en diferencias
N = 64;
impulse = [1, zeros(1, N-1)];    % Impulso unitario

b = [3, 0, -1, 0, 0, 3];         % Coeficientes del numerador
a = [1, -1];                     % Coeficientes del denominador

h = filter(b, a, impulse);       % Respuesta impulsiva
H = fft(h);                      % Respuesta en frecuencia
magnitude = abs(H);              % Magnitud de la respuesta
```

#### Convolución

**Convolución Lineal:**
```octave
h = [-1, 0, -3, -1];      % Respuesta impulsiva
x = [-1, 1, -3, 2];       % Señal de entrada
y = conv(x, h);           % Convolución lineal
```

**Convolución Circular:**
```octave
x = [3, 3, -2, 3, -4];
y = [-1, 3, -4, 0, -1];

% Método FFT
result = ifft(fft(x) .* fft(y));
```

### 🖼️ Procesamiento de Imágenes

#### Conversión a Escala de Grises
```octave
imagen = imread("nostalgia2.jpg");

% Método 1: Seleccionar canal verde
imagen_grey = imagen(:,:,2);

% Método 2: Promedio de canales RGB
imagen_aux = im2double(imagen);
imagen_grey2 = mean(imagen_aux, 3);

% Método 3: Función incorporada
imagen_bn = rgb2gray(imagen);
```

#### Binarización
```octave
umbral = 0.5;
imagen_binaria = imagen_grey > umbral;
```

---

## 🆕 Mejoras y Nuevas Características

### ✨ Reorganización Completa del Código

**Características principales:**
- **Estructura modular** con funciones bien definidas y documentadas
- **Ejecución automática** de todos los ejemplos al cargar los archivos
- **Reducción significativa de líneas de código** manteniendo toda la funcionalidad
- **Mayor coherencia** en la organización y flujo de los ejercicios
- **Mensajes informativos** que guían al usuario durante la ejecución

### 🔧 Funcionalidades Mejoradas

#### `example1.m` - Fundamentals Made Simple
```octave
% Ejecución automática al cargar
>> run('example1.m')

% O ejecutar funciones específicas
>> generateBasicSignals()  % Genera archivos de audio: basic_tone.wav, octave_up.wav, octave_down.wav
>> demoConvolution()       % Visualiza convolución lineal y circular
>> spectralAnalysis()      % Análisis FFT con cálculo de resolución espectral
>> basicFilters()          % Diseño de filtros con múltiples visualizaciones
```

#### `exam1.m` - Advanced Exercises
```octave
% Ejecución automática al cargar
>> run('exam1.m')

% Funciones especializadas
>> audioSynthesis()        % Sintetiza 440Hz, 500Hz, 250Hz → archivos .wav
>> quantizationDemo()      % Cuantización con visualización comparativa
>> advancedFilters()       % Filtros FIR, paso-alto, sistemas por ecuaciones
>> imageProcessing()       % Procesamiento completo de nostalgia2.jpg
```

### 📊 Nuevas Visualizaciones

- **Convolución**: Comparación lado a lado de lineal vs circular
- **Análisis espectral**: Señal temporal + magnitud FFT
- **Filtros**: Respuesta impulsiva + respuesta en frecuencia
- **Remuestreo**: Señal original, diezmada e interpolada
- **Procesamiento de imágenes**: 6 paneles con diferentes métodos

### 🎯 Código Optimizado

**Antes (example1.m)**: 463 líneas dispersas y repetitivas  
**Después (example1.m)**: 132 líneas organizadas y funcionales

**Antes (exam1.m)**: 144 líneas desorganizadas  
**Después (exam1.m)**: 189 líneas estructuradas con funcionalidad avanzada

---

## 💡 Ejemplos de Uso

### 🎵 Ejemplo 1: Generación de Escalas Musicales

```octave
% Definir frecuencias de la escala de Do mayor
notas = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25];
nombres = {'Do', 'Re', 'Mi', 'Fa', 'Sol', 'La', 'Si', 'Do'};

Fs = 44100;
duracion = 0.5;
amplitud = 0.3;

% Generar y concatenar cada nota
escala = [];
for i = 1:length(notas)
    f_norm = notas(i)/Fs;
    N = duracion * Fs;
    n = 0:N-1;
    nota = amplitud * cos(2*pi*f_norm*n);
    escala = [escala, nota];
end

% Guardar y reproducir
audiowrite('escala_do_mayor.wav', escala, Fs);
sound(escala, Fs);
```

### 🔊 Ejemplo 2: Análisis Espectral de Audio

```octave
% Cargar audio
[x, Fs] = audioread('four.wav');

% Análisis espectral
N = length(x);
X = fft(x);
frequencies = (0:N-1) * Fs/N;
magnitude = abs(X);

% Visualización
figure;
subplot(2,1,1);
plot((0:N-1)/Fs, x);
title('Señal en el Tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(2,1,2);
plot(frequencies(1:N/2), magnitude(1:N/2));
title('Espectro de Frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
```

### 🎛️ Ejemplo 3: Diseño de Filtro Paso-Bajo

```octave
% Parámetros del filtro
L = 101;                    % Longitud del filtro
Fc = 400;                   % Frecuencia de corte (Hz)
Fs = 2000;                  % Frecuencia de muestreo (Hz)

% Diseño del filtro FIR usando sinc
n = 0:L-1;
M = (L-1)/2;                % Punto medio
fc_norm = Fc/Fs;            % Frecuencia normalizada

% Respuesta impulsiva del filtro ideal
h = 2 * fc_norm * sinc(2 * fc_norm * (n - M));

% Análisis de la respuesta en frecuencia
H = fft(h, 1024);
f = (0:1023) * Fs/1024;

% Visualización
figure;
subplot(2,1,1);
plot(n, h);
title('Respuesta Impulsiva del Filtro');
xlabel('n');
ylabel('h[n]');

subplot(2,1,2);
plot(f(1:512), abs(H(1:512)));
title('Respuesta en Frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('|H(f)|');
```

---

## 🔧 Instalación y Requisitos

### Requisitos del Sistema

| Componente | Versión Mínima | Recomendada |
|------------|---------------|-------------|
| GNU Octave | 5.2.0 | 6.4.0+ |
| MATLAB | R2018b | R2022b+ |
| RAM | 2 GB | 4 GB+ |
| Almacenamiento | 100 MB | 500 MB+ |

### Instalación de GNU Octave

#### 🪟 Windows
```bash
# Usando Chocolatey
choco install octave

# O descargar desde: https://octave.org/download
```

#### 🐧 Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install octave octave-signal octave-image
```

#### 🍎 macOS
```bash
# Usando Homebrew
brew install octave

# Usando MacPorts
sudo port install octave
```

### Paquetes Adicionales Recomendados

```octave
% En Octave, instalar paquetes adicionales
pkg install -forge signal
pkg install -forge image
pkg install -forge audio
pkg load signal image audio
```

### Configuración Inicial

```octave
% Configurar Octave para mejor rendimiento
graphics_toolkit("gnuplot");    % Para gráficos
set(0, "defaultfigurecolor", "white");
```

---

## 📚 Recursos Adicionales

### 📖 Documentación Oficial
- [GNU Octave Documentation](https://octave.org/doc/)
- [Signal Processing Toolbox](https://octave.sourceforge.io/signal/)
- [Image Processing Toolbox](https://octave.sourceforge.io/image/)

### 🎓 Libros Recomendados
1. **"Digital Signal Processing"** - Alan V. Oppenheim & Ronald W. Schafer
2. **"Discrete-Time Signal Processing"** - Alan V. Oppenheim & Ronald W. Schafer
3. **"Digital Signal Processing using MATLAB"** - Vinay K. Ingle & John G. Proakis

### 🔗 Enlaces Útiles
- [DSP Tutorial](https://www.dspguide.com/)
- [Octave Signal Processing Examples](https://octave.org/examples/)
- [MATLAB to Octave Conversion Guide](https://en.wikibooks.org/wiki/MATLAB_Programming/Differences_between_Octave_and_MATLAB)

---

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Para contribuir:

1. **Fork** el repositorio
2. Crea una **branch** para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. **Commit** tus cambios (`git commit -am 'Añadir nueva funcionalidad'`)
4. **Push** a la branch (`git push origin feature/nueva-funcionalidad`)
5. Crea un **Pull Request**

### Pautas para Contribuir

- 📝 **Documentación**: Cada función debe estar bien documentada
- 🧪 **Testing**: Incluir ejemplos de uso funcionales
- 🎨 **Estilo**: Seguir las convenciones de nomenclatura de Octave
- 🔄 **Compatibilidad**: Asegurar compatibilidad con Octave 5.2+

---

## ⚠️ Troubleshooting

### Problemas Comunes

#### ❌ Error: "función no definida"
```octave
% Problema: Las funciones no se cargan automáticamente
% Solución: Ejecutar el archivo completo
run('example1.m');

% O definir la función en un archivo separado
% archivo: mi_funcion.m
function y = mi_funcion(x)
    y = x * 2;
endfunction
```

#### ❌ Error en reproducción de audio
```octave
% Problema: Audio no se reproduce
% Solución: Verificar instalación de audio
pkg load audio
[y, Fs] = audioread('archivo.wav');
sound(y, Fs);

% Alternativa: Usar audioplayer
player = audioplayer(y, Fs);
play(player);
```

#### ❌ Error en procesamiento de imágenes
```octave
% Problema: imread no funciona
% Solución: Cargar paquete de imágenes
pkg load image
img = imread('imagen.jpg');

% Verificar formato de imagen soportado
imformats();
```

#### ❌ Error en visualización
```octave
% Problema: Las gráficas no se muestran
% Solución: Configurar el toolkit gráfico
graphics_toolkit("gnuplot");
% o alternativamente:
graphics_toolkit("qt");
```

### Optimización de Rendimiento

```octave
% Para mejorar la velocidad de ejecución
warning("off", "all");          % Desactivar warnings
set(0, "defaultfigurevisible", "off");  % Gráficos en background

% Usar vectorización en lugar de loops
% ❌ Lento
for i = 1:N
    y(i) = x(i) * 2;
end

% ✅ Rápido
y = x * 2;
```

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---

## 👨‍💻 Autor

**Desarrollado por:** Manuel Castillejo - Universidad de Sevilla  
**Asignatura:** Procesamiento de Señales Multimedia  

---

## 🏆 Reconocimientos

- Universidad de Sevilla - Escuela Técnica Superior de Ingeniería Informática
- Comunidad de desarrolladores de GNU Octave

---

*💡 Si encuentras este repositorio útil, no olvides darle una ⭐ y compartirlo con otros estudiantes de DSP!*
