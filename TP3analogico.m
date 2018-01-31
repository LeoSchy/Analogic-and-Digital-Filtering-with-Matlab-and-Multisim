%% FILTRADO ANALÓGICO

clear all;
close all;
clc;

s=tf('s');
w0=2*pi*110;
B=2*pi*55;
sn=(s^2+w0^2)/(B*s);
H_s=minreal(1/(sn^2+sqrt(2)*sn+1))

%Diagramas de Magnitud y Fase de H_s
figure(1);
bode(H_s);
grid on;

%Obtenemos los polos de H_s
p=pole(H_s)

%Gráfica de los polos y ceros
figure(2);
pzmap(H_s);


%con los polos obtuvimos las funciones de tranferencia de el pasa bajo
%y pasa alto en base de los polos complejos conjugados 
poli1=poly(p(1:2));
poli2=poly(p(3:4));
H_s_PB=tf(B^2,poli1)
H_s_PA=tf([1 0 0],poli2)

figure(3);
bode(H_s_PB,H_s_PA,H_s_PB*H_s_PA);


%colculo de resistencias y capacitores para los filtros activos a partir de
%H_s_PB,H_s_PA


