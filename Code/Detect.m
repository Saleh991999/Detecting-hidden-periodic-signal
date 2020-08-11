%% this code to detect the location of hidden periodic signal (sine wave) buried under white noise 
%% determine its Length & Period & Amplitude

%% our date n2 consists of 10000 samples


                                          %% get the location of signal%%


%%  Divide the given signal n2 to 10 parts each consists of 1000 samples

P1=n2(1:1000) ;
P2=n2(1000:2000) ;
P3=n2(2000:3000) ;
P4=n2(3000:4000) ;
P5=n2(4000:5000) ;
P6=n2(5000:6000) ;
P7=n2(6000:7000) ;
P8=n2(7000:8000) ;
P9=n2(8000:9000) ;
P10=n2(9000:10000) ;
n2mat={P1 P2 P3 P4 P5 P6 P7 P8 P9 P10};

                                                       %% First Method%%
%% drawing the spectrogram for ten parts
%% as it's hard to visualize the ten plots in the same page 
%% we check each part  manually and we found the higher power in part 1
%%spectrogram(P1, 1000,[],1000,'yaxis') %% plot the spectrogram for  P1

                                                        %% Second Method

%% another method to check that signal in part 1 and we can visualize it we
%% will use fft and parseval relation 
%for i=1:3
    %k=abs(fft(n2mat{i})) ;
    %kk=k.^2 ;
    %subplot(5,2,i) ;
    %plot(kk) 
%end 

%% we know that signal in part 1 but for more filtring
%% divide the part 1 for two parts

j1=P1(1:500);
j2=P1(500:1000);

%% get the spectrogram for them

%%subplot(2,1,1);;
%%spectrogram(j1, 500,[],500,'yaxis')
%%subplot(2,1,2);
%%spectrogram(j2, 500,[],500,'yaxis')

%%  get the power usig fft for them

%m=abs(fft(j1)) ;
%mm=m.^2 ;
%subplot(2,1,1) ;
%plot(mm) 
%h=abs(fft(j2)) ;
%hh=h.^2 ;
%subplot(2,1,2) ;
%plot(hh) 

%% trying to get the location of signal in first 500 samples

%% method 1

%% get the spectrogram for different ranges inside 500 samples and we find from 150:350

%%test=P1(150:350);
%%spectrogram(test, 200,[],200,'yaxis');

%% using band pass filter to filter j1 with two freq (0.07,0.09)

%%y = bandpass(j1,[0.07 0.09])
%%plot (y);

%% we know that the signal is from 140 t0 337


                                                  %% get the period of signal%%
                                                  
%%r = xcorr(j1(140:337))  ; %autocorrelation for signal
%%plot(r) ;       % plot for autocorrelation                                            


                                                 %% get the amplitude of signal%%
x = bandpass(j1(140:337),[0.07 0.09])  %% the signal
e=findpeaks(x);  %% find the different values for amplitudes
o=mean(e);    %% get the mean amplitude  

                                                  
                                                     %% Display the outputs %%
                                                     
disp('The location of signal (S): from 140:337 ');
disp('The length of signal (L) = 197');
disp('The period of signal (N)= 6')
disp('The ampliude of signal (A) = ');
disp(o)
