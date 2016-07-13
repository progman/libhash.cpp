//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// 0.0.5
// Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include "crc16.hpp"
#include "crc32.hpp"
#include "md5.hpp"
#include "sha1.hpp"
#include "sha256.hpp"
#include "sha512.hpp"
#include "sha3_224.hpp"
#include "sha3_256.hpp"
#include "sha3_384.hpp"
#include "sha3_512.hpp"
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
void help()
{
	printf("%s    %s\n", PROG_FULL_NAME, PROG_URL);
	printf("example: echo 'hello world!' | %s [-crc16|-crc32|-md5|-sha1|-sha256|-sha512|-sha3_224|-sha3_256|-sha3_384|-sha3_512] [FILE]\n", PROG_NAME);
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
// general function
int main(int argc, char* argv[])
{
// detect input arguments
	if
	(
		(argc != 2) &&
		(argc != 3)
	)
	{
		help();
		return 1;
	}


	if
	(
		(strcmp(argv[1], "-h")     == 0) ||
		(strcmp(argv[1], "-help")  == 0) ||
		(strcmp(argv[1], "--help") == 0)
	)
	{
		help();
		return 1;
	}


	enum { NONE, CRC16, CRC32, MD5, SHA1, SHA256, SHA512, SHA3_224, SHA3_256, SHA3_384, SHA3_512 } hash_type = NONE;


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

		if (strcmp(argv[1], "-sha512") == 0)
		{
			hash_type = SHA512;
			break;
		}

		if (strcmp(argv[1], "-sha3_224") == 0)
		{
			hash_type = SHA3_224;
			break;
		}

		if (strcmp(argv[1], "-sha3_256") == 0)
		{
			hash_type = SHA3_256;
			break;
		}

		if (strcmp(argv[1], "-sha3_384") == 0)
		{
			hash_type = SHA3_384;
			break;
		}

		if (strcmp(argv[1], "-sha3_512") == 0)
		{
			hash_type = SHA3_512;
			break;
		}

		help();
		return 1;
	}


	const char *filename = NULL;
	if (argc == 3)
	{
		for (;;)
		{
			if (strcmp(argv[2], "-") == 0)
			{
				break;
			}
			if (strcmp(argv[2], "--") == 0)
			{
				break;
			}

			filename = argv[2];
			break;
		}
	}


// open hashes
	crc16_t    crc16;
	crc32_t    crc32;
	md5_t      md5;
	sha1_t     sha1;
	sha256_t   sha256;
	sha512_t   sha512;
	sha3_224_t sha3_224;
	sha3_256_t sha3_256;
	sha3_384_t sha3_384;
	sha3_512_t sha3_512;

	crc16_t::crc16_item_t       crc16_item;
	crc32_t::crc32_item_t       crc32_item;
	md5_t::md5_item_t           md5_item;
	sha1_t::sha1_item_t         sha1_item;
	sha256_t::sha256_item_t     sha256_item;
	sha512_t::sha512_item_t     sha512_item;
	sha3_224_t::sha3_224_item_t sha3_224_item;
	sha3_256_t::sha3_256_item_t sha3_256_item;
	sha3_384_t::sha3_384_item_t sha3_384_item;
	sha3_512_t::sha3_512_item_t sha3_512_item;


	crc16.open(&crc16_item);
	crc32.open(&crc32_item);
	md5.open(&md5_item);
	sha1.open(&sha1_item);
	sha256.open(&sha256_item);
	sha512.open(&sha512_item);
	sha3_224.open(&sha3_224_item);
	sha3_256.open(&sha3_256_item);
	sha3_384.open(&sha3_384_item);
	sha3_512.open(&sha3_512_item);


// read data
	if (filename == NULL) // read from stdin
	{
		size_t size_max = 65536;
		void *pdata = malloc(size_max);
		if (pdata == NULL)
		{
			printf("ERROR[malloc()]: %s (%u)\n", strerror(errno), errno);
			return 1;
		}


		ssize_t size;
		for (;;)
		{
			size = read(STDIN_FILENO, pdata, size_max); // x12 faster than getchar()
			if (size == 0)
			{
				break; // EOF
			}
			if (size == ssize_t(-1))
			{
				printf("ERROR[read()]: %s (%u)\n", strerror(errno), errno);
				return 1;
			}


			switch (hash_type)
			{
				case CRC16:
				{
					crc16.update(pdata, size);
					break;
				}
				case CRC32:
				{
					crc32.update(pdata, size);
					break;
				}
				case MD5:
				{
					md5.update(pdata, size);
					break;
				}
				case SHA1:
				{
					sha1.update(pdata, size);
					break;
				}
				case SHA256:
				{
					sha256.update(pdata, size);
					break;
				}
				case SHA512:
				{
					sha512.update(pdata, size);
					break;
				}
				case SHA3_224:
				{
					sha3_224.update(pdata, size);
					break;
				}
				case SHA3_256:
				{
					sha3_256.update(pdata, size);
					break;
				}
				case SHA3_384:
				{
					sha3_384.update(pdata, size);
					break;
				}
				case SHA3_512:
				{
					sha3_512.update(pdata, size);
					break;
				}
				case NONE:
				default:
				{
					break;
				}
			}
		}


		free(pdata);
	}
	else // read from file
	{
		int rc;


		rc = ::open(filename, O_RDONLY | O_LARGEFILE);
		if (rc == -1)
		{
			printf("ERROR[open()]: %s (%u)\n", strerror(errno), errno);
			return 1;
		}
		int fd = rc;


		struct stat my_stat;
		rc = fstat(fd, &my_stat);
		if (rc == -1)
		{
			printf("ERROR[fstat()]: %s (%u)\n", strerror(errno), errno);
			return 1;
		}
		off_t size = my_stat.st_size;


		void *pdata = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
		if (pdata == MAP_FAILED)
		{
			printf("ERROR[mmap()]: %s (%u)\n", strerror(errno), errno);
			return 1;
		}


		switch (hash_type)
		{
			case CRC16:
			{
				crc16.update(pdata, size);
				break;
			}
			case CRC32:
			{
				crc32.update(pdata, size);
				break;
			}
			case MD5:
			{
				md5.update(pdata, size);
				break;
			}
			case SHA1:
			{
				sha1.update(pdata, size);
				break;
			}
			case SHA256:
			{
				sha256.update(pdata, size);
				break;
			}
			case SHA512:
			{
				sha512.update(pdata, size);
				break;
			}
			case SHA3_224:
			{
				sha3_224.update(pdata, size);
				break;
			}
			case SHA3_256:
			{
				sha3_256.update(pdata, size);
				break;
			}
			case SHA3_384:
			{
				sha3_384.update(pdata, size);
				break;
			}
			case SHA3_512:
			{
				sha3_512.update(pdata, size);
				break;
			}
			case NONE:
			default:
			{
				break;
			}
		}


		munmap(pdata, size);


		::close(fd);
	}


// finalyze hashes
	crc16.close();
	crc32.close();
	md5.close();
	sha1.close();
	sha256.close();
	sha512.close();
	sha3_224.close();
	sha3_256.close();
	sha3_384.close();
	sha3_512.close();


// show hash
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
		case SHA512:
		{
			view_hash(&sha512_item, sizeof(sha512_item));
			break;
		}
		case SHA3_224:
		{
			view_hash(&sha3_224_item, sizeof(sha3_224_item));
			break;
		}
		case SHA3_256:
		{
			view_hash(&sha3_256_item, sizeof(sha3_256_item));
			break;
		}
		case SHA3_384:
		{
			view_hash(&sha3_384_item, sizeof(sha3_384_item));
			break;
		}
		case SHA3_512:
		{
			view_hash(&sha3_512_item, sizeof(sha3_512_item));
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
