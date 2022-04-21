%% FFT��������
Signal_ScopeData1 = voltage_phase;
Signal_ScopeData2 = voltage_line;
% Signal1 = voltage_phase.signals;
% Signal2 = voltage_line.signals;

StartTime = 0.02;
Cycles = 1;
Fundamental = 10;
MaxFrequency = 1000;
FreqAxis = 'hertz';  %'harmonicorder'or'hertz'

FS=15;                                                                     
FN='Times New Roman';                                                      

%% ��Ȼ��������ƽг������
% Importing signal data for fftscope
FFTDATA1 = power_fftscope(Signal_ScopeData1);
%setting parameters for fftscope
FFTDATA1.cycles = Cycles;
% FFTDATA1.signals = Signal1;
FFTDATA1.fundamental = Fundamental;
FFTDATA1.maxFrequency = MaxFrequency;
FFTDATA1.startTime = StartTime;
FFTDATA1.freqAxis = FreqAxis;
% Now Run the fftscope to get the analysis results
% power_fftscope(FFTDATA1);
resultFFT1 = power_fftscope(FFTDATA1);

x1=resultFFT1.freq;
x10=resultFFT1.freq(2);
y1=resultFFT1.mag;
y10=resultFFT1.mag(2);
% 
% Un1=resultFFT1.mag;n1=x1/x10;Udc1=200;WTHD01=(Un1/Udc1)./n1;WTHD01(1,:)=[];WTHD01(1,:)=[];WTHD01=(WTHD01).^2;WTHD01=100*sqrt(sum(WTHD01));%����WTHD01
% 
%% ��Ȼ��������ƽг������
FFTDATA2 = power_fftscope(Signal_ScopeData2);%��Ȼ��������ƽa�ű۵�ѹ

FFTDATA2.cycles = Cycles;
FFTDATA2.fundamental = Fundamental;
% FFTDATA2.signals = Signal2;
FFTDATA2.maxFrequency = MaxFrequency;
FFTDATA2.startTime = StartTime;
FFTDATA2.freqAxis = FreqAxis;

% power_fftscope(FFTDATA2);
resultFFT2=power_fftscope(FFTDATA2);

x1a=resultFFT2.freq;
x10a=resultFFT2.freq(2);
y1a=resultFFT2.mag;
y10a=resultFFT2.mag(2);

%% ������Ȼ��������ƽг������ͼ
figure(3);
set(figure(3),'position',[0 0 1200 500]);
subplot(1,2,1);
bar(x1/x10,y1/100);
set(gca,'FontSize',FS,'Fontname',FN);
title({'Van(Two Levels Asymmetric regular sampling)'},'FontSize',FS,'FontName',FN);
set(gca,'XLim',[0 60]);%X����ʾ��Χ
set(gca,'XTick',(0:10:60));%X����̶�ֵ
set(gca,'XTickLabel',(0:10:60));%X����̶�
set(gca,'YScale','log','YTick',[0.0001 0.001 0.01 0.1 1],'YLim',[0.0001 1.1]);
grid on;
xlabel('Harmonic Number','FontSize',FS,'FontName',FN);%���ú��������ǩ
ylabel('Harmonic Magnitude(p.u.)','FontSize',FS,'FontName',FN);%���ú��������ǩ

subplot(1,2,2);
bar(x1a/x10a,y1a/200);
set(gca,'FontSize',FS,'Fontname',FN);
title({'Vab(Two Levels Asymmetric regular sampling)'},'FontSize',FS,'FontName',FN);
set(gca,'XLim',[0 60]);%X����ʾ��Χ
set(gca,'XTick',(0:10:60));%X����̶�ֵ
set(gca,'XTickLabel',(0:10:60));%X����̶�
set(gca,'YScale','log','YTick',[0.0001 0.001 0.01 0.1 1],'YLim',[0.0001 1.1]);
grid on;
xlabel('Harmonic Number','FontSize',FS,'FontName',FN);%���ú��������ǩ
ylabel('Harmonic Magnitude(p.u.)','FontSize',FS,'FontName',FN);%���ú��������ǩ


