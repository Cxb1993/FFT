#include "fft.h"

struct complex_number complex_add(struct complex_number* x, struct complex_number *y)
{
	struct complex_number ret;

	if(!x || !y)
	{
		printf("You passed NULL into %s()\n",__FUNCTION__);
		goto out ;
	}

	ret.real    = x->real    + y->real;
	ret.imagine = x->imagine + y->imagine;
out:
	return ret;
}
