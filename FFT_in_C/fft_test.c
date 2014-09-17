#include "fft.h"

int main()
{
	double array[8] = {0,5,5,0,0,5,0,0};

	struct signal* p_signal = NULL;
	int size = sizeof(array)/sizeof(array[0]);

	p_signal = (struct signal*)malloc(sizeof(struct complex_number)*size + sizeof(p_signal->size));

	if(!p_signal)
	{
		printf("malloc failed!\n");
		return 0;
	}

	init_signal(p_signal,array,size);

	show_signal(p_signal);

	struct signal* p_output = NULL;

	p_output = fft(p_signal);
	
	show_signal(p_output);

	free(p_signal);
	free(p_output);

	return 0;
}
