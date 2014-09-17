/******************************************************************************
code writer	:	EOF
code file	:	get_r_in_Wn.c
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

	Input Parameter : @k, the location of input signal
                          @m, the current layyer
                          @N, the total number of inputed signal
                          @bits, how many bits should be used to represent 'N'

	Output Parameter: @ret , the value of 'r'
*******************************************************************************/
int get_r_in_Wn(int k, int m, int bits)
{
	int tmp = k<<(bits-m);

	return tmp&((1<<m) -1);
}
