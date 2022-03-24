% full time spectrum analysis

function findfrequency(Fs,row)
  % Fs: user input - sampling frequency
  % row: user input - data location
  % code works as fft(Fs,row) way
  [filename,pathname]=uigetfile('*,txt');
  data=textread(strcat(pathname,filename));
  cd(strcat(pathname));
  T=1/Fs;
  L=length(data);
  t=(0:L-1)*T; %time vector
  NFFT=2^nextpow2(L); 
  % next power of 2 from length of y  長度L的值下一個最接近2的次方數
  % (2^(nextpow2(L)-1))< L < (2^nextpow2(L))
  Y=fft(data(:,row),NFFT)/L;
  f=Fs/2*(0,1,NFFT/2);
  newdata=[2*abs(Y(1:NFFT/2)),f'];
  save PCBfrequency.txt newdata -ascii
  plot(f,2*abs(Y(1:NFFT/2)))
  title('single-sided Amplitude Spectrum of y(t)')
  xlabel('Frequency(Hz)')
  ylabel('(Y(f)')
  saveas(gcf,'find frequency.emf','emf');
