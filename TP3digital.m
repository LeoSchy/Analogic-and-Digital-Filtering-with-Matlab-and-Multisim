%% FILTRADO DIGITAL

clear all;
close all;
clc;


s=tf('s');
w0=2*pi*110;
B=2*pi*30;          % La consigna requiere un ancho de banda de 30Hz.
T=1/10000;          % Consideramos una frecuencia de muestreo de 10KHz.
f=(s^2+w0^2)/(B*s);
H_s=minreal(1/(f^2+sqrt(2)*f+1))

%sacamos los polos
p=pole(H_s);

%Gráfica de los polos y ceros
figure(4);
pzmap(H_s);

%Conformación de dos filtros pasa-banda para cumplir con la función transferencia
poli1=poly(p(1:2));
poli2=poly(p(3:4));
H_s_1=tf([B 0],poli1)
H_s_2=tf([B 0],poli2)

figure(5)
bode(H_s_1,H_s_2,H_s)


%Transformando al plano z con transformación por aproximación Bilineal
H_z_1=c2d(H_s_1,T,'tustin')
H_z_2=c2d(H_s_2,T,'tustin')
[num1 den1]=tfdata(H_z_1)
[num2 den2]=tfdata(H_z_2)


% Graficamos ambos filtros pasabanda con la función freqz:

figure(6)
freqz(cell2mat(num1),cell2mat(den1))
figure(7)
freqz(cell2mat(num2),cell2mat(den2))

% Graficamos el filtro completo con freqz y con fvtool, que nos permite
% analizar en detalle el filtro diseñado
H_z=c2d(H_s,T,'tustin');
[num3 den3]=tfdata(H_z);
% freqz(cell2mat(num3),cell2mat(den3))
fvtool(cell2mat(num3),cell2mat(den3))

Fs = 10000;  % Sampling Frequency

N   = 20;   % Order
Fc1 = 96;   % First Cutoff Frequency
Fc2 = 126;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter')

% Para convertir el filtro a una sola sección:

% Get the transfer function values.
[b, a] = tf(Hd);

% Convert to a singleton filter.
Hd2 = dfilt.df2(b, a);


fvtool(cell2mat(num3),cell2mat(den3),Hd,Hd2)



