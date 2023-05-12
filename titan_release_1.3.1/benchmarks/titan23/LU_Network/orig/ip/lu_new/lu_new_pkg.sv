package lu_new;
	parameter MAX_CPU = 13;
	parameter MAX_NODES = MAX_CPU + 2;
	
	parameter NETADDRBITS = CLogB2(MAX_NODES-1);
	parameter NETADDR_MEM = MAX_NODES - 2;
	parameter NETADDR_CTRL = MAX_NODES - 1;
	
	parameter BSIZE = 64;
	parameter BSIZEBITS = CLogB2(BSIZE-1);
	parameter BWORDS = BSIZE*BSIZE;
	parameter BWORDSBITS = CLogB2(BWORDS-1);
	parameter BWORDSMEM = BWORDS / 8;
	parameter BWORDSMEMBITS = CLogB2(BWORDSMEM-1);
	
	parameter LANES = BSIZE / 4;
	parameter LANESBITS = CLogB2(LANES-1);
	
	parameter NET_DWIDTH = 256;
	
	parameter CURLEFT_AWIDTH = 2*BSIZEBITS - LANESBITS;
	parameter CURLEFT_DWIDTH = LANES*32;
	
	parameter TOP_AWIDTH = 2*BSIZEBITS - 3;
	parameter TOP_DWIDTH = 256;
	parameter TOP_SLICES = 4;
	
	parameter MAX_DIM = 16384;
	parameter MAX_BDIM = MAX_DIM / BSIZE;
	parameter MAX_BDIMBITS = CLogB2(MAX_BDIM-1);
		
	typedef enum
	{
		MODE_1,
		MODE_2,
		MODE_3,
		MODE_4
	} t_cpu_comp_mode;
	
	typedef struct packed
	{
		logic cur;
		logic left;
		logic top;
	} t_buftrio;
	
	typedef struct packed
	{
		// Used only in go message
		logic [MAX_BDIMBITS-1:0]		BLKXMIN;	// current pass leftmost column x coordinate
		logic [MAX_BDIMBITS-1:0]		BLKYMAX;	// bottom of matrix block coordinate
		logic									FIRSTCOL;// is this the first column of a pass?
		
		// Shared between go message, read request, read data
		logic [MAX_BDIMBITS-1:0]		BLKX;		// column x coordinate
		logic [MAX_BDIMBITS-1:0]		BLKY;		// y coordinate of topmost block in column
		t_buftrio					WHICHBUFS;		// which buffers are to be filled
		logic							WHICHPAGE;		// which buffer page (0 or 1) to fill
		
		// Common fields
		logic [NETADDRBITS-1:0]			RQST_ID;		// ID of the node that issued this packet
		logic [NETADDRBITS-1:0]			DEST_ID;		// ID of the destination node for this packet
		logic								DEST_BCAST;		// Broadcast bit: send to all CPUs
		
		// Message type (1-hot)
		logic 						MSG_GO;			// packet is a 'GO' control message
		logic							MSG_DONE;		// packet is a 'DONE' control message
		logic							RD_DATA;			// packet is a response to a read request
		logic							WR_DATA;			// packet is a write to memory
		logic							RD_RQST;			// packet is a read request
	} t_head_packet;
	
	//ceiling of log base 2
	function integer CLogB2;
		input [31:0] Depth;
		integer i;
		begin
			i = Depth;		
			for(CLogB2 = 0; i > 0; CLogB2 = CLogB2 + 1)
				i = i >> 1;
		end
	endfunction

	function int unsigned nodes_for_level(int radix, int nodes, int level);
		automatic int total = nodes;
		
		for (int i = 0; i < level; i++) begin
			total = (total + radix - 1) / radix;
		end
		
		return total;
	endfunction
	
	function int unsigned radix_for_levels(int levels, int nodes);
		int radix;
		int total;
		
		total = 1;
		
		for (radix = 1; total < nodes; radix++) begin
			total = 1;
			for (int i = 0; i < levels; i++) begin
				total = total * radix;
			end
		end
		
		return radix;
	endfunction
endpackage
