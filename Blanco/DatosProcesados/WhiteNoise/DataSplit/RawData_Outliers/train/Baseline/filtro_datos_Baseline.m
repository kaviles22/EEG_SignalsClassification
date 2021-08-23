clear; clc;
Fs=128;
Fmin=5;
Fmax=30;
num_total_rojo = 748%354
num_total_azul = 754%357
num_total_verde = 756%357
num_total_morado = 759%359
num_total_baseline = 759%359

 %f = importdata('filtrado0.csv');
% EEG = f.data; EEG(:,1)
% Hd=designfilt('bandpassiir','FilterOrder',20,'HalfPowerFrequency1',Fmin,'HalfPowerFrequency2',Fmax,'SampleRate',Fs);
% %fvtool(Hd);
% ftemp = filtrarDatos(EEG, Hd)
% csvwrite("FFcsv02.csv", ftemp);
% plot(f)
% xlabel('32400 samples of the EMG signal'); ylabel('Voltage values of the EMG Signal [uV]');
% grid on;
for archivo=0:num_total_baseline
    f = importdata(strcat('muestra', int2str(archivo), '.csv'));
    EEG = f.data; EEG(:,1)
    Hd=designfilt('bandpassiir','FilterOrder',20,'HalfPowerFrequency1',Fmin,'HalfPowerFrequency2',Fmax,'SampleRate',Fs);
    ftemp = filtrarDatos(EEG, Hd)
    csvwrite(strcat("C:\EEG_Embedded_Systems\DatosProcesados_V2\RawData_Outliers_Filtro\Baseline\muestra", int2str(archivo), '.csv'), ftemp);
end

function y = filtrarDatos(EEG, Hd)
ftemp=[];
for e=1:2 %electrodos
   g=filtfilt(Hd,EEG(:,e));
   ftemp(:,e)=g;
end
y = ftemp
end