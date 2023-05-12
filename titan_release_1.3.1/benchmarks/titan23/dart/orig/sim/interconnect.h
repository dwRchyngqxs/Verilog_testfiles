#ifndef INTERCONNECT_H
#define INTERCONNECT_H

#include <vector>
#include <set>
using namespace std;

#include "sim.h"
#include "node.h"
#include "flitqueue.h"
#include "trafficgen.h"
#include "router.h"

//Abstract class Interconnect. Derive from Interconnect to implement various interconnects.
class Interconnect
{
public:
	virtual int tick(vector<Node*> &nodes) = 0;		//Returns how many simulation timesteps to increase. Usually 1.
	Interconnect();
	virtual ~Interconnect() {};
	virtual void print_stats() {};

	virtual int get_num_partitions (int bus) {return 0;};
	virtual vector<Node*> *get_partition (int bus, int partition, vector<Node*> &nodes) {return NULL;};

	struct {
		unsigned int nflits;
		unsigned int nbus[NUM_IC_BUSES];
	} stats;

	char name[32];
	bool bubble_avoidance;
	static int ready_delta;			//Should be assigned along with FlitQueue::ready_delta
};



//******************************************
// Ideal
//******************************************
class InterconnectIdeal : public Interconnect
{
public:
	InterconnectIdeal();
	int tick(vector<Node*> &nodes);
	void print_stats();
};


//******************************************
// DualCrossbar
//******************************************
class InterconnectDualCrossbar : public Interconnect
{
public:
	int tick (vector<Node*> &nodes);
	InterconnectDualCrossbar ();
	void print_stats ();
};


//******************************************
// DualCrossbarRTPort
//******************************************
// Assigns one crossbar input port per Router output port
// Only works with RouterMeshIdeal. Degenerates into DualCrossbar if other
// Router models are used
class InterconnectDualCrossbarRTPort : public Interconnect
{
public:
	int tick (vector<Node*> &nodes);
	InterconnectDualCrossbarRTPort ();
	void print_stats ();
};



typedef struct
{
	int sbus;
	int spartition;
	int dbus;
	int dpartition;
} partition_t;

typedef struct {
    Router *node;
    int vc;
    unsigned int ts;
    unsigned int rr_prio;   // Round-robin priority
} select_t;


//******************************************
// PartitionedXBar (pipelined)
//******************************************

#define ICPX_PART_S 8
#define ICPX_PART_D 4

class InterconnectPartitionedXBar : public Interconnect
{
public:
	int tick (vector<Node*> &nodes);
	InterconnectPartitionedXBar (bool opt_alloc, char *place_file, 
								 int n_sparts = ICPX_PART_S, int n_dparts = ICPX_PART_D);
	virtual ~InterconnectPartitionedXBar ();

	void print_stats ();

private:
	void init (vector<Node*> &nodes);
	void init (char *filename, vector<Node*> &nodes);
    void init2 (char *filename, vector<Node*> &nodes);
	void print_partitions ();

	int tick_bipartite (vector<Node*> &nodes);

	struct {
		unsigned int n_ready_parts[NUM_IC_BUSES];		// See how many source partitions are ready on average
		unsigned int n_delivered_parts[NUM_IC_BUSES];	// See how many destination partitions receive a delivery
		unsigned int n_noready_cycles[NUM_IC_BUSES];	// Cycles where no flits are ready
		unsigned int n_ready[NUM_IC_BUSES][100];		// Number of ready nodes per partition
		unsigned int n_delieverd[NUM_IC_BUSES][100];	// Number of flits delievered per partition
		unsigned int n_delayedby[NUM_IC_BUSES+1];				// Number of cycles delayed by FQ->Router or Router->FQ traffic
	} statspx;

	// Partition of nodes
	vector<Router*> *nodelist_s;			// Source partition nodes
	vector<Node*> *nodelist_d;				// Destination partition nodes
    unsigned int nsparts;
    unsigned int ndparts;
    
    vector<RouterDummy*> dummy_routers;     // Place-holder routers

    map<int, partition_t> addr_to_partition;// Node address to bus/partition lookup

	// Pipeline registers
	Flit **s2_flits[NUM_IC_BUSES];			// Flit for this destination partition
	Node **s2_flit_source[NUM_IC_BUSES];
	bool *s2_flit_valid[NUM_IC_BUSES];
    
    // Selection temporary data
    select_t *s1_nodes[NUM_IC_BUSES];       // [bus][source part]
    select_t *s2_nodes[NUM_IC_BUSES];       // [bus][dest part]

	bool initialized;
	bool use_optimal_xbar_alloc;
	char placement_file[100];				// Optional configuration file for node placement
};




#endif
