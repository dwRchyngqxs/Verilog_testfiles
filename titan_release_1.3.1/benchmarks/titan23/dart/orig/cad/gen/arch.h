/* arch.h
 *
 * Architecture nodes used to build config vector for the simulator
 */
#include <stdio.h>
#include <string>
#include <map>
#include <vector>
#include "util.h"
using namespace std;

class UserNode;
class UserRouter;
class UserNet;
class ArchRouter;

#define RTABLE_SIZE 256

/********************************************************************
 * Arch Node
 */

class ArchNode
{
public:
    ArchNode () {unode = NULL;}
    virtual ~ArchNode () {};
    virtual void print_config (FILE *fp) = 0;
    virtual int num_config_bytes () = 0;
    virtual void print_ram_config (FILE *fp) {};
    virtual int num_ram_config_bytes () = 0;

    unsigned int addr;
    UserNode *unode;
};


/********************************************************************
 * Arch FlitQueue
 */

class ArchFlitQueue : public ArchNode
{
public:

    ArchFlitQueue () {};
    ~ArchFlitQueue () {};
    void print_config (FILE *fp);
    int num_config_bytes ();
    int num_ram_config_bytes () {return 0;}

    unsigned int latency;       // 8 bits
    unsigned int bandwidth;     // 8 bits
};


/********************************************************************
 * Arch RNG
 */

class ArchRNG : public ArchNode
{
public:
    
    ~ArchRNG () {};
    void print_config (FILE *fp);
    int num_config_bytes ();
    int num_ram_config_bytes () {return 0;}

	void srand (unsigned int *val);

    unsigned int s[3];          // 32 x 3 bits
};


/********************************************************************
 * Arch TrafficGen
 */

class ArchTrafficGen : public ArchNode
{
public:

    ArchTrafficGen ();
    ~ArchTrafficGen () {};

    void set_addr (unsigned int _addr);
    void set_threshold (double interval);

    void print_config (FILE *fp);
    int num_config_bytes ();
    int num_ram_config_bytes () {return 0;}

    unsigned int def_router;

    unsigned int size;          // 10 bits
    unsigned int threshold;     // 32 bits
    unsigned int sendto;        // 8 bits

    ArchFlitQueue iq;
    ArchFlitQueue oq;
    ArchRNG rng;
};


/********************************************************************
 * Arch RTable
 */

class ArchRTable : public ArchNode
{
public:
    ArchRTable () {size = 0;};
    ~ArchRTable ();

    void init (int _size);
    void set_rtable (PortTag *table, int num_entries, vector<int> &uport_to_aport, UserNet &user_net);
	void print_rtable ();

    void print_config (FILE *fp) {};
    int num_config_bytes () {return 0;}

    void print_ram_config (FILE *fp);
    int num_ram_config_bytes ();

    ArchRouter *router;         // Router for this RoutingTable

private:
    int size;
    unsigned int *rtable;
};


/********************************************************************
 * Arch Router
 */

class ArchRouter : public ArchNode
{
public:
    ArchRouter (int _nports, int _nvcs);
    ~ArchRouter ();

    void set_init_credit (int init_credit);
    void set_oport (int port, unsigned int dest, int dest_port);

    int get_nports () {return nports;}

    void print_config (FILE *fp);
    int num_config_bytes ();

    void print_ram_config (FILE *fp);
    int num_ram_config_bytes ();

    ArchRTable *rtable;
    unsigned int *iport_map;    // Port ID to ArchFQ/TG addr
    unsigned int *oport_map;    // Port ID to ArchFQ/TG addr

private:
    int nports;
    int nvcs;
    int *init_credits;
};


/********************************************************************
 * Simulation Architecture
 */

class Arch
{
public:
    Arch ();
    ~Arch ();

    static unsigned int get_node_haddr (int dpid, int node_id, int port_id);
    static unsigned int get_node_haddr (int node_addr, int port_id);
	static unsigned int get_node_id (unsigned int haddr);

    void build (const char *arch_file);

    void print_config (FILE *fp);
	void print_config (FILE *fp, ArchNode *anode);
    int num_config_bytes ();

    void print_sim_config (FILE *fp);

    int num_nodes () const;             // Number of nodes (1 Router + 1 TG + (nports-1) FQs)
    int num_router_ports () const {return nports;}

    vector<ArchRouter*> *nodelist_s;    // SourcePartition node list (only the Routers)
    vector<ArchRouter*> *nodelist_d;    // DestPartition node list (only the Routers)
    vector<ArchRTable*> *tablelist_d;   // RoutingTables within each DestPart
    vector<ArchNode*> all_nodes;        // All nodes created

    map<int, ArchNode*> addr_to_node;   // Maps addr to ArchNode (only contains the TGs and FQs)
    map<int, int> spart_to_dpart;       // Maps to SourcePart ID to DestPart ID

	vector<int> uport_to_aport;			// Maps UserRouter port to ArchRouter port

    int nsparts;    // Number of SourceParts
    int ndparts;    // Number of DestParts

    int nports;     // Number of ports per router
    int nvcs;       // Number of VCs per link

    int warmup_cycles;                  // Number of warmup cycles to run

private:
    bool initialized;
};


