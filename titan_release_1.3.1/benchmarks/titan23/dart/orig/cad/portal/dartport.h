#ifndef DARTPORT_H
#define DARTPORT_H

#include <windows.h>

// DART port access functions
class DARTPort
{
public:
	DARTPort ();
	~DARTPort ();

	bool open_port ();
	void close_port ();

	bool write_to_port (char *val, int nbytes);
	bool read_from_port (char *val, int nbytes);

	void echo_test ();	// Measures round-trip latency of an echo

private:

	HANDLE hComm;
	bool port_open;
};

#endif
