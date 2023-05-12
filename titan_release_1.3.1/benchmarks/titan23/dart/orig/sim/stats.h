#ifndef STATS_H
#define STATS_H

#include <vector>
using namespace std;

/* Stats class
 */
class Stats
{
public:
    Stats (int bin_size = 1, int num_bins = 15);
    ~Stats ();
    
    double Average () const;
	double Stdev () const;
    unsigned int Max () const;
    unsigned int Min () const;
	double Sum () const;
    int NumSamples () const;

    void AddSample (unsigned int val);
    
    void Display () const;
	void Display (const char *prefix) const;
    void Clear ();
    
private:
    int num_samples;
    double sample_sum;
    
    bool reset;
    unsigned int min_sample;
    unsigned int max_sample;
    
	int bin_size;
    int num_bins;    
    int *hist;
	vector<unsigned int> overflow_samples;
};

#endif
