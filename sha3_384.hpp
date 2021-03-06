//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// http://en.wikipedia.org/wiki/SHA-3
// wrapper for SHA3_384 for module of GNU/Linux kernel written by Jeff Garzik <jeff@garzik.org> from https://lwn.net/Articles/518415/
// Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#ifndef SHA3_384_HPP_INCLUDE
#define SHA3_384_HPP_INCLUDE
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#include <stdint.h>
#include "sha3.h"
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
class sha3_384_t
{
public:
	typedef uint8_t sha3_384_item_t[SHA3_384_DIGEST_SIZE];

	sha3_384_t();
	void open(sha3_384_item_t *psha3_384_item);
	void update(const void * const p, uint64_t size);
	void close();

private:
	struct sha3_state ctx;
	sha3_384_item_t *psha3_384_item;
};
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#endif
