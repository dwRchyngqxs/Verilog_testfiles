/* unode.h
 *
 * User nodes used to define the user network configuration
 */

#ifndef UNODE_H
#define UNODE_H

#include <map>
#include <vector>
#include "util.h"
using namespace std;

class ArchNode;

/********************************************************************
 * User Node
 */

class UserNode
{
public:
    UserNode () {anode = NULL;}
    virtual ~UserNode () {};
    void set_addr (unsigned int _uaddr) {uaddr = _uaddr;}

    unsigned int uaddr;     // User node address
    ArchNode *anode;        // Pointer to ArchNode
};


/********************************************************************
 * User Link
 */

typedef struct s_UserLink
{
    unsigned int latency;
    unsigned int bandwidth;
} UserLink;


/********************************************************************
 * User TrafficGen
 */

class UserTrafficGen : public UserNode
{
public:
    UserTrafficGen (unsigned int _uaddr) {uaddr = _uaddr;}
    ~UserTrafficGen () {};

    // Bernoulli traffic pattern
    double interval;
    unsigned int packet_size;
    unsigned int sendto;

    // RNG
    unsigned int rng_seeds[3];

    // Input link info
    UserLink iq;

    // DefaultRouter
    unsigned int def_router;
};


/********************************************************************
 * User Router
 */

class UserRouter : public UserNode
{
public:
    UserRouter (unsigned int _uaddr);
    ~UserRouter ();

    static int rtable_size;

    map<int, DestTag> iport_map;
    map<int, DestTag> oport_map;

    vector<UserLink> iq;
    PortTag *rtable;
    int init_credits;
};


/********************************************************************
 * User Network
 */

class UserNet
{
public:
    UserNet ();
    ~UserNet ();

    void build (const char *user_net_file);
    UserNode *get_unode (unsigned int uaddr);

    int num_terminals () {return generators.size();}
    int num_routers () {return routers.size();}
    int max_fanout ();                          // Returns the max Router fanout

    vector<UserNode*> all_nodes;
    vector<UserTrafficGen*> generators;
    vector<UserRouter*> routers;
    map <unsigned int, UserNode*> addr_to_node;	// Contains both Routers and TGs

    unsigned int warmup_cycles;
    int init_credits;
};

#endif

