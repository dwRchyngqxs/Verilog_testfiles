/* util.h
 *
 * Utility functions
 */
#ifndef UTIL_H
#define UTIL_H

#define _CRT_SECURE_NO_WARNINGS

#include <iostream>
using namespace std;

#define MAX_UINT ((unsigned)0xFFFFFFFF)

typedef struct s_DestTag
{
    unsigned int addr;
    unsigned int port;
} DestTag;

typedef struct s_PortTag
{
    unsigned int port;
    unsigned int VC;
} PortTag;

extern bool verbose;

void assert_always (bool expr, const char *format, ...);
void fatal (const char* format, ...);
int myprintf(const char* format, ...);

bool read_str_token (istream &infile, char *str);
bool read_int_token (istream &infile, int &i);
bool read_unsigned_token (istream &infile, unsigned int &i);
bool read_double_token (istream &infile, double &d);

#endif

