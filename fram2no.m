

% edad=28;
% sexo=1;
% peso=84;
% talla=1.68;
% sys=123;
% dia=82;
% fuma=0; 
% padres=2;
% peso=round(peso*2.2046);
% talla=round(talla*39.370);
% bmi=(peso/talla.^2)*703.0814062;
% agedb=edad*dia;

load('paci.dat');

paciente=paci';

paciente=[edad sexo bmi sys dia fuma padres agedb];



n=length(paciente);

for i=1:n

beta=22.949536 + (-0.156412*edad )+( -0.202933*sexo) + (-0.033881*bmi) + (-0.05933*sys) + (-0.128468*dia) + (-0.190731*fuma) +  (-0.166121*padres) + (0.001624*agedb);
riesgo=1-exp(-exp((log(4) - beta)/0.876925));
riesgo(:,i)=round(riesgo*100);

end
