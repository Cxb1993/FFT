%****************************************************************************
%     Code writer     : EOF
%     Code file       : bit_reverse.m
%     Code date       : 2014.09.04
%     e-mail          : jasonleaster@gmail.com
%
%     Function        : ret = bit_reverse(Number,Bits)
%
%     Input Parameter : @Number, that is which number you want to reverse
%                                in bits.
%                       @Bits,   You should tell this function that how
%                                many bits you used to represent 'Number'
%
%     Output Parameter : @ret, that is a bit-reverse number of input 'Number'
%
%     Usage:
%            bit_reverse(1,3) == 4        001 --> 100 
%
%****************************************************************************
function ret = bit_reverse(Number,Bits)

    copy_num = Number;
    tmp_bits = Bits;
    tmp	 = 0;
	
    while	tmp_bits > 0
      
        tmp = tmp + (mod(copy_num,2)) * (2^(tmp_bits-1));
        
        copy_num = floor(copy_num/2);
        
        tmp_bits = tmp_bits - 1;
    end

    ret = tmp;
    
end