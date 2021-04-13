% published by MohammadAmin Alamalhoda (2019)
% feel free to use it anywhere !
% http://ee.sharif.ir/~amin
% Please if this code was useful to you star this repository on my Github or indorse me on LinkedIn
% Github: https://github.com/MohammadAminAlamalhoda
% LinkedIn: https://www.linkedin.com/in/mohammadamin-alamalhoda-765702168
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;

[data_NoNoise,Fs] = audioread("DialedSequence_NoNoise.wav");
[data_00db,] = audioread("DialedSequence_SNR00dB.wav");
[data_10db,] = audioread("DialedSequence_SNR10dB.wav");
[data_20db,] = audioread("DialedSequence_SNR20dB.wav");
[data_30db,] = audioread("DialedSequence_SNR30dB.wav");

data_NoNoise_filtered = my_filter(data_NoNoise');
data_00db_filtered = my_filter(data_00db');
data_10db_filtered = my_filter(data_10db');
data_20db_filtered = my_filter(data_20db');
data_30db_filtered = my_filter(data_30db');
%% filters in frq domain
clc;
load 697; load 770; load 852; load 941; load 1209; load 1336; load 1477; load 1633;

subplot(4,2,1);
filter_plot(filter_697,Fs);
title("697 Hz filter");
subplot(4,2,2);
filter_plot(filter_770,Fs);
title("770 Hz filter");
subplot(4,2,3);
filter_plot(filter_852,Fs);
title("852 Hz filter");
subplot(4,2,4);
filter_plot(filter_941,Fs);
title("941 Hz filter");
subplot(4,2,5);
filter_plot(filter_1209,Fs);
title("1209 Hz filter");
subplot(4,2,6);
filter_plot(filter_1336,Fs);
title("1336 Hz filter");
subplot(4,2,7);
filter_plot(filter_1477,Fs);
title("1477 Hz filter");
subplot(4,2,8);
filter_plot(filter_1633,Fs);
title("1633 Hz filter");
%% signals in frequency domain
subplot(5,2,1)
SemiBandFFT(data_NoNoise', Fs, pi)
title("main data");
subplot(5,2,2)
SemiBandFFT(data_NoNoise_filtered, Fs, pi)
title("filtered data");

subplot(5,2,3)
SemiBandFFT(data_00db', Fs, pi)
subplot(5,2,4)
SemiBandFFT(data_00db_filtered, Fs, pi)

subplot(5,2,5)
SemiBandFFT(data_10db', Fs, pi)
subplot(5,2,6)
SemiBandFFT(data_10db_filtered, Fs, pi)

subplot(5,2,7)
SemiBandFFT(data_20db', Fs, pi)
subplot(5,2,8)
SemiBandFFT(data_20db_filtered, Fs, pi)

subplot(5,2,9)
SemiBandFFT(data_30db', Fs, pi)
subplot(5,2,10)
SemiBandFFT(data_30db_filtered, Fs, pi)

%% signals in TIME domain
subplot(5,2,1)
plot(1:1:length(data_NoNoise'),data_NoNoise')
title("data NoNoise");
subplot(5,2,2)
plot(1:1:length(data_NoNoise_filtered'),data_NoNoise_filtered')
title("data NoNoise filtered");

subplot(5,2,3)
plot(1:1:length(data_00db'),data_00db')
title("data 00db");
subplot(5,2,4)
plot(1:1:length(data_00db_filtered'),data_00db_filtered')
title("data 00db filtered");

subplot(5,2,5)
plot(1:1:length(data_10db'),data_10db')
title("data 10db");
subplot(5,2,6)
plot(1:1:length(data_10db_filtered'),data_10db_filtered')
title("data 10db filtered");

subplot(5,2,7)
plot(1:1:length(data_20db'),data_20db')
title("data 20db");
subplot(5,2,8)
plot(1:1:length(data_20db_filtered'),data_20db_filtered')
title("data 20db filtered");

subplot(5,2,9)
plot(1:1:length(data_30db'),data_30db')
title("data 30db");
subplot(5,2,10)
plot(1:1:length(data_30db_filtered'),data_30db_filtered')
title("data 30db filtered");


%% seperating signals

% ## NOTE : please add .bmp files to your directory (ypu can find them in my
% uploaded file ##

clc;

list_NoNoise = seperater(data_NoNoise_filtered,Fs);

list_00db = seperater(data_00db_filtered,Fs);

list_10db = seperater(data_10db_filtered,Fs);

list_20db = seperater(data_20db_filtered,Fs);

list_30db = seperater(data_30db_filtered,Fs);

w=struct2cell(list_NoNoise);
disp("no noise sound");
num_no_noise=dials(w,Fs);
disp(dials(w,Fs)+newline);

w=struct2cell(list_00db);
disp("00 db sound");
num_00_db=dials(w,Fs);
disp(dials(w,Fs)+newline);

w=struct2cell(list_10db);
disp("10 db sound");
num_10_db=dials(w,Fs);
disp(dials(w,Fs)+newline);

w=struct2cell(list_20db);
disp("20 db sound");
num_20_db=dials(w,Fs);
disp(dials(w,Fs)+newline);

w=struct2cell(list_30db);
disp("30 db sound");
num_30_db=dials(w,Fs);
disp(dials(w,Fs)+newline);

subplot(5,1,1)
visual_dials(num_no_noise)
title("\fontsize{16} no noise sound")
subplot(5,1,2)
visual_dials(num_00_db)
title("\fontsize{16} 00db sound")
subplot(5,1,3)
visual_dials(num_10_db)
title("\fontsize{16} 10db sound")
subplot(5,1,4)
visual_dials(num_20_db)
title("\fontsize{16} 20db sound")
subplot(5,1,5)
visual_dials(num_30_db)
title("\fontsize{16} 30db sound")

%% funtion test
tets = '#*123456789ABCDDCBA987654321*#';
visual_dials(tets)


%% Functions
function visual_dials(string)
pic_0 = imread('0.bmp');
pic_1 = imread('1.bmp');
pic_2 = imread('2.bmp');
pic_3 = imread('3.bmp');
pic_4 = imread('4.bmp');
pic_5 = imread('5.bmp');
pic_6 = imread('6.bmp');
pic_7 = imread('7.bmp');
pic_8 = imread('8.bmp');
pic_9 = imread('9.bmp');
pic_A =  imread('A.bmp');
pic_B =  imread('B.bmp');
pic_C =  imread('C.bmp');
pic_D =  imread('D.bmp');
pic_asterisco = imread('asterisco.bmp');
pic_cancelletto = imread('cancelletto.bmp');

final_pic = [];

string=char(string);

for i=1:length(string)
    switch(string(i))
        
        case '0'
           
            final_pic=[final_pic pic_0];
            
        case '1'
           
            final_pic=[final_pic pic_1];
            
        case '2'
           
            final_pic=[final_pic pic_2];   
            
        case '3'
           
            final_pic=[final_pic pic_3];  
            
        case '4'
           
            final_pic=[final_pic pic_4]; 
            
        case '5'
           
            final_pic=[final_pic pic_5];    
            
        case '6'
           
            final_pic=[final_pic pic_6];                
            
        case '7'
           
            final_pic=[final_pic pic_7];                
            
        case '8'
           
            final_pic=[final_pic pic_8];  
            
        case '9'
           
            final_pic=[final_pic pic_9];               
            
        case 'A'
           
            final_pic=[final_pic pic_A];
            
        case 'B'
           
            final_pic=[final_pic pic_B];                
            
        case 'C'
           
            final_pic=[final_pic pic_C];                
            
        case 'D'
           
            final_pic=[final_pic pic_D];                
            
        case '*'
           
            final_pic=[final_pic pic_asterisco];                
            
        case '#'
           
            final_pic=[final_pic pic_cancelletto];                
            
    end
end
imshow(final_pic);
end

function string=dials(input,Fs)
list = [];
limit=40;
string="";
for i = 1:1:16

    list = detec_freq(input{i},Fs);
    firstnum=list(1,1);
    secondnum=list(1,2);
   
    
    if(abs(697-firstnum)<limit && abs(1209-secondnum)<limit)
        string=string+"1";
    end
    
    if(abs(697-firstnum)<limit && abs(1336-secondnum)<limit)
        string=string+"2";
    end
    
    if(abs(697-firstnum)<limit && abs(1477-secondnum)<limit)
        string=string+"3";
    end
    
    if(abs(697-firstnum)<limit && abs(1633-secondnum)<limit)
        string=string+"A";
    end
    
    if(abs(770-firstnum)<limit && abs(1209-secondnum)<limit)
        string=string+"4";
    end
    
    if(abs(770-firstnum)<limit && abs(1336-secondnum)<limit)
        string=string+"5";
    end
    
    if(abs(770-firstnum)<limit && abs(1477-secondnum)<limit)
        string=string+"6";
    end
    
    if(abs(770-firstnum)<limit && abs(1633-secondnum)<limit)
        string=string+"B";
    end
    
    if(abs(852-firstnum)<limit && abs(1209-secondnum)<limit)
        string=string+"7";
    end
    
    if(abs(852-firstnum)<limit && abs(1336-secondnum)<limit)
        string=string+"8";
    end
    
    if(abs(852-firstnum)<limit && abs(1477-secondnum)<limit)
        string=string+"9";
    end
    
    if(abs(852-firstnum)<limit && abs(1633-secondnum)<limit)
        string=string+"C";
    end
    
    if(abs(941-firstnum)<limit && abs(1209-secondnum)<limit)
        string=string+"*";
    end
    
    if(abs(941-firstnum)<limit && abs(1336-secondnum)<limit)
        string=string+"0";
    end
    
    if(abs(941-firstnum)<limit && abs(1477-secondnum)<limit)
        string=string+"#";
    end
    
    if(abs(941-firstnum)<limit && abs(1633-secondnum)<limit)
        string=string+"D";
    end
    
end
end

function list = seperater(signal,Fs)
numbers_of_freqs = length(detec_freq(signal,Fs));
total_energy = bandpower(signal,Fs,[0 4000]);
meter = total_energy/(4*numbers_of_freqs);
step = 250;
time = 1;
name=1;
i = 0;
while(time+2*step<length(signal))
    
    temp_energy = bandpower(signal(1,time:time+step),Fs,[0 4000]);
    part_energy = bandpower(signal(1,time+step:time+2*step),Fs,[0 4000]);
    
    if(part_energy>5*temp_energy && part_energy>meter )
        
        i = time+step;
        
        while(bandpower(signal(1,i:i+step),Fs,[0 4000])>5*temp_energy )
            
            i = i+step;
            
            if(i+step>length(signal))
             break
            end
            
        end
        
            list.(sprintf('part%i',name))=signal(1,time:i);
            name = name+1;
            
    end
    
    if(i>time)
        time=i;
    else
        time = time+step;
    end
    
end

end

function signal1 = my_filter(signal)

load 697; load 770; load 852; load 941; load 1209; load 1336; load 1477; load 1633;

signal1 = filter(filter_697+filter_770+filter_852+filter_941+filter_1209+filter_1336+filter_1477+filter_1633,1,signal);
end

function filter_plot(signal,Fs)

[h,w] = freqz(signal);
f = w/2/pi*Fs;
semilogy(f,abs(h))
xlim([0 4000])

end
#### main function for DTFM detecting
function freq = detec_freq(InputSignal,fs)

step = 25;
freq = [];
o = 0;
f = 0;
i = 0;

while(o<0.999)
    
 o = (bandpower(InputSignal,fs,[0 f+step])/ bandpower(InputSignal,fs,[0 4000]));
 
 energy_temp = bandpower(InputSignal,fs,[f f+step]);
   
   if(bandpower(InputSignal,fs,[f+step f+2*step])>5*energy_temp && bandpower(InputSignal,fs,[f+step f+2*step])>0.001)
       
       i = f+step;
       
       while(bandpower(InputSignal,fs,[i i+step])>5*energy_temp && bandpower(InputSignal,fs,[i i+step])>0.001)
           
       test=bandpower(InputSignal,fs,[i i+step]);

       i = i+step;
       
       end
       
        freq = [freq (f+i)/2];
        
   end
  
   if(i>f)
       f=i;
   else
       f=f+step;
   end
   
end

end

function SemiBandFFT(InputSignal, Fs, f)

fft_of_input_signal = fft((InputSignal));

N=length(fft_of_input_signal);

n = linspace(0,1,N);

plot(n*Fs,abs(fft_of_input_signal))

if(f<pi)
    
xlim([0 f*Fs/(2*pi)])

else
    
xlim([0 0.5*Fs])   

end

end
