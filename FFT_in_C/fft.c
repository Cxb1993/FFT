/***************************************************************
code writer	:	EOF
code file	:	fft.c
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

code purpose	:

	This code core-part of fft in my implementation.
	If you find something wrong with my code, please touch
me by e-mail. Thank you :)

****************************************************************/
#include "fft.h"

struct signal* fft(struct signal* p_signal)
{
	struct signal*  p_input_signal = \
	(struct signal*) malloc(sizeof(struct complex_number)*(p_signal->size) + sizeof(p_signal->size));

	struct signal*  p_out_put_signal = \
 	(struct signal*)malloc(sizeof(struct complex_number)*(p_signal->size) + sizeof(p_signal->size));

	*p_input_signal   = *p_signal;
	*p_out_put_signal = *p_signal;

	int tmp   = 0;
	int index = 0;
	int bits  = 0;

	int layyer= 0;
	int selected_point = 0;
	int pre_half	   = 0;	

	int    r  = 0;
	double x  = 0;
	struct complex_number W_rN ;
	struct complex_number complex_tmp ;

	/*
	**	We caculate how many bits should be used to 
	** represent the size of the number of input signal.
	*/
	for(tmp = p_signal->size-1;tmp > 0;tmp>>=1)
	{
		bits++;
	}

	/*
	**	We should re-sequence the input signal
	** by bit-reverse.
	*/
	for(tmp = 0;tmp < p_signal->size;tmp++)
	{
		index = reverse_bits(tmp,bits);
		p_input_signal->points[tmp] = p_signal->points[index];
#ifdef DEBUG
		printf(" tmp:%5d index:%5d  ",tmp,index);
		show_complex_number(&p_signal->points[index]);
#endif
	}

	for(layyer = 1;layyer <= bits;layyer++)
	{

		
		#ifdef DEBUG
			printf("layyer %d input\n",layyer);
			show_signal(p_input_signal);
		#endif

		for(selected_point = 0;selected_point < p_signal->size;selected_point += 1<<(layyer))
		{
			for(pre_half = selected_point,r = 0,x = 0;
			    pre_half < (selected_point + (1<<(layyer-1)));
			    pre_half++)
			{
				r = get_r_in_Wn(pre_half,layyer,bits);

				#ifdef DEBUG
					printf("r: %d\n",r);
				#endif
	
				x = -2*PI*r/((double)(p_input_signal->size));
				W_rN.real    = cos(x);
				W_rN.imagine = sin(x);

				complex_tmp = complex_mul(&W_rN , &(p_input_signal->points[pre_half + (1<<(layyer-1))])  );

				#ifdef DEBUG
					show_complex_number(&complex_tmp);
				#endif

				p_out_put_signal->points[pre_half] = \
				complex_add(&p_input_signal->points[pre_half],&complex_tmp);

				p_out_put_signal->points[pre_half + (1<<(layyer-1))] = \
				complex_sub(&p_input_signal->points[pre_half],&complex_tmp);

			}
			
		}

		#ifdef DEBUG
			printf("layyer%d output\n",layyer);
			show_signal(p_out_put_signal);
		#endif

		for(tmp = 0;tmp < p_out_put_signal->size;tmp++)
		{
			p_input_signal->points[tmp] = p_out_put_signal->points[tmp];
		}

	}

	free(p_input_signal);
	return p_out_put_signal;
}
