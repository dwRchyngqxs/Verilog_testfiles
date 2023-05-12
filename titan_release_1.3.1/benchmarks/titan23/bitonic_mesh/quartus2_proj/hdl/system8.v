`timescale 1ns / 1ns 
module system8(clk,resetn,boot_iaddr,boot_idata,boot_daddr,boot_ddata,reg_file_b_readdataout,processor_select);
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
	wire wrProc2West;
	wire fullProc2West;
	wire [31:0] dataOutProc2West;

	 //Processor 2 control and data signals
	wire rdProc2West;
	wire emptyProc2West;
	wire [31:0] dataInProc2West;
	
	 //Processor 3 control and data signals
	wire wrProc3North;
	wire fullProc3North;
	wire [31:0] dataOutProc3North;

	 //Processor 3 control and data signals
	wire rdProc3North;
	wire emptyProc3North;
	wire [31:0] dataInProc3North;
	
	 //Processor 3 control and data signals
	wire rdProc3South;
	wire emptyProc3South;
	wire [31:0] dataInProc3South;
	
	 //Processor 3 control and data signals
	wire wrProc3South;
	wire fullProc3South;
	wire [31:0] dataOutProc3South;
	
	 //Processor 3 control and data signals
	wire rdProc3East;
	wire emptyProc3East;
	wire [31:0] dataInProc3East;

	 //Processor 3 control and data signals
	wire wrProc3East;
	wire fullProc3East;
	wire [31:0] dataOutProc3East;

	 //Processor 4 control and data signals
	wire rdProc4North;
	wire emptyProc4North;
	wire [31:0] dataInProc4North;

	 //Processor 4 control and data signals
	wire wrProc4North;
	wire fullProc4North;
	wire [31:0] dataOutProc4North;

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

	 //Processor 4 control and data signals
	wire rdProc4West;
	wire emptyProc4West;
	wire [31:0] dataInProc4West;

	 //Processor 4 control and data signals
	wire wrProc4West;
	wire fullProc4West;
	wire [31:0] dataOutProc4West;
	
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
	wire wrProc5West;
	wire fullProc5West;
	wire [31:0] dataOutProc5West;
	
	 //Processor 5 control and data signals
	wire rdProc5West;
	wire emptyProc5West;
	wire [31:0] dataInProc5West;

	 //Processor 6 control and data signals
	wire wrProc6North;
	wire fullProc6North;
	wire [31:0] dataOutProc6North;
	
	 //Processor 6 control and data signals
	wire rdProc6North;
	wire emptyProc6North;
	wire [31:0] dataInProc6North;

	 //Processor 6 control and data signals
	wire rdProc6East;
	wire emptyProc6East;
	wire [31:0] dataInProc6East;

	 //Processor 6 control and data signals
	wire wrProc6East;
	wire fullProc6East;
	wire [31:0] dataOutProc6East;

	 //Processor 7 control and data signals
	wire wrProc7North;
	wire fullProc7North;
	wire [31:0] dataOutProc7North;
		
	 //Processor 7 control and data signals
	wire rdProc7North;
	wire emptyProc7North;
	wire [31:0] dataInProc7North;

	 //Processor 7 control and data signals
	wire rdProc7East;
	wire emptyProc7East;
	wire [31:0] dataInProc7East;
	
	 //Processor 7 control and data signals
	wire wrProc7East;
	wire fullProc7East;
	wire [31:0] dataOutProc7East;

	 //Processor 7 control and data signals
	wire rdProc7West;
	wire emptyProc7West;
	wire [31:0] dataInProc7West;

	 //Processor 7 control and data signals
	wire wrProc7West;
	wire fullProc7West;
	wire [31:0] dataOutProc7West;
			
	 //Processor 8 control and data signals
	wire rdProc8North;
	wire emptyProc8North;
	wire [31:0] dataInProc8North;

	 //Processor 8 control and data signals
	wire wrProc8North;
	wire fullProc8North;
	wire [31:0] dataOutProc8North;

	 //Processor 8 control and data signals
	wire wrProc8West;
	wire fullProc8West;
	wire [31:0] dataOutProc8West;
	
	 //Processor 8 control and data signals
	wire rdProc8West;
	wire emptyProc8West;
	wire [31:0] dataInProc8West;



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
	.rdWest(rdProc2West),
	.emptyWest(emptyProc2West),
	.dataInWest(dataInProc2West),
	.wrWest(wrProc2West),
	.fullWest(fullProc2West),
	.dataOutWest(dataOutProc2West));


//PROCESSOR 4
system proc4(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe4),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe4),
	.rdNorth(rdProc4North),
	.emptyNorth(emptyProc4North),
	.dataInNorth(dataInProc4North),
	.wrNorth(wrProc4North),
	.fullNorth(fullProc4North),
	.dataOutNorth(dataOutProc4North),
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
	.dataOutEast(dataOutProc4East),
	.rdWest(rdProc4West),
	.emptyWest(emptyProc4West),
	.dataInWest(dataInProc4West),
	.wrWest(wrProc4West),
	.fullWest(fullProc4West),
	.dataOutWest(dataOutProc4West));

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
	.emptyEast(emptyProc5East),
	.dataInEast(dataInProc5East),
	.wrEast(wrProc5East),
	.wrWest(wrProc5West),
	.fullWest(fullProc5West),
	.dataOutWest(dataOutProc5West));
	
//PROCESSOR 3
system proc3(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe3),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe3),
	.wrNorth(wrProc3North),
	.fullNorth(fullProc3North),
	.dataOutNorth(dataOutProc3North),
	.rdNorth(rdProc3North),
	.emptyNorth(emptyProc3North),
	.dataInNorth(dataInProc3North),
	.rdSouth(rdProc3South),
	.emptySouth(emptyProc3South),
	.dataInSouth(dataInProc3South),
	.wrSouth(wrProc3South),
	.fullSouth(fullProc3South),
	.dataOutSouth(dataOutProc3South),
	.rdEast(rdProc3East),
	.emptyEast(emptyProc3East),
	.dataInEast(dataInProc3East),
	.wrEast(wrProc3East),
	.fullEast(fullProc3East),
	.dataOutEast(dataOutProc3East));

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
	.rdEast(rdProc6East),
	.emptyEast(emptyProc6East),
	.dataInEast(dataInProc6East),
	.wrEast(wrProc6East),
	.fullEast(fullProc6East),
	.dataOutEast(dataOutProc6East));

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
	.rdEast(rdProc7East),
	.emptyEast(emptyProc7East),
	.dataInEast(dataInProc7East),
	.wrEast(wrProc7East),
	.fullEast(fullProc7East),
	.dataOutEast(dataOutProc7East),
	.rdWest(rdProc7West),
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
	.wrWest(wrProc8West),
	.fullWest(fullProc8West),
	.dataOutWest(dataOutProc8West),
	.rdWest(rdProc8West),
	.emptyWest(emptyProc8West),
	.dataInWest(dataInProc8West));

//FIFO 3 TO 0
fifo fifo_proc3_to_proc0(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3North),
	.full(fullProc3North),
	.dataIn(dataOutProc3North),
	.rd(rdProc0South),
	.empty(emptyProc0South),
	.dataOut(dataInProc0South));
	
	//FIFO 0 TO 3
fifo fifo_proc0_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc0South),
	.full(fullProc0South),
	.dataIn(dataOutProc0South),
	.rd(rdProc3North),
	.empty(emptyProc3North),
	.dataOut(dataInProc3North));

//FIFO 0 TO 1
fifo fifo_proc0_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc0East),
	.full(fullProc0East),
	.dataIn(dataOutProc0East),
	.rd(rdProc1West),
	.empty(emptyProc1West),
	.dataOut(dataInProc1West));
	
	//FIFO 0 TO 1
fifo fifo_proc1_to_proc0(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1West),
	.full(fullProc1West),
	.dataIn(dataOutProc1West),
	.rd(rdProc0East),
	.empty(emptyProc0East),
	.dataOut(dataInProc0East));

//FIFO 4 TO 1
fifo fifo_proc4_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4North),
	.full(fullProc4North),
	.dataIn(dataOutProc4North),
	.rd(rdProc1South),
	.empty(emptyProc1South),
	.dataOut(dataInProc1South));
	
	//FIFO 1 TO 4
fifo fifo_proc1_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1South),
	.full(fullProc1South),
	.dataIn(dataOutProc1South),
	.rd(rdProc4North),
	.empty(emptyProc4North),
	.dataOut(dataInProc4North));

//FIFO 1 TO 2
fifo fifo_proc1_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1East),
	.full(fullProc1East),
	.dataIn(dataOutProc1East),
	.rd(rdProc2West),
	.empty(emptyProc2West),
	.dataOut(dataInProc2West));
	
	//FIFO 2 TO 1
fifo fifo_proc2_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2West),
	.full(fullProc2West),
	.dataIn(dataOutProc2West),
	.rd(rdProc1East),
	.empty(emptyProc1East),
	.dataOut(dataInProc1East));

//FIFO 3 TO 4
fifo fifo_proc3_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3East),
	.full(fullProc3East),
	.dataIn(dataOutProc3East),
	.rd(rdProc4West),
	.empty(emptyProc4West),
	.dataOut(dataInProc4West));
	
	//FIFO 4 TO 3
fifo fifo_proc4_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4West),
	.full(fullProc4West),
	.dataIn(dataOutProc4West),
	.rd(rdProc3East),
	.empty(emptyProc3East),
	.dataOut(dataInProc3East));

//FIFO 5 TO 4
fifo fifo_proc5_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5West),
	.full(fullProc5West),
	.dataIn(dataOutProc5West),
	.rd(rdProc4East),
	.empty(emptyProc4East),
	.dataOut(dataInProc4East));

//FIFO 4 TO 5
fifo fifo_proc4_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4East),
	.full(fullProc4East),
	.dataIn(dataOutProc4East),
	.rd(rdProc5West),
	.empty(emptyProc5West),
	.dataOut(dataInProc5West));
	
	//FIFO 5 TO 2
fifo fifo_proc5_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5North),
	.full(fullProc5North),
	.dataIn(dataOutProc5North),
	.rd(rdProc2South),
	.empty(emptyProc2South),
	.dataOut(dataInProc2South));

//FIFO 2 TO 5
fifo fifo_proc2_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2South),
	.full(fullProc2South),
	.dataIn(dataOutProc2South),
	.rd(rdProc5North),
	.empty(emptyProc5North),
	.dataOut(dataInProc5North));
	
//FIFO 6 TO 3
fifo fifo_proc6_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6North),
	.full(fullProc6North),
	.dataIn(dataOutProc6North),
	.rd(rdProc3South),
	.empty(emptyProc3South),
	.dataOut(dataInProc3South));

	//FIFO 3 TO 6
fifo fifo_proc3_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3South),
	.full(fullProc3South),
	.dataIn(dataOutProc3South),
	.rd(rdProc6North),
	.empty(emptyProc6North),
	.dataOut(dataInProc6North));

//FIFO 7 TO 4
fifo fifo_proc7_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7North),
	.full(fullProc7North),
	.dataIn(dataOutProc7North),
	.rd(rdProc4South),
	.empty(emptyProc4South),
	.dataOut(dataInProc4South));

//FIFO 4 TO 7
fifo fifo_proc4_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4South),
	.full(fullProc4South),
	.dataIn(dataOutProc4South),
	.rd(rdProc7North),
	.empty(emptyProc7North),
	.dataOut(dataInProc7North));

//FIFO 8 TO 5
fifo fifo_proc8_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc8North),
	.full(fullProc8North),
	.dataIn(dataOutProc8North),
	.rd(rdProc5South),
	.empty(emptyProc5South),
	.dataOut(dataInProc5South));
	
	//FIFO 5 TO 8
fifo fifo_proc5_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5South),
	.full(fullProc5South),
	.dataIn(dataOutProc5South),
	.rd(rdProc8North),
	.empty(emptyProc8North),
	.dataOut(dataInProc8North));

//FIFO 7 TO 6
fifo fifo_proc7_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7West),
	.full(fullProc7West),
	.dataIn(dataOutProc7West),
	.rd(rdProc6East),
	.empty(emptyProc6East),
	.dataOut(dataInProc6East));

//FIFO 6 TO 7
fifo fifo_proc6_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6East),
	.full(fullProc6East),
	.dataIn(dataOutProc6East),
	.rd(rdProc7West),
	.empty(emptyProc7West),
	.dataOut(dataInProc7West));

//FIFO 8 TO 7
fifo fifo_proc8_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc8West),
	.full(fullProc8West),
	.dataIn(dataOutProc8West),
	.rd(rdProc7East),
	.empty(emptyProc7East),
	.dataOut(dataInProc7East));
	
//FIFO 7 TO 8
fifo fifo_proc7_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7East),
	.full(fullProc7East),
	.dataIn(dataOutProc7East),
	.rd(rdProc8West),
	.empty(emptyProc8West),
	.dataOut(dataInProc8West));

	/**************** Boot loader ********************/
	/*******Boot up each processor one by one*********/
	always@(posedge clk)
	begin
	case(processor_select)
		0: begin

			boot_iwe0 = ~resetn;
			boot_dwe0 = ~resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		1: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 = ~resetn;
			boot_dwe1 = ~resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		2: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 = ~resetn;
			boot_dwe2 = ~resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		3: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 = ~resetn;
			boot_dwe3 = ~resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		4: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 = ~resetn;
			boot_dwe4 = ~resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		5: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 = ~resetn;
			boot_dwe5 = ~resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		6: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 = ~resetn;
			boot_dwe6 = ~resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		7: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 = ~resetn;
			boot_dwe7 = ~resetn;
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
		end

		8: begin

			boot_iwe0 =  resetn;
			boot_dwe0 =  resetn;
			boot_iwe1 =  resetn;
			boot_dwe1 =  resetn;
			boot_iwe2 =  resetn;
			boot_dwe2 =  resetn;
			boot_iwe3 =  resetn;
			boot_dwe3 =  resetn;
			boot_iwe4 =  resetn;
			boot_dwe4 =  resetn;
			boot_iwe5 =  resetn;
			boot_dwe5 =  resetn;
			boot_iwe6 =  resetn;
			boot_dwe6 =  resetn;
			boot_iwe7 =  resetn;
			boot_dwe7 =  resetn;
			boot_iwe8 = ~resetn;
			boot_dwe8 = ~resetn;
		end

		9: begin

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
		end

	endcase
end
endmodule