clc;
clear;

load paci.dat
load pacitar.dat

p=paci;
t=pacitar;

net=newff(minmax(p), [10,14,1], {'tansig','tansig','purelin','purelin'},'trainlm'); 
net.LW{1,1}=net.LW{1,1}*0.01;       %Pesos de conexiones
net.b{1}=net.b{1}*0.01;             %Umbrales
net.trainParam.show = 100;           % El resultado se muestra cada 100 épocas
net.trainParam.lr = 0.01;           % Tasa de aprendizaje usado en algún gradiente
net.trainParam.epochs =500;         % Máximo numero de iteraciones
net.trainParam.goal = 1e-7;          % Tolerancia de Error, criterio de parada
net.trainParam.min_grad=1e-11;         %Minimum performance gradient
%Start training
net.trainParam.showWindow=0;
[net,tr1] = train(net,p,t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simulando datos entrenados
A1=sim(net,p);
Riesgo=round(A1);
menos=(A1-t);
mse_calc = sum((A1-t).^2)/length(t);

save('framin130203.mat')