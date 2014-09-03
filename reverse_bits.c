/*******************************************************
Code writer	: EOF
Code file	: reverse_bits.c
e-mail 		: jasonleaster@gmail.com

code purpose:
	This code is a demo for how to reverse input bits
in FFT.

	If there is something wrong with my code, please
touche me by e-mail. Thank you.

*********************************************************/
#include<stdio.h>
#define ARRAY_SIZE 8

int main(void)
{
	int array[ARRAY_SIZE] = {0,};

	int tmp  = 0;
	int bits = 0;

	/*
	** Initialization of array
	*/
	for(tmp = 0;tmp < ARRAY_SIZE;tmp++)
	{
		array[tmp] = tmp;
	}

	for(tmp = ARRAY_SIZE-1;tmp > 0; tmp >>= 1)
	{
		bits++;
	}

	for(tmp = 0;tmp < ARRAY_SIZE; tmp++)
	{
		printf("%d %d\n",array[tmp],reverse_bits(array[tmp],bits));
	}

	return 0 ;
}

/*
** Reverse the bits of input number
*/
int reverse_bits(int num,int bits)
{
	int tmp  = 0;
	int ret  = 0;
	int copy_num = 0;

	for(ret = 0,tmp = 0,copy_num = num; bits > 0; tmp++,bits--)
	{
		ret  += (copy_num % 2) * (1<<(bits-1));

		copy_num >>= 1;
	}

	return ret;
}
