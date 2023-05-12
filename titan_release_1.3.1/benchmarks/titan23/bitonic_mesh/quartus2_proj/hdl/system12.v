`timescale 1ns / 1ns 
module system12(clk,resetn,boot_iaddr,boot_idata,boot_daddr,boot_ddata,reg_file_b_readdataout,processor_select);
	input clk;
	input resetn;
	input [3:0] processor_select;
	output [31:0] reg_file_b_readdataout;
	input [13:0] boot_iaddr;
	input [31:0] boot_idata;
	input [13:0] boot_daddr;
	input [31:0] boot_ddata;

	reg boot_iwe0;
	reg boot_dwe0;
	reg boot_iwe1;
	reg boot_dwe1;
	reg boot_iwe2;
	reg boot_dwe2;
	reg boot_iwe3;
	reg boot_dwe3;
	reg boot_iwe4;
	reg boot_dwe4;
	reg boot_iwe5;
	reg boot_dwe5;
	reg boot_iwe6;
	reg boot_dwe6;
	reg boot_iwe7;
	reg boot_dwe7;
	reg boot_iwe8;
	reg boot_dwe8;
	reg boot_iwe9;
	reg boot_dwe9;
	reg boot_iwe10;
	reg boot_dwe10;
	reg boot_iwe11;
	reg boot_dwe11;
 
	 //Processor 0 control and data signals
	wire rdProc0South;
	wire emptyProc0South;
	wire [31:0] dataInProc0South;

	 //Processor 0 control and data signals
	wire wrProc0South;
	wire fullProc0South;
	wire [31:0] dataOutProc0South;
	
	//Processor 0 control and data signals
	wire rdProc0East;
	wire emptyProc0East;
	wire [31:0] dataInProc0East;

	 //Processor 0 control and data signals
	wire wrProc0East;
	wire fullProc0East;
	wire [31:0] dataOutProc0East;
	
	 //Processor 1 control and data signals
	wire rdProc1South;
	wire emptyProc1South;
	wire [31:0] dataInProc1South;

	 //Processor 1 control and data signals
	wire wrProc1South;
	wire fullProc1South;
	wire [31:0] dataOutProc1South;

	 //Processor 1 control and data signals
	wire rdProc1East;
	wire emptyProc1East;
	wire [31:0] dataInProc1East;
	
	//Processor 1 control and data signals
	wire wrProc1East;
	wire fullProc1East;
	wire [31:0] dataOutProc1East;

	 //Processor 1 control and data signals
	wire rdProc1West;
	wire emptyProc1West;
	wire [31:0] dataInProc1West;
	
	//Processor 1 control and data signals
	wire wrProc1West;
	wire fullProc1West;
	wire [31:0] dataOutProc1West;
	
	 //Processor 2 control and data signals
	wire rdProc2South;
	wire emptyProc2South;
	wire [31:0] dataInProc2South;

	 //Processor 2 control and data signals
	wire wrProc2South;
	wire fullProc2South;
	wire [31:0] dataOutProc2South;

	 //Processor 2 control and data signals
	wire rdProc2East;
	wire emptyProc2East;
	wire [31:0] dataInProc2East;
	
	//Processor 2 control and data signals
	wire wrProc2East;
	wire fullProc2East;
	wire [31:0] dataOutProc2East;

	 //Processor 2 control and data signals
	wire rdProc2West;
	wire emptyProc2West;
	wire [31:0] dataInProc2West;
	
	//Processor 2 control and data signals
	wire wrProc2West;
	wire fullProc2West;
	wire [31:0] dataOutProc2West;
	
	 //Processor 3 control and data signals
	wire rdProc3South;
	wire emptyProc3South;
	wire [31:0] dataInProc3South;

	 //Processor 3 control and data signals
	wire wrProc3South;
	wire fullProc3South;
	wire [31:0] dataOutProc3South;
	
	 //Processor 3 control and data signals
	wire wrProc3West;
	wire fullProc3West;
	wire [31:0] dataOutProc3West;

	 //Processor 3 control and data signals
	wire rdProc3West;
	wire emptyProc3West;
	wire [31:0] dataInProc3West;

	//Processor 4 control and data signals
	wire wrProc4North;
	wire fullProc4North;
	wire [31:0] dataOutProc4North;

	 //Processor 4 control and data signals
	wire rdProc4North;
	wire emptyProc4North;
	wire [31:0] dataInProc4North;
	
	 //Processor 4 control and data signals
	wire rdProc4South;
	wire emptyProc4South;
	wire [31:0] dataInProc4South;
	
	 //Processor 4 control and data signals
	wire wrProc4South;
	wire fullProc4South;
	wire [31:0] dataOutProc4South;
	
	 //Processor 4 control and data signals
	wire rdProc4East;
	wire emptyProc4East;
	wire [31:0] dataInProc4East;

	 //Processor 4 control and data signals
	wire wrProc4East;
	wire fullProc4East;
	wire [31:0] dataOutProc4East;

	//Processor 5 control and data signals
	wire rdProc5North;
	wire emptyProc5North;
	wire [31:0] dataInProc5North;

	 //Processor 5 control and data signals
	wire wrProc5North;
	wire fullProc5North;
	wire [31:0] dataOutProc5North;

	 //Processor 5 control and data signals
	wire rdProc5South;
	wire emptyProc5South;
	wire [31:0] dataInProc5South;
	
	 //Processor 5 control and data signals
	wire wrProc5South;
	wire fullProc5South;
	wire [31:0] dataOutProc5South;

	 //Processor 5 control and data signals
	wire rdProc5East;
	wire emptyProc5East;
	wire [31:0] dataInProc5East;
	
	 //Processor 5 control and data signals
	wire wrProc5East;
	wire fullProc5East;
	wire [31:0] dataOutProc5East;

	 //Processor 5 control and data signals
	wire rdProc5West;
	wire emptyProc5West;
	wire [31:0] dataInProc5West;

	 //Processor 5 control and data signals
	wire wrProc5West;
	wire fullProc5West;
	wire [31:0] dataOutProc5West;

	//Processor 6 control and data signals
	wire rdProc6North;
	wire emptyProc6North;
	wire [31:0] dataInProc6North;

	 //Processor 6 control and data signals
	wire wrProc6North;
	wire fullProc6North;
	wire [31:0] dataOutProc6North;

	 //Processor 6 control and data signals
	wire rdProc6South;
	wire emptyProc6South;
	wire [31:0] dataInProc6South;
	
	 //Processor 6 control and data signals
	wire wrProc6South;
	wire fullProc6South;
	wire [31:0] dataOutProc6South;

	 //Processor 6 control and data signals
	wire rdProc6East;
	wire emptyProc6East;
	wire [31:0] dataInProc6East;
	
	 //Processor 6 control and data signals
	wire wrProc6East;
	wire fullProc6East;
	wire [31:0] dataOutProc6East;

	 //Processor 6 control and data signals
	wire rdProc6West;
	wire emptyProc6West;
	wire [31:0] dataInProc6West;

	 //Processor 6 control and data signals
	wire wrProc6West;
	wire fullProc6West;
	wire [31:0] dataOutProc6West;

	//Processor 7 control and data signals
	wire wrProc7North;
	wire fullProc7North;
	wire [31:0] dataOutProc7North;

	 //Processor 7 control and data signals
	wire rdProc7South;
	wire emptyProc7South;
	wire [31:0] dataInProc7South;
		
	 //Processor 7 control and data signals
	wire wrProc7South;
	wire fullProc7South;
	wire [31:0] dataOutProc7South;

	 //Processor 7 control and data signals
	wire wrProc7West;
	wire fullProc7West;
	wire [31:0] dataOutProc7West;
	
	 //Processor 7 control and data signals
	wire rdProc7West;
	wire emptyProc7West;
	wire [31:0] dataInProc7West;

	//Processor 8 control and data signals
	wire wrProc8North;
	wire fullProc8North;
	wire [31:0] dataOutProc8North;

	 //Processor 8 control and data signals
	wire rdProc8North;
	wire emptyProc8North;
	wire [31:0] dataInProc8North;
	
	 //Processor 8 control and data signals
	wire rdProc8South;
	wire emptyProc8South;
	wire [31:0] dataInProc8South;
	
	 //Processor 8 control and data signals
	wire wrProc8South;
	wire fullProc8South;
	wire [31:0] dataOutProc8South;
	
	 //Processor 8 control and data signals
	wire rdProc8East;
	wire emptyProc8East;
	wire [31:0] dataInProc8East;

	 //Processor 8 control and data signals
	wire wrProc8East;
	wire fullProc8East;
	wire [31:0] dataOutProc8East;

	//Processor 9 control and data signals
	wire rdProc9North;
	wire emptyProc9North;
	wire [31:0] dataInProc9North;

	 //Processor 9 control and data signals
	wire wrProc9North;
	wire fullProc9North;
	wire [31:0] dataOutProc9North;

	 //Processor 9 control and data signals
	wire rdProc9South;
	wire emptyProc9South;
	wire [31:0] dataInProc9South;
	
	 //Processor 9 control and data signals
	wire wrProc9South;
	wire fullProc9South;
	wire [31:0] dataOutProc9South;

	 //Processor 9 control and data signals
	wire rdProc9East;
	wire emptyProc9East;
	wire [31:0] dataInProc9East;
	
	 //Processor 9 control and data signals
	wire wrProc9East;
	wire fullProc9East;
	wire [31:0] dataOutProc9East;

	 //Processor 9 control and data signals
	wire rdProc9West;
	wire emptyProc9West;
	wire [31:0] dataInProc9West;

	 //Processor 9 control and data signals
	wire wrProc9West;
	wire fullProc9West;
	wire [31:0] dataOutProc9West;

	//Processor 10 control and data signals
	wire rdProc10North;
	wire emptyProc10North;
	wire [31:0] dataInProc10North;

	 //Processor 10 control and data signals
	wire wrProc10North;
	wire fullProc10North;
	wire [31:0] dataOutProc10North;

	 //Processor 10 control and data signals
	wire rdProc10South;
	wire emptyProc10South;
	wire [31:0] dataInProc10South;
	
	 //Processor 10 control and data signals
	wire wrProc10South;
	wire fullProc10South;
	wire [31:0] dataOutProc10South;

	 //Processor 10 control and data signals
	wire rdProc10East;
	wire emptyProc10East;
	wire [31:0] dataInProc10East;
	
	 //Processor 10 control and data signals
	wire wrProc10East;
	wire fullProc10East;
	wire [31:0] dataOutProc10East;

	 //Processor 10 control and data signals
	wire rdProc10West;
	wire emptyProc10West;
	wire [31:0] dataInProc10West;

	 //Processor 10 control and data signals
	wire wrProc10West;
	wire fullProc10West;
	wire [31:0] dataOutProc10West;

	 //Processor11 control and data signals
	wire wrProc11North;
	wire fullProc11North;
	wire [31:0] dataOutProc11North;
	
	 //Processor 11 control and data signals
	wire rdProc11North;
	wire emptyProc11North;
	wire [31:0] dataInProc11North;

	 //Processor 11 control and data signals
	wire rdProc11East;
	wire emptyProc11East;
	wire [31:0] dataInProc11East;

	 //Processor 11 control and data signals
	wire wrProc11East;
	wire fullProc11East;
	wire [31:0] dataOutProc11East;

 
//PROCESSOR 0
system proc0(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe0),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe0),
	.rdSouth(rdProc0South),
	.emptySouth(emptyProc0South),
	.dataInSouth(dataInProc0South),
	.wrSouth(wrProc0South),
	.fullSouth(fullProc0South),
	.dataOutSouth(dataOutProc0South),
	.rdEast(rdProc0East),
	.emptyEast(emptyProc0East),
	.dataInEast(dataInProc0East),
	.wrEast(wrProc0East),
	.fullEast(fullProc0East),
	.dataOutEast(dataOutProc0East),

	.reg_file_b_readdataout(reg_file_b_readdataout));
 
//PROCESSOR 1
system proc1(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe1),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe1),	
	.rdSouth(rdProc1South),
	.emptySouth(emptyProc1South),
	.dataInSouth(dataInProc1South),
	.wrSouth(wrProc1South),
	.fullSouth(fullProc1South),
	.dataOutSouth(dataOutProc1South),
	.rdEast(rdProc1East),
	.emptyEast(emptyProc1East),
	.dataInEast(dataInProc1East),
	.wrEast(wrProc1East),
	.fullEast(fullProc1East),
	.dataOutEast(dataOutProc1East),
	.rdWest(rdProc1West),
	.emptyWest(emptyProc1West),
	.dataInWest(dataInProc1West),
	.wrWest(wrProc1West),
	.fullWest(fullProc1West),
	.dataOutWest(dataOutProc1West));
 
//PROCESSOR 2
system proc2(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe2),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe2),	
	.rdSouth(rdProc2South),
	.emptySouth(emptyProc2South),
	.dataInSouth(dataInProc2South),
	.wrSouth(wrProc2South),
	.fullSouth(fullProc2South),
	.dataOutSouth(dataOutProc2South),
	.rdEast(rdProc2East),
	.emptyEast(emptyProc2East),
	.dataInEast(dataInProc2East),
	.wrEast(wrProc2East),
	.fullEast(fullProc2East),
	.dataOutEast(dataOutProc2East),
	.rdWest(rdProc2West),
	.emptyWest(emptyProc2West),
	.dataInWest(dataInProc2West),
	.wrWest(wrProc2West),
	.fullWest(fullProc2West),
	.dataOutWest(dataOutProc2West));
 
//PROCESSOR 3
system proc3(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe3),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe3),	
	.rdSouth(rdProc3South),
	.emptySouth(emptyProc3South),
	.dataInSouth(dataInProc3South),
	.wrSouth(wrProc3South),
	.fullSouth(fullProc3South),
	.dataOutSouth(dataOutProc3South),
	.rdWest(rdProc3West),
	.emptyWest(emptyProc3West),
	.dataInWest(dataInProc3West),
	.wrWest(wrProc3West),
	.fullWest(fullProc3West),
	.dataOutWest(dataOutProc3West));
 
//PROCESSOR 4
system proc4(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe4),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe4),
	.wrNorth(wrProc4North),
	.fullNorth(fullProc4North),
	.dataOutNorth(dataOutProc4North),
	.rdNorth(rdProc4North),
	.emptyNorth(emptyProc4North),
	.dataInNorth(dataInProc4North),
	.rdSouth(rdProc4South),
	.emptySouth(emptyProc4South),
	.dataInSouth(dataInProc4South),
	.wrSouth(wrProc4South),
	.fullSouth(fullProc4South),
	.dataOutSouth(dataOutProc4South),
	.rdEast(rdProc4East),
	.emptyEast(emptyProc4East),
	.dataInEast(dataInProc4East),
	.wrEast(wrProc4East),
	.fullEast(fullProc4East),
	.dataOutEast(dataOutProc4East));
 
//PROCESSOR 5
system proc5(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe5),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe5),
	.rdNorth(rdProc5North),
	.emptyNorth(emptyProc5North),
	.dataInNorth(dataInProc5North),
	.wrNorth(wrProc5North),
	.fullNorth(fullProc5North),
	.dataOutNorth(dataOutProc5North),
	.rdSouth(rdProc5South),
	.emptySouth(emptyProc5South),
	.dataInSouth(dataInProc5South),
	.wrSouth(wrProc5South),
	.fullSouth(fullProc5South),
	.dataOutSouth(dataOutProc5South),
	.rdEast(rdProc5East),
	.emptyEast(emptyProc5East),
	.dataInEast(dataInProc5East),
	.wrEast(wrProc5East),
	.fullEast(fullProc5East),
	.dataOutEast(dataOutProc5East),
	.rdWest(rdProc5West),
	.emptyWest(emptyProc5West),
	.dataInWest(dataInProc5West),
	.wrWest(wrProc5West),
	.fullWest(fullProc5West),
	.dataOutWest(dataOutProc5West));
 
//PROCESSOR 6
system proc6(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe6),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe6),
	.rdNorth(rdProc6North),
	.emptyNorth(emptyProc6North),
	.dataInNorth(dataInProc6North),
	.wrNorth(wrProc6North),
	.fullNorth(fullProc6North),
	.dataOutNorth(dataOutProc6North),
	.rdSouth(rdProc6South),
	.emptySouth(emptyProc6South),
	.dataInSouth(dataInProc6South),
	.wrSouth(wrProc6South),
	.fullSouth(fullProc6South),
	.dataOutSouth(dataOutProc6South),
	.rdEast(rdProc6East),
	.emptyEast(emptyProc6East),
	.dataInEast(dataInProc6East),
	.wrEast(wrProc6East),
	.fullEast(fullProc6East),
	.dataOutEast(dataOutProc6East),
	.rdWest(rdProc6West),
	.emptyWest(emptyProc6West),
	.dataInWest(dataInProc6West),
	.wrWest(wrProc6West),
	.fullWest(fullProc6West),
	.dataOutWest(dataOutProc6West));
 
//PROCESSOR 7
system proc7(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe7),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe7),
	.rdNorth(rdProc7North),
	.emptyNorth(emptyProc7North),
	.dataInNorth(dataInProc7North),
	.wrNorth(wrProc7North),
	.fullNorth(fullProc7North),
	.dataOutNorth(dataOutProc7North),
	.rdSouth(rdProc7South),
	.emptySouth(emptyProc7South),
	.dataInSouth(dataInProc7South),
	.wrSouth(wrProc7South),
	.fullSouth(fullProc7South),
	.dataOutSouth(dataOutProc7South),
	.rdWest(wrProc7West),
	.emptyWest(emptyProc7West),
	.dataInWest(dataInProc7West),
	.wrWest(wrProc7West),
	.fullWest(fullProc7West),
	.dataOutWest(dataOutProc7West));
 
//PROCESSOR 8
system proc8(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe8),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe8),
	.rdNorth(rdProc8North),
	.emptyNorth(emptyProc8North),
	.dataInNorth(dataInProc8North),
	.wrNorth(wrProc8North),
	.fullNorth(fullProc8North),
	.dataOutNorth(dataOutProc8North),
	.rdEast(rdProc8East),
	.emptyEast(emptyProc8East),
	.dataInEast(dataInProc8East),
	.wrEast(wrProc8East),
	.fullEast(fullProc8East),
	.dataOutEast(dataOutProc8East));
 
//PROCESSOR 9
system proc9(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe9),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe9),
	.rdNorth(rdProc9North),
	.emptyNorth(emptyProc9North),
	.dataInNorth(dataInProc9North),
	.wrNorth(wrProc9North),
	.fullNorth(fullProc9North),
	.dataOutNorth(dataOutProc9North),
	.rdEast(rdProc9East),
	.emptyEast(emptyProc9East),
	.dataInEast(dataInProc9East),
	.wrEast(wrProc9East),
	.fullEast(fullProc9East),
	.dataOutEast(dataOutProc9East),
	.rdWest(rdProc9West),
	.emptyWest(emptyProc9West),
	.dataInWest(dataInProc9West),
	.wrWest(wrProc9West),
	.fullWest(fullProc9West),
	.dataOutWest(dataOutProc9West));
 
//PROCESSOR 10
system proc10(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe10),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe10),
	.rdNorth(rdProc10North),
	.emptyNorth(emptyProc10North),
	.dataInNorth(dataInProc10North),
	.wrNorth(wrProc10North),
	.fullNorth(fullProc10North),
	.dataOutNorth(dataOutProc10North),
	.rdEast(rdProc10East),
	.emptyEast(emptyProc10East),
	.dataInEast(dataInProc10East),
	.wrEast(wrProc10East),
	.fullEast(fullProc10East),
	.dataOutEast(dataOutProc10East),
	.rdWest(rdProc10West),
	.emptyWest(emptyProc10West),
	.dataInWest(dataInProc10West),
	.wrWest(wrProc10West),
	.fullWest(fullProc10West),
	.dataOutWest(dataOutProc10West));
 
//PROCESSOR 11
system proc11(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe11),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe11),
	.rdNorth(rdProc11North),
	.emptyNorth(emptyProc11North),
	.dataInNorth(dataInProc11North),
	.wrNorth(wrProc11North),
	.fullNorth(fullProc11North),
	.dataOutNorth(dataOutProc11North),
	.wrWest(wrProc11West),
	.fullWest(fullProc11West),
	.dataOutWest(dataOutProc11West),
	.rdWest(rdProc11West),
	.emptyWest(emptyProc11West),
	.dataInWest(dataInProc11West));
	
	//FIFO 0 TO 1 
fifo fifo_proc0_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc0West),
	.full(fullProc0West),
	.dataIn(dataOutProc0West),
	.rd(rdProc1East),
	.empty(emptyProc1East),
	.dataOut(dataInProc1East));
	
	//FIFO 1 TO 0
fifo fifo_proc1_to_proc0(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1East),
	.full(fullProc1East),
	.dataIn(dataOutProc1East),
	.rd(rdProc0West),
	.empty(emptyProc0West),
	.dataOut(dataInProc0West));
	
	//FIFO 1 TO 2 
fifo fifo_proc1_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1West),
	.full(fullProc1West),
	.dataIn(dataOutProc1West),
	.rd(rdProc2East),
	.empty(emptyProc2East),
	.dataOut(dataInProc2East));
	
	//FIFO 2 TO 1
fifo fifo_proc2_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2East),
	.full(fullProc2East),
	.dataIn(dataOutProc2East),
	.rd(rdProc1West),
	.empty(emptyProc1West),
	.dataOut(dataInProc1West));
	
	//FIFO 2 TO 3 
fifo fifo_proc2_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2West),
	.full(fullProc2West),
	.dataIn(dataOutProc2West),
	.rd(rdProc3East),
	.empty(emptyProc3East),
	.dataOut(dataInProc3East));
	
	//FIFO 3 TO 2
fifo fifo_proc3_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3East),
	.full(fullProc3East),
	.dataIn(dataOutProc3East),
	.rd(rdProc2West),
	.empty(emptyProc2West),
	.dataOut(dataInProc2West));

	//FIFO 0 TO 4 
fifo fifo_proc0_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc0North),
	.full(fullProc0North),
	.dataIn(dataOutProc0North),
	.rd(rdProc4South),
	.empty(emptyProc4South),
	.dataOut(dataInProc4South));
	
	//FIFO 4 TO 0
fifo fifo_proc4_to_proc0(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4South),
	.full(fullProc4South),
	.dataIn(dataOutProc4South),
	.rd(rdProc0North),
	.empty(emptyProc0North),
	.dataOut(dataInProc0North));

	//FIFO 4 TO 5 
fifo fifo_proc4_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4West),
	.full(fullProc4West),
	.dataIn(dataOutProc4West),
	.rd(rdProc5East),
	.empty(emptyProc5East),
	.dataOut(dataInProc5East));
	
	//FIFO 5 TO 4
fifo fifo_proc5_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5East),
	.full(fullProc5East),
	.dataIn(dataOutProc5East),
	.rd(rdProc4West),
	.empty(emptyProc4West),
	.dataOut(dataInProc4West));
	
	//FIFO 1 TO 5 
fifo fifo_proc1_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1North),
	.full(fullProc1North),
	.dataIn(dataOutProc1North),
	.rd(rdProc5South),
	.empty(emptyProc5South),
	.dataOut(dataInProc5South));
	
	//FIFO 5 TO 1
fifo fifo_proc5_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5South),
	.full(fullProc5South),
	.dataIn(dataOutProc5South),
	.rd(rdProc1North),
	.empty(emptyProc1North),
	.dataOut(dataInProc1North));

	//FIFO 5 TO 6 
fifo fifo_proc5_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5West),
	.full(fullProc5West),
	.dataIn(dataOutProc5West),
	.rd(rdProc6East),
	.empty(emptyProc6East),
	.dataOut(dataInProc6East));
	
	//FIFO 6 TO 5
fifo fifo_proc6_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6East),
	.full(fullProc6East),
	.dataIn(dataOutProc6East),
	.rd(rdProc5West),
	.empty(emptyProc5West),
	.dataOut(dataInProc5West));
	
	//FIFO 2 TO 6 
fifo fifo_proc2_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2North),
	.full(fullProc2North),
	.dataIn(dataOutProc2North),
	.rd(rdProc6South),
	.empty(emptyProc6South),
	.dataOut(dataInProc6South));
	
	//FIFO 6 TO 2
fifo fifo_proc6_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6South),
	.full(fullProc6South),
	.dataIn(dataOutProc6South),
	.rd(rdProc2North),
	.empty(emptyProc2North),
	.dataOut(dataInProc2North));

	//FIFO 6 TO 7 
fifo fifo_proc6_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6West),
	.full(fullProc6West),
	.dataIn(dataOutProc6West),
	.rd(rdProc7East),
	.empty(emptyProc7East),
	.dataOut(dataInProc7East));
	
	//FIFO 7 TO 6
fifo fifo_proc7_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7East),
	.full(fullProc7East),
	.dataIn(dataOutProc7East),
	.rd(rdProc6West),
	.empty(emptyProc6West),
	.dataOut(dataInProc6West));
	
	//FIFO 3 TO 7 
fifo fifo_proc3_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3North),
	.full(fullProc3North),
	.dataIn(dataOutProc3North),
	.rd(rdProc7South),
	.empty(emptyProc7South),
	.dataOut(dataInProc7South));
	
	//FIFO 7 TO 3
fifo fifo_proc7_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7South),
	.full(fullProc7South),
	.dataIn(dataOutProc7South),
	.rd(rdProc3North),
	.empty(emptyProc3North),
	.dataOut(dataInProc3North));

	//FIFO 4 TO 8 
fifo fifo_proc4_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4North),
	.full(fullProc4North),
	.dataIn(dataOutProc4North),
	.rd(rdProc8South),
	.empty(emptyProc8South),
	.dataOut(dataInProc8South));
	
	//FIFO 8 TO 4
fifo fifo_proc8_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc8South),
	.full(fullProc8South),
	.dataIn(dataOutProc8South),
	.rd(rdProc4North),
	.empty(emptyProc4North),
	.dataOut(dataInProc4North));

	//FIFO 8 TO 9 
fifo fifo_proc8_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc8West),
	.full(fullProc8West),
	.dataIn(dataOutProc8West),
	.rd(rdProc9East),
	.empty(emptyProc9East),
	.dataOut(dataInProc9East));
	
	//FIFO 9 TO 8
fifo fifo_proc9_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9East),
	.full(fullProc9East),
	.dataIn(dataOutProc9East),
	.rd(rdProc8West),
	.empty(emptyProc8West),
	.dataOut(dataInProc8West));
	
	//FIFO 5 TO 9 
fifo fifo_proc5_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5North),
	.full(fullProc5North),
	.dataIn(dataOutProc5North),
	.rd(rdProc9South),
	.empty(emptyProc9South),
	.dataOut(dataInProc9South));
	
	//FIFO 9 TO 5
fifo fifo_proc9_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9South),
	.full(fullProc9South),
	.dataIn(dataOutProc9South),
	.rd(rdProc5North),
	.empty(emptyProc5North),
	.dataOut(dataInProc5North));

	//FIFO 9 TO 10 
fifo fifo_proc9_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9West),
	.full(fullProc9West),
	.dataIn(dataOutProc9West),
	.rd(rdProc10East),
	.empty(emptyProc10East),
	.dataOut(dataInProc10East));
	
	//FIFO 10 TO 9
fifo fifo_proc10_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10East),
	.full(fullProc10East),
	.dataIn(dataOutProc10East),
	.rd(rdProc9West),
	.empty(emptyProc9West),
	.dataOut(dataInProc9West));
	
	//FIFO 6 TO 10 
fifo fifo_proc6_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6North),
	.full(fullProc6North),
	.dataIn(dataOutProc6North),
	.rd(rdProc10South),
	.empty(emptyProc10South),
	.dataOut(dataInProc10South));
	
	//FIFO 10 TO 6
fifo fifo_proc10_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10South),
	.full(fullProc10South),
	.dataIn(dataOutProc10South),
	.rd(rdProc6North),
	.empty(emptyProc6North),
	.dataOut(dataInProc6North));

	//FIFO 10 TO 11 
fifo fifo_proc10_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10West),
	.full(fullProc10West),
	.dataIn(dataOutProc10West),
	.rd(rdProc11East),
	.empty(emptyProc11East),
	.dataOut(dataInProc11East));
	
	//FIFO 11 TO 10
fifo fifo_proc11_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc11East),
	.full(fullProc11East),
	.dataIn(dataOutProc11East),
	.rd(rdProc10West),
	.empty(emptyProc10West),
	.dataOut(dataInProc10West));
	
	//FIFO 7 TO 11 
fifo fifo_proc7_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7North),
	.full(fullProc7North),
	.dataIn(dataOutProc7North),
	.rd(rdProc11South),
	.empty(emptyProc11South),
	.dataOut(dataInProc11South));
	
	//FIFO 11 TO 7
fifo fifo_proc11_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc11South),
	.full(fullProc11South),
	.dataIn(dataOutProc11South),
	.rd(rdProc7North),
	.empty(emptyProc7North),
	.dataOut(dataInProc7North));

	/**************** Boot loader ********************/
	/*******Boot up each processor one by one*********/
	always@(posedge clk)
	begin
	case(processor_select)
		0: begin
			boot_iwe0 = ~resetn;
			boot_dwe0 = ~resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		1: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = ~resetn;
			boot_dwe1 = ~resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		2: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = ~resetn;
			boot_dwe2 = ~resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		3: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = ~resetn;
			boot_dwe3 = ~resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		4: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = ~resetn;
			boot_dwe4 = ~resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		5: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = ~resetn;
			boot_dwe5 = ~resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		6: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = ~resetn;
			boot_dwe6 = ~resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		7: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = ~resetn;
			boot_dwe7 = ~resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		8: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = ~resetn;
			boot_dwe8 = ~resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		9: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = ~resetn;
			boot_dwe9 = ~resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		10: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = ~resetn;
			boot_dwe10 = ~resetn;
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
		end
		11: begin
			boot_iwe0 = resetn;
			boot_dwe0 = resetn;
			boot_iwe1 = resetn;
			boot_dwe1 = resetn;
			boot_iwe2 = resetn;
			boot_dwe2 = resetn;
			boot_iwe3 = resetn;
			boot_dwe3 = resetn;
			boot_iwe4 = resetn;
			boot_dwe4 = resetn;
			boot_iwe5 = resetn;
			boot_dwe5 = resetn;
			boot_iwe6 = resetn;
			boot_dwe6 = resetn;
			boot_iwe7 = resetn;
			boot_dwe7 = resetn;
			boot_iwe8 = resetn;
			boot_dwe8 = resetn;
			boot_iwe9 = resetn;
			boot_dwe9 = resetn;
			boot_iwe10 = resetn;
			boot_dwe10 = resetn;
			boot_iwe11 = ~resetn;
			boot_dwe11 = ~resetn;
		end
		12: begin
			boot_iwe0 = 0;
			boot_dwe0 = 0;
			boot_iwe1 = 0;
			boot_dwe1 = 0;
			boot_iwe2 = 0;
			boot_dwe2 = 0;
			boot_iwe3 = 0;
			boot_dwe3 = 0;
			boot_iwe4 = 0;
			boot_dwe4 = 0;
			boot_iwe5 = 0;
			boot_dwe5 = 0;
			boot_iwe6 = 0;
			boot_dwe6 = 0;
			boot_iwe7 = 0;
			boot_dwe7 = 0;
			boot_iwe8 = 0;
			boot_dwe8 = 0;
			boot_iwe9 = 0;
			boot_dwe9 = 0;
			boot_iwe10 = 0;
			boot_dwe10 = 0;
			boot_iwe11 = 0;
			boot_dwe11 = 0;
		end		
	endcase
end
endmodule