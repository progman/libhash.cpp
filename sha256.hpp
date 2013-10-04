//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// http://ru.wikipedia.org/wiki/SHA-2
// wrapper for SHA256 from http://ftp.gnu.org/gnu/coreutils/coreutils-8.21.tar.xz
// Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#include <stdint.h>
#include "sha256.h"
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
class sha256_t
{
public:
	typedef uint8_t sha256_item_t[SHA256_DIGEST_SIZE];

	sha256_t();
	void open(sha256_item_t *psha256_item);
	void update(const void * const p, uint64_t size);
	void close();

private:
	struct sha256_ctx ctx;
	sha256_item_t *psha256_item;
};
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
