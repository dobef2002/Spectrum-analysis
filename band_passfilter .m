
function bandpassfilter(sampling_rate, lowfrequency,highfrequency)
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
data1=data(:,row1);
data2=data(:,row2);

%%%%============filter==========%%%%
Fs=sampling_rate;
filterOrder=20;
%% data1
if lowfrequency < 10
  Wn1=highfrequency/(Fs/2);
  [B1,A1]=butter(filterOrder,Wn1,'low');
  newdata1=filter(B1,A1,data1);
end

if lowfrequency >= 10
  Wn1=highfrequency/(Fs/2);
  [B1,A1]=butter(filterOrder,Wn1,'low');
  newdata1=filter(B1,A1,data1);
  Wn2=lowfrequency/(Fs/2);
 [B2,A2]=BUTTER(filterOrder,Wn2,'high');
  newdata1=filter(B2,A2,newdata1);
end

%%%
Fs=sampling_rate;
filterOrder=20;
%% data1
if lowfrequency < 10
  Wn1=highfrequency/(Fs/2);
  [B1,A1]=butter(filterOrder,Wn1,'low');
  newdata2=filter(B1,A1,data2);
end

if lowfrequency >= 10
  Wn1=highfrequency/(Fs/2);
  [B1,A1]=butter(filterOrder,Wn1,'low');
  newdata2=filter(B1,A1,data2);
  Wn2=lowfrequency/(Fs/2);
 [B2,A2]=BUTTER(filterOrder,Wn2,'high');
  newdata2=filter(B2,A2,newdata2);
end


time=(1:number)/Fs;
str=['bandpass_' filename];
file=data;
file(:,[4;9])=[newdata1,newdata2];
save(str, 'file', '-ascii')
  plot(time,data1,'r', time,newdata1,'b');
figure(2);
plot(time,data2,'r',time,newdata2,'b');
figure(3);plot(time,newdata2,'b');

