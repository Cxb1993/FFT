%%***************************************************************************************
% code writer 	: EOF
% code date     : 2014.09.17
% e-mail 	      : jasonleaster@gmail.com
% code file	    : IFFT_EOF.m
% Version       : 1.0
%
% code purpose :
% 
%       	It's time to finish my demo for DFT. I would like to share my code with
% someone who is interesting in DSP. If there is something wrong with my code,
%	please touche me by e-mail. Thank you!
%
%%***************************************************************************************

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

InPutSignal = fft(OriginalSignal); % for testing

TotalSample = size(InPutSignal,1);

OutPutSignal_to_time = zeros(TotalSample,1);

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

%*******************************************************************
%                |         |        |        |
%   input X(n)   | layer 3 |layer 2 |layer 1 | x(n) output
%                |         |        |        |      
%                
%
%            @layyer      :  the number of layyer
%            @SampleNumber:  the start number of point which 
%                            is going to do butter-fly operation.
%            @pre_half    :  the pre_half point of current butter-fly
%***********************************************************************
for  layyer = Bits:-1:1
      
      for SampleNumber = 1 : 2^(layyer) : TotalSample
      
            for  pre_half = SampleNumber:(SampleNumber+2^(layyer-1) -1)
                          
                 r = -get_r_in_Wn(pre_half-1,layyer,TotalSample,Bits);
                 
                 W_rN = exp(-2*pi*j*(r)/TotalSample) ;
                 
                 OutPutSignal_to_time(pre_half) = ...
                 0.5*(InPutSignal(pre_half) +  ...
                 InPutSignal(pre_half + 2^(layyer-1)));
               
                 OutPutSignal_to_time(pre_half  + 2^(layyer-1)) =  ...
                 0.5*W_rN *(InPutSignal(pre_half) -  ...
                 InPutSignal(pre_half + 2^(layyer-1)));

           end          
      end
      
      InPutSignal = OutPutSignal_to_time;
end

%******************************************
%   Reverse the bits of output number
%******************************************
for SampleNumber = 1 : TotalSample
    
    ret	 = bit_reverse(SampleNumber - 1,Bits);
    
    OutPutSignal_to_time(SampleNumber) = InPutSignal(ret+1);
end