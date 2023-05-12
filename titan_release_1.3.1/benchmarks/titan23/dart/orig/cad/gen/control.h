/* control.h
 *
 * Simulation Control Unit
 */
#ifndef CONTROL_H
#define CONTROL_H

#include "unode.h"
#include "arch.h"

class Control
{
public:
    Control ();
    ~Control () {};

    void init (int argc, const char *argv[]);
    void place ();                      // Place user network on the architecture
    void bitstream ();                  // Generate the user bitstream

private:
    Arch arch;
    UserNet user_net;

    char arch_file[50];
    char user_file[50];
    char bit_file[50];
    char sim_file[50];

    bool initialized;
	
	int trace_node_id;
};

#endif

