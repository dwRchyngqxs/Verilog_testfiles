#ifndef ROUTER_H
#define ROUTER_H

#include <map>
#include <deque>
#include <vector>
using namespace std;

#include "node.h"

#define RT_TABLE_SIZE 1024

typedef enum
{
	RT_NONE = 0,
	RT_IDEAL,
	RT_SIMPLE,
	RT_MESH,
	RT_MESH_PIPE,
	RT_MESH_OPT,
	RT_MESH_FULL,
	RT_MESH_IDEAL,
	NUM_RT_TYPES
} e_rt_type;
// Update rt_type_str in router.cpp when adding a new type
// to e_rt_type;

extern const char *rt_type_str [];


//
// Router Interface
//
class Router : public Node
{
public:
	Router ();
	virtual ~Router () {};

	virtual bool is_quiescent () = 0;
	virtual void tick () = 0;
	virtual bool read_input () = 0;
	virtual Flit* ready (int bid, int vc = 0) = 0;
	virtual Flit* ready (int bid, int port, int vc) {return ready (bid, vc);};
	virtual void push (Flit *p) = 0;
	virtual void pop (int bid, int vc) = 0;
	virtual void pop (int bid, int port, int vc) {pop (bid, vc);};
	virtual bool full (DestTag port) = 0;
	virtual bool can_increment () {return true;};
	virtual int get_xbar_nports () {return 1;};	// Returns the number of ports to a crossbar

	static void print_stats ();
	static void router_ready_stats (unsigned int nready);
	static e_rt_type rt_type;

	DestTag rtable[RT_TABLE_SIZE];				// Destination to nexthop addr2 and input port
	map<unsigned int, DestTag> oport_map;		// Output port to nexthop addr2 and input port
	map<unsigned int, DestTag> iport_map;		// Input port to upstream addr2 and output port

	static int pipe_latency;					// Router pipeline latency

private:
	static unsigned int rt_sum_max_nready;
	static unsigned int rt_max_nready;
	static unsigned int rt_last_ts_checked;
};


// Place holder Router
// Does nothing, emulate an unused Router on-board
//
class RouterDummy : public Router
{
public:
    RouterDummy () {};
    
    bool is_quiescent () {return true;};
    void tick () {};
    bool read_input () {return true;};
    Flit* ready (int bid, int vc = 0) {return NULL;};
    void push (Flit *p);
    void pop (int bid, int vc);
    bool full (DestTag port) {return false;};
    void print_usage () {};
};


//
// RouterIdeal
// Inifite switching bandwidth
//
class RouterIdeal : public Router
{
public:
	RouterIdeal (unsigned int addr2);
	~RouterIdeal ();

	bool is_quiescent ();
	void tick ();
	bool read_input () {return false;};
	Flit* ready(int bid, int vc);
	void push (Flit *p);
	void pop (int bid, int vc);
	bool full (DestTag port) {return false;};
	void print_usage ();

private:

	struct s_rt_stats
	{
		vector<unsigned int> ibuf_max_size;
		vector<unsigned int> obuf_max_size;
	} rt_stats;

	int ready_port;
	int nports;
	deque<Flit*> *ibuf;						// One input buffer for each port
	deque<Flit*> *obuf;						// One output buffer for each port

	void init ();
	bool initialized;

	void tick_infinite ();						// Route with infinite bandwidth
	void tick_finite ();						// Route a finite number of flits

	vector<unsigned int> last_popped_ts;		// Timstamp of the last flit popped
};



//
// RouterSimple
// Oblivious of number input and output ports
//
class RouterSimple : public Router
{
public:
	RouterSimple (unsigned int addr2);
	~RouterSimple ();

	bool is_quiescent ();
	void tick ();
	bool read_input () {return false;};
	Flit* ready(int bid, int vc);
	void push (Flit *p);
	void pop (int bid, int vc);
	bool full (DestTag port) {return false;};
	void print_usage ();

private:

	struct s_rt_stats
	{
		unsigned int max_ibuf_size;
		unsigned int max_obuf_size;
	} rt_stats;

	deque<Flit*> ibuf;						// Input buffer
	deque<Flit*> obuf;						// Output buffer
};


