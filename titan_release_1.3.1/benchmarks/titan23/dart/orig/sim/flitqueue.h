#ifndef PACKETQUEUE_H
#define PACKETQUEUE_H

#include <deque>
using namespace std;

#include "node.h"

class FlitQueue : public Node
{
public:
	FlitQueue ();
	~FlitQueue ();

	bool is_quiescent ();
	void tick ();
	Flit *ready (int bid, int vc);
	bool full (DestTag port) {return false;};
	bool can_increment () {return true;};
	void push (Flit *p);
	void pop (int bid, int vc);
	int size (int bid, int vc);

	void print_usage ();

	void set (unsigned addr2, DestTag nexthop, unsigned latency, unsigned bandwidth);
	DestTag get_nexthop () {return nexthop;};

	static int ready_delta;
	static int nVCs;

private:

	struct s_pq_stats {
		unsigned int max_ibuf_size;
		unsigned int max_obuf_size;
	} pq_stats;

	unsigned int latency;
	unsigned int bandwidth;			// Number of flits to let through per time step
	DestTag nexthop;

	struct s_flits_through {
		unsigned int last_ts;		// Timestamp of the last flit processed
		unsigned int count;			// Number of flits through this link in this time step
		unsigned int reset_when;	// Timestamp to reset the bandwidth counter
	} flits_through;

	deque<Flit*> *ibuf[NUM_IC_BUSES];	// Input channels
	deque<Flit*> *obuf[NUM_IC_BUSES];	// Output channels

	void process_flit (Flit *p, int vc);	// Add flit to output queue and do bandwidth control
};

#endif
