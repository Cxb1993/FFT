%% ***************************************************************************************
% code writer 	: EOF
% code date     : 2014.09.03
% e-mail 	      : jasonleaster@gmail.com
% code file	    : fft_EOF.m
% Version       : 1.0
%
% code purpose :
% 
%       	It's time to finish my demo for DFT. I would like to share my code with
% someone who is interesting in DSP. If there is something wrong with my code,
%	please touche me by e-mail. Thank you!
%
%% ***************************************************************************************

clear all;

%*************************************************
% The number of all the signal that our sensor got
%*************************************************
TotalSample = 8;

% We assume that the preiod of the signal we generated is 'circle';
circle = TotalSample/2;

%**************************************************************
%       This varible is used for recording the signal which 
%  were processed by inverse-DFT in time domain
%**************************************************************
SignalInT = zeros(TotalSample,1);


SignalInT_reversed = zeros(TotalSample,1);
%This varible is used for recording the signal which were processed by inverse-DFT in time domain

OutPutSignal = zeros(TotalSample,1);

OriginalSignal = zeros(TotalSample,1);
%This varible is used for recording the original signal that we got.

%% initialize a square wave
for SampleNumber = -(TotalSample/2):(TotalSample/2)-1

    if (mod(abs(SampleNumber),circle) < (circle/2))&&(SampleNumber>0)

        OriginalSignal((TotalSample/2)+1+SampleNumber) = 5;

    elseif (mod(abs(SampleNumber),circle) >= (circle/2))&&(SampleNumber>0)

        OriginalSignal((TotalSample/2)+1+SampleNumber) = 0;

    elseif (mod(abs(SampleNumber),circle) < (circle/2))&&(SampleNumber<0)

        OriginalSignal((TotalSample/2)+1+SampleNumber) = 0;   

    elseif (mod(abs(SampleNumber),circle) >= (circle/2))&&(SampleNumber<0)

        OriginalSignal((TotalSample/2)+1+SampleNumber) = 5;
    end
end

%  We show the original signal in time domain.
figure(1);
plot( -(TotalSample/2):(TotalSample/2)-1,OriginalSignal,'.-');
title('The original signal');

tmp = TotalSample - 1;

%%***********************************************************************
% @Bits : describe how many bits should be used to make up the TotalSample
%%*********************************************************************** 
Bits = 0;

while	tmp > 0

    %%  floor (X) Return the largest integer not greater than X.
    tmp = floor(tmp/2);

    Bits = Bits + 1;	
end

SignalInT = OriginalSignal;

%******************************************
%   Reverse the bits of input number
%******************************************
for SampleNumber = 1 : TotalSample
    
    ret	 = bit_reverse(SampleNumber - 1,Bits);
    
    SignalInT_reversed(SampleNumber) = SignalInT(ret+1);
end

InPutSignal = SignalInT_reversed;

for  layyer = 1 : Bits
      
      for SampleNumber = 1 : 2^(layyer) : TotalSample
      
            for  pre_half = SampleNumber:(SampleNumber+2^(layyer-1) -1)
                          
                 r = get_r_in_Wn(pre_half-1,layyer,TotalSample,Bits);
                 
                 W_rN = exp(-2*pi*j*(r)/TotalSample) ;
                 
                 OutPutSignal(pre_half) = ...
                 InPutSignal(pre_half) +  ...
                 W_rN * InPutSignal(pre_half + 2^(layyer-1));
               
                 OutPutSignal(pre_half  + 2^(layyer-1)) =  ...
                 InPutSignal(pre_half) -  ...
                 W_rN * InPutSignal(pre_half + 2^(layyer-1));

           end          
      end
      
      InPutSignal = OutPutSignal;
end