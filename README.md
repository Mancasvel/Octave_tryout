# 📊 Procesamiento de Señales en Octave - Ejercicios y Experimentos

Este repositorio contiene una colección estructurada y comentada de **ejercicios prácticos en Octave** relacionados con el **Procesamiento Digital de Señales (DSP)**, usados para el estudio de la asignatura *Procesamiento de Señales Multimedia* de 3º del Grado en Ingeniería Informática - Ingeniería del Software (Universidad de Sevilla).

---

## 🎯 Objetivo del proyecto

El objetivo principal de este repositorio es **entender y aplicar los conceptos clave del procesamiento digital de señales** mediante ejemplos prácticos y bien explicados. Aquí se exploran tanto aspectos teóricos como implementaciones reales usando GNU Octave, una alternativa libre a MATLAB.

---

## 📦 Contenido

Cada script de este repositorio aborda un concepto o técnica clave de DSP. A continuación, una descripción general de lo incluido:

### 🟢 1. Señales básicas

- `t1_delta.m`: implementación de la delta de Dirac discreta.
- `t1_y.m`: desplazamiento de señales (`delta[n - 3]`).
- `t1_pulso.m`: función pulso rectangular.
- `res_ej_delta1.m`: evaluación de señales en diferentes puntos.

### 🟡 2. Reproducción y síntesis de audio

- Generación de tonos (como 440Hz).
- Desplazamiento de frecuencia a una octava superior e inferior.
- Escritura de audio `.wav` usando `audiowrite`.
- Manipulación de audios reales y cambio de tono usando resampling.

### 🔵 3. Convolución

- Convolución lineal usando `conv`.
- Convolución circular usando `fft`, `.*`, e `ifft`.
- Relleno con ceros para igualar dimensiones de salida.

### 🟣 4. Respuesta impulsiva y frecuencia

- Uso de `filter` con coeficientes de diferencia para obtener la **respuesta al impulso**.
- Cálculo de la **respuesta en frecuencia** mediante `fft`.
- Visualización con `plot`.

---

## 🧠 Conceptos aplicados

- Sistemas LTI (lineales e invariantes en el tiempo).
- Convolución lineal vs circular.
- Representación de señales discretas.
- Transformada rápida de Fourier (FFT).
- Filtros FIR e IIR definidos por ecuaciones en diferencias.
- Respuesta en frecuencia (módulo y fase).
- Cambio de tono usando resampling.

---

## 💡 Ejemplo de flujo típico en un ejercicio

```matlab
% Crear una señal impulso
x = [1, zeros(1, N-1)];

% Calcular respuesta impulsiva de un sistema
h = filter(b, a, x);

% Obtener su respuesta en frecuencia
H = fft(h);
t4_H = abs(H);  % Módulo de la respuesta