// 
// RouterMesh
// Mesh node router (5 ports)
// Router picks one port to switch every clock cycle
//
#define RTM_IBUF_SIZE 1

struct InputPortInfo
{
	deque<Flit*> buf;		// Input buffers
	bool inspected;			// Whether this port is inspected during this time step
	bool stalled;			// The flit at this port was stalled due to lack of credits
	DestTag dest;			// Allocated output port and VC for this port/VC
	unsigned int last_ts;	// Timestamp of Router departure of the last flit through this port
};

struct OutputPortInfo
{
	int credit;				// Credit associated with this port
	int credit_update;		// Credits received during this time step
	bool free;				// Wehther the output port/VC is free for allocation
	unsigned int reuse_ts;	// When this output VC can be reassigned
	unsigned int owner;		// PID of the head flit that allocated this resource
	unsigned int last_ts;	// Timestamp of the last flit through this port
	deque<Flit*> credit_buf;
	deque<Flit*> credit_update_buf;
};

class RouterMesh : public Router
{
public:
	RouterMesh (unsigned int addr2, e_rt_type router_type);
	~RouterMesh ();

	bool is_quiescent ();
	void tick ();
	bool read_input ();
	Flit* ready (int bid, int vc);
	Flit* ready (int bid, int port, int vc);
	void push (Flit *p);
	void pop (int bid, int vc);
	void pop (int bid, int port, int vc);
	bool full (DestTag port);
	bool can_increment ();	// Whether this Router has completed all possible actions for the current time step
	void print_usage ();
	int get_xbar_nports ();

    static int ncredits;    // Initial amount of credits per output VC
    static int nports;      // Number of router ports

protected:
	struct s_rt_stats
	{
        unsigned int *max_ibuf_size;				// [port]
		unsigned int max_obuf_size[NUM_IC_BUSES];
		unsigned int max_flits_per_cycle;
		unsigned int sum_ready_ports_clock;
		unsigned int sum_ready_ports_timestep;
		unsigned int max_ready_ports_timestep;
		unsigned int ready_ports_timestep;
		bool **ready_stats_done;		// [port][VC]
	} rt_stats;

	InputPortInfo **iports;				// [port][VC]
	OutputPortInfo **oports;			// [port][VC]

	deque<Flit*> *obuf[NUM_IC_BUSES];	// Output buffer [bus][port]

	PortTag sole_uninspected_iport;		// Holds the port number of the uninspected iport, if there's only one

	int get_oport (DestTag &nexthop);	// Returns the output port number associated with the nexthop
};

//
// Router Mesh Pipelined (2 stages)
//
class RouterMeshPipe : public RouterMesh
{
public:
	RouterMeshPipe (unsigned int addr2);
	void tick ();
    bool can_increment ();

private:
	Flit *s2_flit;						// Pipeline register
	PortTag s2_flit_iport;
	bool s2_flit_valid;
};




// 
// RouterMeshIdeal
// Mesh router that can route for all input ports in a clock cycle
//
class RouterMeshIdeal : public Router
{
public:
	RouterMeshIdeal (unsigned int addr2);
	~RouterMeshIdeal ();

	bool is_quiescent ();
	void tick ();
	bool read_input ();
	Flit* ready (int bid, int vc);
	Flit* ready (int bid, int port, int vc);
	void push (Flit *p);
	void pop (int bid, int vc);
	void pop (int bid, int port, int vc);
	bool full (DestTag port);
	bool can_increment () {return true;};
	void print_usage ();
	int get_xbar_nports () {return RouterMesh::nports;};

private:
	struct s_rt_stats
	{
		unsigned int *max_ibuf_size;			// [port]
		unsigned int max_obuf_size[NUM_IC_BUSES];
		unsigned int max_flits_per_cycle;
	} rt_stats;

	InputPortInfo **iports;				// [port][VC]
	OutputPortInfo **oports;			// [port][VC]

	deque<Flit*> *obuf[NUM_IC_BUSES];	// Output buffer [bus][port]
	int pop_port;

	int get_oport (DestTag &nexthop);			// Returns the output port number associated with the nexthop
};

#endif

