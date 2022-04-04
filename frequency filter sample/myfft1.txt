function [yfft,f]=myfft(y,Fs)
  
         yfft=fft(y);
         yfft=yfft(1:ceil((length(y)+1)/2));
         sampnum=[0:(length(yfft)-1)]';
         f=sampnum*Fs/length(y);

end