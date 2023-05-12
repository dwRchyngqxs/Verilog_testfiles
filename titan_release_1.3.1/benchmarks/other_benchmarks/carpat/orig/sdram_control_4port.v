module Sdram_Control_4Port(
		//	HOST Side
        REF_CLK,
        RESET_N,
		CLK,
		CLK_18,

        WR1_DATA,
		WR1,
		WR1_ADDR,
		WR1_MAX_ADDR,
		WR1_LENGTH,
		WR1_LOAD,
		WR1_CLK,
		
        WR2_DATA,
		WR2,
		WR2_ADDR,
		WR2_MAX_ADDR,
		WR2_LENGTH,
		WR2_LOAD,
		WR2_CLK,
		
        RD1_DATA,
		RD1,
		RD1_ADDR,
		RD1_MAX_ADDR,
		RD1_LENGTH,
		RD1_LOAD,	
		RD1_CLK,

		RD2_DATA,
		RD2,
		RD2_ADDR,
		RD2_MAX_ADDR,
		RD2_LENGTH,
		RD2_LOAD,
		RD2_CLK,

		//	SDRAM Side
        SA,
        BA,
        CS_N,
        CKE,
        RAS_N,
        CAS_N,
        WE_N,
        DQ,
        DQM,
		SDR_CLK
        );


// Address Space Parameters

`define ROWSTART        8          
`define ROWSIZE         12
`define COLSTART        0
`define COLSIZE         8
`define BANKSTART       20
`define BANKSIZE        2

// Address and Data Bus Sizes

parameter	INIT_PER	=	24000;
parameter	REF_PER		=	1024;
parameter	SC_CL		=	3;
parameter	SC_RCD		=	3;
parameter	SC_RRD		=	7;
parameter	SC_PM		=	1;
parameter	SC_BL		=	1;

//	SDRAM Parameter
parameter	SDR_BL		=	(SC_PM == 1)?	3'b111	:
							(SC_BL == 1)?	3'b000	:
							(SC_BL == 2)?	3'b001	:
							(SC_BL == 4)?	3'b010	:
											3'b011	;
parameter	SDR_BT		=	1'b0;	//	Sequential
							//	1'b1:	//	Interteave
parameter	SDR_CL		=	(SC_CL == 2)?	3'b10:
											3'b11;
 	
//	HOST Side
input                           REF_CLK;                //System Clock
input                           RESET_N;                //System Reset
//	FIFO Write Side 1
input   [15:0]            WR1_DATA;               //Data input
input							WR1;					//Write Request
input	[22:0]			WR1_ADDR;				//Write start address
input	[22:0]			WR1_MAX_ADDR;			//Write max address
input	[8:0]					WR1_LENGTH;				//Write length
input							WR1_LOAD;				//Write register load & fifo clear
input							WR1_CLK;				//Write fifo clock

//	FIFO Write Side 2
input   [15:0]            WR2_DATA;               //Data input
input							WR2;					//Write Request
input	[22:0]			WR2_ADDR;				//Write start address
input	[22:0]			WR2_MAX_ADDR;			//Write max address
input	[8:0]					WR2_LENGTH;				//Write length
input							WR2_LOAD;				//Write register load & fifo clear
input							WR2_CLK;				//Write fifo clock


//	FIFO Read Side 1
output  [15:0]            RD1_DATA;               //Data output
input							RD1;					//Read Request
input	[22:0]			RD1_ADDR;				//Read start address
input	[22:0]			RD1_MAX_ADDR;			//Read max address
input	[8:0]					RD1_LENGTH;				//Read length
input							RD1_LOAD;				//Read register load & fifo clear
input							RD1_CLK;				//Read fifo clock

//	FIFO Read Side 2
output  [15:0]            RD2_DATA;               //Data output
input							RD2;					//Read Request
input	[22:0]			RD2_ADDR;				//Read start address
input	[22:0]			RD2_MAX_ADDR;			//Read max address
input	[8:0]					RD2_LENGTH;				//Read length
input							RD2_LOAD;				//Read register load & fifo clear
input							RD2_CLK;				//Read fifo clock

