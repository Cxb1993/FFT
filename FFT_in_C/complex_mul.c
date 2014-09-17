/***************************************************************
code writer	:	EOF
code file	:	complex_mul.c
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

code purpose	:
	We need multiple(*) operation between complex number, so here is 
my method.

	If you find something wrong with my code, please touch
me by e-mail. Thank you :)

****************************************************************/
#include "fft.h"

struct complex_number complex_mul(struct complex_number* x,struct complex_number *y)
{
	struct complex_number ret;
	if(!x || !y)
	{
		printf("You passed NULL into %s()\n",__FUNCTION__);
		goto out ;
	}

	ret.real    = (x->real) * (y->real)    - (x->imagine)*(y->imagine);
	ret.imagine = (x->real) * (y->imagine) + (x->imagine)* (y->real);

out:
	return ret;
}
