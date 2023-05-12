#ifndef SIM_H
#define SIM_H
#define _CRT_SECURE_NO_DEPRECATE

#include <map>
#include <vector>
using namespace std;

#include "node.h"

#define MAX_UINT	0xFFFFFFFF

// Global variables
extern unsigned int T, DT;					            // Simulation time
extern unsigned int CLK;					            // Simulation clock cycles
extern map<unsigned int, Node*> addr_to_node;           // Map user ID to Node*
extern e_sim_state sim_state;				            // Simulation state
extern unsigned int flit_id;				            // Next flit ID (unique)
extern int num_warnings;					            // Total number of warnings
extern SimTime sim_time;
extern unsigned int min_clks_per_step;

// Interconnect options
#define BUBBLE_AVOIDANCE 0

// Deadlock detection
#define DEADLOCK_LIMIT 100

// Hardware modeling parameters
// FQ/RT output buffer latency
#define FQ_LATENCY 1
#define RT_LATENCY 1

#endif
