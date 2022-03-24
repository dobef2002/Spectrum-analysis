
function bandstopfilter(sampling_rate,row,LF,HF)
%%%%============input data======%%%
  %user input: sampling rate, lowfrequency,highfrequency
  %頻率接近0時誤差大
  %example
  % sampling rate=1000; lowfrequency=0;highfrequency=100;row1=4,roe2=9;
%
  [filename, pathname]=uigetfile('*.txt')
  data=textread(strcat(pathname, filename));
cd(strcat(pathname));
channel=length(data(1,:));
sample=1;
number=fix(length(data(:,2))/sample);
width=length(data(1,:));
newdata=zeros(number,wifth);
data=data(:,row);

%%%%============filter==========%%%%
Fs=sampling_rate;
Fs_2=Fs/2;
filterOrder=10;
wp=[0.01 4000]/Fs_2;
ws=[LF HF]/Fs_2;
rp=1; %通帶衰減
rs=50; %阻帶衰減
[n,wn]=buttord(wp,ws,rp,rs);% 求取濾波器需求最低階數n與截止頻率
[B,A]=butter(n,wn, 'stop'); 
% Transfer function coefficient of the filter, returned as row vectors of length n+1 
% for lowpass and highpass filters and 2n+1 for bandpass and bandstop filters

  newdata=filter(B1,A1,data);
  
  time=(((1:number)/Fs)-0.99999);
  plot(time,data,'r', time,newdata,'b');
  legend('data','filterdata');
  


