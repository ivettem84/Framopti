clc;
clear;

load('pacientesreal.dat')

load('framin130203.mat')
paciente=pacientesreal;



n=length(paciente);

for i=1:n

estudio = net(paciente);
riesgo=round(estudio);

end
