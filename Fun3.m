function n = Fun3 (Sol,k1)


load paci.dat
load pacitar.dat

x= paci;
ta= pacitar;




disp('Iniciando Entrenamiento...');
          
          %%%%%%%%%%%%%%%%%%%%%%%%%%%% PRIMER MODULO %%%%%%%%%%%%%%%%%%%%%%%%%%
        
          disp('Inicia Modulo 1...');
%           
%           if(Chrom(i,1)==1)%Monolitica
%              display('Red monolitica en construccion')
%           elseif (Chrom(i,1)==2) % Modular
              if(Sol(1,1)==1)% 1 modulo y  1 capa
                  net=newff(minmax(x),[Sol(1,2),1],{'tansig','purelin','logsig'},'trainlm');
              end
              
              if(Sol(1,1)==2)% 1 modulo y  2 capa
                  net=newff(minmax(x),[Sol(1,2),Sol(1,3),1],{'tansig','tansig','purelin','purelin','logsig'},'trainlm');
              end
              

              net.LW{2,1} = net.LW{2,1}*0.05;
              net.b{2}=net.b{2}*0.01;
              net.trainParam.show=NaN;
              net.trainParam.goal=1e-7;
              net.trainParam.lr=0.001;
              net.trainParam.epochs = 500;
              net.trainParam.showWindow=0;
              [net,tr1]=train(net,x,ta);
          
          disp('Fin del entrenamiento de la Red monolitica');
          
   fnob2fpa();

   
   %filename = [ 'best' num2str(k1) '.mat' ];
% save(filename)
  n=errorestfpa;
  




