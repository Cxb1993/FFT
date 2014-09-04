%****************************************************************************
%     Code writer     : EOF
%     Code file       : bit_reverse.m
%     Code date       : 2014.09.04
%     e-mail          : jasonleaster@gmail.com
%
%     Function        : ret = get_r_in_Wn(k,m,N,bits)
%
%     Input Parameter : @k, the location of input signal
%                       @m, the current layyer
%                       @N, the total number of inputed signal
%                       @bits, how many bits should be used to represent 'N'
%
%     Output Parameter: @ret , the value of 'r'
%             
%****************************************************************************

function ret = get_r_in_Wn(k,m,N,bits)

         tmp = bitshift(k,bits - m);
         
         ret = bitand(tmp,(2^m) - 1);    
end