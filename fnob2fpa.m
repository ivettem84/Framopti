%SIMULACION DE DATOS ENTRENADOS
% at1=sim(net,x);
% at1=(at1*ns);
%TS=(TS*ns)

load pacientesreal.dat
load tarreal.dat

x1=pacientesreal;


rtarg=tarreal;
num=length(rtarg);
%SIMULANDO DATOS PRONOSTICADOS
sim1=sim(net,x1);
sim2=round(sim1);

%IMPRIMIR SOLO EL PRONOSITICO
pronostico1=rtarg;

 for j=1:num
     pronostico1(1,j)=sim2(1,j);
 end
 
 pronostico1=round(pronostico1);

%%%%%%%%%%%%%%%%%%%%
%INTEGRACION POR PROMEDIO

   prom=pronostico1;
   for iii=1:12
   erroresga(iii)=abs(rtarg(iii)-pronostico1(iii));  
   mse_calc(iii) = sum((rtarg(iii)-pronostico1(iii)).^2)/length(rtarg);
   end

   %mse_calc = sum((y-targets).^2)/length(y);

errorestfpa=0;
for ii=1:12
   errorestfpa=errorestfpa+mse_calc(ii);
end

errorestfpa=errorestfpa/12;
