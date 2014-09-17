SOURCE_FILE:=	complex_add.c complex_mul.c complex_sub.c fft.c get_r_in_Wn.c init_signal.c reverse_bits.c show_signal.c fft_test.c show_complex_number.c

OBJECT_FILE:=	complex_add.o complex_mul.o complex_sub.o fft.o get_r_in_Wn.o init_signal.o reverse_bits.o show_signal.o fft_test.o show_complex_number.o


compile:
	gcc -g -c $(SOURCE_FILE)

link:
	gcc $(OBJECT_FILE) -g -lm -o ./a.out

clean:
	rm -rf ./*.o
