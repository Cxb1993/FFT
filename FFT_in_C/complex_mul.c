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