//	SDRAM Side
output  [11:0]                  SA;                     //SDRAM address output
output  [1:0]                   BA;                     //SDRAM bank address
output  [1:0]                   CS_N;                   //SDRAM Chip Selects
output                          CKE;                    //SDRAM clock enable
output                          RAS_N;                  //SDRAM Row address Strobe
output                          CAS_N;                  //SDRAM Column address Strobe
output                          WE_N;                   //SDRAM write enable
inout   [15:0]            DQ;                     //SDRAM data bus
output  [16/8-1:0]          DQM;                    //SDRAM data mask lines
output							SDR_CLK;				//SDRAM clock
//	Internal Registers/Wires
//	Controller
reg		[22:0]			mADDR;					//Internal address
reg		[8:0]					mLENGTH;				//Internal length
reg		[22:0]			rWR1_ADDR;				//Register write address				
reg		[22:0]			rWR1_MAX_ADDR;			//Register max write address				
reg		[22:0]			rWR2_ADDR;				//Register write address				
reg		[22:0]			rWR2_MAX_ADDR;			//Register max write address				
reg		[8:0]			rWR2_LENGTH;			//Register write length
reg		[8:0]			rWR1_LENGTH;			//Register write length
reg		[22:0]			rRD1_ADDR;				//Register read address
reg		[22:0]			rRD1_MAX_ADDR;			//Register max read address
reg		[8:0]					rRD1_LENGTH;			//Register read length
reg		[22:0]			rRD2_ADDR;				//Register read address
reg		[22:0]			rRD2_MAX_ADDR;			//Register max read address
reg		[8:0]					rRD2_LENGTH;			//Register read length
reg		[1:0]					WR_MASK;				//Write port active mask
reg		[1:0]					RD_MASK;				//Read port active mask
reg								mWR_DONE;				//Flag write done, 1 pulse SDR_CLK
reg								mRD_DONE;				//Flag read done, 1 pulse SDR_CLK
reg								mWR,Pre_WR;				//Internal WR edge capture
reg								mRD,Pre_RD;				//Internal RD edge capture
reg 	[9:0] 					ST;						//Controller status
reg		[1:0] 					CMD;					//Controller command
reg								PM_STOP;				//Flag page mode stop
reg								Read;					//Flag read active
reg								Write;					//Flag write active
reg	    [15:0]           	mDATAOUT;               //Controller Data output
wire    [15:0]           	mDATAIN;                //Controller Data input
wire    [15:0]           	mDATAIN1;                //Controller Data input 1
wire    [15:0]           	mDATAIN2;                //Controller Data input 2

//	DRAM Control
reg  	[16/8-1:0]          DQM;                    //SDRAM data mask lines
reg     [11:0]                  SA;                     //SDRAM address output
reg     [1:0]                   BA;                     //SDRAM bank address
reg     [1:0]                   CS_N;                   //SDRAM Chip Selects
reg                             CKE;                    //SDRAM clock enable
reg                             RAS_N;                  //SDRAM Row address Strobe
reg                             CAS_N;                  //SDRAM Column address Strobe
reg                             WE_N;                   //SDRAM write enable
wire    [15:0]            DQOUT;					//SDRAM data out link

//	FIFO Control
reg								OUT_VALID;				//Output data request to read side fifo
reg								IN_REQ;					//Input	data request to write side fifo
wire	[15:0]					write_side_fifo_rusedw1;
wire	[15:0]					read_side_fifo_wusedw1;
wire	[15:0]					write_side_fifo_rusedw2;
wire	[15:0]					read_side_fifo_wusedw2;

//	DRAM Internal Control
wire							active;
output                          CLK;
output                          CLK_18;


Sdram_PLL sdram_pll1	(
				.inclk0(REF_CLK),
				.c0(CLK),
				.c1(SDR_CLK),
				.c2(CLK_18)
				);
            
reg                             reada;
reg                             writea;
reg                             refresh;
reg                             precharge;
reg                             load_mode;
reg     [22:0]            saddr;
reg                             ref_req;
reg                             init_req;
reg                             CMDACK;

// Internal signals
reg     [15:0]                  timer;
reg		[15:0]					init_timer;



