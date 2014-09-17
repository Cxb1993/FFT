/***************************************************************
code writer	:	EOF
code file	:	reverse_bits.c
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

code purpose	:

	 	Reverse the bits of input number

	If you find something wrong with my code, please touch
me by e-mail. Thank you :)

****************************************************************/

int reverse_bits(int num,int bits)
{
	int ret  = 0;
	int copy_num = 0;

	for(ret = 0,copy_num = num; bits > 0; bits--)
	{
		ret  += (copy_num % 2) * (1<<(bits-1));

		copy_num >>= 1;
	}

	return ret;
}
