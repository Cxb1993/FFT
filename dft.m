%% ***************************************************************************************
% code writer 	: EOF
% code date 	: 2014.03.11              2014.03.12 update
% e-mail 	: jasonleaster@gmail.com
% code purpose : 
%       This code is demo for DFT. I would like to share my code with
%       someone who is interesting in DSP. If there is something wrong with
%       my code, please touche me by e-mail. Thank you!
%
%% ***************************************************************************************

TotalSample = 400;
%The number of all the signal that our sensor got
circle = TotalSample/2;
% circle = TotalSample;
%We assume that the preiod of the signal we generated is 'circle';
SignalInS = zeros(circle,1);
%This varible is used for recording the signal in frequency domain
SignalInT = zeros(TotalSample,1);
%This varible is used for recording the signal which were processed by inverse-DFT in time domain
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

% %% initialize a delta wave
% for SampleNumber = -(TotalSample/2):(TotalSample/2)-1
%     if (SampleNumber == 0)
%         OriginalSignal((TotalSample/2)+1+SampleNumber) = 5;
%     end
% end

%We show the original signal in time domain.
figure(1);
plot( -(TotalSample/2):(TotalSample/2)-1,OriginalSignal,'.-');
title('The original signal');

%% forward-DFT
for frequency = -(circle/2):(circle/2)-1 
    % You must knew what is "Shannon sampling theorem" and you will knew that why frequency is from -(circle/2) to (circle/2)-1
    for SampleNumber = -(TotalSample/2):(TotalSample/2)-1%Nothingelse, just from 1 to TotalSample
        SignalInS((circle/2)+1+frequency) = ...
        SignalInS((circle/2)+1+frequency) + ...
        OriginalSignal((TotalSample/2)+1+SampleNumber)*exp(-2*pi*(frequency/circle)*(SampleNumber)*i);
    end
end

%We show the real part of processed signal in frequency domain.
figure(2);
plot(-(circle/2):(circle/2)-1,real(SignalInS),'-');
title('The real part of signal after processed');

%We show the imagine part of processed signal in frequency domain.
figure(3);
plot(-(circle/2):(circle/2)-1,imag(SignalInS),'-');
title('The imagine part of signal after processed');

%% inverse-DFT
for frequency = -(circle/2):(circle/2)-1
    for SampleNumber = -(TotalSample/2):(TotalSample/2)-1
        SignalInT((TotalSample/2)+1+SampleNumber) = ...
        SignalInT((TotalSample/2)+1+SampleNumber) + ...
        (1/TotalSample)*SignalInS((circle/2)+1+frequency)*exp(2*pi*(frequency/circle)*(SampleNumber)*i);
    end
end

%Just show the signal that we rebuilt by inverse-DFT
figure(4);
plot(-(TotalSample/2):(TotalSample/2)-1,SignalInT,'-');
title('The  rebuilt signal after processed');

