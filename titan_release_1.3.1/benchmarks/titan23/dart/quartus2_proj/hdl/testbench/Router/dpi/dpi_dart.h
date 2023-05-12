/* Helper functions used in DPI testbenches for DART
 */
#ifndef DPI_DART_H
#define DPI_DART_H

#include "const.h"
#include "node.h"


#if C_TEST
    #define V_DISP(x) printf("%s\n", x)
    #define sv_0 0
    #define sv_1 1
#else
    #include "svdpi.h"
    #include "dpiheader.h"
    #define V_DISP(x) v_disp(x)
#endif

#define myprintf(fmt,...) printf("%5u  ", CLK); printf(fmt,##__VA_ARGS__)
#define VVDISP(fmt,...) sprintf(buf, fmt,##__VA_ARGS__); V_DISP(buf)

#if C_TEST
typedef int svLogic;
typedef int svLogicVecVal;
//#define svLogic int
//#define svLogicVecVal int
#define SV_PACKED_DATA_NELEMS(x) (x)
#endif

//#define min(x, y) (((x)<(y)) ? (x) : (y))

typedef struct {
    int width;
    int elemwidth;          // Width of individual element
    bool is_array;
    union
    {
        unsigned int value;
        unsigned int *arrayvalue;
    } v;
} test_signal;

typedef int (*t_test_func)();


test_signal new_test_signal (int width);
test_signal new_test_signal_vector (int nelems, int elemwidth);

void free_test_signal (test_signal val);

void put_logic (svLogicVecVal *d, int len, int offset, unsigned int s);
void get_logic (const svLogicVecVal *s, int len, int offset, unsigned int *d);

void put (svLogic *d, test_signal &val);
void get (const svLogic *s, test_signal &val);

void put_vec (svLogicVecVal *d, test_signal &val);
void get_vec (const svLogicVecVal *s, test_signal &val);

void form_flit (const Flit *f, unsigned *flit_hi, unsigned *flit_lo);

#endif

