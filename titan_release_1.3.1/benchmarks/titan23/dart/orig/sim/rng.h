#ifndef RNG_H
#define RNG_H

// Tausworthe Random Number Generator
class TausRNG
{
public:
	TausRNG ();
	~TausRNG () {};

	void srand (unsigned int i1, unsigned int i2, unsigned int i3);
	unsigned int rand ();

private:
	unsigned int s[3];
};


#endif
