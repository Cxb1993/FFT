/***************************************************************
code writer	:	EOF
code file	:	fft.h
code date	:	2014.09.17
e-mail		:	jasonleaster@gmail.com

****************************************************************/
#ifndef _FFT_IN_C_H
#define _FFT_IN_C_H

	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>

	#define PI 3.1415926
	#define DEBUG

	struct complex_number
	{
		double real;
		double imagine;
	};

	struct signal
	{
		int size;//how many points in this domain.
		struct complex_number points[0];
	};
	
	int reverse_bits(int num,int bits);
	int get_r_in_Wn(int k, int m, int bits);

	void init_signal(struct signal* p_signal,double* array,int size);

	struct signal* fft(struct signal* p_signal);

	struct complex_number complex_mul(struct complex_number* x,struct complex_number* y);

	struct complex_number complex_add(struct complex_number* x, struct complex_number *y);

	struct complex_number complex_sub(struct complex_number* x, struct complex_number *y);

	void show_signal(struct signal* const signal);

	void show_complex_number(struct complex_number * x);
#endif
