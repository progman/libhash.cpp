//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// http://ru.wikipedia.org/wiki/SHA-2
// wrapper for SHA512 from http://ftp.gnu.org/gnu/coreutils/coreutils-8.21.tar.xz
// Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#ifndef SHA512_HPP_INCLUDE
#define SHA512_HPP_INCLUDE
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#include <stdint.h>
#include <config.h>
#include "sha512.h"
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
class sha512_t
{
public:
	typedef uint8_t sha512_item_t[512 / 8];

	sha512_t();
	void open(sha512_item_t *psha512_item);
	void update(const void * const p, uint64_t size);
	void close();

private:
	struct sha512_ctx ctx;
	sha512_item_t *psha512_item;
};
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#endif
