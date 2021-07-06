%Por: vasanza;
clear; clc;
Fs=128;
%% Fig1 data con armonicos
%S=load('A01I1E1.mat'); EEG=S.b; %filtered
%S=load('001I1E1.mat'); EEG=S.E1;%no filteres
f = importdata('filtrado0.csv')
d = f;
EEG = d(:,1);
figure();
plot(EEG);
xlabel('4599 samples of 64 EEG signal'); ylabel('Voltage values of the EEG Signal [uV]');
grid on;
% %%  Fig2 distribución de los datos con ruido
% figure();
% %histogram(EEG);
% xlabel('EMG amplitude value [uV]'); ylabel('Number of events');
% grid on;
%% Fig3 grafica de frecuencia de los datos con ruido
% x=EEG;
% periodogram(x,rectwin(length(x)),length(x),Fs);
%% fig4 filtro respuesta de magnitud
Fmin=7;
Fmax=30;
Hd=designfilt('bandpassiir','FilterOrder',20,'HalfPowerFrequency1',Fmin,'HalfPowerFrequency2',Fmax,'SampleRate',Fs);
% xlabel('EMG amplitude value [uV]'); ylabel('Number of events');
 %fvtool(Hd);
%% fig8 datos filtrada
figure();
ftemp=[];
EEG =d
for e=1:2 %electrodos
   g=filtfilt(Hd,EEG(:,e));
   ftemp(:,e)=g;
end
plot(ftemp)
xlabel('32400 samples of the EMG signal'); ylabel('Voltage values of the EMG Signal [uV]');
grid on;
%% fig9 grafica de frecuencia de los datos filtrados
x=EEG(:,1:2);
periodogram(x,rectwin(length(x)),length(x),Fs);

%% fig10 distribucion de los datos filtrados
% histogram(ftemp);
% xlabel('EMG amplitude value [uV]'); ylabel('Number of events');
% grid on;

%% almacenar los datos filtrados
csvwrite("FFcsv01.csv",ftemp);
