#ifndef TRAFFICGEN_H
#define TRAFFICGEN_H

#include "node.h"
#include "rng.h"
#include "flitqueue.h"
#include "stats.h"

#define TG_OBUF_SIZE 32

// Synthetic Traffic Generator
class TrafficGen : public Node
{
public:
	TrafficGen(unsigned int addr2, unsigned int def_router);
	~TrafficGen () {};

	bool is_quiescent ();
	void tick();
	Flit *ready(int bid, int vc);
	bool full(DestTag port) {return i_queue.full(port);};
	void push(Flit *p);
	void pop(int bid, int vc);
	bool can_increment ();
	
	void init_bernoulli (unsigned int size, double interval, unsigned int sendto);
	void srand (unsigned int i1, unsigned int i2, unsigned int i3);
	void print_usage();

	void set_iqueue (unsigned int latency, unsigned int bandwidth);
	void set_oqueue (unsigned int latency, unsigned int bandwidth);

	unsigned int get_dest () {return sendto;};

	DestTag def_router;
	unsigned int next_vc;

	struct s_tg_stats
	{
		unsigned int ninjected;				// Number of injected flits
		unsigned int nreceived;				// Number of received flits
		unsigned int ninjected_pkt;			// Number of injected packets
		unsigned int nreceived_pkt;			// Number of received packets
		       float latency_sum;			// Sum of packet latency (used to calculate average latency)
		unsigned int wc_lantecy;			// Worst case latency
		unsigned int max_ibuf_size;
		unsigned int max_obuf_size;
	} tg_stats;
	
	Stats tg_recv_stats;					// Stats on received packets

	static bool single_cycle_injection;
	static Stats tg_overall_stats;

private:

	FlitQueue o_queue;					// Input buffer to default router
	FlitQueue i_queue;					// This node's input buffer

	unsigned int psize;					// Packet size
	unsigned int bernoulli_threshold;
	unsigned int sendto;

	struct s_lag_injection
	{
		unsigned int  lag_ts;
		unsigned int  flits_injected;	// Number of flits in this packet that has been injected
		Flit injected_head;				// Most recently injected head flit
	} lag_injection;

	TausRNG rng;
};


#endif