// Command decode and mADDR register
always @(posedge CLK or negedge RESET_N)
begin
        if (RESET_N == 0) 
        begin
                reada           <= 0;
                writea          <= 0;
                saddr           <= 0;
        end
        
        else
        begin
        
                saddr <= mADDR;                                  // register the address to keep proper
                                                                // alignment with the command
                        
                if (CMD == 3'b001)                              // reada command
                        reada <= 1;
                else
                        reada <= 0;
                 
                if (CMD == 3'b010)                              // writea command
                        writea <= 1;
                else
                        writea <= 0;
                        
        end
end


//  Generate CMDACK
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
		CMDACK <= 0;
    else
       if ((cm_ack == 1) & (CMDACK == 0))
			CMDACK <= 1;
       else
            CMDACK <= 0;
end


// refresh timer
always @(posedge CLK or negedge RESET_N) begin
        if (RESET_N == 0) 
        begin
                timer           <= 0;
                ref_req         <= 0;
        end        
        else 
        begin
                if (ref_ack == 1)
				begin
                	timer <= REF_PER;
					ref_req	<=0;
				end
				else if (init_req == 1)
				begin
                	timer <= REF_PER+200;
					ref_req	<=0;					
				end
                else
                	timer <= timer - 1'b1;

                if (timer==0)
                    ref_req    <= 1;

        end
end

// initial timer
always @(posedge CLK or negedge RESET_N) begin
        if (RESET_N == 0) 
        begin
                init_timer      <= 0;
				refresh         <= 0;
                precharge      	<= 0; 
				load_mode		<= 0;
				init_req		<= 0;
        end        
        else 
        begin
                if (init_timer < (INIT_PER+201))
					init_timer 	<= init_timer+1;
					
				if (init_timer < INIT_PER)
				begin
					refresh		<=0;
					precharge	<=0;
					load_mode	<=0;
					init_req	<=1;
				end
				else if(init_timer == (INIT_PER+20))
				begin
					refresh		<=0;
					precharge	<=1;
					load_mode	<=0;
					init_req	<=0;
				end
				else if( 	(init_timer == (INIT_PER+40))	||
							(init_timer == (INIT_PER+60))	||
							(init_timer == (INIT_PER+80))	||
							(init_timer == (INIT_PER+100))	||
							(init_timer == (INIT_PER+120))	||
							(init_timer == (INIT_PER+140))	||
							(init_timer == (INIT_PER+160))	||
							(init_timer == (INIT_PER+180))	)
				begin
					refresh		<=1;
					precharge	<=0;
					load_mode	<=0;
					init_req	<=0;
				end
				else if(init_timer == (INIT_PER+200))
				begin
					refresh		<=0;
					precharge	<=0;
					load_mode	<=1;
					init_req	<=0;				
				end
				else
				begin
					refresh		<=0;
					precharge	<=0;
					load_mode	<=0;
					init_req	<=0;									
				end
        end
end




            
reg                             cm_ack;
reg                             ref_ack;
reg                             oe;
reg     [11:0]                  ISA;
reg     [1:0]                   IBA;
reg     [1:0]                   ICS_N;
reg                             IRAS_N;
reg                             ICAS_N;
reg                             IWE_N;



// Internal signals
reg                             do_reada;
reg                             do_writea;
reg                             do_refresh;
reg                             do_precharge;
reg                             do_load_mode;
reg								do_initial;
reg                             command_done;
reg     [7:0]                   command_delay;
reg     [1:0]                   rw_shift;
reg                             do_act;
reg                             rw_flag;
reg                             do_rw;
reg     [6:0]                   oe_shift;
reg                             oe1;
reg                             oe2;
reg                             oe3;
reg                             oe4;
reg     [3:0]                   rp_shift;
reg                             rp_done;
reg								ex_read;
reg								ex_write;

wire    [`ROWSIZE - 1:0]        rowaddr;
wire    [`COLSIZE - 1:0]        coladdr;
wire    [`BANKSIZE - 1:0]       bankaddr;

assign   rowaddr   = saddr[`ROWSTART + `ROWSIZE - 1: `ROWSTART];          // assignment of the row address bits from saddr
assign   coladdr   = saddr[`COLSTART + `COLSIZE - 1:`COLSTART];           // assignment of the column address bits
assign   bankaddr  = saddr[`BANKSTART + `BANKSIZE - 1:`BANKSTART];        // assignment of the bank address bits



// This always block monitors the individual command lines and issues a command
// to the next stage if there currently another command already running.
//
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0) 
    begin
            do_reada        <= 0;
            do_writea       <= 0;
            do_refresh      <= 0;
            do_precharge    <= 0;
            do_load_mode    <= 0;
			do_initial		<= 0;
            command_done    <= 0;
            command_delay   <= 0;
            rw_flag         <= 0;
            rp_shift        <= 0;
            rp_done         <= 0;
			ex_read			<= 0;
			ex_write		<= 0;
    end
    
    else
    begin

//  Issue the appropriate command if the sdram is not currently busy
		if( init_req == 1 )
		begin
            do_reada        <= 0;
            do_writea       <= 0;
            do_refresh      <= 0;
            do_precharge    <= 0;
            do_load_mode    <= 0;
			do_initial		<= 1;
            command_done    <= 0;
            command_delay   <= 0;
            rw_flag         <= 0;
            rp_shift        <= 0;
            rp_done         <= 0;
			ex_read			<= 0;
			ex_write		<= 0;
		end
		else
		begin
			do_initial		<= 0;
			
            if ((ref_req == 1 | refresh == 1) & command_done == 0 & do_refresh == 0 & rp_done == 0         // Refresh
                    & do_reada == 0 & do_writea == 0)
                    do_refresh <= 1;         
            else
                    do_refresh <= 0;

            if ((reada == 1) & (command_done == 0) & (do_reada == 0) & (rp_done == 0) & (ref_req == 0))    // reada
            begin
				    do_reada <= 1;
					ex_read <= 1;
			end
            else
                    do_reada <= 0;
                
            if ((writea == 1) & (command_done == 0) & (do_writea == 0) & (rp_done == 0) & (ref_req == 0))  // writea
            begin
				    do_writea <= 1;
					ex_write <= 1;
			end
            else
                    do_writea <= 0;

            if ((precharge == 1) & (command_done == 0) & (do_precharge == 0))                              // precharge
                    do_precharge <= 1;
            else
                    do_precharge <= 0;

            if ((load_mode == 1) & (command_done == 0) & (do_load_mode == 0))                              // LOADMODE
                    do_load_mode <= 1;
            else
                    do_load_mode <= 0;
                                           
// set command_delay shift register and command_done flag
// The command delay shift register is a timer that is used to ensure that
// the SDRAM devices have had sufficient time to finish the last command.

            if ((do_refresh == 1) | (do_reada == 1) | (do_writea == 1) | (do_precharge == 1)
                 | (do_load_mode == 1))
            begin
                    command_delay <= 8'b11111111;
                    command_done  <= 1;
                    rw_flag <= do_reada;                                                  
            end
            
            else
            begin
                    command_done        <= command_delay[0];                // the command_delay shift operation
                    command_delay		<= (command_delay>>1);
            end 
            

// start additional timer that is used for the refresh, writea, reada commands               
            if (command_delay[0] == 0 & command_done == 1)
            begin
                rp_shift <= 4'b1111;
                rp_done <= 1;
            end
            else
            begin						
				if(SC_PM == 0)
				begin
					rp_shift	<= (rp_shift>>1);
                    rp_done		<= rp_shift[0];
				end
				else
				begin
					if( (ex_read == 0) && (ex_write == 0) )
					begin
						rp_shift	<= (rp_shift>>1);
        	            rp_done		<= rp_shift[0];
					end
					else
					begin
						if( PM_STOP==1 )
						begin
							rp_shift	<= (rp_shift>>1);
        	      		    rp_done     <= rp_shift[0];
							ex_read		<= 1'b0;
							ex_write	<= 1'b0;
						end					
					end
				end
            end
		end
    end
end


// logic that generates the oe signal for the data path module
// For normal burst write he duration of oe is dependent on the configured burst length.
// For page mode accesses(SC_PM=1) the oe signal is turned on at the start of the write command
// and is left on until a precharge(page burst terminate) is detected.
//
always @(posedge CLK or negedge RESET_N)
begin
        if (RESET_N == 0)
        begin
                oe_shift <= 0;
                oe1      <= 0;
                oe2      <= 0;
                oe       <= 0;
        end
        else
        begin
                if (SC_PM == 0)
                begin
                        if (do_writea == 1)
                        begin
                                if (SC_BL == 1)                       //  Set the shift register to the appropriate
                                        oe_shift <= 0;                // value based on burst length.
                                else if (SC_BL == 2)
                                        oe_shift <= 1;
                                else if (SC_BL == 4)
                                        oe_shift <= 7;
                                else if (SC_BL == 8)
                                        oe_shift <= 127;
                                oe1 <= 1;
                        end
                        else 
                        begin
                                oe_shift <= (oe_shift>>1);
                                oe1  <= oe_shift[0];
                                oe2  <= oe1;
                                oe3  <= oe2;
                                oe4  <= oe3;
                                if (SC_RCD == 2)
                                        oe <= oe3;
                                else
                                        oe <= oe4;
                        end
                end
                else
                begin
                        if (do_writea == 1)                                    // oe generation for page mode accesses
                                oe4   <= 1;
                        else if (do_precharge == 1 | do_reada == 1 | do_refresh==1 | do_initial == 1 | PM_STOP==1 )
                                oe4   <= 0;
                        oe <= oe4;
                end
                               
        end
end

// This always block tracks the time between the activate command and the
// subsequent writea or reada command, RC.  The shift register is set using
// the configuration register setting SC_RCD. The shift register is loaded with
// a single '1' with the position within the register dependent on SC_RCD.
// When the '1' is shifted out of the register it sets so_rw which triggers
// a writea or reada command
//
always @(posedge CLK or negedge RESET_N)
begin
        if (RESET_N == 0)
        begin
                rw_shift <= 0;
                do_rw    <= 0;
        end
        
        else begin
                
                if ((do_reada == 1) | (do_writea == 1))
                begin
                        if (SC_RCD == 1)                          // Set the shift register
                                do_rw <= 1;
                        else if (SC_RCD == 2)
                                rw_shift <= 1;
                        else if (SC_RCD == 3)
                                rw_shift <= 2;
                end
                else
                begin
                        rw_shift <= (rw_shift>>1);
                        do_rw    <= rw_shift[0];
                end 
        end
end              

// This always block generates the command acknowledge, cm_ack, signal.
// It also generates the acknowledge signal, ref_ack, that acknowledges
// a refresh request that was generated by the internal refresh timer circuit.
always @(posedge CLK or negedge RESET_N) begin
    if (RESET_N == 0) 
    begin
        cm_ack   <= 0;
        ref_ack  <= 0;
    end
    else  begin
        if (do_refresh == 1 & ref_req == 1)                   // Internal refresh timer refresh request
                ref_ack <= 1;
        else if ((do_refresh == 1) | (do_reada == 1) | (do_writea == 1) | (do_precharge == 1)   // externa  commands
                 | (do_load_mode))
                cm_ack <= 1;
        else begin
                ref_ack <= 0;
                cm_ack  <= 0;
        end
    end
end 
              

// This always block generates the address, cs, cke, and command signals(ras,cas,wen)
// 
always @(posedge CLK ) begin
    if (RESET_N==0) begin
            ISA    <= 0;
            IBA    <= 0;
            ICS_N  <= 1;
            IRAS_N <= 1;
            ICAS_N <= 1;
            IWE_N  <= 1;
    end
    else begin
        
	// Generate ISA 	
		if (do_writea == 1 | do_reada == 1)    // ACTIVATE command is being issued, so present the row address
			ISA <= rowaddr;
		else
			ISA <= coladdr;                 // else alway present column address

		if ((do_rw==1) | (do_precharge))
			ISA[10] <= !SC_PM;              // set ISA[10] for autoprecharge read/write or for a precharge all command
											   // don't set it if the controller is in page mode.           
		if (do_precharge==1 | do_load_mode==1)
			IBA <= 0;                       // Set IBA=0 if performing a precharge or load_mode command
		else
			IBA <= bankaddr[1:0];           // else set it with the appropriate address bits

		if (do_refresh==1 | do_precharge==1 | do_load_mode==1 | do_initial==1)
			ICS_N <= 0;                                    // Select both chip selects if performing
		else                                                  // refresh, precharge(all) or load_mode
		begin
			ICS_N[0] <= saddr[22];                   // else set the chip selects based off of the
			ICS_N[1] <= ~saddr[22];                  // msb address bit
		end

		if(do_load_mode==1)
			ISA	  <= {2'b00,SDR_CL,SDR_BT,SDR_BL};


	//Generate the appropriate logic levels on IRAS_N, ICAS_N, and IWE_N
	//depending on the issued command.
	//		
		if ( do_refresh==1 ) begin                        // Refresh: S=00, RAS=0, CAS=0, WE=1
				IRAS_N <= 0;
				ICAS_N <= 0;
				IWE_N  <= 1;
		end
		else if ((do_precharge==1) & ((oe4 == 1) | (rw_flag == 1))) begin      // burst terminate if write is active
				IRAS_N <= 1;
				ICAS_N <= 1;
				IWE_N  <= 0;
		end
		else if (do_precharge==1) begin                 // Precharge All: S=00, RAS=0, CAS=1, WE=0
				IRAS_N <= 0;
				ICAS_N <= 1;
				IWE_N  <= 0;
		end
		else if (do_load_mode==1) begin                 // Mode Write: S=00, RAS=0, CAS=0, WE=0
				IRAS_N <= 0;
				ICAS_N <= 0;
				IWE_N  <= 0;
		end
		else if (do_reada == 1 | do_writea == 1) begin  // Activate: S=01 or 10, RAS=0, CAS=1, WE=1
				IRAS_N <= 0;
				ICAS_N <= 1;
				IWE_N  <= 1;
		end
		else if (do_rw == 1) begin                      // Read/Write: S=01 or 10, RAS=1, CAS=0, WE=0 or 1
				IRAS_N <= 1;
				ICAS_N <= 0;
				IWE_N  <= rw_flag;
		end
		else if (do_initial ==1) begin
				IRAS_N <= 1;
				ICAS_N <= 1;
				IWE_N  <= 1;				
		end
		else begin                                      // No Operation: RAS=1, CAS=1, WE=1
				IRAS_N <= 1;
				ICAS_N <= 1;
				IWE_N  <= 1;
		end
	end 
end

assign DQOUT = mDATAIN;

Sdram_FIFO 	write_fifo1(
				.data(WR1_DATA),
				.wrreq(WR1),
				.wrclk(WR1_CLK),
				.aclr(WR1_LOAD),
				.rdreq(IN_REQ&WR_MASK[0]),
				.rdclk(CLK),
				.q(mDATAIN1),
				.wrfull(),
				.wrusedw(),
				.rdusedw(write_side_fifo_rusedw1)
				);

Sdram_FIFO 	write_fifo2(
				.data(WR2_DATA),
				.wrreq(WR2),
				.wrclk(WR2_CLK),
				.aclr(WR2_LOAD),
				.rdreq(IN_REQ&WR_MASK[1]),
				.rdclk(CLK),
				.q(mDATAIN2),
				.wrfull(),
				.wrusedw(),
				.rdusedw(write_side_fifo_rusedw2)
				);


assign	mDATAIN	=	(WR_MASK[0])	?	mDATAIN1	:
										mDATAIN2	;

Sdram_FIFO 	read_fifo1(
				.data(mDATAOUT),
				.wrreq(OUT_VALID&RD_MASK[0]),
				.wrclk(CLK),
				.aclr(RD1_LOAD),
				.rdreq(RD1),
				.rdclk(RD1_CLK),
				.q(RD1_DATA),
				.wrusedw(read_side_fifo_wusedw1),
				.rdempty(),
				.rdusedw()
				);
				
Sdram_FIFO 	read_fifo2(
				.data(mDATAOUT),
				.wrreq(OUT_VALID&RD_MASK[1]),
				.wrclk(CLK),
				.aclr(RD2_LOAD),
				.rdreq(RD2),
				.rdclk(RD2_CLK),
				.q(RD2_DATA),
				.wrusedw(read_side_fifo_wusedw2),
				.rdempty(),
				.rdusedw()
				);

always @(posedge CLK)
begin
	SA      <= (ST==SC_CL+mLENGTH)	?	12'h200	:	ISA;
    BA      <= IBA;
    CS_N    <= ICS_N;
    CKE     <= 1'b1;
    RAS_N   <= (ST==SC_CL+mLENGTH)	?	1'b0	:	IRAS_N;
    CAS_N   <= (ST==SC_CL+mLENGTH)	?	1'b1	:	ICAS_N;
    WE_N    <= (ST==SC_CL+mLENGTH)	?	1'b0	:	IWE_N;
	PM_STOP	<= (ST==SC_CL+mLENGTH)	?	1'b1	:	1'b0;
	DQM		<= ( active && (ST>=SC_CL) )	?	(	((ST==SC_CL+mLENGTH) && Write)?	2'b11	:	2'b00	)	:	2'b11	;
	mDATAOUT<= DQ;
end

assign  DQ = oe ? DQOUT : 16'hzzzz;
assign	active	=	Read | Write;

always@(posedge CLK or negedge RESET_N)
begin
	if(RESET_N==0)
	begin
		CMD			<=  0;
		ST			<=  0;
		Pre_RD		<=  0;
		Pre_WR		<=  0;
		Read		<=	0;
		Write		<=	0;
		OUT_VALID	<=	0;
		IN_REQ		<=	0;
		mWR_DONE	<=	0;
		mRD_DONE	<=	0;
	end
	else
	begin
		Pre_RD	<=	mRD;
		Pre_WR	<=	mWR;
		case(ST)
		0:	begin
				if({Pre_RD,mRD}==2'b01)
				begin
					Read	<=	1;
					Write	<=	0;
					CMD		<=	2'b01;
					ST		<=	1;
				end
				else if({Pre_WR,mWR}==2'b01)
				begin
					Read	<=	0;
					Write	<=	1;
					CMD		<=	2'b10;
					ST		<=	1;
				end
			end
		1:	begin
				if(CMDACK==1) begin
					CMD<=2'b00;
					ST<=2;
				end
			end
		default:	
			begin	
				if(ST!=SC_CL+SC_RCD+mLENGTH+1) ST<=ST+1;
				else ST<=0;
			end
		endcase
	
		if(Read) begin
			if(ST==SC_CL+SC_RCD+1)
			OUT_VALID	<=	1;
			else if(ST==SC_CL+SC_RCD+mLENGTH+1)
			begin
				OUT_VALID	<=	0;
				Read		<=	0;
				mRD_DONE	<=	1;
			end
		end
		else
		mRD_DONE	<=	0;
		
		if(Write) begin
			if(ST==SC_CL-1)
			IN_REQ	<=	1;
			else if(ST==SC_CL+mLENGTH-1)
			IN_REQ	<=	0;
			else if(ST==SC_CL+SC_RCD+mLENGTH)
			begin
				Write	<=	0;
				mWR_DONE<=	1;
			end
		end
		else
		mWR_DONE<=	0;

	end
end
//	Internal Address & Length Control
always@(posedge CLK or negedge RESET_N)
begin
	if(!RESET_N)
	begin

	end
	else
	begin
		//	Write Side 1
		if(WR1_LOAD)
		begin
			rWR1_ADDR	<=	WR1_ADDR;
			rWR1_LENGTH	<=	WR1_LENGTH;
			rWR1_MAX_ADDR <= WR1_MAX_ADDR;
		end
		else if(mWR_DONE&WR_MASK[0])
		begin
			if(rWR1_ADDR<rWR1_MAX_ADDR-rWR1_LENGTH)
				rWR1_ADDR	<=	rWR1_ADDR+rWR1_LENGTH;
			else
				rWR1_ADDR	<=	WR1_ADDR;
		end
		
		//	Write Side 2
		if(WR2_LOAD)
		begin
			rWR2_ADDR	<=	WR2_ADDR;
			rWR2_LENGTH	<=	WR2_LENGTH;
			rWR2_MAX_ADDR <= WR2_MAX_ADDR;
		end
		else if(mWR_DONE&WR_MASK[1])
		begin
			if(rWR2_ADDR < rWR2_MAX_ADDR-rWR2_LENGTH)
				rWR2_ADDR	<=	rWR2_ADDR+rWR2_LENGTH;
			else
				rWR2_ADDR	<=	WR2_ADDR;
		end
		
		//	Read Side 1
		if(RD1_LOAD)
		begin
			rRD1_ADDR	<=	RD1_ADDR;
			rRD1_LENGTH	<=	RD1_LENGTH;
			rRD1_MAX_ADDR <= RD1_MAX_ADDR;
		end
		else if(mRD_DONE&RD_MASK[0])
		begin
			if(rRD1_ADDR<rRD1_MAX_ADDR-rRD1_LENGTH)
				rRD1_ADDR	<=	rRD1_ADDR+rRD1_LENGTH;
			else
				rRD1_ADDR	<=	RD1_ADDR;
		end
		//	Read Side 2
		if(RD2_LOAD)
		begin
			rRD2_ADDR	<=	RD2_ADDR;
			rRD2_LENGTH	<=	RD2_LENGTH;
			rRD2_MAX_ADDR <= RD2_MAX_ADDR;
		end
		else if(mRD_DONE&RD_MASK[1])
		begin
			if(rRD2_ADDR<rRD2_MAX_ADDR-rRD2_LENGTH)
				rRD2_ADDR	<=	rRD2_ADDR+rRD2_LENGTH;
			else
				rRD2_ADDR	<=	RD2_ADDR;
		end
	end
end
//	Auto Read/Write Control
always@(posedge CLK or negedge RESET_N)
begin
	if(!RESET_N)
	begin
		mWR		<=	0;
		mRD		<=	0;
		mADDR	<=	0;
		mLENGTH	<=	0;
	end
	else
	begin
		if( (mWR==0) && (mRD==0) && (ST==0) &&
			(WR_MASK==0)	&&	(RD_MASK==0) &&
			(WR1_LOAD==0)	&&	(RD1_LOAD==0) &&
			(RD2_LOAD==0) )
		begin
			//	Read Side 1
			if( (read_side_fifo_wusedw1 < rRD1_LENGTH) )
			begin
				mADDR	<=	rRD1_ADDR;
				mLENGTH	<=	rRD1_LENGTH;
				WR_MASK	<=	2'b00;
				RD_MASK	<=	2'b01;
				mWR		<=	0;
				mRD		<=	1;				
			end
			
			//	Read Side 2
			else if( (read_side_fifo_wusedw2 < rRD2_LENGTH) )
			begin
				mADDR	<=	rRD2_ADDR;
				mLENGTH	<=	rRD2_LENGTH;
				WR_MASK	<=	2'b00;
				RD_MASK	<=	2'b10;
				mWR		<=	0;
				mRD		<=	1;
			end

			//	Write Side 1
			else if( (write_side_fifo_rusedw1 >= rWR1_LENGTH) && (rWR1_LENGTH!=0) )
			begin
				mADDR	<=	rWR1_ADDR;
				mLENGTH	<=	rWR1_LENGTH;
				WR_MASK	<=	2'b01;
				RD_MASK	<=	2'b00;
				mWR		<=	1;
				mRD		<=	0;
			end			

			else if( (write_side_fifo_rusedw2 >= rWR2_LENGTH) && (rWR2_LENGTH!=0) )
			begin
				mADDR	<=	rWR2_ADDR;
				mLENGTH	<=	rWR2_LENGTH;
				WR_MASK	<=	2'b10;
				RD_MASK	<=	2'b00;
				mWR		<=	1;
				mRD		<=	0;
			end
		end
		if(mWR_DONE) begin
			WR_MASK	<=	0;
			mWR		<=	0;
		end
		if(mRD_DONE) begin
			RD_MASK	<=	0;
			mRD		<=	0;
		end
	end
end

endmodule
