#ifndef NODE_H
#define NODE_H

typedef enum
{
	FLIT_DATA = 0,
	FLIT_CREDIT,
	NUM_FLIT_TYPES
} e_flit_type;

struct DestTag
{
	unsigned int addr2;						// Physical node address of the destination
	unsigned int port;						// Port number of the destination
	unsigned int VC;						// Virtual channel of the destination
};

struct PortTag
{
	int port;
	int vc;
};

struct Flit
{
	unsigned int addr3;						// Final destination of flit (Layer 3)
	DestTag nexthop;						// Next hop of this flit (Layer 2)
	unsigned int size;
	unsigned int timestamp;
	unsigned int data;
	unsigned int source;					// Originator node of the flit
	unsigned int injection_ts;				// Injection timestamp
	bool measure;							// Indicate if this is a measurement flit
	e_flit_type type;						// Type of flit
	unsigned int process_clk;				// When this flit should be processed. Models the RAM FIFO latency
	bool is_head;
	bool is_tail;

};

// Simulation time
struct SimTime {
	unsigned int warmup;
	unsigned int measurement;
	unsigned int drain;
};

// Simulation State
typedef enum {
	SIM_INIT = 0,
	SIM_WARMUP,
	SIM_MEASURE,
	SIM_DRAIN,
	SIM_DONE,
	NUM_SIM_STATES
} e_sim_state;

// Interconnect buses
typedef enum
{
	BUS_FLIT = 0,
	BUS_CREDIT,
	NUM_IC_BUSES
} e_bus;


class Node
{
public:
	unsigned int addr2;						// "physical" node address. Assumed unique.
    unsigned int haddr;                     // Hardware node address

	Node ();
	virtual ~Node () {};

	virtual bool is_quiescent () = 0;		// Node has no more in-flight flits
	virtual void tick() {};					// Simulator clock tick
	virtual void push(Flit *p) = 0;			// Node receives a flit destined for it
	virtual void pop(int bid, int vc) = 0;	// Removes first ready flit from the specified bus and VC
	virtual Flit* ready(int bid, int vc) = 0;	// Returns first ready flit for the specified bus and VC, or null
	virtual bool full(DestTag port) = 0;	// Returns if the node's input buffer is full
	virtual bool can_increment () = 0;		// Returns if the node completed all ops for this time step
	virtual void print_usage() = 0;

	struct s_stats
	{
		unsigned int noutoforder;
		unsigned int noutoforder_router;
		unsigned int noutoforder_queue;
		unsigned int noutoforder_tg;
		unsigned int nlate;					// Number of late flits
		unsigned int sum_late;				// Sum of lateness
		unsigned int last_timestamp[NUM_IC_BUSES];
		unsigned int npushed;
		unsigned int flits_through;			// Number of flits through this node during simulation
	} stats;

protected:
	void push_stats(const Flit *p, bool count_late_stats);
	void update_usage (const Flit *p);
};

#endif
