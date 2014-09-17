/***************************************************************
code writer	:	EOF
code file	:	show_complex_number.c
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

	If you find something wrong with my code, please touch
me by e-mail. Thank you :)

****************************************************************/
#include "fft.h"

void show_complex_number(struct complex_number * x)
{
	printf("real:%lf  imagine:%lf\n",x->real,x->imagine);
}
