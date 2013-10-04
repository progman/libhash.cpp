//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// 0.0.2
// Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "crc16.hpp"
#include "crc32.hpp"
#include "md5.hpp"
#include "sha1.hpp"
#include "sha256.hpp"
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// view hash
void view_hash(const void * const p, size_t size)
{
	const uint8_t *pp = (const uint8_t *)p;
	for (size_t i=0; i < size; i++)
	{
		printf("%02x", *pp++);
	}
	printf("\n");
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// view help
void help(const char *prog_name)
{
	printf("example: echo 'hello world!' | %s [-crc16|-crc32|-md5|-sha1|-sha256]\n", prog_name);
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// general function
int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		help(argv[0]);
		return 1;
	}


	if
	(
		(strcmp(argv[1], "-h")     == 0) ||
		(strcmp(argv[1], "-help")  == 0) ||
		(strcmp(argv[1], "--help") == 0)
	)
	{
		help(argv[0]);
		return 1;
	}


	enum hash_type_t { NONE, CRC16, CRC32, MD5, SHA1, SHA256 };
	hash_type_t hash_type = NONE;


	for (;;)
	{
		if (strcmp(argv[1], "-crc16") == 0)
		{
			hash_type = CRC16;
			break;
		}

		if (strcmp(argv[1], "-crc32") == 0)
		{
			hash_type = CRC32;
			break;
		}

		if (strcmp(argv[1], "-md5") == 0)
		{
			hash_type = MD5;
			break;
		}

		if (strcmp(argv[1], "-sha1") == 0)
		{
			hash_type = SHA1;
			break;
		}

		if (strcmp(argv[1], "-sha256") == 0)
		{
			hash_type = SHA256;
			break;
		}

		help(argv[0]);
		return 1;
	}


	int rc;
	uint8_t ch;
	crc16_t crc16;
	crc32_t crc32;
	md5_t md5;
	sha1_t  sha1;
	sha256_t  sha256;
	crc16_t::crc16_item_t crc16_item;
	crc32_t::crc32_item_t crc32_item;
	md5_t::md5_item_t md5_item;
	sha1_t::sha1_item_t sha1_item;
	sha256_t::sha256_item_t sha256_item;


	crc16.open(&crc16_item);
	crc32.open(&crc32_item);
	md5.open(&md5_item);
	sha1.open(&sha1_item);
	sha256.open(&sha256_item);


	for (;;)
	{
		rc = getchar();
		if (rc == EOF) break;

		ch = (uint8_t)rc;

		switch (hash_type)
		{
			case CRC16:
			{
				crc16.update(&ch, sizeof(ch));
				break;
			}
			case CRC32:
			{
				crc32.update(&ch, sizeof(ch));
				break;
			}
			case MD5:
			{
				md5.update(&ch, sizeof(ch));
				break;
			}
			case SHA1:
			{
				sha1.update(&ch, sizeof(ch));
				break;
			}
			case SHA256:
			{
				sha256.update(&ch, sizeof(ch));
				break;
			}
			case NONE:
			default:
			{
				break;
			}
		}
	}


	crc16.close();
	crc32.close();
	md5.close();
	sha1.close();
	sha256.close();


	switch (hash_type)
	{
		case CRC16:
		{
			view_hash(&crc16_item, sizeof(crc16_item));
			break;
		}
		case CRC32:
		{
			view_hash(&crc32_item, sizeof(crc32_item));
			break;
		}
		case MD5:
		{
			view_hash(&md5_item, sizeof(md5_item));
			break;
		}
		case SHA1:
		{
			view_hash(&sha1_item, sizeof(sha1_item));
			break;
		}
		case SHA256:
		{
			view_hash(&sha256_item, sizeof(sha256_item));
			break;
		}
		case NONE:
		default:
		{
			break;
		}
	}


	return 0;
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
