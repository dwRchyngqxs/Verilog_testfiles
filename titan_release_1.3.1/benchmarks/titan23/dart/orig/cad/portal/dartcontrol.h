#ifndef DARTCONTROL_H
#define DARTCONTROL_H

#include <string>
#include <iostream>
#include <sstream>
using namespace std;


bool dart_initialize (int argc, char *argv[]);
bool dart_handle_command (istream &ins, bool verbose = false);
void dart_finalize ();

#endif
