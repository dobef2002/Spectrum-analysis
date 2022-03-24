% variables: sampling rate, window, overlap data number, nfft number
% variables: 取樣頻率,取樣窗格,重複點數,進行DFT的點數(影響解析度,2^n)

[filename,pathname]=uigetfile('*.txt');    % user input data
data=textread(strcat(pathname,filename));
cd(stract(pathname));
channel=length(data(1,:));
data1=data(:,row1);
spectrogram(data1,window,noverlap,nfft,Fs,'yaxis');view(0:90);
colormap default

figure(2);
spectrogram(data1,window,noverlap,nfft,Fs,'yaxis');view(90:0);  %different view way
colormap summer

