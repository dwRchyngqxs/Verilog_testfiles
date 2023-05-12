#ifndef UTIL_H
#define UTIL_H

#include <iostream>
#include "flitqueue.h"
#include "trafficgen.h"
#include "router.h"
#include "interconnect.h"

#define VERBOSE 0
#define BUFSIZE 255

extern bool sim_verbose;

void sim_setup (int argc, char *argv[], Interconnect **ic, vector<TrafficGen*> &generators, 
			  vector<FlitQueue*> &queues, vector<Router*> &routers,
			  vector<Node*> &all_nodes, SimTime &sim_time);

void analyze_topology (vector<TrafficGen*> &generators);

void sim_cleanup ();

void assert_always (bool expr, const char* format, ...);
void assert_warn (bool expr, const char* format, ...);
void fatal (const char* format, ...);

int myprintf(const char* format, ...);
int trprintf (Node *n, const char* format, ...);
int trprintf (int s, int p, char t, const char* format, ...);
int trprintf (int s, const char *format, ...);

void print_flit (const Flit &p, unsigned *hi, unsigned *lo);
char get_flit_type_char (Flit *p);

bool read_str_token (istream &infile, char *i);
bool read_int_token (istream &infile, int &i);
bool read_unsigned_token (istream &infile, unsigned int &i);
bool read_double_token (istream &infile, double &d);

e_sim_state get_sim_state (unsigned int sim_time);

#define MAX(a,b) ((a) < (b) ? (b) : (a))

#endif
