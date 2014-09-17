#include "fft.h"

void init_signal(struct signal* p_signal,double* array,int size)
{
	if(!p_signal || !array)
	{
		printf("You passed NULL into %s()\n",__FUNCTION__);
		return ;
	}

	int tmp = 0;

	p_signal->size = size;

	for(tmp = 0; tmp < size; tmp++)
	{
		p_signal->points[tmp].real    = array[tmp];
		p_signal->points[tmp].imagine = 0;
	}
}
