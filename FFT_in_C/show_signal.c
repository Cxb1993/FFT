/***************************************************************
code writer	:	EOF
code file	:	show_signal.c
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

code purpose	:
	If you want to see the detail about signal that @p_signal point to, just call this API.

	If you find something wrong with my code, please touch
me by e-mail. Thank you :)

****************************************************************/
#include "fft.h"

void show_signal(struct signal* const p_signal)
{
	if(!p_signal)
	{
		printf("You passed NULL into function %s  line:%d\n",__FUNCTION__,__LINE__);

		return ;
	}

	int tmp = 0;

	for(tmp = 0; tmp < p_signal->size;tmp++)
	{
		printf("point %d real : %lf imagine %lf\n",\
		tmp,\
		p_signal->points[tmp].real,\
		p_signal->points[tmp].imagine);
	}
	printf("\n\n");
}
