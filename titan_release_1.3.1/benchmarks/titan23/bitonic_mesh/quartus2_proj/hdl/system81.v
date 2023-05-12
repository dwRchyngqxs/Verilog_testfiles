`timescale 1ns / 1ns 
module system81(clk,resetn,boot_iaddr,boot_idata,boot_daddr,boot_ddata,reg_file_b_readdataout,processor_select);
	input clk;
	input resetn;
	input [8:0] processor_select;
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
	reg boot_iwe12;
	reg boot_dwe12;
	reg boot_iwe13;
	reg boot_dwe13;
	reg boot_iwe14;
	reg boot_dwe14;
	reg boot_iwe15;
	reg boot_dwe15;
	reg boot_iwe16;
	reg boot_dwe16;
	reg boot_iwe17;
	reg boot_dwe17;
	reg boot_iwe18;
	reg boot_dwe18;
	reg boot_iwe19;
	reg boot_dwe19;
	reg boot_iwe20;
	reg boot_dwe20;
	reg boot_iwe21;
	reg boot_dwe21;
	reg boot_iwe22;
	reg boot_dwe22;
	reg boot_iwe23;
	reg boot_dwe23;
	reg boot_iwe24;
	reg boot_dwe24;
	reg boot_iwe25;
	reg boot_dwe25;
	reg boot_iwe26;
	reg boot_dwe26;
	reg boot_iwe27;
	reg boot_dwe27;
	reg boot_iwe28;
	reg boot_dwe28;
	reg boot_iwe29;
	reg boot_dwe29;
	reg boot_iwe30;
	reg boot_dwe30;
	reg boot_iwe31;
	reg boot_dwe31;
	reg boot_iwe32;
	reg boot_dwe32;
	reg boot_iwe33;
	reg boot_dwe33;
	reg boot_iwe34;
	reg boot_dwe34;
	reg boot_iwe35;
	reg boot_dwe35;
	reg boot_iwe36;
	reg boot_dwe36;
	reg boot_iwe37;
	reg boot_dwe37;
	reg boot_iwe38;
	reg boot_dwe38;
	reg boot_iwe39;
	reg boot_dwe39;
	reg boot_iwe40;
	reg boot_dwe40;
	reg boot_iwe41;
	reg boot_dwe41;
	reg boot_iwe42;
	reg boot_dwe42;
	reg boot_iwe43;
	reg boot_dwe43;
	reg boot_iwe44;
	reg boot_dwe44;
	reg boot_iwe45;
	reg boot_dwe45;
	reg boot_iwe46;
	reg boot_dwe46;
	reg boot_iwe47;
	reg boot_dwe47;
	reg boot_iwe48;
	reg boot_dwe48;
	reg boot_iwe49;
	reg boot_dwe49;
	reg boot_iwe50;
	reg boot_dwe50;
	reg boot_iwe51;
	reg boot_dwe51;
	reg boot_iwe52;
	reg boot_dwe52;
	reg boot_iwe53;
	reg boot_dwe53;
	reg boot_iwe54;
	reg boot_dwe54;
	reg boot_iwe55;
	reg boot_dwe55;
	reg boot_iwe56;
	reg boot_dwe56;
	reg boot_iwe57;
	reg boot_dwe57;
	reg boot_iwe58;
	reg boot_dwe58;
	reg boot_iwe59;
	reg boot_dwe59;
	reg boot_iwe60;
	reg boot_dwe60;
	reg boot_iwe61;
	reg boot_dwe61;
	reg boot_iwe62;
	reg boot_dwe62;
	reg boot_iwe63;
	reg boot_dwe63;
	reg boot_iwe64;
	reg boot_dwe64;
	reg boot_iwe65;
	reg boot_dwe65;
	reg boot_iwe66;
	reg boot_dwe66;
	reg boot_iwe67;
	reg boot_dwe67;
	reg boot_iwe68;
	reg boot_dwe68;
	reg boot_iwe69;
	reg boot_dwe69;
	reg boot_iwe70;
	reg boot_dwe70;
	reg boot_iwe71;
	reg boot_dwe71;
	reg boot_iwe72;
	reg boot_dwe72;
	reg boot_iwe73;
	reg boot_dwe73;
	reg boot_iwe74;
	reg boot_dwe74;
	reg boot_iwe75;
	reg boot_dwe75;
	reg boot_iwe76;
	reg boot_dwe76;
	reg boot_iwe77;
	reg boot_dwe77;
	reg boot_iwe78;
	reg boot_dwe78;
	reg boot_iwe79;
	reg boot_dwe79;
	reg boot_iwe80;
	reg boot_dwe80;
 
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
	wire rdProc3East;
	wire emptyProc3East;
	wire [31:0] dataInProc3East;
	
	//Processor 3 control and data signals
	wire wrProc3East;
	wire fullProc3East;
	wire [31:0] dataOutProc3East;

	 //Processor 3 control and data signals
	wire rdProc3West;
	wire emptyProc3West;
	wire [31:0] dataInProc3West;
	
	//Processor 3 control and data signals
	wire wrProc3West;
	wire fullProc3West;
	wire [31:0] dataOutProc3West;
	
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
	wire rdProc7South;
	wire emptyProc7South;
	wire [31:0] dataInProc7South;

	 //Processor 7 control and data signals
	wire wrProc7South;
	wire fullProc7South;
	wire [31:0] dataOutProc7South;

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
	wire rdProc8South;
	wire emptyProc8South;
	wire [31:0] dataInProc8South;

	 //Processor 8 control and data signals
	wire wrProc8South;
	wire fullProc8South;
	wire [31:0] dataOutProc8South;
	
	 //Processor 8 control and data signals
	wire wrProc8West;
	wire fullProc8West;
	wire [31:0] dataOutProc8West;

	 //Processor 8 control and data signals
	wire rdProc8West;
	wire emptyProc8West;
	wire [31:0] dataInProc8West;

	//Processor 9 control and data signals
	wire wrProc9North;
	wire fullProc9North;
	wire [31:0] dataOutProc9North;

	 //Processor 9 control and data signals
	wire rdProc9North;
	wire emptyProc9North;
	wire [31:0] dataInProc9North;
	
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

	//Processor 11 control and data signals
	wire rdProc11North;
	wire emptyProc11North;
	wire [31:0] dataInProc11North;

	 //Processor 11 control and data signals
	wire wrProc11North;
	wire fullProc11North;
	wire [31:0] dataOutProc11North;

	 //Processor 11 control and data signals
	wire rdProc11South;
	wire emptyProc11South;
	wire [31:0] dataInProc11South;
	
	 //Processor 11 control and data signals
	wire wrProc11South;
	wire fullProc11South;
	wire [31:0] dataOutProc11South;

	 //Processor 11 control and data signals
	wire rdProc11East;
	wire emptyProc11East;
	wire [31:0] dataInProc11East;
	
	 //Processor 11 control and data signals
	wire wrProc11East;
	wire fullProc11East;
	wire [31:0] dataOutProc11East;

	 //Processor 11 control and data signals
	wire rdProc11West;
	wire emptyProc11West;
	wire [31:0] dataInProc11West;

	 //Processor 11 control and data signals
	wire wrProc11West;
	wire fullProc11West;
	wire [31:0] dataOutProc11West;

	//Processor 12 control and data signals
	wire rdProc12North;
	wire emptyProc12North;
	wire [31:0] dataInProc12North;

	 //Processor 12 control and data signals
	wire wrProc12North;
	wire fullProc12North;
	wire [31:0] dataOutProc12North;

	 //Processor 12 control and data signals
	wire rdProc12South;
	wire emptyProc12South;
	wire [31:0] dataInProc12South;
	
	 //Processor 12 control and data signals
	wire wrProc12South;
	wire fullProc12South;
	wire [31:0] dataOutProc12South;

	 //Processor 12 control and data signals
	wire rdProc12East;
	wire emptyProc12East;
	wire [31:0] dataInProc12East;
	
	 //Processor 12 control and data signals
	wire wrProc12East;
	wire fullProc12East;
	wire [31:0] dataOutProc12East;

	 //Processor 12 control and data signals
	wire rdProc12West;
	wire emptyProc12West;
	wire [31:0] dataInProc12West;

	 //Processor 12 control and data signals
	wire wrProc12West;
	wire fullProc12West;
	wire [31:0] dataOutProc12West;

	//Processor 13 control and data signals
	wire rdProc13North;
	wire emptyProc13North;
	wire [31:0] dataInProc13North;

	 //Processor 13 control and data signals
	wire wrProc13North;
	wire fullProc13North;
	wire [31:0] dataOutProc13North;

	 //Processor 13 control and data signals
	wire rdProc13South;
	wire emptyProc13South;
	wire [31:0] dataInProc13South;
	
	 //Processor 13 control and data signals
	wire wrProc13South;
	wire fullProc13South;
	wire [31:0] dataOutProc13South;

	 //Processor 13 control and data signals
	wire rdProc13East;
	wire emptyProc13East;
	wire [31:0] dataInProc13East;
	
	 //Processor 13 control and data signals
	wire wrProc13East;
	wire fullProc13East;
	wire [31:0] dataOutProc13East;

	 //Processor 13 control and data signals
	wire rdProc13West;
	wire emptyProc13West;
	wire [31:0] dataInProc13West;

	 //Processor 13 control and data signals
	wire wrProc13West;
	wire fullProc13West;
	wire [31:0] dataOutProc13West;

	//Processor 14 control and data signals
	wire rdProc14North;
	wire emptyProc14North;
	wire [31:0] dataInProc14North;

	 //Processor 14 control and data signals
	wire wrProc14North;
	wire fullProc14North;
	wire [31:0] dataOutProc14North;

	 //Processor 14 control and data signals
	wire rdProc14South;
	wire emptyProc14South;
	wire [31:0] dataInProc14South;
	
	 //Processor 14 control and data signals
	wire wrProc14South;
	wire fullProc14South;
	wire [31:0] dataOutProc14South;

	 //Processor 14 control and data signals
	wire rdProc14East;
	wire emptyProc14East;
	wire [31:0] dataInProc14East;
	
	 //Processor 14 control and data signals
	wire wrProc14East;
	wire fullProc14East;
	wire [31:0] dataOutProc14East;

	 //Processor 14 control and data signals
	wire rdProc14West;
	wire emptyProc14West;
	wire [31:0] dataInProc14West;

	 //Processor 14 control and data signals
	wire wrProc14West;
	wire fullProc14West;
	wire [31:0] dataOutProc14West;

	//Processor 15 control and data signals
	wire rdProc15North;
	wire emptyProc15North;
	wire [31:0] dataInProc15North;

	 //Processor 15 control and data signals
	wire wrProc15North;
	wire fullProc15North;
	wire [31:0] dataOutProc15North;

	 //Processor 15 control and data signals
	wire rdProc15South;
	wire emptyProc15South;
	wire [31:0] dataInProc15South;
	
	 //Processor 15 control and data signals
	wire wrProc15South;
	wire fullProc15South;
	wire [31:0] dataOutProc15South;

	 //Processor 15 control and data signals
	wire rdProc15East;
	wire emptyProc15East;
	wire [31:0] dataInProc15East;
	
	 //Processor 15 control and data signals
	wire wrProc15East;
	wire fullProc15East;
	wire [31:0] dataOutProc15East;

	 //Processor 15 control and data signals
	wire rdProc15West;
	wire emptyProc15West;
	wire [31:0] dataInProc15West;

	 //Processor 15 control and data signals
	wire wrProc15West;
	wire fullProc15West;
	wire [31:0] dataOutProc15West;

	//Processor 16 control and data signals
	wire rdProc16North;
	wire emptyProc16North;
	wire [31:0] dataInProc16North;

	 //Processor 16 control and data signals
	wire wrProc16North;
	wire fullProc16North;
	wire [31:0] dataOutProc16North;

	 //Processor 16 control and data signals
	wire rdProc16South;
	wire emptyProc16South;
	wire [31:0] dataInProc16South;
	
	 //Processor 16 control and data signals
	wire wrProc16South;
	wire fullProc16South;
	wire [31:0] dataOutProc16South;

	 //Processor 16 control and data signals
	wire rdProc16East;
	wire emptyProc16East;
	wire [31:0] dataInProc16East;
	
	 //Processor 16 control and data signals
	wire wrProc16East;
	wire fullProc16East;
	wire [31:0] dataOutProc16East;

	 //Processor 16 control and data signals
	wire rdProc16West;
	wire emptyProc16West;
	wire [31:0] dataInProc16West;

	 //Processor 16 control and data signals
	wire wrProc16West;
	wire fullProc16West;
	wire [31:0] dataOutProc16West;

	//Processor 17 control and data signals
	wire wrProc17North;
	wire fullProc17North;
	wire [31:0] dataOutProc17North;

	//Processor 17 control and data signals
        wire rdProc17North;
        wire emptyProc17North;
        wire [31:0] dataInProc17North;

	//Processor 17 control and data signals
	wire rdProc17South;
	wire emptyProc17South;
	wire [31:0] dataInProc17South;
		
	 //Processor 17 control and data signals
	wire wrProc17South;
	wire fullProc17South;
	wire [31:0] dataOutProc17South;

	 //Processor 17 control and data signals
	wire wrProc17West;
	wire fullProc17West;
	wire [31:0] dataOutProc17West;
	
	 //Processor 17 control and data signals
	wire rdProc17West;
	wire emptyProc17West;
	wire [31:0] dataInProc17West;

	//Processor 18 control and data signals
	wire wrProc18North;
	wire fullProc18North;
	wire [31:0] dataOutProc18North;

	 //Processor 18 control and data signals
	wire rdProc18North;
	wire emptyProc18North;
	wire [31:0] dataInProc18North;
	
	 //Processor 18 control and data signals
	wire rdProc18South;
	wire emptyProc18South;
	wire [31:0] dataInProc18South;
	
	 //Processor 18 control and data signals
	wire wrProc18South;
	wire fullProc18South;
	wire [31:0] dataOutProc18South;
	
	 //Processor 18 control and data signals
	wire rdProc18East;
	wire emptyProc18East;
	wire [31:0] dataInProc18East;

	 //Processor 18 control and data signals
	wire wrProc18East;
	wire fullProc18East;
	wire [31:0] dataOutProc18East;

	//Processor 19 control and data signals
	wire rdProc19North;
	wire emptyProc19North;
	wire [31:0] dataInProc19North;

	 //Processor 19 control and data signals
	wire wrProc19North;
	wire fullProc19North;
	wire [31:0] dataOutProc19North;

	 //Processor 19 control and data signals
	wire rdProc19South;
	wire emptyProc19South;
	wire [31:0] dataInProc19South;
	
	 //Processor 19 control and data signals
	wire wrProc19South;
	wire fullProc19South;
	wire [31:0] dataOutProc19South;

	 //Processor 19 control and data signals
	wire rdProc19East;
	wire emptyProc19East;
	wire [31:0] dataInProc19East;
	
	 //Processor 19 control and data signals
	wire wrProc19East;
	wire fullProc19East;
	wire [31:0] dataOutProc19East;

	 //Processor 19 control and data signals
	wire rdProc19West;
	wire emptyProc19West;
	wire [31:0] dataInProc19West;

	 //Processor 19 control and data signals
	wire wrProc19West;
	wire fullProc19West;
	wire [31:0] dataOutProc19West;

	//Processor 20 control and data signals
	wire rdProc20North;
	wire emptyProc20North;
	wire [31:0] dataInProc20North;

	 //Processor 20 control and data signals
	wire wrProc20North;
	wire fullProc20North;
	wire [31:0] dataOutProc20North;

	 //Processor 20 control and data signals
	wire rdProc20South;
	wire emptyProc20South;
	wire [31:0] dataInProc20South;
	
	 //Processor 20 control and data signals
	wire wrProc20South;
	wire fullProc20South;
	wire [31:0] dataOutProc20South;

	 //Processor 20 control and data signals
	wire rdProc20East;
	wire emptyProc20East;
	wire [31:0] dataInProc20East;
	
	 //Processor 20 control and data signals
	wire wrProc20East;
	wire fullProc20East;
	wire [31:0] dataOutProc20East;

	 //Processor 20 control and data signals
	wire rdProc20West;
	wire emptyProc20West;
	wire [31:0] dataInProc20West;

	 //Processor 20 control and data signals
	wire wrProc20West;
	wire fullProc20West;
	wire [31:0] dataOutProc20West;

	//Processor 21 control and data signals
	wire rdProc21North;
	wire emptyProc21North;
	wire [31:0] dataInProc21North;

	 //Processor 21 control and data signals
	wire wrProc21North;
	wire fullProc21North;
	wire [31:0] dataOutProc21North;

	 //Processor 21 control and data signals
	wire rdProc21South;
	wire emptyProc21South;
	wire [31:0] dataInProc21South;
	
	 //Processor 21 control and data signals
	wire wrProc21South;
	wire fullProc21South;
	wire [31:0] dataOutProc21South;

	 //Processor 21 control and data signals
	wire rdProc21East;
	wire emptyProc21East;
	wire [31:0] dataInProc21East;
	
	 //Processor 21 control and data signals
	wire wrProc21East;
	wire fullProc21East;
	wire [31:0] dataOutProc21East;

	 //Processor 21 control and data signals
	wire rdProc21West;
	wire emptyProc21West;
	wire [31:0] dataInProc21West;

	 //Processor 21 control and data signals
	wire wrProc21West;
	wire fullProc21West;
	wire [31:0] dataOutProc21West;

	//Processor 22 control and data signals
	wire rdProc22North;
	wire emptyProc22North;
	wire [31:0] dataInProc22North;

	 //Processor 22 control and data signals
	wire wrProc22North;
	wire fullProc22North;
	wire [31:0] dataOutProc22North;

	 //Processor 22 control and data signals
	wire rdProc22South;
	wire emptyProc22South;
	wire [31:0] dataInProc22South;
	
	 //Processor 22 control and data signals
	wire wrProc22South;
	wire fullProc22South;
	wire [31:0] dataOutProc22South;

	 //Processor 22 control and data signals
	wire rdProc22East;
	wire emptyProc22East;
	wire [31:0] dataInProc22East;
	
	 //Processor 22 control and data signals
	wire wrProc22East;
	wire fullProc22East;
	wire [31:0] dataOutProc22East;

	 //Processor 22 control and data signals
	wire rdProc22West;
	wire emptyProc22West;
	wire [31:0] dataInProc22West;

	 //Processor 22 control and data signals
	wire wrProc22West;
	wire fullProc22West;
	wire [31:0] dataOutProc22West;

	//Processor 23 control and data signals
	wire rdProc23North;
	wire emptyProc23North;
	wire [31:0] dataInProc23North;

	 //Processor 23 control and data signals
	wire wrProc23North;
	wire fullProc23North;
	wire [31:0] dataOutProc23North;

	 //Processor 23 control and data signals
	wire rdProc23South;
	wire emptyProc23South;
	wire [31:0] dataInProc23South;
	
	 //Processor 23 control and data signals
	wire wrProc23South;
	wire fullProc23South;
	wire [31:0] dataOutProc23South;

	 //Processor 23 control and data signals
	wire rdProc23East;
	wire emptyProc23East;
	wire [31:0] dataInProc23East;
	
	 //Processor 23 control and data signals
	wire wrProc23East;
	wire fullProc23East;
	wire [31:0] dataOutProc23East;

	 //Processor 23 control and data signals
	wire rdProc23West;
	wire emptyProc23West;
	wire [31:0] dataInProc23West;

	 //Processor 23 control and data signals
	wire wrProc23West;
	wire fullProc23West;
	wire [31:0] dataOutProc23West;

	//Processor 24 control and data signals
	wire rdProc24North;
	wire emptyProc24North;
	wire [31:0] dataInProc24North;

	 //Processor 24 control and data signals
	wire wrProc24North;
	wire fullProc24North;
	wire [31:0] dataOutProc24North;

	 //Processor 24 control and data signals
	wire rdProc24South;
	wire emptyProc24South;
	wire [31:0] dataInProc24South;
	
	 //Processor 24 control and data signals
	wire wrProc24South;
	wire fullProc24South;
	wire [31:0] dataOutProc24South;

	 //Processor 24 control and data signals
	wire rdProc24East;
	wire emptyProc24East;
	wire [31:0] dataInProc24East;
	
	 //Processor 24 control and data signals
	wire wrProc24East;
	wire fullProc24East;
	wire [31:0] dataOutProc24East;

	 //Processor 24 control and data signals
	wire rdProc24West;
	wire emptyProc24West;
	wire [31:0] dataInProc24West;

	 //Processor 24 control and data signals
	wire wrProc24West;
	wire fullProc24West;
	wire [31:0] dataOutProc24West;

	//Processor 25 control and data signals
	wire rdProc25North;
	wire emptyProc25North;
	wire [31:0] dataInProc25North;

	 //Processor 25 control and data signals
	wire wrProc25North;
	wire fullProc25North;
	wire [31:0] dataOutProc25North;

	 //Processor 25 control and data signals
	wire rdProc25South;
	wire emptyProc25South;
	wire [31:0] dataInProc25South;
	
	 //Processor 25 control and data signals
	wire wrProc25South;
	wire fullProc25South;
	wire [31:0] dataOutProc25South;

	 //Processor 25 control and data signals
	wire rdProc25East;
	wire emptyProc25East;
	wire [31:0] dataInProc25East;
	
	 //Processor 25 control and data signals
	wire wrProc25East;
	wire fullProc25East;
	wire [31:0] dataOutProc25East;

	 //Processor 25 control and data signals
	wire rdProc25West;
	wire emptyProc25West;
	wire [31:0] dataInProc25West;

	 //Processor 25 control and data signals
	wire wrProc25West;
	wire fullProc25West;
	wire [31:0] dataOutProc25West;

	//Processor 26 control and data signals
	wire wrProc26North;
	wire fullProc26North;
	wire [31:0] dataOutProc26North;

	//Processor 26 control and data signals
        wire rdProc26North;
        wire emptyProc26North;
        wire [31:0] dataInProc26North;

	//Processor 26 control and data signals
	wire rdProc26South;
	wire emptyProc26South;
	wire [31:0] dataInProc26South;
		
	 //Processor 26 control and data signals
	wire wrProc26South;
	wire fullProc26South;
	wire [31:0] dataOutProc26South;

	 //Processor 26 control and data signals
	wire wrProc26West;
	wire fullProc26West;
	wire [31:0] dataOutProc26West;
	
	 //Processor 26 control and data signals
	wire rdProc26West;
	wire emptyProc26West;
	wire [31:0] dataInProc26West;

	//Processor 27 control and data signals
	wire wrProc27North;
	wire fullProc27North;
	wire [31:0] dataOutProc27North;

	 //Processor 27 control and data signals
	wire rdProc27North;
	wire emptyProc27North;
	wire [31:0] dataInProc27North;
	
	 //Processor 27 control and data signals
	wire rdProc27South;
	wire emptyProc27South;
	wire [31:0] dataInProc27South;
	
	 //Processor 27 control and data signals
	wire wrProc27South;
	wire fullProc27South;
	wire [31:0] dataOutProc27South;
	
	 //Processor 27 control and data signals
	wire rdProc27East;
	wire emptyProc27East;
	wire [31:0] dataInProc27East;

	 //Processor 27 control and data signals
	wire wrProc27East;
	wire fullProc27East;
	wire [31:0] dataOutProc27East;

	//Processor 28 control and data signals
	wire rdProc28North;
	wire emptyProc28North;
	wire [31:0] dataInProc28North;

	 //Processor 28 control and data signals
	wire wrProc28North;
	wire fullProc28North;
	wire [31:0] dataOutProc28North;

	 //Processor 28 control and data signals
	wire rdProc28South;
	wire emptyProc28South;
	wire [31:0] dataInProc28South;
	
	 //Processor 28 control and data signals
	wire wrProc28South;
	wire fullProc28South;
	wire [31:0] dataOutProc28South;

	 //Processor 28 control and data signals
	wire rdProc28East;
	wire emptyProc28East;
	wire [31:0] dataInProc28East;
	
	 //Processor 28 control and data signals
	wire wrProc28East;
	wire fullProc28East;
	wire [31:0] dataOutProc28East;

	 //Processor 28 control and data signals
	wire rdProc28West;
	wire emptyProc28West;
	wire [31:0] dataInProc28West;

	 //Processor 28 control and data signals
	wire wrProc28West;
	wire fullProc28West;
	wire [31:0] dataOutProc28West;

	//Processor 29 control and data signals
	wire rdProc29North;
	wire emptyProc29North;
	wire [31:0] dataInProc29North;

	 //Processor 29 control and data signals
	wire wrProc29North;
	wire fullProc29North;
	wire [31:0] dataOutProc29North;

	 //Processor 29 control and data signals
	wire rdProc29South;
	wire emptyProc29South;
	wire [31:0] dataInProc29South;
	
	 //Processor 29 control and data signals
	wire wrProc29South;
	wire fullProc29South;
	wire [31:0] dataOutProc29South;

	 //Processor 29 control and data signals
	wire rdProc29East;
	wire emptyProc29East;
	wire [31:0] dataInProc29East;
	
	 //Processor 29 control and data signals
	wire wrProc29East;
	wire fullProc29East;
	wire [31:0] dataOutProc29East;

	 //Processor 29 control and data signals
	wire rdProc29West;
	wire emptyProc29West;
	wire [31:0] dataInProc29West;

	 //Processor 29 control and data signals
	wire wrProc29West;
	wire fullProc29West;
	wire [31:0] dataOutProc29West;

	//Processor 30 control and data signals
	wire rdProc30North;
	wire emptyProc30North;
	wire [31:0] dataInProc30North;

	 //Processor 30 control and data signals
	wire wrProc30North;
	wire fullProc30North;
	wire [31:0] dataOutProc30North;

	 //Processor 30 control and data signals
	wire rdProc30South;
	wire emptyProc30South;
	wire [31:0] dataInProc30South;
	
	 //Processor 30 control and data signals
	wire wrProc30South;
	wire fullProc30South;
	wire [31:0] dataOutProc30South;

	 //Processor 30 control and data signals
	wire rdProc30East;
	wire emptyProc30East;
	wire [31:0] dataInProc30East;
	
	 //Processor 30 control and data signals
	wire wrProc30East;
	wire fullProc30East;
	wire [31:0] dataOutProc30East;

	 //Processor 30 control and data signals
	wire rdProc30West;
	wire emptyProc30West;
	wire [31:0] dataInProc30West;

	 //Processor 30 control and data signals
	wire wrProc30West;
	wire fullProc30West;
	wire [31:0] dataOutProc30West;

	//Processor 31 control and data signals
	wire rdProc31North;
	wire emptyProc31North;
	wire [31:0] dataInProc31North;

	 //Processor 31 control and data signals
	wire wrProc31North;
	wire fullProc31North;
	wire [31:0] dataOutProc31North;

	 //Processor 31 control and data signals
	wire rdProc31South;
	wire emptyProc31South;
	wire [31:0] dataInProc31South;
	
	 //Processor 31 control and data signals
	wire wrProc31South;
	wire fullProc31South;
	wire [31:0] dataOutProc31South;

	 //Processor 31 control and data signals
	wire rdProc31East;
	wire emptyProc31East;
	wire [31:0] dataInProc31East;
	
	 //Processor 31 control and data signals
	wire wrProc31East;
	wire fullProc31East;
	wire [31:0] dataOutProc31East;

	 //Processor 31 control and data signals
	wire rdProc31West;
	wire emptyProc31West;
	wire [31:0] dataInProc31West;

	 //Processor 31 control and data signals
	wire wrProc31West;
	wire fullProc31West;
	wire [31:0] dataOutProc31West;

	//Processor 32 control and data signals
	wire rdProc32North;
	wire emptyProc32North;
	wire [31:0] dataInProc32North;

	 //Processor 32 control and data signals
	wire wrProc32North;
	wire fullProc32North;
	wire [31:0] dataOutProc32North;

	 //Processor 32 control and data signals
	wire rdProc32South;
	wire emptyProc32South;
	wire [31:0] dataInProc32South;
	
	 //Processor 32 control and data signals
	wire wrProc32South;
	wire fullProc32South;
	wire [31:0] dataOutProc32South;

	 //Processor 32 control and data signals
	wire rdProc32East;
	wire emptyProc32East;
	wire [31:0] dataInProc32East;
	
	 //Processor 32 control and data signals
	wire wrProc32East;
	wire fullProc32East;
	wire [31:0] dataOutProc32East;

	 //Processor 32 control and data signals
	wire rdProc32West;
	wire emptyProc32West;
	wire [31:0] dataInProc32West;

	 //Processor 32 control and data signals
	wire wrProc32West;
	wire fullProc32West;
	wire [31:0] dataOutProc32West;

	//Processor 33 control and data signals
	wire rdProc33North;
	wire emptyProc33North;
	wire [31:0] dataInProc33North;

	 //Processor 33 control and data signals
	wire wrProc33North;
	wire fullProc33North;
	wire [31:0] dataOutProc33North;

	 //Processor 33 control and data signals
	wire rdProc33South;
	wire emptyProc33South;
	wire [31:0] dataInProc33South;
	
	 //Processor 33 control and data signals
	wire wrProc33South;
	wire fullProc33South;
	wire [31:0] dataOutProc33South;

	 //Processor 33 control and data signals
	wire rdProc33East;
	wire emptyProc33East;
	wire [31:0] dataInProc33East;
	
	 //Processor 33 control and data signals
	wire wrProc33East;
	wire fullProc33East;
	wire [31:0] dataOutProc33East;

	 //Processor 33 control and data signals
	wire rdProc33West;
	wire emptyProc33West;
	wire [31:0] dataInProc33West;

	 //Processor 33 control and data signals
	wire wrProc33West;
	wire fullProc33West;
	wire [31:0] dataOutProc33West;

	//Processor 34 control and data signals
	wire rdProc34North;
	wire emptyProc34North;
	wire [31:0] dataInProc34North;

	 //Processor 34 control and data signals
	wire wrProc34North;
	wire fullProc34North;
	wire [31:0] dataOutProc34North;

	 //Processor 34 control and data signals
	wire rdProc34South;
	wire emptyProc34South;
	wire [31:0] dataInProc34South;
	
	 //Processor 34 control and data signals
	wire wrProc34South;
	wire fullProc34South;
	wire [31:0] dataOutProc34South;

	 //Processor 34 control and data signals
	wire rdProc34East;
	wire emptyProc34East;
	wire [31:0] dataInProc34East;
	
	 //Processor 34 control and data signals
	wire wrProc34East;
	wire fullProc34East;
	wire [31:0] dataOutProc34East;

	 //Processor 34 control and data signals
	wire rdProc34West;
	wire emptyProc34West;
	wire [31:0] dataInProc34West;

	 //Processor 34 control and data signals
	wire wrProc34West;
	wire fullProc34West;
	wire [31:0] dataOutProc34West;

	//Processor 35 control and data signals
	wire wrProc35North;
	wire fullProc35North;
	wire [31:0] dataOutProc35North;

	//Processor 35 control and data signals
        wire rdProc35North;
        wire emptyProc35North;
        wire [31:0] dataInProc35North;

	//Processor 35 control and data signals
	wire rdProc35South;
	wire emptyProc35South;
	wire [31:0] dataInProc35South;
		
	 //Processor 35 control and data signals
	wire wrProc35South;
	wire fullProc35South;
	wire [31:0] dataOutProc35South;

	 //Processor 35 control and data signals
	wire wrProc35West;
	wire fullProc35West;
	wire [31:0] dataOutProc35West;
	
	 //Processor 35 control and data signals
	wire rdProc35West;
	wire emptyProc35West;
	wire [31:0] dataInProc35West;

	//Processor 36 control and data signals
	wire wrProc36North;
	wire fullProc36North;
	wire [31:0] dataOutProc36North;

	 //Processor 36 control and data signals
	wire rdProc36North;
	wire emptyProc36North;
	wire [31:0] dataInProc36North;
	
	 //Processor 36 control and data signals
	wire rdProc36South;
	wire emptyProc36South;
	wire [31:0] dataInProc36South;
	
	 //Processor 36 control and data signals
	wire wrProc36South;
	wire fullProc36South;
	wire [31:0] dataOutProc36South;
	
	 //Processor 36 control and data signals
	wire rdProc36East;
	wire emptyProc36East;
	wire [31:0] dataInProc36East;

	 //Processor 36 control and data signals
	wire wrProc36East;
	wire fullProc36East;
	wire [31:0] dataOutProc36East;

	//Processor 37 control and data signals
	wire rdProc37North;
	wire emptyProc37North;
	wire [31:0] dataInProc37North;

	 //Processor 37 control and data signals
	wire wrProc37North;
	wire fullProc37North;
	wire [31:0] dataOutProc37North;

	 //Processor 37 control and data signals
	wire rdProc37South;
	wire emptyProc37South;
	wire [31:0] dataInProc37South;
	
	 //Processor 37 control and data signals
	wire wrProc37South;
	wire fullProc37South;
	wire [31:0] dataOutProc37South;

	 //Processor 37 control and data signals
	wire rdProc37East;
	wire emptyProc37East;
	wire [31:0] dataInProc37East;
	
	 //Processor 37 control and data signals
	wire wrProc37East;
	wire fullProc37East;
	wire [31:0] dataOutProc37East;

	 //Processor 37 control and data signals
	wire rdProc37West;
	wire emptyProc37West;
	wire [31:0] dataInProc37West;

	 //Processor 37 control and data signals
	wire wrProc37West;
	wire fullProc37West;
	wire [31:0] dataOutProc37West;

	//Processor 38 control and data signals
	wire rdProc38North;
	wire emptyProc38North;
	wire [31:0] dataInProc38North;

	 //Processor 38 control and data signals
	wire wrProc38North;
	wire fullProc38North;
	wire [31:0] dataOutProc38North;

	 //Processor 38 control and data signals
	wire rdProc38South;
	wire emptyProc38South;
	wire [31:0] dataInProc38South;
	
	 //Processor 38 control and data signals
	wire wrProc38South;
	wire fullProc38South;
	wire [31:0] dataOutProc38South;

	 //Processor 38 control and data signals
	wire rdProc38East;
	wire emptyProc38East;
	wire [31:0] dataInProc38East;
	
	 //Processor 38 control and data signals
	wire wrProc38East;
	wire fullProc38East;
	wire [31:0] dataOutProc38East;

	 //Processor 38 control and data signals
	wire rdProc38West;
	wire emptyProc38West;
	wire [31:0] dataInProc38West;

	 //Processor 38 control and data signals
	wire wrProc38West;
	wire fullProc38West;
	wire [31:0] dataOutProc38West;

	//Processor 39 control and data signals
	wire rdProc39North;
	wire emptyProc39North;
	wire [31:0] dataInProc39North;

	 //Processor 39 control and data signals
	wire wrProc39North;
	wire fullProc39North;
	wire [31:0] dataOutProc39North;

	 //Processor 39 control and data signals
	wire rdProc39South;
	wire emptyProc39South;
	wire [31:0] dataInProc39South;
	
	 //Processor 39 control and data signals
	wire wrProc39South;
	wire fullProc39South;
	wire [31:0] dataOutProc39South;

	 //Processor 39 control and data signals
	wire rdProc39East;
	wire emptyProc39East;
	wire [31:0] dataInProc39East;
	
	 //Processor 39 control and data signals
	wire wrProc39East;
	wire fullProc39East;
	wire [31:0] dataOutProc39East;

	 //Processor 39 control and data signals
	wire rdProc39West;
	wire emptyProc39West;
	wire [31:0] dataInProc39West;

	 //Processor 39 control and data signals
	wire wrProc39West;
	wire fullProc39West;
	wire [31:0] dataOutProc39West;

	//Processor 40 control and data signals
	wire rdProc40North;
	wire emptyProc40North;
	wire [31:0] dataInProc40North;

	 //Processor 40 control and data signals
	wire wrProc40North;
	wire fullProc40North;
	wire [31:0] dataOutProc40North;

	 //Processor 40 control and data signals
	wire rdProc40South;
	wire emptyProc40South;
	wire [31:0] dataInProc40South;
	
	 //Processor 40 control and data signals
	wire wrProc40South;
	wire fullProc40South;
	wire [31:0] dataOutProc40South;

	 //Processor 40 control and data signals
	wire rdProc40East;
	wire emptyProc40East;
	wire [31:0] dataInProc40East;
	
	 //Processor 40 control and data signals
	wire wrProc40East;
	wire fullProc40East;
	wire [31:0] dataOutProc40East;

	 //Processor 40 control and data signals
	wire rdProc40West;
	wire emptyProc40West;
	wire [31:0] dataInProc40West;

	 //Processor 40 control and data signals
	wire wrProc40West;
	wire fullProc40West;
	wire [31:0] dataOutProc40West;

	//Processor 41 control and data signals
	wire rdProc41North;
	wire emptyProc41North;
	wire [31:0] dataInProc41North;

	 //Processor 41 control and data signals
	wire wrProc41North;
	wire fullProc41North;
	wire [31:0] dataOutProc41North;

	 //Processor 41 control and data signals
	wire rdProc41South;
	wire emptyProc41South;
	wire [31:0] dataInProc41South;
	
	 //Processor 41 control and data signals
	wire wrProc41South;
	wire fullProc41South;
	wire [31:0] dataOutProc41South;

	 //Processor 41 control and data signals
	wire rdProc41East;
	wire emptyProc41East;
	wire [31:0] dataInProc41East;
	
	 //Processor 41 control and data signals
	wire wrProc41East;
	wire fullProc41East;
	wire [31:0] dataOutProc41East;

	 //Processor 41 control and data signals
	wire rdProc41West;
	wire emptyProc41West;
	wire [31:0] dataInProc41West;

	 //Processor 41 control and data signals
	wire wrProc41West;
	wire fullProc41West;
	wire [31:0] dataOutProc41West;

	//Processor 42 control and data signals
	wire rdProc42North;
	wire emptyProc42North;
	wire [31:0] dataInProc42North;

	 //Processor 42 control and data signals
	wire wrProc42North;
	wire fullProc42North;
	wire [31:0] dataOutProc42North;

	 //Processor 42 control and data signals
	wire rdProc42South;
	wire emptyProc42South;
	wire [31:0] dataInProc42South;
	
	 //Processor 42 control and data signals
	wire wrProc42South;
	wire fullProc42South;
	wire [31:0] dataOutProc42South;

	 //Processor 42 control and data signals
	wire rdProc42East;
	wire emptyProc42East;
	wire [31:0] dataInProc42East;
	
	 //Processor 42 control and data signals
	wire wrProc42East;
	wire fullProc42East;
	wire [31:0] dataOutProc42East;

	 //Processor 42 control and data signals
	wire rdProc42West;
	wire emptyProc42West;
	wire [31:0] dataInProc42West;

	 //Processor 42 control and data signals
	wire wrProc42West;
	wire fullProc42West;
	wire [31:0] dataOutProc42West;

	//Processor 43 control and data signals
	wire rdProc43North;
	wire emptyProc43North;
	wire [31:0] dataInProc43North;

	 //Processor 43 control and data signals
	wire wrProc43North;
	wire fullProc43North;
	wire [31:0] dataOutProc43North;

	 //Processor 43 control and data signals
	wire rdProc43South;
	wire emptyProc43South;
	wire [31:0] dataInProc43South;
	
	 //Processor 43 control and data signals
	wire wrProc43South;
	wire fullProc43South;
	wire [31:0] dataOutProc43South;

	 //Processor 43 control and data signals
	wire rdProc43East;
	wire emptyProc43East;
	wire [31:0] dataInProc43East;
	
	 //Processor 43 control and data signals
	wire wrProc43East;
	wire fullProc43East;
	wire [31:0] dataOutProc43East;

	 //Processor 43 control and data signals
	wire rdProc43West;
	wire emptyProc43West;
	wire [31:0] dataInProc43West;

	 //Processor 43 control and data signals
	wire wrProc43West;
	wire fullProc43West;
	wire [31:0] dataOutProc43West;

	//Processor 44 control and data signals
	wire wrProc44North;
	wire fullProc44North;
	wire [31:0] dataOutProc44North;

	//Processor 44 control and data signals
        wire rdProc44North;
        wire emptyProc44North;
        wire [31:0] dataInProc44North;

	//Processor 44 control and data signals
	wire rdProc44South;
	wire emptyProc44South;
	wire [31:0] dataInProc44South;
		
	 //Processor 44 control and data signals
	wire wrProc44South;
	wire fullProc44South;
	wire [31:0] dataOutProc44South;

	 //Processor 44 control and data signals
	wire wrProc44West;
	wire fullProc44West;
	wire [31:0] dataOutProc44West;
	
	 //Processor 44 control and data signals
	wire rdProc44West;
	wire emptyProc44West;
	wire [31:0] dataInProc44West;

	//Processor 45 control and data signals
	wire wrProc45North;
	wire fullProc45North;
	wire [31:0] dataOutProc45North;

	 //Processor 45 control and data signals
	wire rdProc45North;
	wire emptyProc45North;
	wire [31:0] dataInProc45North;
	
	 //Processor 45 control and data signals
	wire rdProc45South;
	wire emptyProc45South;
	wire [31:0] dataInProc45South;
	
	 //Processor 45 control and data signals
	wire wrProc45South;
	wire fullProc45South;
	wire [31:0] dataOutProc45South;
	
	 //Processor 45 control and data signals
	wire rdProc45East;
	wire emptyProc45East;
	wire [31:0] dataInProc45East;

	 //Processor 45 control and data signals
	wire wrProc45East;
	wire fullProc45East;
	wire [31:0] dataOutProc45East;

	//Processor 46 control and data signals
	wire rdProc46North;
	wire emptyProc46North;
	wire [31:0] dataInProc46North;

	 //Processor 46 control and data signals
	wire wrProc46North;
	wire fullProc46North;
	wire [31:0] dataOutProc46North;

	 //Processor 46 control and data signals
	wire rdProc46South;
	wire emptyProc46South;
	wire [31:0] dataInProc46South;
	
	 //Processor 46 control and data signals
	wire wrProc46South;
	wire fullProc46South;
	wire [31:0] dataOutProc46South;

	 //Processor 46 control and data signals
	wire rdProc46East;
	wire emptyProc46East;
	wire [31:0] dataInProc46East;
	
	 //Processor 46 control and data signals
	wire wrProc46East;
	wire fullProc46East;
	wire [31:0] dataOutProc46East;

	 //Processor 46 control and data signals
	wire rdProc46West;
	wire emptyProc46West;
	wire [31:0] dataInProc46West;

	 //Processor 46 control and data signals
	wire wrProc46West;
	wire fullProc46West;
	wire [31:0] dataOutProc46West;

	//Processor 47 control and data signals
	wire rdProc47North;
	wire emptyProc47North;
	wire [31:0] dataInProc47North;

	 //Processor 47 control and data signals
	wire wrProc47North;
	wire fullProc47North;
	wire [31:0] dataOutProc47North;

	 //Processor 47 control and data signals
	wire rdProc47South;
	wire emptyProc47South;
	wire [31:0] dataInProc47South;
	
	 //Processor 47 control and data signals
	wire wrProc47South;
	wire fullProc47South;
	wire [31:0] dataOutProc47South;

	 //Processor 47 control and data signals
	wire rdProc47East;
	wire emptyProc47East;
	wire [31:0] dataInProc47East;
	
	 //Processor 47 control and data signals
	wire wrProc47East;
	wire fullProc47East;
	wire [31:0] dataOutProc47East;

	 //Processor 47 control and data signals
	wire rdProc47West;
	wire emptyProc47West;
	wire [31:0] dataInProc47West;

	 //Processor 47 control and data signals
	wire wrProc47West;
	wire fullProc47West;
	wire [31:0] dataOutProc47West;

	//Processor 48 control and data signals
	wire rdProc48North;
	wire emptyProc48North;
	wire [31:0] dataInProc48North;

	 //Processor 48 control and data signals
	wire wrProc48North;
	wire fullProc48North;
	wire [31:0] dataOutProc48North;

	 //Processor 48 control and data signals
	wire rdProc48South;
	wire emptyProc48South;
	wire [31:0] dataInProc48South;
	
	 //Processor 48 control and data signals
	wire wrProc48South;
	wire fullProc48South;
	wire [31:0] dataOutProc48South;

	 //Processor 48 control and data signals
	wire rdProc48East;
	wire emptyProc48East;
	wire [31:0] dataInProc48East;
	
	 //Processor 48 control and data signals
	wire wrProc48East;
	wire fullProc48East;
	wire [31:0] dataOutProc48East;

	 //Processor 48 control and data signals
	wire rdProc48West;
	wire emptyProc48West;
	wire [31:0] dataInProc48West;

	 //Processor 48 control and data signals
	wire wrProc48West;
	wire fullProc48West;
	wire [31:0] dataOutProc48West;

	//Processor 49 control and data signals
	wire rdProc49North;
	wire emptyProc49North;
	wire [31:0] dataInProc49North;

	 //Processor 49 control and data signals
	wire wrProc49North;
	wire fullProc49North;
	wire [31:0] dataOutProc49North;

	 //Processor 49 control and data signals
	wire rdProc49South;
	wire emptyProc49South;
	wire [31:0] dataInProc49South;
	
	 //Processor 49 control and data signals
	wire wrProc49South;
	wire fullProc49South;
	wire [31:0] dataOutProc49South;

	 //Processor 49 control and data signals
	wire rdProc49East;
	wire emptyProc49East;
	wire [31:0] dataInProc49East;
	
	 //Processor 49 control and data signals
	wire wrProc49East;
	wire fullProc49East;
	wire [31:0] dataOutProc49East;

	 //Processor 49 control and data signals
	wire rdProc49West;
	wire emptyProc49West;
	wire [31:0] dataInProc49West;

	 //Processor 49 control and data signals
	wire wrProc49West;
	wire fullProc49West;
	wire [31:0] dataOutProc49West;

	//Processor 50 control and data signals
	wire rdProc50North;
	wire emptyProc50North;
	wire [31:0] dataInProc50North;

	 //Processor 50 control and data signals
	wire wrProc50North;
	wire fullProc50North;
	wire [31:0] dataOutProc50North;

	 //Processor 50 control and data signals
	wire rdProc50South;
	wire emptyProc50South;
	wire [31:0] dataInProc50South;
	
	 //Processor 50 control and data signals
	wire wrProc50South;
	wire fullProc50South;
	wire [31:0] dataOutProc50South;

	 //Processor 50 control and data signals
	wire rdProc50East;
	wire emptyProc50East;
	wire [31:0] dataInProc50East;
	
	 //Processor 50 control and data signals
	wire wrProc50East;
	wire fullProc50East;
	wire [31:0] dataOutProc50East;

	 //Processor 50 control and data signals
	wire rdProc50West;
	wire emptyProc50West;
	wire [31:0] dataInProc50West;

	 //Processor 50 control and data signals
	wire wrProc50West;
	wire fullProc50West;
	wire [31:0] dataOutProc50West;

	//Processor 51 control and data signals
	wire rdProc51North;
	wire emptyProc51North;
	wire [31:0] dataInProc51North;

	 //Processor 51 control and data signals
	wire wrProc51North;
	wire fullProc51North;
	wire [31:0] dataOutProc51North;

	 //Processor 51 control and data signals
	wire rdProc51South;
	wire emptyProc51South;
	wire [31:0] dataInProc51South;
	
	 //Processor 51 control and data signals
	wire wrProc51South;
	wire fullProc51South;
	wire [31:0] dataOutProc51South;

	 //Processor 51 control and data signals
	wire rdProc51East;
	wire emptyProc51East;
	wire [31:0] dataInProc51East;
	
	 //Processor 51 control and data signals
	wire wrProc51East;
	wire fullProc51East;
	wire [31:0] dataOutProc51East;

	 //Processor 51 control and data signals
	wire rdProc51West;
	wire emptyProc51West;
	wire [31:0] dataInProc51West;

	 //Processor 51 control and data signals
	wire wrProc51West;
	wire fullProc51West;
	wire [31:0] dataOutProc51West;

	//Processor 52 control and data signals
	wire rdProc52North;
	wire emptyProc52North;
	wire [31:0] dataInProc52North;

	 //Processor 52 control and data signals
	wire wrProc52North;
	wire fullProc52North;
	wire [31:0] dataOutProc52North;

	 //Processor 52 control and data signals
	wire rdProc52South;
	wire emptyProc52South;
	wire [31:0] dataInProc52South;
	
	 //Processor 52 control and data signals
	wire wrProc52South;
	wire fullProc52South;
	wire [31:0] dataOutProc52South;

	 //Processor 52 control and data signals
	wire rdProc52East;
	wire emptyProc52East;
	wire [31:0] dataInProc52East;
	
	 //Processor 52 control and data signals
	wire wrProc52East;
	wire fullProc52East;
	wire [31:0] dataOutProc52East;

	 //Processor 52 control and data signals
	wire rdProc52West;
	wire emptyProc52West;
	wire [31:0] dataInProc52West;

	 //Processor 52 control and data signals
	wire wrProc52West;
	wire fullProc52West;
	wire [31:0] dataOutProc52West;

	//Processor 53 control and data signals
	wire wrProc53North;
	wire fullProc53North;
	wire [31:0] dataOutProc53North;

	//Processor 53 control and data signals
        wire rdProc53North;
        wire emptyProc53North;
        wire [31:0] dataInProc53North;

	//Processor 53 control and data signals
	wire rdProc53South;
	wire emptyProc53South;
	wire [31:0] dataInProc53South;
		
	 //Processor 53 control and data signals
	wire wrProc53South;
	wire fullProc53South;
	wire [31:0] dataOutProc53South;

	 //Processor 53 control and data signals
	wire wrProc53West;
	wire fullProc53West;
	wire [31:0] dataOutProc53West;
	
	 //Processor 53 control and data signals
	wire rdProc53West;
	wire emptyProc53West;
	wire [31:0] dataInProc53West;

	//Processor 54 control and data signals
	wire wrProc54North;
	wire fullProc54North;
	wire [31:0] dataOutProc54North;

	 //Processor 54 control and data signals
	wire rdProc54North;
	wire emptyProc54North;
	wire [31:0] dataInProc54North;
	
	 //Processor 54 control and data signals
	wire rdProc54South;
	wire emptyProc54South;
	wire [31:0] dataInProc54South;
	
	 //Processor 54 control and data signals
	wire wrProc54South;
	wire fullProc54South;
	wire [31:0] dataOutProc54South;
	
	 //Processor 54 control and data signals
	wire rdProc54East;
	wire emptyProc54East;
	wire [31:0] dataInProc54East;

	 //Processor 54 control and data signals
	wire wrProc54East;
	wire fullProc54East;
	wire [31:0] dataOutProc54East;

	//Processor 55 control and data signals
	wire rdProc55North;
	wire emptyProc55North;
	wire [31:0] dataInProc55North;

	 //Processor 55 control and data signals
	wire wrProc55North;
	wire fullProc55North;
	wire [31:0] dataOutProc55North;

	 //Processor 55 control and data signals
	wire rdProc55South;
	wire emptyProc55South;
	wire [31:0] dataInProc55South;
	
	 //Processor 55 control and data signals
	wire wrProc55South;
	wire fullProc55South;
	wire [31:0] dataOutProc55South;

	 //Processor 55 control and data signals
	wire rdProc55East;
	wire emptyProc55East;
	wire [31:0] dataInProc55East;
	
	 //Processor 55 control and data signals
	wire wrProc55East;
	wire fullProc55East;
	wire [31:0] dataOutProc55East;

	 //Processor 55 control and data signals
	wire rdProc55West;
	wire emptyProc55West;
	wire [31:0] dataInProc55West;

	 //Processor 55 control and data signals
	wire wrProc55West;
	wire fullProc55West;
	wire [31:0] dataOutProc55West;

	//Processor 56 control and data signals
	wire rdProc56North;
	wire emptyProc56North;
	wire [31:0] dataInProc56North;

	 //Processor 56 control and data signals
	wire wrProc56North;
	wire fullProc56North;
	wire [31:0] dataOutProc56North;

	 //Processor 56 control and data signals
	wire rdProc56South;
	wire emptyProc56South;
	wire [31:0] dataInProc56South;
	
	 //Processor 56 control and data signals
	wire wrProc56South;
	wire fullProc56South;
	wire [31:0] dataOutProc56South;

	 //Processor 56 control and data signals
	wire rdProc56East;
	wire emptyProc56East;
	wire [31:0] dataInProc56East;
	
	 //Processor 56 control and data signals
	wire wrProc56East;
	wire fullProc56East;
	wire [31:0] dataOutProc56East;

	 //Processor 56 control and data signals
	wire rdProc56West;
	wire emptyProc56West;
	wire [31:0] dataInProc56West;

	 //Processor 56 control and data signals
	wire wrProc56West;
	wire fullProc56West;
	wire [31:0] dataOutProc56West;

	//Processor 57 control and data signals
	wire rdProc57North;
	wire emptyProc57North;
	wire [31:0] dataInProc57North;

	 //Processor 57 control and data signals
	wire wrProc57North;
	wire fullProc57North;
	wire [31:0] dataOutProc57North;

	 //Processor 57 control and data signals
	wire rdProc57South;
	wire emptyProc57South;
	wire [31:0] dataInProc57South;
	
	 //Processor 57 control and data signals
	wire wrProc57South;
	wire fullProc57South;
	wire [31:0] dataOutProc57South;

	 //Processor 57 control and data signals
	wire rdProc57East;
	wire emptyProc57East;
	wire [31:0] dataInProc57East;
	
	 //Processor 57 control and data signals
	wire wrProc57East;
	wire fullProc57East;
	wire [31:0] dataOutProc57East;

	 //Processor 57 control and data signals
	wire rdProc57West;
	wire emptyProc57West;
	wire [31:0] dataInProc57West;

	 //Processor 57 control and data signals
	wire wrProc57West;
	wire fullProc57West;
	wire [31:0] dataOutProc57West;

	//Processor 58 control and data signals
	wire rdProc58North;
	wire emptyProc58North;
	wire [31:0] dataInProc58North;

	 //Processor 58 control and data signals
	wire wrProc58North;
	wire fullProc58North;
	wire [31:0] dataOutProc58North;

	 //Processor 58 control and data signals
	wire rdProc58South;
	wire emptyProc58South;
	wire [31:0] dataInProc58South;
	
	 //Processor 58 control and data signals
	wire wrProc58South;
	wire fullProc58South;
	wire [31:0] dataOutProc58South;

	 //Processor 58 control and data signals
	wire rdProc58East;
	wire emptyProc58East;
	wire [31:0] dataInProc58East;
	
	 //Processor 58 control and data signals
	wire wrProc58East;
	wire fullProc58East;
	wire [31:0] dataOutProc58East;

	 //Processor 58 control and data signals
	wire rdProc58West;
	wire emptyProc58West;
	wire [31:0] dataInProc58West;

	 //Processor 58 control and data signals
	wire wrProc58West;
	wire fullProc58West;
	wire [31:0] dataOutProc58West;

	//Processor 59 control and data signals
	wire rdProc59North;
	wire emptyProc59North;
	wire [31:0] dataInProc59North;

	 //Processor 59 control and data signals
	wire wrProc59North;
	wire fullProc59North;
	wire [31:0] dataOutProc59North;

	 //Processor 59 control and data signals
	wire rdProc59South;
	wire emptyProc59South;
	wire [31:0] dataInProc59South;
	
	 //Processor 59 control and data signals
	wire wrProc59South;
	wire fullProc59South;
	wire [31:0] dataOutProc59South;

	 //Processor 59 control and data signals
	wire rdProc59East;
	wire emptyProc59East;
	wire [31:0] dataInProc59East;
	
	 //Processor 59 control and data signals
	wire wrProc59East;
	wire fullProc59East;
	wire [31:0] dataOutProc59East;

	 //Processor 59 control and data signals
	wire rdProc59West;
	wire emptyProc59West;
	wire [31:0] dataInProc59West;

	 //Processor 59 control and data signals
	wire wrProc59West;
	wire fullProc59West;
	wire [31:0] dataOutProc59West;

	//Processor 60 control and data signals
	wire rdProc60North;
	wire emptyProc60North;
	wire [31:0] dataInProc60North;

	 //Processor 60 control and data signals
	wire wrProc60North;
	wire fullProc60North;
	wire [31:0] dataOutProc60North;

	 //Processor 60 control and data signals
	wire rdProc60South;
	wire emptyProc60South;
	wire [31:0] dataInProc60South;
	
	 //Processor 60 control and data signals
	wire wrProc60South;
	wire fullProc60South;
	wire [31:0] dataOutProc60South;

	 //Processor 60 control and data signals
	wire rdProc60East;
	wire emptyProc60East;
	wire [31:0] dataInProc60East;
	
	 //Processor 60 control and data signals
	wire wrProc60East;
	wire fullProc60East;
	wire [31:0] dataOutProc60East;

	 //Processor 60 control and data signals
	wire rdProc60West;
	wire emptyProc60West;
	wire [31:0] dataInProc60West;

	 //Processor 60 control and data signals
	wire wrProc60West;
	wire fullProc60West;
	wire [31:0] dataOutProc60West;

	//Processor 61 control and data signals
	wire rdProc61North;
	wire emptyProc61North;
	wire [31:0] dataInProc61North;

	 //Processor 61 control and data signals
	wire wrProc61North;
	wire fullProc61North;
	wire [31:0] dataOutProc61North;

	 //Processor 61 control and data signals
	wire rdProc61South;
	wire emptyProc61South;
	wire [31:0] dataInProc61South;
	
	 //Processor 61 control and data signals
	wire wrProc61South;
	wire fullProc61South;
	wire [31:0] dataOutProc61South;

	 //Processor 61 control and data signals
	wire rdProc61East;
	wire emptyProc61East;
	wire [31:0] dataInProc61East;
	
	 //Processor 61 control and data signals
	wire wrProc61East;
	wire fullProc61East;
	wire [31:0] dataOutProc61East;

	 //Processor 61 control and data signals
	wire rdProc61West;
	wire emptyProc61West;
	wire [31:0] dataInProc61West;

	 //Processor 61 control and data signals
	wire wrProc61West;
	wire fullProc61West;
	wire [31:0] dataOutProc61West;

	//Processor 62 control and data signals
	wire wrProc62North;
	wire fullProc62North;
	wire [31:0] dataOutProc62North;

	//Processor 62 control and data signals
        wire rdProc62North;
        wire emptyProc62North;
        wire [31:0] dataInProc62North;

	//Processor 62 control and data signals
	wire rdProc62South;
	wire emptyProc62South;
	wire [31:0] dataInProc62South;
		
	 //Processor 62 control and data signals
	wire wrProc62South;
	wire fullProc62South;
	wire [31:0] dataOutProc62South;

	 //Processor 62 control and data signals
	wire wrProc62West;
	wire fullProc62West;
	wire [31:0] dataOutProc62West;
	
	 //Processor 62 control and data signals
	wire rdProc62West;
	wire emptyProc62West;
	wire [31:0] dataInProc62West;

	//Processor 63 control and data signals
	wire wrProc63North;
	wire fullProc63North;
	wire [31:0] dataOutProc63North;

	 //Processor 63 control and data signals
	wire rdProc63North;
	wire emptyProc63North;
	wire [31:0] dataInProc63North;
	
	 //Processor 63 control and data signals
	wire rdProc63South;
	wire emptyProc63South;
	wire [31:0] dataInProc63South;
	
	 //Processor 63 control and data signals
	wire wrProc63South;
	wire fullProc63South;
	wire [31:0] dataOutProc63South;
	
	 //Processor 63 control and data signals
	wire rdProc63East;
	wire emptyProc63East;
	wire [31:0] dataInProc63East;

	 //Processor 63 control and data signals
	wire wrProc63East;
	wire fullProc63East;
	wire [31:0] dataOutProc63East;

	//Processor 64 control and data signals
	wire rdProc64North;
	wire emptyProc64North;
	wire [31:0] dataInProc64North;

	 //Processor 64 control and data signals
	wire wrProc64North;
	wire fullProc64North;
	wire [31:0] dataOutProc64North;

	 //Processor 64 control and data signals
	wire rdProc64South;
	wire emptyProc64South;
	wire [31:0] dataInProc64South;
	
	 //Processor 64 control and data signals
	wire wrProc64South;
	wire fullProc64South;
	wire [31:0] dataOutProc64South;

	 //Processor 64 control and data signals
	wire rdProc64East;
	wire emptyProc64East;
	wire [31:0] dataInProc64East;
	
	 //Processor 64 control and data signals
	wire wrProc64East;
	wire fullProc64East;
	wire [31:0] dataOutProc64East;

	 //Processor 64 control and data signals
	wire rdProc64West;
	wire emptyProc64West;
	wire [31:0] dataInProc64West;

	 //Processor 64 control and data signals
	wire wrProc64West;
	wire fullProc64West;
	wire [31:0] dataOutProc64West;

	//Processor 65 control and data signals
	wire rdProc65North;
	wire emptyProc65North;
	wire [31:0] dataInProc65North;

	 //Processor 65 control and data signals
	wire wrProc65North;
	wire fullProc65North;
	wire [31:0] dataOutProc65North;

	 //Processor 65 control and data signals
	wire rdProc65South;
	wire emptyProc65South;
	wire [31:0] dataInProc65South;
	
	 //Processor 65 control and data signals
	wire wrProc65South;
	wire fullProc65South;
	wire [31:0] dataOutProc65South;

	 //Processor 65 control and data signals
	wire rdProc65East;
	wire emptyProc65East;
	wire [31:0] dataInProc65East;
	
	 //Processor 65 control and data signals
	wire wrProc65East;
	wire fullProc65East;
	wire [31:0] dataOutProc65East;

	 //Processor 65 control and data signals
	wire rdProc65West;
	wire emptyProc65West;
	wire [31:0] dataInProc65West;

	 //Processor 65 control and data signals
	wire wrProc65West;
	wire fullProc65West;
	wire [31:0] dataOutProc65West;

	//Processor 66 control and data signals
	wire rdProc66North;
	wire emptyProc66North;
	wire [31:0] dataInProc66North;

	 //Processor 66 control and data signals
	wire wrProc66North;
	wire fullProc66North;
	wire [31:0] dataOutProc66North;

	 //Processor 66 control and data signals
	wire rdProc66South;
	wire emptyProc66South;
	wire [31:0] dataInProc66South;
	
	 //Processor 66 control and data signals
	wire wrProc66South;
	wire fullProc66South;
	wire [31:0] dataOutProc66South;

	 //Processor 66 control and data signals
	wire rdProc66East;
	wire emptyProc66East;
	wire [31:0] dataInProc66East;
	
	 //Processor 66 control and data signals
	wire wrProc66East;
	wire fullProc66East;
	wire [31:0] dataOutProc66East;

	 //Processor 66 control and data signals
	wire rdProc66West;
	wire emptyProc66West;
	wire [31:0] dataInProc66West;

	 //Processor 66 control and data signals
	wire wrProc66West;
	wire fullProc66West;
	wire [31:0] dataOutProc66West;

	//Processor 67 control and data signals
	wire rdProc67North;
	wire emptyProc67North;
	wire [31:0] dataInProc67North;

	 //Processor 67 control and data signals
	wire wrProc67North;
	wire fullProc67North;
	wire [31:0] dataOutProc67North;

	 //Processor 67 control and data signals
	wire rdProc67South;
	wire emptyProc67South;
	wire [31:0] dataInProc67South;
	
	 //Processor 67 control and data signals
	wire wrProc67South;
	wire fullProc67South;
	wire [31:0] dataOutProc67South;

	 //Processor 67 control and data signals
	wire rdProc67East;
	wire emptyProc67East;
	wire [31:0] dataInProc67East;
	
	 //Processor 67 control and data signals
	wire wrProc67East;
	wire fullProc67East;
	wire [31:0] dataOutProc67East;

	 //Processor 67 control and data signals
	wire rdProc67West;
	wire emptyProc67West;
	wire [31:0] dataInProc67West;

	 //Processor 67 control and data signals
	wire wrProc67West;
	wire fullProc67West;
	wire [31:0] dataOutProc67West;

	//Processor 68 control and data signals
	wire rdProc68North;
	wire emptyProc68North;
	wire [31:0] dataInProc68North;

	 //Processor 68 control and data signals
	wire wrProc68North;
	wire fullProc68North;
	wire [31:0] dataOutProc68North;

	 //Processor 68 control and data signals
	wire rdProc68South;
	wire emptyProc68South;
	wire [31:0] dataInProc68South;
	
	 //Processor 68 control and data signals
	wire wrProc68South;
	wire fullProc68South;
	wire [31:0] dataOutProc68South;

	 //Processor 68 control and data signals
	wire rdProc68East;
	wire emptyProc68East;
	wire [31:0] dataInProc68East;
	
	 //Processor 68 control and data signals
	wire wrProc68East;
	wire fullProc68East;
	wire [31:0] dataOutProc68East;

	 //Processor 68 control and data signals
	wire rdProc68West;
	wire emptyProc68West;
	wire [31:0] dataInProc68West;

	 //Processor 68 control and data signals
	wire wrProc68West;
	wire fullProc68West;
	wire [31:0] dataOutProc68West;

	//Processor 69 control and data signals
	wire rdProc69North;
	wire emptyProc69North;
	wire [31:0] dataInProc69North;

	 //Processor 69 control and data signals
	wire wrProc69North;
	wire fullProc69North;
	wire [31:0] dataOutProc69North;

	 //Processor 69 control and data signals
	wire rdProc69South;
	wire emptyProc69South;
	wire [31:0] dataInProc69South;
	
	 //Processor 69 control and data signals
	wire wrProc69South;
	wire fullProc69South;
	wire [31:0] dataOutProc69South;

	 //Processor 69 control and data signals
	wire rdProc69East;
	wire emptyProc69East;
	wire [31:0] dataInProc69East;
	
	 //Processor 69 control and data signals
	wire wrProc69East;
	wire fullProc69East;
	wire [31:0] dataOutProc69East;

	 //Processor 69 control and data signals
	wire rdProc69West;
	wire emptyProc69West;
	wire [31:0] dataInProc69West;

	 //Processor 69 control and data signals
	wire wrProc69West;
	wire fullProc69West;
	wire [31:0] dataOutProc69West;

	//Processor 70 control and data signals
	wire rdProc70North;
	wire emptyProc70North;
	wire [31:0] dataInProc70North;

	 //Processor 70 control and data signals
	wire wrProc70North;
	wire fullProc70North;
	wire [31:0] dataOutProc70North;

	 //Processor 70 control and data signals
	wire rdProc70South;
	wire emptyProc70South;
	wire [31:0] dataInProc70South;
	
	 //Processor 70 control and data signals
	wire wrProc70South;
	wire fullProc70South;
	wire [31:0] dataOutProc70South;

	 //Processor 70 control and data signals
	wire rdProc70East;
	wire emptyProc70East;
	wire [31:0] dataInProc70East;
	
	 //Processor 70 control and data signals
	wire wrProc70East;
	wire fullProc70East;
	wire [31:0] dataOutProc70East;

	 //Processor 70 control and data signals
	wire rdProc70West;
	wire emptyProc70West;
	wire [31:0] dataInProc70West;

	 //Processor 70 control and data signals
	wire wrProc70West;
	wire fullProc70West;
	wire [31:0] dataOutProc70West;

	//Processor 71 control and data signals
	wire wrProc71North;
	wire fullProc71North;
	wire [31:0] dataOutProc71North;

	//Processor 71 control and data signals
        wire rdProc71North;
        wire emptyProc71North;
        wire [31:0] dataInProc71North;

	//Processor 71 control and data signals
	wire rdProc71South;
	wire emptyProc71South;
	wire [31:0] dataInProc71South;
		
	 //Processor 71 control and data signals
	wire wrProc71South;
	wire fullProc71South;
	wire [31:0] dataOutProc71South;

	 //Processor 71 control and data signals
	wire wrProc71West;
	wire fullProc71West;
	wire [31:0] dataOutProc71West;
	
	 //Processor 71 control and data signals
	wire rdProc71West;
	wire emptyProc71West;
	wire [31:0] dataInProc71West;

	 //Processor72 control and data signals
	wire wrProc72North;
	wire fullProc72North;
	wire [31:0] dataOutProc72North;
	
	 //Processor 72 control and data signals
	wire rdProc72North;
	wire emptyProc72North;
	wire [31:0] dataInProc72North;

	 //Processor 72 control and data signals
	wire rdProc72East;
	wire emptyProc72East;
	wire [31:0] dataInProc72East;

	 //Processor 72 control and data signals
	wire wrProc72East;
	wire fullProc72East;
	wire [31:0] dataOutProc72East;

	//Processor 73 control and data signals
	wire wrProc73North;
	wire fullProc73North;
	wire [31:0] dataOutProc73North;
		
	 //Processor 73 control and data signals
	wire rdProc73North;
	wire emptyProc73North;
	wire [31:0] dataInProc73North;

	 //Processor 73 control and data signals
	wire rdProc73East;
	wire emptyProc73East;
	wire [31:0] dataInProc73East;
	
	 //Processor 73 control and data signals
	wire wrProc73East;
	wire fullProc73East;
	wire [31:0] dataOutProc73East;

	 //Processor 73 control and data signals
	wire rdProc73West;
	wire emptyProc73West;
	wire [31:0] dataInProc73West;

	 //Processor 73 control and data signals
	wire wrProc73West;
	wire fullProc73West;
	wire [31:0] dataOutProc73West;

	//Processor 74 control and data signals
	wire wrProc74North;
	wire fullProc74North;
	wire [31:0] dataOutProc74North;
		
	 //Processor 74 control and data signals
	wire rdProc74North;
	wire emptyProc74North;
	wire [31:0] dataInProc74North;

	 //Processor 74 control and data signals
	wire rdProc74East;
	wire emptyProc74East;
	wire [31:0] dataInProc74East;
	
	 //Processor 74 control and data signals
	wire wrProc74East;
	wire fullProc74East;
	wire [31:0] dataOutProc74East;

	 //Processor 74 control and data signals
	wire rdProc74West;
	wire emptyProc74West;
	wire [31:0] dataInProc74West;

	 //Processor 74 control and data signals
	wire wrProc74West;
	wire fullProc74West;
	wire [31:0] dataOutProc74West;

	//Processor 75 control and data signals
	wire wrProc75North;
	wire fullProc75North;
	wire [31:0] dataOutProc75North;
		
	 //Processor 75 control and data signals
	wire rdProc75North;
	wire emptyProc75North;
	wire [31:0] dataInProc75North;

	 //Processor 75 control and data signals
	wire rdProc75East;
	wire emptyProc75East;
	wire [31:0] dataInProc75East;
	
	 //Processor 75 control and data signals
	wire wrProc75East;
	wire fullProc75East;
	wire [31:0] dataOutProc75East;

	 //Processor 75 control and data signals
	wire rdProc75West;
	wire emptyProc75West;
	wire [31:0] dataInProc75West;

	 //Processor 75 control and data signals
	wire wrProc75West;
	wire fullProc75West;
	wire [31:0] dataOutProc75West;

	//Processor 76 control and data signals
	wire wrProc76North;
	wire fullProc76North;
	wire [31:0] dataOutProc76North;
		
	 //Processor 76 control and data signals
	wire rdProc76North;
	wire emptyProc76North;
	wire [31:0] dataInProc76North;

	 //Processor 76 control and data signals
	wire rdProc76East;
	wire emptyProc76East;
	wire [31:0] dataInProc76East;
	
	 //Processor 76 control and data signals
	wire wrProc76East;
	wire fullProc76East;
	wire [31:0] dataOutProc76East;

	 //Processor 76 control and data signals
	wire rdProc76West;
	wire emptyProc76West;
	wire [31:0] dataInProc76West;

	 //Processor 76 control and data signals
	wire wrProc76West;
	wire fullProc76West;
	wire [31:0] dataOutProc76West;

	//Processor 77 control and data signals
	wire wrProc77North;
	wire fullProc77North;
	wire [31:0] dataOutProc77North;
		
	 //Processor 77 control and data signals
	wire rdProc77North;
	wire emptyProc77North;
	wire [31:0] dataInProc77North;

	 //Processor 77 control and data signals
	wire rdProc77East;
	wire emptyProc77East;
	wire [31:0] dataInProc77East;
	
	 //Processor 77 control and data signals
	wire wrProc77East;
	wire fullProc77East;
	wire [31:0] dataOutProc77East;

	 //Processor 77 control and data signals
	wire rdProc77West;
	wire emptyProc77West;
	wire [31:0] dataInProc77West;

	 //Processor 77 control and data signals
	wire wrProc77West;
	wire fullProc77West;
	wire [31:0] dataOutProc77West;

	//Processor 78 control and data signals
	wire wrProc78North;
	wire fullProc78North;
	wire [31:0] dataOutProc78North;
		
	 //Processor 78 control and data signals
	wire rdProc78North;
	wire emptyProc78North;
	wire [31:0] dataInProc78North;

	 //Processor 78 control and data signals
	wire rdProc78East;
	wire emptyProc78East;
	wire [31:0] dataInProc78East;
	
	 //Processor 78 control and data signals
	wire wrProc78East;
	wire fullProc78East;
	wire [31:0] dataOutProc78East;

	 //Processor 78 control and data signals
	wire rdProc78West;
	wire emptyProc78West;
	wire [31:0] dataInProc78West;

	 //Processor 78 control and data signals
	wire wrProc78West;
	wire fullProc78West;
	wire [31:0] dataOutProc78West;

	//Processor 79 control and data signals
	wire wrProc79North;
	wire fullProc79North;
	wire [31:0] dataOutProc79North;
		
	 //Processor 79 control and data signals
	wire rdProc79North;
	wire emptyProc79North;
	wire [31:0] dataInProc79North;

	 //Processor 79 control and data signals
	wire rdProc79East;
	wire emptyProc79East;
	wire [31:0] dataInProc79East;
	
	 //Processor 79 control and data signals
	wire wrProc79East;
	wire fullProc79East;
	wire [31:0] dataOutProc79East;

	 //Processor 79 control and data signals
	wire rdProc79West;
	wire emptyProc79West;
	wire [31:0] dataInProc79West;

	 //Processor 79 control and data signals
	wire wrProc79West;
	wire fullProc79West;
	wire [31:0] dataOutProc79West;

	//Processor 80 control and data signals
	wire rdProc80North;
	wire emptyProc80North;
	wire [31:0] dataInProc80North;

	 //Processor 80 control and data signals
	wire wrProc80North;
	wire fullProc80North;
	wire [31:0] dataOutProc80North;

	 //Processor 80 control and data signals
	wire wrProc80West;
	wire fullProc80West;
	wire [31:0] dataOutProc80West;
	
	 //Processor 80 control and data signals
	wire rdProc80West;
	wire emptyProc80West;
	wire [31:0] dataInProc80West;

 
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
	.rdEast(rdProc3East),
	.emptyEast(emptyProc3East),
	.dataInEast(dataInProc3East),
	.wrEast(wrProc3East),
	.fullEast(fullProc3East),
	.dataOutEast(dataOutProc3East),
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
	.rdSouth(rdProc7South),
	.emptySouth(emptyProc7South),
	.dataInSouth(dataInProc7South),
	.wrSouth(wrProc7South),
	.fullSouth(fullProc7South),
	.dataOutSouth(dataOutProc7South),
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
	.rdSouth(rdProc8South),
	.emptySouth(emptyProc8South),
	.dataInSouth(dataInProc8South),
	.wrSouth(wrProc8South),
	.fullSouth(fullProc8South),
	.dataOutSouth(dataOutProc8South),
	.rdWest(rdProc8West),
	.emptyWest(emptyProc8West),
	.dataInWest(dataInProc8West),
	.wrWest(wrProc8West),
	.fullWest(fullProc8West),
	.dataOutWest(dataOutProc8West));
 
//PROCESSOR 9
system proc9(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe9),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe9),
	.wrNorth(wrProc9North),
	.fullNorth(fullProc9North),
	.dataOutNorth(dataOutProc9North),
	.rdNorth(rdProc9North),
	.emptyNorth(emptyProc9North),
	.dataInNorth(dataInProc9North),
	.rdSouth(rdProc9South),
	.emptySouth(emptyProc9South),
	.dataInSouth(dataInProc9South),
	.wrSouth(wrProc9South),
	.fullSouth(fullProc9South),
	.dataOutSouth(dataOutProc9South),
	.rdEast(rdProc9East),
	.emptyEast(emptyProc9East),
	.dataInEast(dataInProc9East),
	.wrEast(wrProc9East),
	.fullEast(fullProc9East),
	.dataOutEast(dataOutProc9East));
 
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
	.rdSouth(rdProc10South),
	.emptySouth(emptyProc10South),
	.dataInSouth(dataInProc10South),
	.wrSouth(wrProc10South),
	.fullSouth(fullProc10South),
	.dataOutSouth(dataOutProc10South),
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
	.rdSouth(rdProc11South),
	.emptySouth(emptyProc11South),
	.dataInSouth(dataInProc11South),
	.wrSouth(wrProc11South),
	.fullSouth(fullProc11South),
	.dataOutSouth(dataOutProc11South),
	.rdEast(rdProc11East),
	.emptyEast(emptyProc11East),
	.dataInEast(dataInProc11East),
	.wrEast(wrProc11East),
	.fullEast(fullProc11East),
	.dataOutEast(dataOutProc11East),
	.rdWest(rdProc11West),
	.emptyWest(emptyProc11West),
	.dataInWest(dataInProc11West),
	.wrWest(wrProc11West),
	.fullWest(fullProc11West),
	.dataOutWest(dataOutProc11West));
 
//PROCESSOR 12
system proc12(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe12),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe12),
	.rdNorth(rdProc12North),
	.emptyNorth(emptyProc12North),
	.dataInNorth(dataInProc12North),
	.wrNorth(wrProc12North),
	.fullNorth(fullProc12North),
	.dataOutNorth(dataOutProc12North),
	.rdSouth(rdProc12South),
	.emptySouth(emptyProc12South),
	.dataInSouth(dataInProc12South),
	.wrSouth(wrProc12South),
	.fullSouth(fullProc12South),
	.dataOutSouth(dataOutProc12South),
	.rdEast(rdProc12East),
	.emptyEast(emptyProc12East),
	.dataInEast(dataInProc12East),
	.wrEast(wrProc12East),
	.fullEast(fullProc12East),
	.dataOutEast(dataOutProc12East),
	.rdWest(rdProc12West),
	.emptyWest(emptyProc12West),
	.dataInWest(dataInProc12West),
	.wrWest(wrProc12West),
	.fullWest(fullProc12West),
	.dataOutWest(dataOutProc12West));
 
//PROCESSOR 13
system proc13(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe13),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe13),
	.rdNorth(rdProc13North),
	.emptyNorth(emptyProc13North),
	.dataInNorth(dataInProc13North),
	.wrNorth(wrProc13North),
	.fullNorth(fullProc13North),
	.dataOutNorth(dataOutProc13North),
	.rdSouth(rdProc13South),
	.emptySouth(emptyProc13South),
	.dataInSouth(dataInProc13South),
	.wrSouth(wrProc13South),
	.fullSouth(fullProc13South),
	.dataOutSouth(dataOutProc13South),
	.rdEast(rdProc13East),
	.emptyEast(emptyProc13East),
	.dataInEast(dataInProc13East),
	.wrEast(wrProc13East),
	.fullEast(fullProc13East),
	.dataOutEast(dataOutProc13East),
	.rdWest(rdProc13West),
	.emptyWest(emptyProc13West),
	.dataInWest(dataInProc13West),
	.wrWest(wrProc13West),
	.fullWest(fullProc13West),
	.dataOutWest(dataOutProc13West));
 
//PROCESSOR 14
system proc14(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe14),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe14),
	.rdNorth(rdProc14North),
	.emptyNorth(emptyProc14North),
	.dataInNorth(dataInProc14North),
	.wrNorth(wrProc14North),
	.fullNorth(fullProc14North),
	.dataOutNorth(dataOutProc14North),
	.rdSouth(rdProc14South),
	.emptySouth(emptyProc14South),
	.dataInSouth(dataInProc14South),
	.wrSouth(wrProc14South),
	.fullSouth(fullProc14South),
	.dataOutSouth(dataOutProc14South),
	.rdEast(rdProc14East),
	.emptyEast(emptyProc14East),
	.dataInEast(dataInProc14East),
	.wrEast(wrProc14East),
	.fullEast(fullProc14East),
	.dataOutEast(dataOutProc14East),
	.rdWest(rdProc14West),
	.emptyWest(emptyProc14West),
	.dataInWest(dataInProc14West),
	.wrWest(wrProc14West),
	.fullWest(fullProc14West),
	.dataOutWest(dataOutProc14West));
 
//PROCESSOR 15
system proc15(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe15),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe15),
	.rdNorth(rdProc15North),
	.emptyNorth(emptyProc15North),
	.dataInNorth(dataInProc15North),
	.wrNorth(wrProc15North),
	.fullNorth(fullProc15North),
	.dataOutNorth(dataOutProc15North),
	.rdSouth(rdProc15South),
	.emptySouth(emptyProc15South),
	.dataInSouth(dataInProc15South),
	.wrSouth(wrProc15South),
	.fullSouth(fullProc15South),
	.dataOutSouth(dataOutProc15South),
	.rdEast(rdProc15East),
	.emptyEast(emptyProc15East),
	.dataInEast(dataInProc15East),
	.wrEast(wrProc15East),
	.fullEast(fullProc15East),
	.dataOutEast(dataOutProc15East),
	.rdWest(rdProc15West),
	.emptyWest(emptyProc15West),
	.dataInWest(dataInProc15West),
	.wrWest(wrProc15West),
	.fullWest(fullProc15West),
	.dataOutWest(dataOutProc15West));
 
//PROCESSOR 16
system proc16(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe16),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe16),
	.rdNorth(rdProc16North),
	.emptyNorth(emptyProc16North),
	.dataInNorth(dataInProc16North),
	.wrNorth(wrProc16North),
	.fullNorth(fullProc16North),
	.dataOutNorth(dataOutProc16North),
	.rdSouth(rdProc16South),
	.emptySouth(emptyProc16South),
	.dataInSouth(dataInProc16South),
	.wrSouth(wrProc16South),
	.fullSouth(fullProc16South),
	.dataOutSouth(dataOutProc16South),
	.rdEast(rdProc16East),
	.emptyEast(emptyProc16East),
	.dataInEast(dataInProc16East),
	.wrEast(wrProc16East),
	.fullEast(fullProc16East),
	.dataOutEast(dataOutProc16East),
	.rdWest(rdProc16West),
	.emptyWest(emptyProc16West),
	.dataInWest(dataInProc16West),
	.wrWest(wrProc16West),
	.fullWest(fullProc16West),
	.dataOutWest(dataOutProc16West));
 
//PROCESSOR 17
system proc17(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe17),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe17),
	.rdNorth(rdProc17North),
	.emptyNorth(emptyProc17North),
	.dataInNorth(dataInProc17North),
	.wrNorth(wrProc17North),
	.fullNorth(fullProc17North),
	.dataOutNorth(dataOutProc17North),
	.rdSouth(rdProc17South),
	.emptySouth(emptyProc17South),
	.dataInSouth(dataInProc17South),
	.wrSouth(wrProc17South),
	.fullSouth(fullProc17South),
	.dataOutSouth(dataOutProc17South),
	.rdWest(rdProc17West),
	.emptyWest(emptyProc17West),
	.dataInWest(dataInProc17West),
	.wrWest(wrProc17West),
	.fullWest(fullProc17West),
	.dataOutWest(dataOutProc17West));
 
//PROCESSOR 18
system proc18(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe18),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe18),
	.wrNorth(wrProc18North),
	.fullNorth(fullProc18North),
	.dataOutNorth(dataOutProc18North),
	.rdNorth(rdProc18North),
	.emptyNorth(emptyProc18North),
	.dataInNorth(dataInProc18North),
	.rdSouth(rdProc18South),
	.emptySouth(emptyProc18South),
	.dataInSouth(dataInProc18South),
	.wrSouth(wrProc18South),
	.fullSouth(fullProc18South),
	.dataOutSouth(dataOutProc18South),
	.rdEast(rdProc18East),
	.emptyEast(emptyProc18East),
	.dataInEast(dataInProc18East),
	.wrEast(wrProc18East),
	.fullEast(fullProc18East),
	.dataOutEast(dataOutProc18East));
 
//PROCESSOR 19
system proc19(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe19),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe19),
	.rdNorth(rdProc19North),
	.emptyNorth(emptyProc19North),
	.dataInNorth(dataInProc19North),
	.wrNorth(wrProc19North),
	.fullNorth(fullProc19North),
	.dataOutNorth(dataOutProc19North),
	.rdSouth(rdProc19South),
	.emptySouth(emptyProc19South),
	.dataInSouth(dataInProc19South),
	.wrSouth(wrProc19South),
	.fullSouth(fullProc19South),
	.dataOutSouth(dataOutProc19South),
	.rdEast(rdProc19East),
	.emptyEast(emptyProc19East),
	.dataInEast(dataInProc19East),
	.wrEast(wrProc19East),
	.fullEast(fullProc19East),
	.dataOutEast(dataOutProc19East),
	.rdWest(rdProc19West),
	.emptyWest(emptyProc19West),
	.dataInWest(dataInProc19West),
	.wrWest(wrProc19West),
	.fullWest(fullProc19West),
	.dataOutWest(dataOutProc19West));
 
//PROCESSOR 20
system proc20(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe20),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe20),
	.rdNorth(rdProc20North),
	.emptyNorth(emptyProc20North),
	.dataInNorth(dataInProc20North),
	.wrNorth(wrProc20North),
	.fullNorth(fullProc20North),
	.dataOutNorth(dataOutProc20North),
	.rdSouth(rdProc20South),
	.emptySouth(emptyProc20South),
	.dataInSouth(dataInProc20South),
	.wrSouth(wrProc20South),
	.fullSouth(fullProc20South),
	.dataOutSouth(dataOutProc20South),
	.rdEast(rdProc20East),
	.emptyEast(emptyProc20East),
	.dataInEast(dataInProc20East),
	.wrEast(wrProc20East),
	.fullEast(fullProc20East),
	.dataOutEast(dataOutProc20East),
	.rdWest(rdProc20West),
	.emptyWest(emptyProc20West),
	.dataInWest(dataInProc20West),
	.wrWest(wrProc20West),
	.fullWest(fullProc20West),
	.dataOutWest(dataOutProc20West));
 
//PROCESSOR 21
system proc21(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe21),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe21),
	.rdNorth(rdProc21North),
	.emptyNorth(emptyProc21North),
	.dataInNorth(dataInProc21North),
	.wrNorth(wrProc21North),
	.fullNorth(fullProc21North),
	.dataOutNorth(dataOutProc21North),
	.rdSouth(rdProc21South),
	.emptySouth(emptyProc21South),
	.dataInSouth(dataInProc21South),
	.wrSouth(wrProc21South),
	.fullSouth(fullProc21South),
	.dataOutSouth(dataOutProc21South),
	.rdEast(rdProc21East),
	.emptyEast(emptyProc21East),
	.dataInEast(dataInProc21East),
	.wrEast(wrProc21East),
	.fullEast(fullProc21East),
	.dataOutEast(dataOutProc21East),
	.rdWest(rdProc21West),
	.emptyWest(emptyProc21West),
	.dataInWest(dataInProc21West),
	.wrWest(wrProc21West),
	.fullWest(fullProc21West),
	.dataOutWest(dataOutProc21West));
 
//PROCESSOR 22
system proc22(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe22),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe22),
	.rdNorth(rdProc22North),
	.emptyNorth(emptyProc22North),
	.dataInNorth(dataInProc22North),
	.wrNorth(wrProc22North),
	.fullNorth(fullProc22North),
	.dataOutNorth(dataOutProc22North),
	.rdSouth(rdProc22South),
	.emptySouth(emptyProc22South),
	.dataInSouth(dataInProc22South),
	.wrSouth(wrProc22South),
	.fullSouth(fullProc22South),
	.dataOutSouth(dataOutProc22South),
	.rdEast(rdProc22East),
	.emptyEast(emptyProc22East),
	.dataInEast(dataInProc22East),
	.wrEast(wrProc22East),
	.fullEast(fullProc22East),
	.dataOutEast(dataOutProc22East),
	.rdWest(rdProc22West),
	.emptyWest(emptyProc22West),
	.dataInWest(dataInProc22West),
	.wrWest(wrProc22West),
	.fullWest(fullProc22West),
	.dataOutWest(dataOutProc22West));
 
//PROCESSOR 23
system proc23(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe23),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe23),
	.rdNorth(rdProc23North),
	.emptyNorth(emptyProc23North),
	.dataInNorth(dataInProc23North),
	.wrNorth(wrProc23North),
	.fullNorth(fullProc23North),
	.dataOutNorth(dataOutProc23North),
	.rdSouth(rdProc23South),
	.emptySouth(emptyProc23South),
	.dataInSouth(dataInProc23South),
	.wrSouth(wrProc23South),
	.fullSouth(fullProc23South),
	.dataOutSouth(dataOutProc23South),
	.rdEast(rdProc23East),
	.emptyEast(emptyProc23East),
	.dataInEast(dataInProc23East),
	.wrEast(wrProc23East),
	.fullEast(fullProc23East),
	.dataOutEast(dataOutProc23East),
	.rdWest(rdProc23West),
	.emptyWest(emptyProc23West),
	.dataInWest(dataInProc23West),
	.wrWest(wrProc23West),
	.fullWest(fullProc23West),
	.dataOutWest(dataOutProc23West));
 
//PROCESSOR 24
system proc24(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe24),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe24),
	.rdNorth(rdProc24North),
	.emptyNorth(emptyProc24North),
	.dataInNorth(dataInProc24North),
	.wrNorth(wrProc24North),
	.fullNorth(fullProc24North),
	.dataOutNorth(dataOutProc24North),
	.rdSouth(rdProc24South),
	.emptySouth(emptyProc24South),
	.dataInSouth(dataInProc24South),
	.wrSouth(wrProc24South),
	.fullSouth(fullProc24South),
	.dataOutSouth(dataOutProc24South),
	.rdEast(rdProc24East),
	.emptyEast(emptyProc24East),
	.dataInEast(dataInProc24East),
	.wrEast(wrProc24East),
	.fullEast(fullProc24East),
	.dataOutEast(dataOutProc24East),
	.rdWest(rdProc24West),
	.emptyWest(emptyProc24West),
	.dataInWest(dataInProc24West),
	.wrWest(wrProc24West),
	.fullWest(fullProc24West),
	.dataOutWest(dataOutProc24West));
 
//PROCESSOR 25
system proc25(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe25),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe25),
	.rdNorth(rdProc25North),
	.emptyNorth(emptyProc25North),
	.dataInNorth(dataInProc25North),
	.wrNorth(wrProc25North),
	.fullNorth(fullProc25North),
	.dataOutNorth(dataOutProc25North),
	.rdSouth(rdProc25South),
	.emptySouth(emptyProc25South),
	.dataInSouth(dataInProc25South),
	.wrSouth(wrProc25South),
	.fullSouth(fullProc25South),
	.dataOutSouth(dataOutProc25South),
	.rdEast(rdProc25East),
	.emptyEast(emptyProc25East),
	.dataInEast(dataInProc25East),
	.wrEast(wrProc25East),
	.fullEast(fullProc25East),
	.dataOutEast(dataOutProc25East),
	.rdWest(rdProc25West),
	.emptyWest(emptyProc25West),
	.dataInWest(dataInProc25West),
	.wrWest(wrProc25West),
	.fullWest(fullProc25West),
	.dataOutWest(dataOutProc25West));
 
//PROCESSOR 26
system proc26(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe26),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe26),
	.rdNorth(rdProc26North),
	.emptyNorth(emptyProc26North),
	.dataInNorth(dataInProc26North),
	.wrNorth(wrProc26North),
	.fullNorth(fullProc26North),
	.dataOutNorth(dataOutProc26North),
	.rdSouth(rdProc26South),
	.emptySouth(emptyProc26South),
	.dataInSouth(dataInProc26South),
	.wrSouth(wrProc26South),
	.fullSouth(fullProc26South),
	.dataOutSouth(dataOutProc26South),
	.rdWest(rdProc26West),
	.emptyWest(emptyProc26West),
	.dataInWest(dataInProc26West),
	.wrWest(wrProc26West),
	.fullWest(fullProc26West),
	.dataOutWest(dataOutProc26West));
 
//PROCESSOR 27
system proc27(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe27),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe27),
	.wrNorth(wrProc27North),
	.fullNorth(fullProc27North),
	.dataOutNorth(dataOutProc27North),
	.rdNorth(rdProc27North),
	.emptyNorth(emptyProc27North),
	.dataInNorth(dataInProc27North),
	.rdSouth(rdProc27South),
	.emptySouth(emptyProc27South),
	.dataInSouth(dataInProc27South),
	.wrSouth(wrProc27South),
	.fullSouth(fullProc27South),
	.dataOutSouth(dataOutProc27South),
	.rdEast(rdProc27East),
	.emptyEast(emptyProc27East),
	.dataInEast(dataInProc27East),
	.wrEast(wrProc27East),
	.fullEast(fullProc27East),
	.dataOutEast(dataOutProc27East));
 
//PROCESSOR 28
system proc28(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe28),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe28),
	.rdNorth(rdProc28North),
	.emptyNorth(emptyProc28North),
	.dataInNorth(dataInProc28North),
	.wrNorth(wrProc28North),
	.fullNorth(fullProc28North),
	.dataOutNorth(dataOutProc28North),
	.rdSouth(rdProc28South),
	.emptySouth(emptyProc28South),
	.dataInSouth(dataInProc28South),
	.wrSouth(wrProc28South),
	.fullSouth(fullProc28South),
	.dataOutSouth(dataOutProc28South),
	.rdEast(rdProc28East),
	.emptyEast(emptyProc28East),
	.dataInEast(dataInProc28East),
	.wrEast(wrProc28East),
	.fullEast(fullProc28East),
	.dataOutEast(dataOutProc28East),
	.rdWest(rdProc28West),
	.emptyWest(emptyProc28West),
	.dataInWest(dataInProc28West),
	.wrWest(wrProc28West),
	.fullWest(fullProc28West),
	.dataOutWest(dataOutProc28West));
 
//PROCESSOR 29
system proc29(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe29),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe29),
	.rdNorth(rdProc29North),
	.emptyNorth(emptyProc29North),
	.dataInNorth(dataInProc29North),
	.wrNorth(wrProc29North),
	.fullNorth(fullProc29North),
	.dataOutNorth(dataOutProc29North),
	.rdSouth(rdProc29South),
	.emptySouth(emptyProc29South),
	.dataInSouth(dataInProc29South),
	.wrSouth(wrProc29South),
	.fullSouth(fullProc29South),
	.dataOutSouth(dataOutProc29South),
	.rdEast(rdProc29East),
	.emptyEast(emptyProc29East),
	.dataInEast(dataInProc29East),
	.wrEast(wrProc29East),
	.fullEast(fullProc29East),
	.dataOutEast(dataOutProc29East),
	.rdWest(rdProc29West),
	.emptyWest(emptyProc29West),
	.dataInWest(dataInProc29West),
	.wrWest(wrProc29West),
	.fullWest(fullProc29West),
	.dataOutWest(dataOutProc29West));
 
//PROCESSOR 30
system proc30(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe30),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe30),
	.rdNorth(rdProc30North),
	.emptyNorth(emptyProc30North),
	.dataInNorth(dataInProc30North),
	.wrNorth(wrProc30North),
	.fullNorth(fullProc30North),
	.dataOutNorth(dataOutProc30North),
	.rdSouth(rdProc30South),
	.emptySouth(emptyProc30South),
	.dataInSouth(dataInProc30South),
	.wrSouth(wrProc30South),
	.fullSouth(fullProc30South),
	.dataOutSouth(dataOutProc30South),
	.rdEast(rdProc30East),
	.emptyEast(emptyProc30East),
	.dataInEast(dataInProc30East),
	.wrEast(wrProc30East),
	.fullEast(fullProc30East),
	.dataOutEast(dataOutProc30East),
	.rdWest(rdProc30West),
	.emptyWest(emptyProc30West),
	.dataInWest(dataInProc30West),
	.wrWest(wrProc30West),
	.fullWest(fullProc30West),
	.dataOutWest(dataOutProc30West));
 
//PROCESSOR 31
system proc31(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe31),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe31),
	.rdNorth(rdProc31North),
	.emptyNorth(emptyProc31North),
	.dataInNorth(dataInProc31North),
	.wrNorth(wrProc31North),
	.fullNorth(fullProc31North),
	.dataOutNorth(dataOutProc31North),
	.rdSouth(rdProc31South),
	.emptySouth(emptyProc31South),
	.dataInSouth(dataInProc31South),
	.wrSouth(wrProc31South),
	.fullSouth(fullProc31South),
	.dataOutSouth(dataOutProc31South),
	.rdEast(rdProc31East),
	.emptyEast(emptyProc31East),
	.dataInEast(dataInProc31East),
	.wrEast(wrProc31East),
	.fullEast(fullProc31East),
	.dataOutEast(dataOutProc31East),
	.rdWest(rdProc31West),
	.emptyWest(emptyProc31West),
	.dataInWest(dataInProc31West),
	.wrWest(wrProc31West),
	.fullWest(fullProc31West),
	.dataOutWest(dataOutProc31West));
 
//PROCESSOR 32
system proc32(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe32),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe32),
	.rdNorth(rdProc32North),
	.emptyNorth(emptyProc32North),
	.dataInNorth(dataInProc32North),
	.wrNorth(wrProc32North),
	.fullNorth(fullProc32North),
	.dataOutNorth(dataOutProc32North),
	.rdSouth(rdProc32South),
	.emptySouth(emptyProc32South),
	.dataInSouth(dataInProc32South),
	.wrSouth(wrProc32South),
	.fullSouth(fullProc32South),
	.dataOutSouth(dataOutProc32South),
	.rdEast(rdProc32East),
	.emptyEast(emptyProc32East),
	.dataInEast(dataInProc32East),
	.wrEast(wrProc32East),
	.fullEast(fullProc32East),
	.dataOutEast(dataOutProc32East),
	.rdWest(rdProc32West),
	.emptyWest(emptyProc32West),
	.dataInWest(dataInProc32West),
	.wrWest(wrProc32West),
	.fullWest(fullProc32West),
	.dataOutWest(dataOutProc32West));
 
//PROCESSOR 33
system proc33(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe33),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe33),
	.rdNorth(rdProc33North),
	.emptyNorth(emptyProc33North),
	.dataInNorth(dataInProc33North),
	.wrNorth(wrProc33North),
	.fullNorth(fullProc33North),
	.dataOutNorth(dataOutProc33North),
	.rdSouth(rdProc33South),
	.emptySouth(emptyProc33South),
	.dataInSouth(dataInProc33South),
	.wrSouth(wrProc33South),
	.fullSouth(fullProc33South),
	.dataOutSouth(dataOutProc33South),
	.rdEast(rdProc33East),
	.emptyEast(emptyProc33East),
	.dataInEast(dataInProc33East),
	.wrEast(wrProc33East),
	.fullEast(fullProc33East),
	.dataOutEast(dataOutProc33East),
	.rdWest(rdProc33West),
	.emptyWest(emptyProc33West),
	.dataInWest(dataInProc33West),
	.wrWest(wrProc33West),
	.fullWest(fullProc33West),
	.dataOutWest(dataOutProc33West));
 
//PROCESSOR 34
system proc34(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe34),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe34),
	.rdNorth(rdProc34North),
	.emptyNorth(emptyProc34North),
	.dataInNorth(dataInProc34North),
	.wrNorth(wrProc34North),
	.fullNorth(fullProc34North),
	.dataOutNorth(dataOutProc34North),
	.rdSouth(rdProc34South),
	.emptySouth(emptyProc34South),
	.dataInSouth(dataInProc34South),
	.wrSouth(wrProc34South),
	.fullSouth(fullProc34South),
	.dataOutSouth(dataOutProc34South),
	.rdEast(rdProc34East),
	.emptyEast(emptyProc34East),
	.dataInEast(dataInProc34East),
	.wrEast(wrProc34East),
	.fullEast(fullProc34East),
	.dataOutEast(dataOutProc34East),
	.rdWest(rdProc34West),
	.emptyWest(emptyProc34West),
	.dataInWest(dataInProc34West),
	.wrWest(wrProc34West),
	.fullWest(fullProc34West),
	.dataOutWest(dataOutProc34West));
 
//PROCESSOR 35
system proc35(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe35),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe35),
	.rdNorth(rdProc35North),
	.emptyNorth(emptyProc35North),
	.dataInNorth(dataInProc35North),
	.wrNorth(wrProc35North),
	.fullNorth(fullProc35North),
	.dataOutNorth(dataOutProc35North),
	.rdSouth(rdProc35South),
	.emptySouth(emptyProc35South),
	.dataInSouth(dataInProc35South),
	.wrSouth(wrProc35South),
	.fullSouth(fullProc35South),
	.dataOutSouth(dataOutProc35South),
	.rdWest(rdProc35West),
	.emptyWest(emptyProc35West),
	.dataInWest(dataInProc35West),
	.wrWest(wrProc35West),
	.fullWest(fullProc35West),
	.dataOutWest(dataOutProc35West));
 
//PROCESSOR 36
system proc36(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe36),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe36),
	.wrNorth(wrProc36North),
	.fullNorth(fullProc36North),
	.dataOutNorth(dataOutProc36North),
	.rdNorth(rdProc36North),
	.emptyNorth(emptyProc36North),
	.dataInNorth(dataInProc36North),
	.rdSouth(rdProc36South),
	.emptySouth(emptyProc36South),
	.dataInSouth(dataInProc36South),
	.wrSouth(wrProc36South),
	.fullSouth(fullProc36South),
	.dataOutSouth(dataOutProc36South),
	.rdEast(rdProc36East),
	.emptyEast(emptyProc36East),
	.dataInEast(dataInProc36East),
	.wrEast(wrProc36East),
	.fullEast(fullProc36East),
	.dataOutEast(dataOutProc36East));
 
//PROCESSOR 37
system proc37(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe37),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe37),
	.rdNorth(rdProc37North),
	.emptyNorth(emptyProc37North),
	.dataInNorth(dataInProc37North),
	.wrNorth(wrProc37North),
	.fullNorth(fullProc37North),
	.dataOutNorth(dataOutProc37North),
	.rdSouth(rdProc37South),
	.emptySouth(emptyProc37South),
	.dataInSouth(dataInProc37South),
	.wrSouth(wrProc37South),
	.fullSouth(fullProc37South),
	.dataOutSouth(dataOutProc37South),
	.rdEast(rdProc37East),
	.emptyEast(emptyProc37East),
	.dataInEast(dataInProc37East),
	.wrEast(wrProc37East),
	.fullEast(fullProc37East),
	.dataOutEast(dataOutProc37East),
	.rdWest(rdProc37West),
	.emptyWest(emptyProc37West),
	.dataInWest(dataInProc37West),
	.wrWest(wrProc37West),
	.fullWest(fullProc37West),
	.dataOutWest(dataOutProc37West));
 
//PROCESSOR 38
system proc38(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe38),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe38),
	.rdNorth(rdProc38North),
	.emptyNorth(emptyProc38North),
	.dataInNorth(dataInProc38North),
	.wrNorth(wrProc38North),
	.fullNorth(fullProc38North),
	.dataOutNorth(dataOutProc38North),
	.rdSouth(rdProc38South),
	.emptySouth(emptyProc38South),
	.dataInSouth(dataInProc38South),
	.wrSouth(wrProc38South),
	.fullSouth(fullProc38South),
	.dataOutSouth(dataOutProc38South),
	.rdEast(rdProc38East),
	.emptyEast(emptyProc38East),
	.dataInEast(dataInProc38East),
	.wrEast(wrProc38East),
	.fullEast(fullProc38East),
	.dataOutEast(dataOutProc38East),
	.rdWest(rdProc38West),
	.emptyWest(emptyProc38West),
	.dataInWest(dataInProc38West),
	.wrWest(wrProc38West),
	.fullWest(fullProc38West),
	.dataOutWest(dataOutProc38West));
 
//PROCESSOR 39
system proc39(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe39),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe39),
	.rdNorth(rdProc39North),
	.emptyNorth(emptyProc39North),
	.dataInNorth(dataInProc39North),
	.wrNorth(wrProc39North),
	.fullNorth(fullProc39North),
	.dataOutNorth(dataOutProc39North),
	.rdSouth(rdProc39South),
	.emptySouth(emptyProc39South),
	.dataInSouth(dataInProc39South),
	.wrSouth(wrProc39South),
	.fullSouth(fullProc39South),
	.dataOutSouth(dataOutProc39South),
	.rdEast(rdProc39East),
	.emptyEast(emptyProc39East),
	.dataInEast(dataInProc39East),
	.wrEast(wrProc39East),
	.fullEast(fullProc39East),
	.dataOutEast(dataOutProc39East),
	.rdWest(rdProc39West),
	.emptyWest(emptyProc39West),
	.dataInWest(dataInProc39West),
	.wrWest(wrProc39West),
	.fullWest(fullProc39West),
	.dataOutWest(dataOutProc39West));
 
//PROCESSOR 40
system proc40(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe40),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe40),
	.rdNorth(rdProc40North),
	.emptyNorth(emptyProc40North),
	.dataInNorth(dataInProc40North),
	.wrNorth(wrProc40North),
	.fullNorth(fullProc40North),
	.dataOutNorth(dataOutProc40North),
	.rdSouth(rdProc40South),
	.emptySouth(emptyProc40South),
	.dataInSouth(dataInProc40South),
	.wrSouth(wrProc40South),
	.fullSouth(fullProc40South),
	.dataOutSouth(dataOutProc40South),
	.rdEast(rdProc40East),
	.emptyEast(emptyProc40East),
	.dataInEast(dataInProc40East),
	.wrEast(wrProc40East),
	.fullEast(fullProc40East),
	.dataOutEast(dataOutProc40East),
	.rdWest(rdProc40West),
	.emptyWest(emptyProc40West),
	.dataInWest(dataInProc40West),
	.wrWest(wrProc40West),
	.fullWest(fullProc40West),
	.dataOutWest(dataOutProc40West));
 
//PROCESSOR 41
system proc41(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe41),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe41),
	.rdNorth(rdProc41North),
	.emptyNorth(emptyProc41North),
	.dataInNorth(dataInProc41North),
	.wrNorth(wrProc41North),
	.fullNorth(fullProc41North),
	.dataOutNorth(dataOutProc41North),
	.rdSouth(rdProc41South),
	.emptySouth(emptyProc41South),
	.dataInSouth(dataInProc41South),
	.wrSouth(wrProc41South),
	.fullSouth(fullProc41South),
	.dataOutSouth(dataOutProc41South),
	.rdEast(rdProc41East),
	.emptyEast(emptyProc41East),
	.dataInEast(dataInProc41East),
	.wrEast(wrProc41East),
	.fullEast(fullProc41East),
	.dataOutEast(dataOutProc41East),
	.rdWest(rdProc41West),
	.emptyWest(emptyProc41West),
	.dataInWest(dataInProc41West),
	.wrWest(wrProc41West),
	.fullWest(fullProc41West),
	.dataOutWest(dataOutProc41West));
 
//PROCESSOR 42
system proc42(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe42),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe42),
	.rdNorth(rdProc42North),
	.emptyNorth(emptyProc42North),
	.dataInNorth(dataInProc42North),
	.wrNorth(wrProc42North),
	.fullNorth(fullProc42North),
	.dataOutNorth(dataOutProc42North),
	.rdSouth(rdProc42South),
	.emptySouth(emptyProc42South),
	.dataInSouth(dataInProc42South),
	.wrSouth(wrProc42South),
	.fullSouth(fullProc42South),
	.dataOutSouth(dataOutProc42South),
	.rdEast(rdProc42East),
	.emptyEast(emptyProc42East),
	.dataInEast(dataInProc42East),
	.wrEast(wrProc42East),
	.fullEast(fullProc42East),
	.dataOutEast(dataOutProc42East),
	.rdWest(rdProc42West),
	.emptyWest(emptyProc42West),
	.dataInWest(dataInProc42West),
	.wrWest(wrProc42West),
	.fullWest(fullProc42West),
	.dataOutWest(dataOutProc42West));
 
//PROCESSOR 43
system proc43(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe43),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe43),
	.rdNorth(rdProc43North),
	.emptyNorth(emptyProc43North),
	.dataInNorth(dataInProc43North),
	.wrNorth(wrProc43North),
	.fullNorth(fullProc43North),
	.dataOutNorth(dataOutProc43North),
	.rdSouth(rdProc43South),
	.emptySouth(emptyProc43South),
	.dataInSouth(dataInProc43South),
	.wrSouth(wrProc43South),
	.fullSouth(fullProc43South),
	.dataOutSouth(dataOutProc43South),
	.rdEast(rdProc43East),
	.emptyEast(emptyProc43East),
	.dataInEast(dataInProc43East),
	.wrEast(wrProc43East),
	.fullEast(fullProc43East),
	.dataOutEast(dataOutProc43East),
	.rdWest(rdProc43West),
	.emptyWest(emptyProc43West),
	.dataInWest(dataInProc43West),
	.wrWest(wrProc43West),
	.fullWest(fullProc43West),
	.dataOutWest(dataOutProc43West));
 
//PROCESSOR 44
system proc44(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe44),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe44),
	.rdNorth(rdProc44North),
	.emptyNorth(emptyProc44North),
	.dataInNorth(dataInProc44North),
	.wrNorth(wrProc44North),
	.fullNorth(fullProc44North),
	.dataOutNorth(dataOutProc44North),
	.rdSouth(rdProc44South),
	.emptySouth(emptyProc44South),
	.dataInSouth(dataInProc44South),
	.wrSouth(wrProc44South),
	.fullSouth(fullProc44South),
	.dataOutSouth(dataOutProc44South),
	.rdWest(rdProc44West),
	.emptyWest(emptyProc44West),
	.dataInWest(dataInProc44West),
	.wrWest(wrProc44West),
	.fullWest(fullProc44West),
	.dataOutWest(dataOutProc44West));
 
//PROCESSOR 45
system proc45(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe45),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe45),
	.wrNorth(wrProc45North),
	.fullNorth(fullProc45North),
	.dataOutNorth(dataOutProc45North),
	.rdNorth(rdProc45North),
	.emptyNorth(emptyProc45North),
	.dataInNorth(dataInProc45North),
	.rdSouth(rdProc45South),
	.emptySouth(emptyProc45South),
	.dataInSouth(dataInProc45South),
	.wrSouth(wrProc45South),
	.fullSouth(fullProc45South),
	.dataOutSouth(dataOutProc45South),
	.rdEast(rdProc45East),
	.emptyEast(emptyProc45East),
	.dataInEast(dataInProc45East),
	.wrEast(wrProc45East),
	.fullEast(fullProc45East),
	.dataOutEast(dataOutProc45East));
 
//PROCESSOR 46
system proc46(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe46),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe46),
	.rdNorth(rdProc46North),
	.emptyNorth(emptyProc46North),
	.dataInNorth(dataInProc46North),
	.wrNorth(wrProc46North),
	.fullNorth(fullProc46North),
	.dataOutNorth(dataOutProc46North),
	.rdSouth(rdProc46South),
	.emptySouth(emptyProc46South),
	.dataInSouth(dataInProc46South),
	.wrSouth(wrProc46South),
	.fullSouth(fullProc46South),
	.dataOutSouth(dataOutProc46South),
	.rdEast(rdProc46East),
	.emptyEast(emptyProc46East),
	.dataInEast(dataInProc46East),
	.wrEast(wrProc46East),
	.fullEast(fullProc46East),
	.dataOutEast(dataOutProc46East),
	.rdWest(rdProc46West),
	.emptyWest(emptyProc46West),
	.dataInWest(dataInProc46West),
	.wrWest(wrProc46West),
	.fullWest(fullProc46West),
	.dataOutWest(dataOutProc46West));
 
//PROCESSOR 47
system proc47(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe47),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe47),
	.rdNorth(rdProc47North),
	.emptyNorth(emptyProc47North),
	.dataInNorth(dataInProc47North),
	.wrNorth(wrProc47North),
	.fullNorth(fullProc47North),
	.dataOutNorth(dataOutProc47North),
	.rdSouth(rdProc47South),
	.emptySouth(emptyProc47South),
	.dataInSouth(dataInProc47South),
	.wrSouth(wrProc47South),
	.fullSouth(fullProc47South),
	.dataOutSouth(dataOutProc47South),
	.rdEast(rdProc47East),
	.emptyEast(emptyProc47East),
	.dataInEast(dataInProc47East),
	.wrEast(wrProc47East),
	.fullEast(fullProc47East),
	.dataOutEast(dataOutProc47East),
	.rdWest(rdProc47West),
	.emptyWest(emptyProc47West),
	.dataInWest(dataInProc47West),
	.wrWest(wrProc47West),
	.fullWest(fullProc47West),
	.dataOutWest(dataOutProc47West));
 
//PROCESSOR 48
system proc48(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe48),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe48),
	.rdNorth(rdProc48North),
	.emptyNorth(emptyProc48North),
	.dataInNorth(dataInProc48North),
	.wrNorth(wrProc48North),
	.fullNorth(fullProc48North),
	.dataOutNorth(dataOutProc48North),
	.rdSouth(rdProc48South),
	.emptySouth(emptyProc48South),
	.dataInSouth(dataInProc48South),
	.wrSouth(wrProc48South),
	.fullSouth(fullProc48South),
	.dataOutSouth(dataOutProc48South),
	.rdEast(rdProc48East),
	.emptyEast(emptyProc48East),
	.dataInEast(dataInProc48East),
	.wrEast(wrProc48East),
	.fullEast(fullProc48East),
	.dataOutEast(dataOutProc48East),
	.rdWest(rdProc48West),
	.emptyWest(emptyProc48West),
	.dataInWest(dataInProc48West),
	.wrWest(wrProc48West),
	.fullWest(fullProc48West),
	.dataOutWest(dataOutProc48West));
 
//PROCESSOR 49
system proc49(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe49),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe49),
	.rdNorth(rdProc49North),
	.emptyNorth(emptyProc49North),
	.dataInNorth(dataInProc49North),
	.wrNorth(wrProc49North),
	.fullNorth(fullProc49North),
	.dataOutNorth(dataOutProc49North),
	.rdSouth(rdProc49South),
	.emptySouth(emptyProc49South),
	.dataInSouth(dataInProc49South),
	.wrSouth(wrProc49South),
	.fullSouth(fullProc49South),
	.dataOutSouth(dataOutProc49South),
	.rdEast(rdProc49East),
	.emptyEast(emptyProc49East),
	.dataInEast(dataInProc49East),
	.wrEast(wrProc49East),
	.fullEast(fullProc49East),
	.dataOutEast(dataOutProc49East),
	.rdWest(rdProc49West),
	.emptyWest(emptyProc49West),
	.dataInWest(dataInProc49West),
	.wrWest(wrProc49West),
	.fullWest(fullProc49West),
	.dataOutWest(dataOutProc49West));
 
//PROCESSOR 50
system proc50(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe50),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe50),
	.rdNorth(rdProc50North),
	.emptyNorth(emptyProc50North),
	.dataInNorth(dataInProc50North),
	.wrNorth(wrProc50North),
	.fullNorth(fullProc50North),
	.dataOutNorth(dataOutProc50North),
	.rdSouth(rdProc50South),
	.emptySouth(emptyProc50South),
	.dataInSouth(dataInProc50South),
	.wrSouth(wrProc50South),
	.fullSouth(fullProc50South),
	.dataOutSouth(dataOutProc50South),
	.rdEast(rdProc50East),
	.emptyEast(emptyProc50East),
	.dataInEast(dataInProc50East),
	.wrEast(wrProc50East),
	.fullEast(fullProc50East),
	.dataOutEast(dataOutProc50East),
	.rdWest(rdProc50West),
	.emptyWest(emptyProc50West),
	.dataInWest(dataInProc50West),
	.wrWest(wrProc50West),
	.fullWest(fullProc50West),
	.dataOutWest(dataOutProc50West));
 
//PROCESSOR 51
system proc51(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe51),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe51),
	.rdNorth(rdProc51North),
	.emptyNorth(emptyProc51North),
	.dataInNorth(dataInProc51North),
	.wrNorth(wrProc51North),
	.fullNorth(fullProc51North),
	.dataOutNorth(dataOutProc51North),
	.rdSouth(rdProc51South),
	.emptySouth(emptyProc51South),
	.dataInSouth(dataInProc51South),
	.wrSouth(wrProc51South),
	.fullSouth(fullProc51South),
	.dataOutSouth(dataOutProc51South),
	.rdEast(rdProc51East),
	.emptyEast(emptyProc51East),
	.dataInEast(dataInProc51East),
	.wrEast(wrProc51East),
	.fullEast(fullProc51East),
	.dataOutEast(dataOutProc51East),
	.rdWest(rdProc51West),
	.emptyWest(emptyProc51West),
	.dataInWest(dataInProc51West),
	.wrWest(wrProc51West),
	.fullWest(fullProc51West),
	.dataOutWest(dataOutProc51West));
 
//PROCESSOR 52
system proc52(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe52),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe52),
	.rdNorth(rdProc52North),
	.emptyNorth(emptyProc52North),
	.dataInNorth(dataInProc52North),
	.wrNorth(wrProc52North),
	.fullNorth(fullProc52North),
	.dataOutNorth(dataOutProc52North),
	.rdSouth(rdProc52South),
	.emptySouth(emptyProc52South),
	.dataInSouth(dataInProc52South),
	.wrSouth(wrProc52South),
	.fullSouth(fullProc52South),
	.dataOutSouth(dataOutProc52South),
	.rdEast(rdProc52East),
	.emptyEast(emptyProc52East),
	.dataInEast(dataInProc52East),
	.wrEast(wrProc52East),
	.fullEast(fullProc52East),
	.dataOutEast(dataOutProc52East),
	.rdWest(rdProc52West),
	.emptyWest(emptyProc52West),
	.dataInWest(dataInProc52West),
	.wrWest(wrProc52West),
	.fullWest(fullProc52West),
	.dataOutWest(dataOutProc52West));
 
//PROCESSOR 53
system proc53(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe53),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe53),
	.rdNorth(rdProc53North),
	.emptyNorth(emptyProc53North),
	.dataInNorth(dataInProc53North),
	.wrNorth(wrProc53North),
	.fullNorth(fullProc53North),
	.dataOutNorth(dataOutProc53North),
	.rdSouth(rdProc53South),
	.emptySouth(emptyProc53South),
	.dataInSouth(dataInProc53South),
	.wrSouth(wrProc53South),
	.fullSouth(fullProc53South),
	.dataOutSouth(dataOutProc53South),
	.rdWest(rdProc53West),
	.emptyWest(emptyProc53West),
	.dataInWest(dataInProc53West),
	.wrWest(wrProc53West),
	.fullWest(fullProc53West),
	.dataOutWest(dataOutProc53West));
 
//PROCESSOR 54
system proc54(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe54),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe54),
	.wrNorth(wrProc54North),
	.fullNorth(fullProc54North),
	.dataOutNorth(dataOutProc54North),
	.rdNorth(rdProc54North),
	.emptyNorth(emptyProc54North),
	.dataInNorth(dataInProc54North),
	.rdSouth(rdProc54South),
	.emptySouth(emptyProc54South),
	.dataInSouth(dataInProc54South),
	.wrSouth(wrProc54South),
	.fullSouth(fullProc54South),
	.dataOutSouth(dataOutProc54South),
	.rdEast(rdProc54East),
	.emptyEast(emptyProc54East),
	.dataInEast(dataInProc54East),
	.wrEast(wrProc54East),
	.fullEast(fullProc54East),
	.dataOutEast(dataOutProc54East));
 
//PROCESSOR 55
system proc55(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe55),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe55),
	.rdNorth(rdProc55North),
	.emptyNorth(emptyProc55North),
	.dataInNorth(dataInProc55North),
	.wrNorth(wrProc55North),
	.fullNorth(fullProc55North),
	.dataOutNorth(dataOutProc55North),
	.rdSouth(rdProc55South),
	.emptySouth(emptyProc55South),
	.dataInSouth(dataInProc55South),
	.wrSouth(wrProc55South),
	.fullSouth(fullProc55South),
	.dataOutSouth(dataOutProc55South),
	.rdEast(rdProc55East),
	.emptyEast(emptyProc55East),
	.dataInEast(dataInProc55East),
	.wrEast(wrProc55East),
	.fullEast(fullProc55East),
	.dataOutEast(dataOutProc55East),
	.rdWest(rdProc55West),
	.emptyWest(emptyProc55West),
	.dataInWest(dataInProc55West),
	.wrWest(wrProc55West),
	.fullWest(fullProc55West),
	.dataOutWest(dataOutProc55West));
 
//PROCESSOR 56
system proc56(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe56),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe56),
	.rdNorth(rdProc56North),
	.emptyNorth(emptyProc56North),
	.dataInNorth(dataInProc56North),
	.wrNorth(wrProc56North),
	.fullNorth(fullProc56North),
	.dataOutNorth(dataOutProc56North),
	.rdSouth(rdProc56South),
	.emptySouth(emptyProc56South),
	.dataInSouth(dataInProc56South),
	.wrSouth(wrProc56South),
	.fullSouth(fullProc56South),
	.dataOutSouth(dataOutProc56South),
	.rdEast(rdProc56East),
	.emptyEast(emptyProc56East),
	.dataInEast(dataInProc56East),
	.wrEast(wrProc56East),
	.fullEast(fullProc56East),
	.dataOutEast(dataOutProc56East),
	.rdWest(rdProc56West),
	.emptyWest(emptyProc56West),
	.dataInWest(dataInProc56West),
	.wrWest(wrProc56West),
	.fullWest(fullProc56West),
	.dataOutWest(dataOutProc56West));
 
//PROCESSOR 57
system proc57(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe57),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe57),
	.rdNorth(rdProc57North),
	.emptyNorth(emptyProc57North),
	.dataInNorth(dataInProc57North),
	.wrNorth(wrProc57North),
	.fullNorth(fullProc57North),
	.dataOutNorth(dataOutProc57North),
	.rdSouth(rdProc57South),
	.emptySouth(emptyProc57South),
	.dataInSouth(dataInProc57South),
	.wrSouth(wrProc57South),
	.fullSouth(fullProc57South),
	.dataOutSouth(dataOutProc57South),
	.rdEast(rdProc57East),
	.emptyEast(emptyProc57East),
	.dataInEast(dataInProc57East),
	.wrEast(wrProc57East),
	.fullEast(fullProc57East),
	.dataOutEast(dataOutProc57East),
	.rdWest(rdProc57West),
	.emptyWest(emptyProc57West),
	.dataInWest(dataInProc57West),
	.wrWest(wrProc57West),
	.fullWest(fullProc57West),
	.dataOutWest(dataOutProc57West));
 
//PROCESSOR 58
system proc58(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe58),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe58),
	.rdNorth(rdProc58North),
	.emptyNorth(emptyProc58North),
	.dataInNorth(dataInProc58North),
	.wrNorth(wrProc58North),
	.fullNorth(fullProc58North),
	.dataOutNorth(dataOutProc58North),
	.rdSouth(rdProc58South),
	.emptySouth(emptyProc58South),
	.dataInSouth(dataInProc58South),
	.wrSouth(wrProc58South),
	.fullSouth(fullProc58South),
	.dataOutSouth(dataOutProc58South),
	.rdEast(rdProc58East),
	.emptyEast(emptyProc58East),
	.dataInEast(dataInProc58East),
	.wrEast(wrProc58East),
	.fullEast(fullProc58East),
	.dataOutEast(dataOutProc58East),
	.rdWest(rdProc58West),
	.emptyWest(emptyProc58West),
	.dataInWest(dataInProc58West),
	.wrWest(wrProc58West),
	.fullWest(fullProc58West),
	.dataOutWest(dataOutProc58West));
 
//PROCESSOR 59
system proc59(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe59),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe59),
	.rdNorth(rdProc59North),
	.emptyNorth(emptyProc59North),
	.dataInNorth(dataInProc59North),
	.wrNorth(wrProc59North),
	.fullNorth(fullProc59North),
	.dataOutNorth(dataOutProc59North),
	.rdSouth(rdProc59South),
	.emptySouth(emptyProc59South),
	.dataInSouth(dataInProc59South),
	.wrSouth(wrProc59South),
	.fullSouth(fullProc59South),
	.dataOutSouth(dataOutProc59South),
	.rdEast(rdProc59East),
	.emptyEast(emptyProc59East),
	.dataInEast(dataInProc59East),
	.wrEast(wrProc59East),
	.fullEast(fullProc59East),
	.dataOutEast(dataOutProc59East),
	.rdWest(rdProc59West),
	.emptyWest(emptyProc59West),
	.dataInWest(dataInProc59West),
	.wrWest(wrProc59West),
	.fullWest(fullProc59West),
	.dataOutWest(dataOutProc59West));
 
//PROCESSOR 60
system proc60(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe60),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe60),
	.rdNorth(rdProc60North),
	.emptyNorth(emptyProc60North),
	.dataInNorth(dataInProc60North),
	.wrNorth(wrProc60North),
	.fullNorth(fullProc60North),
	.dataOutNorth(dataOutProc60North),
	.rdSouth(rdProc60South),
	.emptySouth(emptyProc60South),
	.dataInSouth(dataInProc60South),
	.wrSouth(wrProc60South),
	.fullSouth(fullProc60South),
	.dataOutSouth(dataOutProc60South),
	.rdEast(rdProc60East),
	.emptyEast(emptyProc60East),
	.dataInEast(dataInProc60East),
	.wrEast(wrProc60East),
	.fullEast(fullProc60East),
	.dataOutEast(dataOutProc60East),
	.rdWest(rdProc60West),
	.emptyWest(emptyProc60West),
	.dataInWest(dataInProc60West),
	.wrWest(wrProc60West),
	.fullWest(fullProc60West),
	.dataOutWest(dataOutProc60West));
 
//PROCESSOR 61
system proc61(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe61),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe61),
	.rdNorth(rdProc61North),
	.emptyNorth(emptyProc61North),
	.dataInNorth(dataInProc61North),
	.wrNorth(wrProc61North),
	.fullNorth(fullProc61North),
	.dataOutNorth(dataOutProc61North),
	.rdSouth(rdProc61South),
	.emptySouth(emptyProc61South),
	.dataInSouth(dataInProc61South),
	.wrSouth(wrProc61South),
	.fullSouth(fullProc61South),
	.dataOutSouth(dataOutProc61South),
	.rdEast(rdProc61East),
	.emptyEast(emptyProc61East),
	.dataInEast(dataInProc61East),
	.wrEast(wrProc61East),
	.fullEast(fullProc61East),
	.dataOutEast(dataOutProc61East),
	.rdWest(rdProc61West),
	.emptyWest(emptyProc61West),
	.dataInWest(dataInProc61West),
	.wrWest(wrProc61West),
	.fullWest(fullProc61West),
	.dataOutWest(dataOutProc61West));
 
//PROCESSOR 62
system proc62(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe62),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe62),
	.rdNorth(rdProc62North),
	.emptyNorth(emptyProc62North),
	.dataInNorth(dataInProc62North),
	.wrNorth(wrProc62North),
	.fullNorth(fullProc62North),
	.dataOutNorth(dataOutProc62North),
	.rdSouth(rdProc62South),
	.emptySouth(emptyProc62South),
	.dataInSouth(dataInProc62South),
	.wrSouth(wrProc62South),
	.fullSouth(fullProc62South),
	.dataOutSouth(dataOutProc62South),
	.rdWest(rdProc62West),
	.emptyWest(emptyProc62West),
	.dataInWest(dataInProc62West),
	.wrWest(wrProc62West),
	.fullWest(fullProc62West),
	.dataOutWest(dataOutProc62West));
 
//PROCESSOR 63
system proc63(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe63),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe63),
	.wrNorth(wrProc63North),
	.fullNorth(fullProc63North),
	.dataOutNorth(dataOutProc63North),
	.rdNorth(rdProc63North),
	.emptyNorth(emptyProc63North),
	.dataInNorth(dataInProc63North),
	.rdSouth(rdProc63South),
	.emptySouth(emptyProc63South),
	.dataInSouth(dataInProc63South),
	.wrSouth(wrProc63South),
	.fullSouth(fullProc63South),
	.dataOutSouth(dataOutProc63South),
	.rdEast(rdProc63East),
	.emptyEast(emptyProc63East),
	.dataInEast(dataInProc63East),
	.wrEast(wrProc63East),
	.fullEast(fullProc63East),
	.dataOutEast(dataOutProc63East));
 
//PROCESSOR 64
system proc64(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe64),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe64),
	.rdNorth(rdProc64North),
	.emptyNorth(emptyProc64North),
	.dataInNorth(dataInProc64North),
	.wrNorth(wrProc64North),
	.fullNorth(fullProc64North),
	.dataOutNorth(dataOutProc64North),
	.rdSouth(rdProc64South),
	.emptySouth(emptyProc64South),
	.dataInSouth(dataInProc64South),
	.wrSouth(wrProc64South),
	.fullSouth(fullProc64South),
	.dataOutSouth(dataOutProc64South),
	.rdEast(rdProc64East),
	.emptyEast(emptyProc64East),
	.dataInEast(dataInProc64East),
	.wrEast(wrProc64East),
	.fullEast(fullProc64East),
	.dataOutEast(dataOutProc64East),
	.rdWest(rdProc64West),
	.emptyWest(emptyProc64West),
	.dataInWest(dataInProc64West),
	.wrWest(wrProc64West),
	.fullWest(fullProc64West),
	.dataOutWest(dataOutProc64West));
 
//PROCESSOR 65
system proc65(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe65),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe65),
	.rdNorth(rdProc65North),
	.emptyNorth(emptyProc65North),
	.dataInNorth(dataInProc65North),
	.wrNorth(wrProc65North),
	.fullNorth(fullProc65North),
	.dataOutNorth(dataOutProc65North),
	.rdSouth(rdProc65South),
	.emptySouth(emptyProc65South),
	.dataInSouth(dataInProc65South),
	.wrSouth(wrProc65South),
	.fullSouth(fullProc65South),
	.dataOutSouth(dataOutProc65South),
	.rdEast(rdProc65East),
	.emptyEast(emptyProc65East),
	.dataInEast(dataInProc65East),
	.wrEast(wrProc65East),
	.fullEast(fullProc65East),
	.dataOutEast(dataOutProc65East),
	.rdWest(rdProc65West),
	.emptyWest(emptyProc65West),
	.dataInWest(dataInProc65West),
	.wrWest(wrProc65West),
	.fullWest(fullProc65West),
	.dataOutWest(dataOutProc65West));
 
//PROCESSOR 66
system proc66(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe66),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe66),
	.rdNorth(rdProc66North),
	.emptyNorth(emptyProc66North),
	.dataInNorth(dataInProc66North),
	.wrNorth(wrProc66North),
	.fullNorth(fullProc66North),
	.dataOutNorth(dataOutProc66North),
	.rdSouth(rdProc66South),
	.emptySouth(emptyProc66South),
	.dataInSouth(dataInProc66South),
	.wrSouth(wrProc66South),
	.fullSouth(fullProc66South),
	.dataOutSouth(dataOutProc66South),
	.rdEast(rdProc66East),
	.emptyEast(emptyProc66East),
	.dataInEast(dataInProc66East),
	.wrEast(wrProc66East),
	.fullEast(fullProc66East),
	.dataOutEast(dataOutProc66East),
	.rdWest(rdProc66West),
	.emptyWest(emptyProc66West),
	.dataInWest(dataInProc66West),
	.wrWest(wrProc66West),
	.fullWest(fullProc66West),
	.dataOutWest(dataOutProc66West));
 
//PROCESSOR 67
system proc67(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe67),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe67),
	.rdNorth(rdProc67North),
	.emptyNorth(emptyProc67North),
	.dataInNorth(dataInProc67North),
	.wrNorth(wrProc67North),
	.fullNorth(fullProc67North),
	.dataOutNorth(dataOutProc67North),
	.rdSouth(rdProc67South),
	.emptySouth(emptyProc67South),
	.dataInSouth(dataInProc67South),
	.wrSouth(wrProc67South),
	.fullSouth(fullProc67South),
	.dataOutSouth(dataOutProc67South),
	.rdEast(rdProc67East),
	.emptyEast(emptyProc67East),
	.dataInEast(dataInProc67East),
	.wrEast(wrProc67East),
	.fullEast(fullProc67East),
	.dataOutEast(dataOutProc67East),
	.rdWest(rdProc67West),
	.emptyWest(emptyProc67West),
	.dataInWest(dataInProc67West),
	.wrWest(wrProc67West),
	.fullWest(fullProc67West),
	.dataOutWest(dataOutProc67West));
 
//PROCESSOR 68
system proc68(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe68),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe68),
	.rdNorth(rdProc68North),
	.emptyNorth(emptyProc68North),
	.dataInNorth(dataInProc68North),
	.wrNorth(wrProc68North),
	.fullNorth(fullProc68North),
	.dataOutNorth(dataOutProc68North),
	.rdSouth(rdProc68South),
	.emptySouth(emptyProc68South),
	.dataInSouth(dataInProc68South),
	.wrSouth(wrProc68South),
	.fullSouth(fullProc68South),
	.dataOutSouth(dataOutProc68South),
	.rdEast(rdProc68East),
	.emptyEast(emptyProc68East),
	.dataInEast(dataInProc68East),
	.wrEast(wrProc68East),
	.fullEast(fullProc68East),
	.dataOutEast(dataOutProc68East),
	.rdWest(rdProc68West),
	.emptyWest(emptyProc68West),
	.dataInWest(dataInProc68West),
	.wrWest(wrProc68West),
	.fullWest(fullProc68West),
	.dataOutWest(dataOutProc68West));
 
//PROCESSOR 69
system proc69(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe69),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe69),
	.rdNorth(rdProc69North),
	.emptyNorth(emptyProc69North),
	.dataInNorth(dataInProc69North),
	.wrNorth(wrProc69North),
	.fullNorth(fullProc69North),
	.dataOutNorth(dataOutProc69North),
	.rdSouth(rdProc69South),
	.emptySouth(emptyProc69South),
	.dataInSouth(dataInProc69South),
	.wrSouth(wrProc69South),
	.fullSouth(fullProc69South),
	.dataOutSouth(dataOutProc69South),
	.rdEast(rdProc69East),
	.emptyEast(emptyProc69East),
	.dataInEast(dataInProc69East),
	.wrEast(wrProc69East),
	.fullEast(fullProc69East),
	.dataOutEast(dataOutProc69East),
	.rdWest(rdProc69West),
	.emptyWest(emptyProc69West),
	.dataInWest(dataInProc69West),
	.wrWest(wrProc69West),
	.fullWest(fullProc69West),
	.dataOutWest(dataOutProc69West));
 
//PROCESSOR 70
system proc70(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe70),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe70),
	.rdNorth(rdProc70North),
	.emptyNorth(emptyProc70North),
	.dataInNorth(dataInProc70North),
	.wrNorth(wrProc70North),
	.fullNorth(fullProc70North),
	.dataOutNorth(dataOutProc70North),
	.rdSouth(rdProc70South),
	.emptySouth(emptyProc70South),
	.dataInSouth(dataInProc70South),
	.wrSouth(wrProc70South),
	.fullSouth(fullProc70South),
	.dataOutSouth(dataOutProc70South),
	.rdEast(rdProc70East),
	.emptyEast(emptyProc70East),
	.dataInEast(dataInProc70East),
	.wrEast(wrProc70East),
	.fullEast(fullProc70East),
	.dataOutEast(dataOutProc70East),
	.rdWest(rdProc70West),
	.emptyWest(emptyProc70West),
	.dataInWest(dataInProc70West),
	.wrWest(wrProc70West),
	.fullWest(fullProc70West),
	.dataOutWest(dataOutProc70West));
 
//PROCESSOR 71
system proc71(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe71),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe71),
	.rdNorth(rdProc71North),
	.emptyNorth(emptyProc71North),
	.dataInNorth(dataInProc71North),
	.wrNorth(wrProc71North),
	.fullNorth(fullProc71North),
	.dataOutNorth(dataOutProc71North),
	.rdSouth(rdProc71South),
	.emptySouth(emptyProc71South),
	.dataInSouth(dataInProc71South),
	.wrSouth(wrProc71South),
	.fullSouth(fullProc71South),
	.dataOutSouth(dataOutProc71South),
	.rdWest(rdProc71West),
	.emptyWest(emptyProc71West),
	.dataInWest(dataInProc71West),
	.wrWest(wrProc71West),
	.fullWest(fullProc71West),
	.dataOutWest(dataOutProc71West));
 
//PROCESSOR 72
system proc72(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe72),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe72),
	.rdNorth(rdProc72North),
	.emptyNorth(emptyProc72North),
	.dataInNorth(dataInProc72North),
	.wrNorth(wrProc72North),
	.fullNorth(fullProc72North),
	.dataOutNorth(dataOutProc72North),
	.rdEast(rdProc72East),
	.emptyEast(emptyProc72East),
	.dataInEast(dataInProc72East),
	.wrEast(wrProc72East),
	.fullEast(fullProc72East),
	.dataOutEast(dataOutProc72East));
 
//PROCESSOR 73
system proc73(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe73),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe73),
	.rdNorth(rdProc73North),
	.emptyNorth(emptyProc73North),
	.dataInNorth(dataInProc73North),
	.wrNorth(wrProc73North),
	.fullNorth(fullProc73North),
	.dataOutNorth(dataOutProc73North),
	.rdEast(rdProc73East),
	.emptyEast(emptyProc73East),
	.dataInEast(dataInProc73East),
	.wrEast(wrProc73East),
	.fullEast(fullProc73East),
	.dataOutEast(dataOutProc73East),
	.rdWest(rdProc73West),
	.emptyWest(emptyProc73West),
	.dataInWest(dataInProc73West),
	.wrWest(wrProc73West),
	.fullWest(fullProc73West),
	.dataOutWest(dataOutProc73West));
 
//PROCESSOR 74
system proc74(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe74),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe74),
	.rdNorth(rdProc74North),
	.emptyNorth(emptyProc74North),
	.dataInNorth(dataInProc74North),
	.wrNorth(wrProc74North),
	.fullNorth(fullProc74North),
	.dataOutNorth(dataOutProc74North),
	.rdEast(rdProc74East),
	.emptyEast(emptyProc74East),
	.dataInEast(dataInProc74East),
	.wrEast(wrProc74East),
	.fullEast(fullProc74East),
	.dataOutEast(dataOutProc74East),
	.rdWest(rdProc74West),
	.emptyWest(emptyProc74West),
	.dataInWest(dataInProc74West),
	.wrWest(wrProc74West),
	.fullWest(fullProc74West),
	.dataOutWest(dataOutProc74West));
 
//PROCESSOR 75
system proc75(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe75),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe75),
	.rdNorth(rdProc75North),
	.emptyNorth(emptyProc75North),
	.dataInNorth(dataInProc75North),
	.wrNorth(wrProc75North),
	.fullNorth(fullProc75North),
	.dataOutNorth(dataOutProc75North),
	.rdEast(rdProc75East),
	.emptyEast(emptyProc75East),
	.dataInEast(dataInProc75East),
	.wrEast(wrProc75East),
	.fullEast(fullProc75East),
	.dataOutEast(dataOutProc75East),
	.rdWest(rdProc75West),
	.emptyWest(emptyProc75West),
	.dataInWest(dataInProc75West),
	.wrWest(wrProc75West),
	.fullWest(fullProc75West),
	.dataOutWest(dataOutProc75West));
 
//PROCESSOR 76
system proc76(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe76),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe76),
	.rdNorth(rdProc76North),
	.emptyNorth(emptyProc76North),
	.dataInNorth(dataInProc76North),
	.wrNorth(wrProc76North),
	.fullNorth(fullProc76North),
	.dataOutNorth(dataOutProc76North),
	.rdEast(rdProc76East),
	.emptyEast(emptyProc76East),
	.dataInEast(dataInProc76East),
	.wrEast(wrProc76East),
	.fullEast(fullProc76East),
	.dataOutEast(dataOutProc76East),
	.rdWest(rdProc76West),
	.emptyWest(emptyProc76West),
	.dataInWest(dataInProc76West),
	.wrWest(wrProc76West),
	.fullWest(fullProc76West),
	.dataOutWest(dataOutProc76West));
 
//PROCESSOR 77
system proc77(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe77),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe77),
	.rdNorth(rdProc77North),
	.emptyNorth(emptyProc77North),
	.dataInNorth(dataInProc77North),
	.wrNorth(wrProc77North),
	.fullNorth(fullProc77North),
	.dataOutNorth(dataOutProc77North),
	.rdEast(rdProc77East),
	.emptyEast(emptyProc77East),
	.dataInEast(dataInProc77East),
	.wrEast(wrProc77East),
	.fullEast(fullProc77East),
	.dataOutEast(dataOutProc77East),
	.rdWest(rdProc77West),
	.emptyWest(emptyProc77West),
	.dataInWest(dataInProc77West),
	.wrWest(wrProc77West),
	.fullWest(fullProc77West),
	.dataOutWest(dataOutProc77West));
 
//PROCESSOR 78
system proc78(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe78),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe78),
	.rdNorth(rdProc78North),
	.emptyNorth(emptyProc78North),
	.dataInNorth(dataInProc78North),
	.wrNorth(wrProc78North),
	.fullNorth(fullProc78North),
	.dataOutNorth(dataOutProc78North),
	.rdEast(rdProc78East),
	.emptyEast(emptyProc78East),
	.dataInEast(dataInProc78East),
	.wrEast(wrProc78East),
	.fullEast(fullProc78East),
	.dataOutEast(dataOutProc78East),
	.rdWest(rdProc78West),
	.emptyWest(emptyProc78West),
	.dataInWest(dataInProc78West),
	.wrWest(wrProc78West),
	.fullWest(fullProc78West),
	.dataOutWest(dataOutProc78West));
 
//PROCESSOR 79
system proc79(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe79),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe79),
	.rdNorth(rdProc79North),
	.emptyNorth(emptyProc79North),
	.dataInNorth(dataInProc79North),
	.wrNorth(wrProc79North),
	.fullNorth(fullProc79North),
	.dataOutNorth(dataOutProc79North),
	.rdEast(rdProc79East),
	.emptyEast(emptyProc79East),
	.dataInEast(dataInProc79East),
	.wrEast(wrProc79East),
	.fullEast(fullProc79East),
	.dataOutEast(dataOutProc79East),
	.rdWest(rdProc79West),
	.emptyWest(emptyProc79West),
	.dataInWest(dataInProc79West),
	.wrWest(wrProc79West),
	.fullWest(fullProc79West),
	.dataOutWest(dataOutProc79West));
 
//PROCESSOR 80
system proc80(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe80),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe80),
	.rdNorth(rdProc80North),
	.emptyNorth(emptyProc80North),
	.dataInNorth(dataInProc80North),
	.wrNorth(wrProc80North),
	.fullNorth(fullProc80North),
	.dataOutNorth(dataOutProc80North),
	.wrWest(wrProc80West),
	.fullWest(fullProc80West),
	.dataOutWest(dataOutProc80West),
	.rdWest(rdProc80West),
	.emptyWest(emptyProc80West),
	.dataInWest(dataInProc80West));
	
	//FIFO 1 TO 0 
fifo fifo_proc1_to_proc0(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1West),
	.full(fullProc1West),
	.dataIn(dataOutProc1West),
	.rd(rdProc0East),
	.empty(emptyProc0East),
	.dataOut(dataInProc0East));
	
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
	
	//FIFO 3 TO 2 
fifo fifo_proc3_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3West),
	.full(fullProc3West),
	.dataIn(dataOutProc3West),
	.rd(rdProc2East),
	.empty(emptyProc2East),
	.dataOut(dataInProc2East));
	
	//FIFO 2 TO 3
fifo fifo_proc2_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2East),
	.full(fullProc2East),
	.dataIn(dataOutProc2East),
	.rd(rdProc3West),
	.empty(emptyProc3West),
	.dataOut(dataInProc3West));
	
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
	
	//FIFO 6 TO 5 
fifo fifo_proc6_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6West),
	.full(fullProc6West),
	.dataIn(dataOutProc6West),
	.rd(rdProc5East),
	.empty(emptyProc5East),
	.dataOut(dataInProc5East));
	
	//FIFO 5 TO 6
fifo fifo_proc5_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5East),
	.full(fullProc5East),
	.dataIn(dataOutProc5East),
	.rd(rdProc6West),
	.empty(emptyProc6West),
	.dataOut(dataInProc6West));
	
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

	//FIFO 9 TO 0 
fifo fifo_proc9_to_proc0(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9North),
	.full(fullProc9North),
	.dataIn(dataOutProc9North),
	.rd(rdProc0South),
	.empty(emptyProc0South),
	.dataOut(dataInProc0South));
	
	//FIFO 0 TO 9
fifo fifo_proc0_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc0South),
	.full(fullProc0South),
	.dataIn(dataOutProc0South),
	.rd(rdProc9North),
	.empty(emptyProc9North),
	.dataOut(dataInProc9North));

	//FIFO 10 TO 9 
fifo fifo_proc10_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10West),
	.full(fullProc10West),
	.dataIn(dataOutProc10West),
	.rd(rdProc9East),
	.empty(emptyProc9East),
	.dataOut(dataInProc9East));
	
	//FIFO 9 TO 10
fifo fifo_proc9_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9East),
	.full(fullProc9East),
	.dataIn(dataOutProc9East),
	.rd(rdProc10West),
	.empty(emptyProc10West),
	.dataOut(dataInProc10West));
	
	//FIFO 10 TO 1 
fifo fifo_proc10_to_proc1(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10North),
	.full(fullProc10North),
	.dataIn(dataOutProc10North),
	.rd(rdProc1South),
	.empty(emptyProc1South),
	.dataOut(dataInProc1South));
	
	//FIFO 1 TO 10
fifo fifo_proc1_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc1South),
	.full(fullProc1South),
	.dataIn(dataOutProc1South),
	.rd(rdProc10North),
	.empty(emptyProc10North),
	.dataOut(dataInProc10North));

	//FIFO 11 TO 10 
fifo fifo_proc11_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc11West),
	.full(fullProc11West),
	.dataIn(dataOutProc11West),
	.rd(rdProc10East),
	.empty(emptyProc10East),
	.dataOut(dataInProc10East));
	
	//FIFO 10 TO 11
fifo fifo_proc10_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10East),
	.full(fullProc10East),
	.dataIn(dataOutProc10East),
	.rd(rdProc11West),
	.empty(emptyProc11West),
	.dataOut(dataInProc11West));
	
	//FIFO 11 TO 2 
fifo fifo_proc11_to_proc2(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc11North),
	.full(fullProc11North),
	.dataIn(dataOutProc11North),
	.rd(rdProc2South),
	.empty(emptyProc2South),
	.dataOut(dataInProc2South));
	
	//FIFO 2 TO 11
fifo fifo_proc2_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc2South),
	.full(fullProc2South),
	.dataIn(dataOutProc2South),
	.rd(rdProc11North),
	.empty(emptyProc11North),
	.dataOut(dataInProc11North));

	//FIFO 12 TO 11 
fifo fifo_proc12_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc12West),
	.full(fullProc12West),
	.dataIn(dataOutProc12West),
	.rd(rdProc11East),
	.empty(emptyProc11East),
	.dataOut(dataInProc11East));
	
	//FIFO 11 TO 12
fifo fifo_proc11_to_proc12(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc11East),
	.full(fullProc11East),
	.dataIn(dataOutProc11East),
	.rd(rdProc12West),
	.empty(emptyProc12West),
	.dataOut(dataInProc12West));
	
	//FIFO 12 TO 3 
fifo fifo_proc12_to_proc3(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc12North),
	.full(fullProc12North),
	.dataIn(dataOutProc12North),
	.rd(rdProc3South),
	.empty(emptyProc3South),
	.dataOut(dataInProc3South));
	
	//FIFO 3 TO 12
fifo fifo_proc3_to_proc12(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc3South),
	.full(fullProc3South),
	.dataIn(dataOutProc3South),
	.rd(rdProc12North),
	.empty(emptyProc12North),
	.dataOut(dataInProc12North));

	//FIFO 13 TO 12 
fifo fifo_proc13_to_proc12(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc13West),
	.full(fullProc13West),
	.dataIn(dataOutProc13West),
	.rd(rdProc12East),
	.empty(emptyProc12East),
	.dataOut(dataInProc12East));
	
	//FIFO 12 TO 13
fifo fifo_proc12_to_proc13(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc12East),
	.full(fullProc12East),
	.dataIn(dataOutProc12East),
	.rd(rdProc13West),
	.empty(emptyProc13West),
	.dataOut(dataInProc13West));
	
	//FIFO 13 TO 4 
fifo fifo_proc13_to_proc4(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc13North),
	.full(fullProc13North),
	.dataIn(dataOutProc13North),
	.rd(rdProc4South),
	.empty(emptyProc4South),
	.dataOut(dataInProc4South));
	
	//FIFO 4 TO 13
fifo fifo_proc4_to_proc13(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc4South),
	.full(fullProc4South),
	.dataIn(dataOutProc4South),
	.rd(rdProc13North),
	.empty(emptyProc13North),
	.dataOut(dataInProc13North));

	//FIFO 14 TO 13 
fifo fifo_proc14_to_proc13(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc14West),
	.full(fullProc14West),
	.dataIn(dataOutProc14West),
	.rd(rdProc13East),
	.empty(emptyProc13East),
	.dataOut(dataInProc13East));
	
	//FIFO 13 TO 14
fifo fifo_proc13_to_proc14(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc13East),
	.full(fullProc13East),
	.dataIn(dataOutProc13East),
	.rd(rdProc14West),
	.empty(emptyProc14West),
	.dataOut(dataInProc14West));
	
	//FIFO 14 TO 5 
fifo fifo_proc14_to_proc5(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc14North),
	.full(fullProc14North),
	.dataIn(dataOutProc14North),
	.rd(rdProc5South),
	.empty(emptyProc5South),
	.dataOut(dataInProc5South));
	
	//FIFO 5 TO 14
fifo fifo_proc5_to_proc14(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc5South),
	.full(fullProc5South),
	.dataIn(dataOutProc5South),
	.rd(rdProc14North),
	.empty(emptyProc14North),
	.dataOut(dataInProc14North));

	//FIFO 15 TO 14 
fifo fifo_proc15_to_proc14(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc15West),
	.full(fullProc15West),
	.dataIn(dataOutProc15West),
	.rd(rdProc14East),
	.empty(emptyProc14East),
	.dataOut(dataInProc14East));
	
	//FIFO 14 TO 15
fifo fifo_proc14_to_proc15(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc14East),
	.full(fullProc14East),
	.dataIn(dataOutProc14East),
	.rd(rdProc15West),
	.empty(emptyProc15West),
	.dataOut(dataInProc15West));
	
	//FIFO 15 TO 6 
fifo fifo_proc15_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc15North),
	.full(fullProc15North),
	.dataIn(dataOutProc15North),
	.rd(rdProc6South),
	.empty(emptyProc6South),
	.dataOut(dataInProc6South));
	
	//FIFO 6 TO 15
fifo fifo_proc6_to_proc15(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6South),
	.full(fullProc6South),
	.dataIn(dataOutProc6South),
	.rd(rdProc15North),
	.empty(emptyProc15North),
	.dataOut(dataInProc15North));

	//FIFO 16 TO 15 
fifo fifo_proc16_to_proc15(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc16West),
	.full(fullProc16West),
	.dataIn(dataOutProc16West),
	.rd(rdProc15East),
	.empty(emptyProc15East),
	.dataOut(dataInProc15East));
	
	//FIFO 15 TO 16
fifo fifo_proc15_to_proc16(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc15East),
	.full(fullProc15East),
	.dataIn(dataOutProc15East),
	.rd(rdProc16West),
	.empty(emptyProc16West),
	.dataOut(dataInProc16West));
	
	//FIFO 16 TO 7 
fifo fifo_proc16_to_proc7(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc16North),
	.full(fullProc16North),
	.dataIn(dataOutProc16North),
	.rd(rdProc7South),
	.empty(emptyProc7South),
	.dataOut(dataInProc7South));
	
	//FIFO 7 TO 16
fifo fifo_proc7_to_proc16(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7South),
	.full(fullProc7South),
	.dataIn(dataOutProc7South),
	.rd(rdProc16North),
	.empty(emptyProc16North),
	.dataOut(dataInProc16North));

	//FIFO 17 TO 16 
fifo fifo_proc17_to_proc16(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc17West),
	.full(fullProc17West),
	.dataIn(dataOutProc17West),
	.rd(rdProc16East),
	.empty(emptyProc16East),
	.dataOut(dataInProc16East));
	
	//FIFO 16 TO 17
fifo fifo_proc16_to_proc17(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc16East),
	.full(fullProc16East),
	.dataIn(dataOutProc16East),
	.rd(rdProc17West),
	.empty(emptyProc17West),
	.dataOut(dataInProc17West));
	
	//FIFO 17 TO 8 
fifo fifo_proc17_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc17North),
	.full(fullProc17North),
	.dataIn(dataOutProc17North),
	.rd(rdProc8South),
	.empty(emptyProc8South),
	.dataOut(dataInProc8South));
	
	//FIFO 8 TO 17
fifo fifo_proc8_to_proc17(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc8South),
	.full(fullProc8South),
	.dataIn(dataOutProc8South),
	.rd(rdProc17North),
	.empty(emptyProc17North),
	.dataOut(dataInProc17North));

	//FIFO 18 TO 9 
fifo fifo_proc18_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc18North),
	.full(fullProc18North),
	.dataIn(dataOutProc18North),
	.rd(rdProc9South),
	.empty(emptyProc9South),
	.dataOut(dataInProc9South));
	
	//FIFO 9 TO 18
fifo fifo_proc9_to_proc18(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9South),
	.full(fullProc9South),
	.dataIn(dataOutProc9South),
	.rd(rdProc18North),
	.empty(emptyProc18North),
	.dataOut(dataInProc18North));

	//FIFO 19 TO 18 
fifo fifo_proc19_to_proc18(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc19West),
	.full(fullProc19West),
	.dataIn(dataOutProc19West),
	.rd(rdProc18East),
	.empty(emptyProc18East),
	.dataOut(dataInProc18East));
	
	//FIFO 18 TO 19
fifo fifo_proc18_to_proc19(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc18East),
	.full(fullProc18East),
	.dataIn(dataOutProc18East),
	.rd(rdProc19West),
	.empty(emptyProc19West),
	.dataOut(dataInProc19West));
	
	//FIFO 19 TO 10 
fifo fifo_proc19_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc19North),
	.full(fullProc19North),
	.dataIn(dataOutProc19North),
	.rd(rdProc10South),
	.empty(emptyProc10South),
	.dataOut(dataInProc10South));
	
	//FIFO 10 TO 19
fifo fifo_proc10_to_proc19(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10South),
	.full(fullProc10South),
	.dataIn(dataOutProc10South),
	.rd(rdProc19North),
	.empty(emptyProc19North),
	.dataOut(dataInProc19North));

	//FIFO 20 TO 19 
fifo fifo_proc20_to_proc19(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc20West),
	.full(fullProc20West),
	.dataIn(dataOutProc20West),
	.rd(rdProc19East),
	.empty(emptyProc19East),
	.dataOut(dataInProc19East));
	
	//FIFO 19 TO 20
fifo fifo_proc19_to_proc20(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc19East),
	.full(fullProc19East),
	.dataIn(dataOutProc19East),
	.rd(rdProc20West),
	.empty(emptyProc20West),
	.dataOut(dataInProc20West));
	
	//FIFO 20 TO 11 
fifo fifo_proc20_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc20North),
	.full(fullProc20North),
	.dataIn(dataOutProc20North),
	.rd(rdProc11South),
	.empty(emptyProc11South),
	.dataOut(dataInProc11South));
	
	//FIFO 11 TO 20
fifo fifo_proc11_to_proc20(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc11South),
	.full(fullProc11South),
	.dataIn(dataOutProc11South),
	.rd(rdProc20North),
	.empty(emptyProc20North),
	.dataOut(dataInProc20North));

	//FIFO 21 TO 20 
fifo fifo_proc21_to_proc20(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc21West),
	.full(fullProc21West),
	.dataIn(dataOutProc21West),
	.rd(rdProc20East),
	.empty(emptyProc20East),
	.dataOut(dataInProc20East));
	
	//FIFO 20 TO 21
fifo fifo_proc20_to_proc21(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc20East),
	.full(fullProc20East),
	.dataIn(dataOutProc20East),
	.rd(rdProc21West),
	.empty(emptyProc21West),
	.dataOut(dataInProc21West));
	
	//FIFO 21 TO 12 
fifo fifo_proc21_to_proc12(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc21North),
	.full(fullProc21North),
	.dataIn(dataOutProc21North),
	.rd(rdProc12South),
	.empty(emptyProc12South),
	.dataOut(dataInProc12South));
	
	//FIFO 12 TO 21
fifo fifo_proc12_to_proc21(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc12South),
	.full(fullProc12South),
	.dataIn(dataOutProc12South),
	.rd(rdProc21North),
	.empty(emptyProc21North),
	.dataOut(dataInProc21North));

	//FIFO 22 TO 21 
fifo fifo_proc22_to_proc21(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc22West),
	.full(fullProc22West),
	.dataIn(dataOutProc22West),
	.rd(rdProc21East),
	.empty(emptyProc21East),
	.dataOut(dataInProc21East));
	
	//FIFO 21 TO 22
fifo fifo_proc21_to_proc22(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc21East),
	.full(fullProc21East),
	.dataIn(dataOutProc21East),
	.rd(rdProc22West),
	.empty(emptyProc22West),
	.dataOut(dataInProc22West));
	
	//FIFO 22 TO 13 
fifo fifo_proc22_to_proc13(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc22North),
	.full(fullProc22North),
	.dataIn(dataOutProc22North),
	.rd(rdProc13South),
	.empty(emptyProc13South),
	.dataOut(dataInProc13South));
	
	//FIFO 13 TO 22
fifo fifo_proc13_to_proc22(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc13South),
	.full(fullProc13South),
	.dataIn(dataOutProc13South),
	.rd(rdProc22North),
	.empty(emptyProc22North),
	.dataOut(dataInProc22North));

	//FIFO 23 TO 22 
fifo fifo_proc23_to_proc22(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc23West),
	.full(fullProc23West),
	.dataIn(dataOutProc23West),
	.rd(rdProc22East),
	.empty(emptyProc22East),
	.dataOut(dataInProc22East));
	
	//FIFO 22 TO 23
fifo fifo_proc22_to_proc23(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc22East),
	.full(fullProc22East),
	.dataIn(dataOutProc22East),
	.rd(rdProc23West),
	.empty(emptyProc23West),
	.dataOut(dataInProc23West));
	
	//FIFO 23 TO 14 
fifo fifo_proc23_to_proc14(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc23North),
	.full(fullProc23North),
	.dataIn(dataOutProc23North),
	.rd(rdProc14South),
	.empty(emptyProc14South),
	.dataOut(dataInProc14South));
	
	//FIFO 14 TO 23
fifo fifo_proc14_to_proc23(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc14South),
	.full(fullProc14South),
	.dataIn(dataOutProc14South),
	.rd(rdProc23North),
	.empty(emptyProc23North),
	.dataOut(dataInProc23North));

	//FIFO 24 TO 23 
fifo fifo_proc24_to_proc23(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc24West),
	.full(fullProc24West),
	.dataIn(dataOutProc24West),
	.rd(rdProc23East),
	.empty(emptyProc23East),
	.dataOut(dataInProc23East));
	
	//FIFO 23 TO 24
fifo fifo_proc23_to_proc24(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc23East),
	.full(fullProc23East),
	.dataIn(dataOutProc23East),
	.rd(rdProc24West),
	.empty(emptyProc24West),
	.dataOut(dataInProc24West));
	
	//FIFO 24 TO 15 
fifo fifo_proc24_to_proc15(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc24North),
	.full(fullProc24North),
	.dataIn(dataOutProc24North),
	.rd(rdProc15South),
	.empty(emptyProc15South),
	.dataOut(dataInProc15South));
	
	//FIFO 15 TO 24
fifo fifo_proc15_to_proc24(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc15South),
	.full(fullProc15South),
	.dataIn(dataOutProc15South),
	.rd(rdProc24North),
	.empty(emptyProc24North),
	.dataOut(dataInProc24North));

	//FIFO 25 TO 24 
fifo fifo_proc25_to_proc24(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc25West),
	.full(fullProc25West),
	.dataIn(dataOutProc25West),
	.rd(rdProc24East),
	.empty(emptyProc24East),
	.dataOut(dataInProc24East));
	
	//FIFO 24 TO 25
fifo fifo_proc24_to_proc25(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc24East),
	.full(fullProc24East),
	.dataIn(dataOutProc24East),
	.rd(rdProc25West),
	.empty(emptyProc25West),
	.dataOut(dataInProc25West));
	
	//FIFO 25 TO 16 
fifo fifo_proc25_to_proc16(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc25North),
	.full(fullProc25North),
	.dataIn(dataOutProc25North),
	.rd(rdProc16South),
	.empty(emptyProc16South),
	.dataOut(dataInProc16South));
	
	//FIFO 16 TO 25
fifo fifo_proc16_to_proc25(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc16South),
	.full(fullProc16South),
	.dataIn(dataOutProc16South),
	.rd(rdProc25North),
	.empty(emptyProc25North),
	.dataOut(dataInProc25North));

	//FIFO 26 TO 25 
fifo fifo_proc26_to_proc25(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc26West),
	.full(fullProc26West),
	.dataIn(dataOutProc26West),
	.rd(rdProc25East),
	.empty(emptyProc25East),
	.dataOut(dataInProc25East));
	
	//FIFO 25 TO 26
fifo fifo_proc25_to_proc26(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc25East),
	.full(fullProc25East),
	.dataIn(dataOutProc25East),
	.rd(rdProc26West),
	.empty(emptyProc26West),
	.dataOut(dataInProc26West));
	
	//FIFO 26 TO 17 
fifo fifo_proc26_to_proc17(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc26North),
	.full(fullProc26North),
	.dataIn(dataOutProc26North),
	.rd(rdProc17South),
	.empty(emptyProc17South),
	.dataOut(dataInProc17South));
	
	//FIFO 17 TO 26
fifo fifo_proc17_to_proc26(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc17South),
	.full(fullProc17South),
	.dataIn(dataOutProc17South),
	.rd(rdProc26North),
	.empty(emptyProc26North),
	.dataOut(dataInProc26North));

	//FIFO 27 TO 18 
fifo fifo_proc27_to_proc18(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc27North),
	.full(fullProc27North),
	.dataIn(dataOutProc27North),
	.rd(rdProc18South),
	.empty(emptyProc18South),
	.dataOut(dataInProc18South));
	
	//FIFO 18 TO 27
fifo fifo_proc18_to_proc27(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc18South),
	.full(fullProc18South),
	.dataIn(dataOutProc18South),
	.rd(rdProc27North),
	.empty(emptyProc27North),
	.dataOut(dataInProc27North));

	//FIFO 28 TO 27 
fifo fifo_proc28_to_proc27(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc28West),
	.full(fullProc28West),
	.dataIn(dataOutProc28West),
	.rd(rdProc27East),
	.empty(emptyProc27East),
	.dataOut(dataInProc27East));
	
	//FIFO 27 TO 28
fifo fifo_proc27_to_proc28(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc27East),
	.full(fullProc27East),
	.dataIn(dataOutProc27East),
	.rd(rdProc28West),
	.empty(emptyProc28West),
	.dataOut(dataInProc28West));
	
	//FIFO 28 TO 19 
fifo fifo_proc28_to_proc19(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc28North),
	.full(fullProc28North),
	.dataIn(dataOutProc28North),
	.rd(rdProc19South),
	.empty(emptyProc19South),
	.dataOut(dataInProc19South));
	
	//FIFO 19 TO 28
fifo fifo_proc19_to_proc28(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc19South),
	.full(fullProc19South),
	.dataIn(dataOutProc19South),
	.rd(rdProc28North),
	.empty(emptyProc28North),
	.dataOut(dataInProc28North));

	//FIFO 29 TO 28 
fifo fifo_proc29_to_proc28(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc29West),
	.full(fullProc29West),
	.dataIn(dataOutProc29West),
	.rd(rdProc28East),
	.empty(emptyProc28East),
	.dataOut(dataInProc28East));
	
	//FIFO 28 TO 29
fifo fifo_proc28_to_proc29(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc28East),
	.full(fullProc28East),
	.dataIn(dataOutProc28East),
	.rd(rdProc29West),
	.empty(emptyProc29West),
	.dataOut(dataInProc29West));
	
	//FIFO 29 TO 20 
fifo fifo_proc29_to_proc20(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc29North),
	.full(fullProc29North),
	.dataIn(dataOutProc29North),
	.rd(rdProc20South),
	.empty(emptyProc20South),
	.dataOut(dataInProc20South));
	
	//FIFO 20 TO 29
fifo fifo_proc20_to_proc29(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc20South),
	.full(fullProc20South),
	.dataIn(dataOutProc20South),
	.rd(rdProc29North),
	.empty(emptyProc29North),
	.dataOut(dataInProc29North));

	//FIFO 30 TO 29 
fifo fifo_proc30_to_proc29(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc30West),
	.full(fullProc30West),
	.dataIn(dataOutProc30West),
	.rd(rdProc29East),
	.empty(emptyProc29East),
	.dataOut(dataInProc29East));
	
	//FIFO 29 TO 30
fifo fifo_proc29_to_proc30(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc29East),
	.full(fullProc29East),
	.dataIn(dataOutProc29East),
	.rd(rdProc30West),
	.empty(emptyProc30West),
	.dataOut(dataInProc30West));
	
	//FIFO 30 TO 21 
fifo fifo_proc30_to_proc21(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc30North),
	.full(fullProc30North),
	.dataIn(dataOutProc30North),
	.rd(rdProc21South),
	.empty(emptyProc21South),
	.dataOut(dataInProc21South));
	
	//FIFO 21 TO 30
fifo fifo_proc21_to_proc30(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc21South),
	.full(fullProc21South),
	.dataIn(dataOutProc21South),
	.rd(rdProc30North),
	.empty(emptyProc30North),
	.dataOut(dataInProc30North));

	//FIFO 31 TO 30 
fifo fifo_proc31_to_proc30(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc31West),
	.full(fullProc31West),
	.dataIn(dataOutProc31West),
	.rd(rdProc30East),
	.empty(emptyProc30East),
	.dataOut(dataInProc30East));
	
	//FIFO 30 TO 31
fifo fifo_proc30_to_proc31(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc30East),
	.full(fullProc30East),
	.dataIn(dataOutProc30East),
	.rd(rdProc31West),
	.empty(emptyProc31West),
	.dataOut(dataInProc31West));
	
	//FIFO 31 TO 22 
fifo fifo_proc31_to_proc22(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc31North),
	.full(fullProc31North),
	.dataIn(dataOutProc31North),
	.rd(rdProc22South),
	.empty(emptyProc22South),
	.dataOut(dataInProc22South));
	
	//FIFO 22 TO 31
fifo fifo_proc22_to_proc31(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc22South),
	.full(fullProc22South),
	.dataIn(dataOutProc22South),
	.rd(rdProc31North),
	.empty(emptyProc31North),
	.dataOut(dataInProc31North));

	//FIFO 32 TO 31 
fifo fifo_proc32_to_proc31(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc32West),
	.full(fullProc32West),
	.dataIn(dataOutProc32West),
	.rd(rdProc31East),
	.empty(emptyProc31East),
	.dataOut(dataInProc31East));
	
	//FIFO 31 TO 32
fifo fifo_proc31_to_proc32(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc31East),
	.full(fullProc31East),
	.dataIn(dataOutProc31East),
	.rd(rdProc32West),
	.empty(emptyProc32West),
	.dataOut(dataInProc32West));
	
	//FIFO 32 TO 23 
fifo fifo_proc32_to_proc23(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc32North),
	.full(fullProc32North),
	.dataIn(dataOutProc32North),
	.rd(rdProc23South),
	.empty(emptyProc23South),
	.dataOut(dataInProc23South));
	
	//FIFO 23 TO 32
fifo fifo_proc23_to_proc32(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc23South),
	.full(fullProc23South),
	.dataIn(dataOutProc23South),
	.rd(rdProc32North),
	.empty(emptyProc32North),
	.dataOut(dataInProc32North));

	//FIFO 33 TO 32 
fifo fifo_proc33_to_proc32(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc33West),
	.full(fullProc33West),
	.dataIn(dataOutProc33West),
	.rd(rdProc32East),
	.empty(emptyProc32East),
	.dataOut(dataInProc32East));
	
	//FIFO 32 TO 33
fifo fifo_proc32_to_proc33(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc32East),
	.full(fullProc32East),
	.dataIn(dataOutProc32East),
	.rd(rdProc33West),
	.empty(emptyProc33West),
	.dataOut(dataInProc33West));
	
	//FIFO 33 TO 24 
fifo fifo_proc33_to_proc24(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc33North),
	.full(fullProc33North),
	.dataIn(dataOutProc33North),
	.rd(rdProc24South),
	.empty(emptyProc24South),
	.dataOut(dataInProc24South));
	
	//FIFO 24 TO 33
fifo fifo_proc24_to_proc33(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc24South),
	.full(fullProc24South),
	.dataIn(dataOutProc24South),
	.rd(rdProc33North),
	.empty(emptyProc33North),
	.dataOut(dataInProc33North));

	//FIFO 34 TO 33 
fifo fifo_proc34_to_proc33(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc34West),
	.full(fullProc34West),
	.dataIn(dataOutProc34West),
	.rd(rdProc33East),
	.empty(emptyProc33East),
	.dataOut(dataInProc33East));
	
	//FIFO 33 TO 34
fifo fifo_proc33_to_proc34(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc33East),
	.full(fullProc33East),
	.dataIn(dataOutProc33East),
	.rd(rdProc34West),
	.empty(emptyProc34West),
	.dataOut(dataInProc34West));
	
	//FIFO 34 TO 25 
fifo fifo_proc34_to_proc25(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc34North),
	.full(fullProc34North),
	.dataIn(dataOutProc34North),
	.rd(rdProc25South),
	.empty(emptyProc25South),
	.dataOut(dataInProc25South));
	
	//FIFO 25 TO 34
fifo fifo_proc25_to_proc34(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc25South),
	.full(fullProc25South),
	.dataIn(dataOutProc25South),
	.rd(rdProc34North),
	.empty(emptyProc34North),
	.dataOut(dataInProc34North));

	//FIFO 35 TO 34 
fifo fifo_proc35_to_proc34(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc35West),
	.full(fullProc35West),
	.dataIn(dataOutProc35West),
	.rd(rdProc34East),
	.empty(emptyProc34East),
	.dataOut(dataInProc34East));
	
	//FIFO 34 TO 35
fifo fifo_proc34_to_proc35(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc34East),
	.full(fullProc34East),
	.dataIn(dataOutProc34East),
	.rd(rdProc35West),
	.empty(emptyProc35West),
	.dataOut(dataInProc35West));
	
	//FIFO 35 TO 26 
fifo fifo_proc35_to_proc26(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc35North),
	.full(fullProc35North),
	.dataIn(dataOutProc35North),
	.rd(rdProc26South),
	.empty(emptyProc26South),
	.dataOut(dataInProc26South));
	
	//FIFO 26 TO 35
fifo fifo_proc26_to_proc35(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc26South),
	.full(fullProc26South),
	.dataIn(dataOutProc26South),
	.rd(rdProc35North),
	.empty(emptyProc35North),
	.dataOut(dataInProc35North));

	//FIFO 36 TO 27 
fifo fifo_proc36_to_proc27(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc36North),
	.full(fullProc36North),
	.dataIn(dataOutProc36North),
	.rd(rdProc27South),
	.empty(emptyProc27South),
	.dataOut(dataInProc27South));
	
	//FIFO 27 TO 36
fifo fifo_proc27_to_proc36(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc27South),
	.full(fullProc27South),
	.dataIn(dataOutProc27South),
	.rd(rdProc36North),
	.empty(emptyProc36North),
	.dataOut(dataInProc36North));

	//FIFO 37 TO 36 
fifo fifo_proc37_to_proc36(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc37West),
	.full(fullProc37West),
	.dataIn(dataOutProc37West),
	.rd(rdProc36East),
	.empty(emptyProc36East),
	.dataOut(dataInProc36East));
	
	//FIFO 36 TO 37
fifo fifo_proc36_to_proc37(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc36East),
	.full(fullProc36East),
	.dataIn(dataOutProc36East),
	.rd(rdProc37West),
	.empty(emptyProc37West),
	.dataOut(dataInProc37West));
	
	//FIFO 37 TO 28 
fifo fifo_proc37_to_proc28(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc37North),
	.full(fullProc37North),
	.dataIn(dataOutProc37North),
	.rd(rdProc28South),
	.empty(emptyProc28South),
	.dataOut(dataInProc28South));
	
	//FIFO 28 TO 37
fifo fifo_proc28_to_proc37(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc28South),
	.full(fullProc28South),
	.dataIn(dataOutProc28South),
	.rd(rdProc37North),
	.empty(emptyProc37North),
	.dataOut(dataInProc37North));

	//FIFO 38 TO 37 
fifo fifo_proc38_to_proc37(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc38West),
	.full(fullProc38West),
	.dataIn(dataOutProc38West),
	.rd(rdProc37East),
	.empty(emptyProc37East),
	.dataOut(dataInProc37East));
	
	//FIFO 37 TO 38
fifo fifo_proc37_to_proc38(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc37East),
	.full(fullProc37East),
	.dataIn(dataOutProc37East),
	.rd(rdProc38West),
	.empty(emptyProc38West),
	.dataOut(dataInProc38West));
	
	//FIFO 38 TO 29 
fifo fifo_proc38_to_proc29(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc38North),
	.full(fullProc38North),
	.dataIn(dataOutProc38North),
	.rd(rdProc29South),
	.empty(emptyProc29South),
	.dataOut(dataInProc29South));
	
	//FIFO 29 TO 38
fifo fifo_proc29_to_proc38(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc29South),
	.full(fullProc29South),
	.dataIn(dataOutProc29South),
	.rd(rdProc38North),
	.empty(emptyProc38North),
	.dataOut(dataInProc38North));

	//FIFO 39 TO 38 
fifo fifo_proc39_to_proc38(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc39West),
	.full(fullProc39West),
	.dataIn(dataOutProc39West),
	.rd(rdProc38East),
	.empty(emptyProc38East),
	.dataOut(dataInProc38East));
	
	//FIFO 38 TO 39
fifo fifo_proc38_to_proc39(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc38East),
	.full(fullProc38East),
	.dataIn(dataOutProc38East),
	.rd(rdProc39West),
	.empty(emptyProc39West),
	.dataOut(dataInProc39West));
	
	//FIFO 39 TO 30 
fifo fifo_proc39_to_proc30(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc39North),
	.full(fullProc39North),
	.dataIn(dataOutProc39North),
	.rd(rdProc30South),
	.empty(emptyProc30South),
	.dataOut(dataInProc30South));
	
	//FIFO 30 TO 39
fifo fifo_proc30_to_proc39(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc30South),
	.full(fullProc30South),
	.dataIn(dataOutProc30South),
	.rd(rdProc39North),
	.empty(emptyProc39North),
	.dataOut(dataInProc39North));

	//FIFO 40 TO 39 
fifo fifo_proc40_to_proc39(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc40West),
	.full(fullProc40West),
	.dataIn(dataOutProc40West),
	.rd(rdProc39East),
	.empty(emptyProc39East),
	.dataOut(dataInProc39East));
	
	//FIFO 39 TO 40
fifo fifo_proc39_to_proc40(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc39East),
	.full(fullProc39East),
	.dataIn(dataOutProc39East),
	.rd(rdProc40West),
	.empty(emptyProc40West),
	.dataOut(dataInProc40West));
	
	//FIFO 40 TO 31 
fifo fifo_proc40_to_proc31(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc40North),
	.full(fullProc40North),
	.dataIn(dataOutProc40North),
	.rd(rdProc31South),
	.empty(emptyProc31South),
	.dataOut(dataInProc31South));
	
	//FIFO 31 TO 40
fifo fifo_proc31_to_proc40(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc31South),
	.full(fullProc31South),
	.dataIn(dataOutProc31South),
	.rd(rdProc40North),
	.empty(emptyProc40North),
	.dataOut(dataInProc40North));

	//FIFO 41 TO 40 
fifo fifo_proc41_to_proc40(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc41West),
	.full(fullProc41West),
	.dataIn(dataOutProc41West),
	.rd(rdProc40East),
	.empty(emptyProc40East),
	.dataOut(dataInProc40East));
	
	//FIFO 40 TO 41
fifo fifo_proc40_to_proc41(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc40East),
	.full(fullProc40East),
	.dataIn(dataOutProc40East),
	.rd(rdProc41West),
	.empty(emptyProc41West),
	.dataOut(dataInProc41West));
	
	//FIFO 41 TO 32 
fifo fifo_proc41_to_proc32(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc41North),
	.full(fullProc41North),
	.dataIn(dataOutProc41North),
	.rd(rdProc32South),
	.empty(emptyProc32South),
	.dataOut(dataInProc32South));
	
	//FIFO 32 TO 41
fifo fifo_proc32_to_proc41(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc32South),
	.full(fullProc32South),
	.dataIn(dataOutProc32South),
	.rd(rdProc41North),
	.empty(emptyProc41North),
	.dataOut(dataInProc41North));

	//FIFO 42 TO 41 
fifo fifo_proc42_to_proc41(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc42West),
	.full(fullProc42West),
	.dataIn(dataOutProc42West),
	.rd(rdProc41East),
	.empty(emptyProc41East),
	.dataOut(dataInProc41East));
	
	//FIFO 41 TO 42
fifo fifo_proc41_to_proc42(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc41East),
	.full(fullProc41East),
	.dataIn(dataOutProc41East),
	.rd(rdProc42West),
	.empty(emptyProc42West),
	.dataOut(dataInProc42West));
	
	//FIFO 42 TO 33 
fifo fifo_proc42_to_proc33(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc42North),
	.full(fullProc42North),
	.dataIn(dataOutProc42North),
	.rd(rdProc33South),
	.empty(emptyProc33South),
	.dataOut(dataInProc33South));
	
	//FIFO 33 TO 42
fifo fifo_proc33_to_proc42(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc33South),
	.full(fullProc33South),
	.dataIn(dataOutProc33South),
	.rd(rdProc42North),
	.empty(emptyProc42North),
	.dataOut(dataInProc42North));

	//FIFO 43 TO 42 
fifo fifo_proc43_to_proc42(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc43West),
	.full(fullProc43West),
	.dataIn(dataOutProc43West),
	.rd(rdProc42East),
	.empty(emptyProc42East),
	.dataOut(dataInProc42East));
	
	//FIFO 42 TO 43
fifo fifo_proc42_to_proc43(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc42East),
	.full(fullProc42East),
	.dataIn(dataOutProc42East),
	.rd(rdProc43West),
	.empty(emptyProc43West),
	.dataOut(dataInProc43West));
	
	//FIFO 43 TO 34 
fifo fifo_proc43_to_proc34(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc43North),
	.full(fullProc43North),
	.dataIn(dataOutProc43North),
	.rd(rdProc34South),
	.empty(emptyProc34South),
	.dataOut(dataInProc34South));
	
	//FIFO 34 TO 43
fifo fifo_proc34_to_proc43(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc34South),
	.full(fullProc34South),
	.dataIn(dataOutProc34South),
	.rd(rdProc43North),
	.empty(emptyProc43North),
	.dataOut(dataInProc43North));

	//FIFO 44 TO 43 
fifo fifo_proc44_to_proc43(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc44West),
	.full(fullProc44West),
	.dataIn(dataOutProc44West),
	.rd(rdProc43East),
	.empty(emptyProc43East),
	.dataOut(dataInProc43East));
	
	//FIFO 43 TO 44
fifo fifo_proc43_to_proc44(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc43East),
	.full(fullProc43East),
	.dataIn(dataOutProc43East),
	.rd(rdProc44West),
	.empty(emptyProc44West),
	.dataOut(dataInProc44West));
	
	//FIFO 44 TO 35 
fifo fifo_proc44_to_proc35(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc44North),
	.full(fullProc44North),
	.dataIn(dataOutProc44North),
	.rd(rdProc35South),
	.empty(emptyProc35South),
	.dataOut(dataInProc35South));
	
	//FIFO 35 TO 44
fifo fifo_proc35_to_proc44(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc35South),
	.full(fullProc35South),
	.dataIn(dataOutProc35South),
	.rd(rdProc44North),
	.empty(emptyProc44North),
	.dataOut(dataInProc44North));

	//FIFO 45 TO 36 
fifo fifo_proc45_to_proc36(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc45North),
	.full(fullProc45North),
	.dataIn(dataOutProc45North),
	.rd(rdProc36South),
	.empty(emptyProc36South),
	.dataOut(dataInProc36South));
	
	//FIFO 36 TO 45
fifo fifo_proc36_to_proc45(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc36South),
	.full(fullProc36South),
	.dataIn(dataOutProc36South),
	.rd(rdProc45North),
	.empty(emptyProc45North),
	.dataOut(dataInProc45North));

	//FIFO 46 TO 45 
fifo fifo_proc46_to_proc45(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc46West),
	.full(fullProc46West),
	.dataIn(dataOutProc46West),
	.rd(rdProc45East),
	.empty(emptyProc45East),
	.dataOut(dataInProc45East));
	
	//FIFO 45 TO 46
fifo fifo_proc45_to_proc46(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc45East),
	.full(fullProc45East),
	.dataIn(dataOutProc45East),
	.rd(rdProc46West),
	.empty(emptyProc46West),
	.dataOut(dataInProc46West));
	
	//FIFO 46 TO 37 
fifo fifo_proc46_to_proc37(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc46North),
	.full(fullProc46North),
	.dataIn(dataOutProc46North),
	.rd(rdProc37South),
	.empty(emptyProc37South),
	.dataOut(dataInProc37South));
	
	//FIFO 37 TO 46
fifo fifo_proc37_to_proc46(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc37South),
	.full(fullProc37South),
	.dataIn(dataOutProc37South),
	.rd(rdProc46North),
	.empty(emptyProc46North),
	.dataOut(dataInProc46North));

	//FIFO 47 TO 46 
fifo fifo_proc47_to_proc46(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc47West),
	.full(fullProc47West),
	.dataIn(dataOutProc47West),
	.rd(rdProc46East),
	.empty(emptyProc46East),
	.dataOut(dataInProc46East));
	
	//FIFO 46 TO 47
fifo fifo_proc46_to_proc47(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc46East),
	.full(fullProc46East),
	.dataIn(dataOutProc46East),
	.rd(rdProc47West),
	.empty(emptyProc47West),
	.dataOut(dataInProc47West));
	
	//FIFO 47 TO 38 
fifo fifo_proc47_to_proc38(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc47North),
	.full(fullProc47North),
	.dataIn(dataOutProc47North),
	.rd(rdProc38South),
	.empty(emptyProc38South),
	.dataOut(dataInProc38South));
	
	//FIFO 38 TO 47
fifo fifo_proc38_to_proc47(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc38South),
	.full(fullProc38South),
	.dataIn(dataOutProc38South),
	.rd(rdProc47North),
	.empty(emptyProc47North),
	.dataOut(dataInProc47North));

	//FIFO 48 TO 47 
fifo fifo_proc48_to_proc47(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc48West),
	.full(fullProc48West),
	.dataIn(dataOutProc48West),
	.rd(rdProc47East),
	.empty(emptyProc47East),
	.dataOut(dataInProc47East));
	
	//FIFO 47 TO 48
fifo fifo_proc47_to_proc48(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc47East),
	.full(fullProc47East),
	.dataIn(dataOutProc47East),
	.rd(rdProc48West),
	.empty(emptyProc48West),
	.dataOut(dataInProc48West));
	
	//FIFO 48 TO 39 
fifo fifo_proc48_to_proc39(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc48North),
	.full(fullProc48North),
	.dataIn(dataOutProc48North),
	.rd(rdProc39South),
	.empty(emptyProc39South),
	.dataOut(dataInProc39South));
	
	//FIFO 39 TO 48
fifo fifo_proc39_to_proc48(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc39South),
	.full(fullProc39South),
	.dataIn(dataOutProc39South),
	.rd(rdProc48North),
	.empty(emptyProc48North),
	.dataOut(dataInProc48North));

	//FIFO 49 TO 48 
fifo fifo_proc49_to_proc48(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc49West),
	.full(fullProc49West),
	.dataIn(dataOutProc49West),
	.rd(rdProc48East),
	.empty(emptyProc48East),
	.dataOut(dataInProc48East));
	
	//FIFO 48 TO 49
fifo fifo_proc48_to_proc49(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc48East),
	.full(fullProc48East),
	.dataIn(dataOutProc48East),
	.rd(rdProc49West),
	.empty(emptyProc49West),
	.dataOut(dataInProc49West));
	
	//FIFO 49 TO 40 
fifo fifo_proc49_to_proc40(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc49North),
	.full(fullProc49North),
	.dataIn(dataOutProc49North),
	.rd(rdProc40South),
	.empty(emptyProc40South),
	.dataOut(dataInProc40South));
	
	//FIFO 40 TO 49
fifo fifo_proc40_to_proc49(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc40South),
	.full(fullProc40South),
	.dataIn(dataOutProc40South),
	.rd(rdProc49North),
	.empty(emptyProc49North),
	.dataOut(dataInProc49North));

	//FIFO 50 TO 49 
fifo fifo_proc50_to_proc49(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc50West),
	.full(fullProc50West),
	.dataIn(dataOutProc50West),
	.rd(rdProc49East),
	.empty(emptyProc49East),
	.dataOut(dataInProc49East));
	
	//FIFO 49 TO 50
fifo fifo_proc49_to_proc50(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc49East),
	.full(fullProc49East),
	.dataIn(dataOutProc49East),
	.rd(rdProc50West),
	.empty(emptyProc50West),
	.dataOut(dataInProc50West));
	
	//FIFO 50 TO 41 
fifo fifo_proc50_to_proc41(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc50North),
	.full(fullProc50North),
	.dataIn(dataOutProc50North),
	.rd(rdProc41South),
	.empty(emptyProc41South),
	.dataOut(dataInProc41South));
	
	//FIFO 41 TO 50
fifo fifo_proc41_to_proc50(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc41South),
	.full(fullProc41South),
	.dataIn(dataOutProc41South),
	.rd(rdProc50North),
	.empty(emptyProc50North),
	.dataOut(dataInProc50North));

	//FIFO 51 TO 50 
fifo fifo_proc51_to_proc50(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc51West),
	.full(fullProc51West),
	.dataIn(dataOutProc51West),
	.rd(rdProc50East),
	.empty(emptyProc50East),
	.dataOut(dataInProc50East));
	
	//FIFO 50 TO 51
fifo fifo_proc50_to_proc51(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc50East),
	.full(fullProc50East),
	.dataIn(dataOutProc50East),
	.rd(rdProc51West),
	.empty(emptyProc51West),
	.dataOut(dataInProc51West));
	
	//FIFO 51 TO 42 
fifo fifo_proc51_to_proc42(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc51North),
	.full(fullProc51North),
	.dataIn(dataOutProc51North),
	.rd(rdProc42South),
	.empty(emptyProc42South),
	.dataOut(dataInProc42South));
	
	//FIFO 42 TO 51
fifo fifo_proc42_to_proc51(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc42South),
	.full(fullProc42South),
	.dataIn(dataOutProc42South),
	.rd(rdProc51North),
	.empty(emptyProc51North),
	.dataOut(dataInProc51North));

	//FIFO 52 TO 51 
fifo fifo_proc52_to_proc51(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc52West),
	.full(fullProc52West),
	.dataIn(dataOutProc52West),
	.rd(rdProc51East),
	.empty(emptyProc51East),
	.dataOut(dataInProc51East));
	
	//FIFO 51 TO 52
fifo fifo_proc51_to_proc52(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc51East),
	.full(fullProc51East),
	.dataIn(dataOutProc51East),
	.rd(rdProc52West),
	.empty(emptyProc52West),
	.dataOut(dataInProc52West));
	
	//FIFO 52 TO 43 
fifo fifo_proc52_to_proc43(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc52North),
	.full(fullProc52North),
	.dataIn(dataOutProc52North),
	.rd(rdProc43South),
	.empty(emptyProc43South),
	.dataOut(dataInProc43South));
	
	//FIFO 43 TO 52
fifo fifo_proc43_to_proc52(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc43South),
	.full(fullProc43South),
	.dataIn(dataOutProc43South),
	.rd(rdProc52North),
	.empty(emptyProc52North),
	.dataOut(dataInProc52North));

	//FIFO 53 TO 52 
fifo fifo_proc53_to_proc52(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc53West),
	.full(fullProc53West),
	.dataIn(dataOutProc53West),
	.rd(rdProc52East),
	.empty(emptyProc52East),
	.dataOut(dataInProc52East));
	
	//FIFO 52 TO 53
fifo fifo_proc52_to_proc53(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc52East),
	.full(fullProc52East),
	.dataIn(dataOutProc52East),
	.rd(rdProc53West),
	.empty(emptyProc53West),
	.dataOut(dataInProc53West));
	
	//FIFO 53 TO 44 
fifo fifo_proc53_to_proc44(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc53North),
	.full(fullProc53North),
	.dataIn(dataOutProc53North),
	.rd(rdProc44South),
	.empty(emptyProc44South),
	.dataOut(dataInProc44South));
	
	//FIFO 44 TO 53
fifo fifo_proc44_to_proc53(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc44South),
	.full(fullProc44South),
	.dataIn(dataOutProc44South),
	.rd(rdProc53North),
	.empty(emptyProc53North),
	.dataOut(dataInProc53North));

	//FIFO 54 TO 45 
fifo fifo_proc54_to_proc45(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc54North),
	.full(fullProc54North),
	.dataIn(dataOutProc54North),
	.rd(rdProc45South),
	.empty(emptyProc45South),
	.dataOut(dataInProc45South));
	
	//FIFO 45 TO 54
fifo fifo_proc45_to_proc54(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc45South),
	.full(fullProc45South),
	.dataIn(dataOutProc45South),
	.rd(rdProc54North),
	.empty(emptyProc54North),
	.dataOut(dataInProc54North));

	//FIFO 55 TO 54 
fifo fifo_proc55_to_proc54(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc55West),
	.full(fullProc55West),
	.dataIn(dataOutProc55West),
	.rd(rdProc54East),
	.empty(emptyProc54East),
	.dataOut(dataInProc54East));
	
	//FIFO 54 TO 55
fifo fifo_proc54_to_proc55(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc54East),
	.full(fullProc54East),
	.dataIn(dataOutProc54East),
	.rd(rdProc55West),
	.empty(emptyProc55West),
	.dataOut(dataInProc55West));
	
	//FIFO 55 TO 46 
fifo fifo_proc55_to_proc46(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc55North),
	.full(fullProc55North),
	.dataIn(dataOutProc55North),
	.rd(rdProc46South),
	.empty(emptyProc46South),
	.dataOut(dataInProc46South));
	
	//FIFO 46 TO 55
fifo fifo_proc46_to_proc55(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc46South),
	.full(fullProc46South),
	.dataIn(dataOutProc46South),
	.rd(rdProc55North),
	.empty(emptyProc55North),
	.dataOut(dataInProc55North));

	//FIFO 56 TO 55 
fifo fifo_proc56_to_proc55(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc56West),
	.full(fullProc56West),
	.dataIn(dataOutProc56West),
	.rd(rdProc55East),
	.empty(emptyProc55East),
	.dataOut(dataInProc55East));
	
	//FIFO 55 TO 56
fifo fifo_proc55_to_proc56(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc55East),
	.full(fullProc55East),
	.dataIn(dataOutProc55East),
	.rd(rdProc56West),
	.empty(emptyProc56West),
	.dataOut(dataInProc56West));
	
	//FIFO 56 TO 47 
fifo fifo_proc56_to_proc47(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc56North),
	.full(fullProc56North),
	.dataIn(dataOutProc56North),
	.rd(rdProc47South),
	.empty(emptyProc47South),
	.dataOut(dataInProc47South));
	
	//FIFO 47 TO 56
fifo fifo_proc47_to_proc56(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc47South),
	.full(fullProc47South),
	.dataIn(dataOutProc47South),
	.rd(rdProc56North),
	.empty(emptyProc56North),
	.dataOut(dataInProc56North));

	//FIFO 57 TO 56 
fifo fifo_proc57_to_proc56(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc57West),
	.full(fullProc57West),
	.dataIn(dataOutProc57West),
	.rd(rdProc56East),
	.empty(emptyProc56East),
	.dataOut(dataInProc56East));
	
	//FIFO 56 TO 57
fifo fifo_proc56_to_proc57(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc56East),
	.full(fullProc56East),
	.dataIn(dataOutProc56East),
	.rd(rdProc57West),
	.empty(emptyProc57West),
	.dataOut(dataInProc57West));
	
	//FIFO 57 TO 48 
fifo fifo_proc57_to_proc48(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc57North),
	.full(fullProc57North),
	.dataIn(dataOutProc57North),
	.rd(rdProc48South),
	.empty(emptyProc48South),
	.dataOut(dataInProc48South));
	
	//FIFO 48 TO 57
fifo fifo_proc48_to_proc57(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc48South),
	.full(fullProc48South),
	.dataIn(dataOutProc48South),
	.rd(rdProc57North),
	.empty(emptyProc57North),
	.dataOut(dataInProc57North));

	//FIFO 58 TO 57 
fifo fifo_proc58_to_proc57(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc58West),
	.full(fullProc58West),
	.dataIn(dataOutProc58West),
	.rd(rdProc57East),
	.empty(emptyProc57East),
	.dataOut(dataInProc57East));
	
	//FIFO 57 TO 58
fifo fifo_proc57_to_proc58(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc57East),
	.full(fullProc57East),
	.dataIn(dataOutProc57East),
	.rd(rdProc58West),
	.empty(emptyProc58West),
	.dataOut(dataInProc58West));
	
	//FIFO 58 TO 49 
fifo fifo_proc58_to_proc49(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc58North),
	.full(fullProc58North),
	.dataIn(dataOutProc58North),
	.rd(rdProc49South),
	.empty(emptyProc49South),
	.dataOut(dataInProc49South));
	
	//FIFO 49 TO 58
fifo fifo_proc49_to_proc58(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc49South),
	.full(fullProc49South),
	.dataIn(dataOutProc49South),
	.rd(rdProc58North),
	.empty(emptyProc58North),
	.dataOut(dataInProc58North));

	//FIFO 59 TO 58 
fifo fifo_proc59_to_proc58(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc59West),
	.full(fullProc59West),
	.dataIn(dataOutProc59West),
	.rd(rdProc58East),
	.empty(emptyProc58East),
	.dataOut(dataInProc58East));
	
	//FIFO 58 TO 59
fifo fifo_proc58_to_proc59(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc58East),
	.full(fullProc58East),
	.dataIn(dataOutProc58East),
	.rd(rdProc59West),
	.empty(emptyProc59West),
	.dataOut(dataInProc59West));
	
	//FIFO 59 TO 50 
fifo fifo_proc59_to_proc50(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc59North),
	.full(fullProc59North),
	.dataIn(dataOutProc59North),
	.rd(rdProc50South),
	.empty(emptyProc50South),
	.dataOut(dataInProc50South));
	
	//FIFO 50 TO 59
fifo fifo_proc50_to_proc59(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc50South),
	.full(fullProc50South),
	.dataIn(dataOutProc50South),
	.rd(rdProc59North),
	.empty(emptyProc59North),
	.dataOut(dataInProc59North));

	//FIFO 60 TO 59 
fifo fifo_proc60_to_proc59(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc60West),
	.full(fullProc60West),
	.dataIn(dataOutProc60West),
	.rd(rdProc59East),
	.empty(emptyProc59East),
	.dataOut(dataInProc59East));
	
	//FIFO 59 TO 60
fifo fifo_proc59_to_proc60(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc59East),
	.full(fullProc59East),
	.dataIn(dataOutProc59East),
	.rd(rdProc60West),
	.empty(emptyProc60West),
	.dataOut(dataInProc60West));
	
	//FIFO 60 TO 51 
fifo fifo_proc60_to_proc51(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc60North),
	.full(fullProc60North),
	.dataIn(dataOutProc60North),
	.rd(rdProc51South),
	.empty(emptyProc51South),
	.dataOut(dataInProc51South));
	
	//FIFO 51 TO 60
fifo fifo_proc51_to_proc60(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc51South),
	.full(fullProc51South),
	.dataIn(dataOutProc51South),
	.rd(rdProc60North),
	.empty(emptyProc60North),
	.dataOut(dataInProc60North));

	//FIFO 61 TO 60 
fifo fifo_proc61_to_proc60(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc61West),
	.full(fullProc61West),
	.dataIn(dataOutProc61West),
	.rd(rdProc60East),
	.empty(emptyProc60East),
	.dataOut(dataInProc60East));
	
	//FIFO 60 TO 61
fifo fifo_proc60_to_proc61(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc60East),
	.full(fullProc60East),
	.dataIn(dataOutProc60East),
	.rd(rdProc61West),
	.empty(emptyProc61West),
	.dataOut(dataInProc61West));
	
	//FIFO 61 TO 52 
fifo fifo_proc61_to_proc52(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc61North),
	.full(fullProc61North),
	.dataIn(dataOutProc61North),
	.rd(rdProc52South),
	.empty(emptyProc52South),
	.dataOut(dataInProc52South));
	
	//FIFO 52 TO 61
fifo fifo_proc52_to_proc61(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc52South),
	.full(fullProc52South),
	.dataIn(dataOutProc52South),
	.rd(rdProc61North),
	.empty(emptyProc61North),
	.dataOut(dataInProc61North));

	//FIFO 62 TO 61 
fifo fifo_proc62_to_proc61(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc62West),
	.full(fullProc62West),
	.dataIn(dataOutProc62West),
	.rd(rdProc61East),
	.empty(emptyProc61East),
	.dataOut(dataInProc61East));
	
	//FIFO 61 TO 62
fifo fifo_proc61_to_proc62(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc61East),
	.full(fullProc61East),
	.dataIn(dataOutProc61East),
	.rd(rdProc62West),
	.empty(emptyProc62West),
	.dataOut(dataInProc62West));
	
	//FIFO 62 TO 53 
fifo fifo_proc62_to_proc53(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc62North),
	.full(fullProc62North),
	.dataIn(dataOutProc62North),
	.rd(rdProc53South),
	.empty(emptyProc53South),
	.dataOut(dataInProc53South));
	
	//FIFO 53 TO 62
fifo fifo_proc53_to_proc62(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc53South),
	.full(fullProc53South),
	.dataIn(dataOutProc53South),
	.rd(rdProc62North),
	.empty(emptyProc62North),
	.dataOut(dataInProc62North));

	//FIFO 63 TO 54 
fifo fifo_proc63_to_proc54(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc63North),
	.full(fullProc63North),
	.dataIn(dataOutProc63North),
	.rd(rdProc54South),
	.empty(emptyProc54South),
	.dataOut(dataInProc54South));
	
	//FIFO 54 TO 63
fifo fifo_proc54_to_proc63(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc54South),
	.full(fullProc54South),
	.dataIn(dataOutProc54South),
	.rd(rdProc63North),
	.empty(emptyProc63North),
	.dataOut(dataInProc63North));

	//FIFO 64 TO 63 
fifo fifo_proc64_to_proc63(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc64West),
	.full(fullProc64West),
	.dataIn(dataOutProc64West),
	.rd(rdProc63East),
	.empty(emptyProc63East),
	.dataOut(dataInProc63East));
	
	//FIFO 63 TO 64
fifo fifo_proc63_to_proc64(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc63East),
	.full(fullProc63East),
	.dataIn(dataOutProc63East),
	.rd(rdProc64West),
	.empty(emptyProc64West),
	.dataOut(dataInProc64West));
	
	//FIFO 64 TO 55 
fifo fifo_proc64_to_proc55(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc64North),
	.full(fullProc64North),
	.dataIn(dataOutProc64North),
	.rd(rdProc55South),
	.empty(emptyProc55South),
	.dataOut(dataInProc55South));
	
	//FIFO 55 TO 64
fifo fifo_proc55_to_proc64(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc55South),
	.full(fullProc55South),
	.dataIn(dataOutProc55South),
	.rd(rdProc64North),
	.empty(emptyProc64North),
	.dataOut(dataInProc64North));

	//FIFO 65 TO 64 
fifo fifo_proc65_to_proc64(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc65West),
	.full(fullProc65West),
	.dataIn(dataOutProc65West),
	.rd(rdProc64East),
	.empty(emptyProc64East),
	.dataOut(dataInProc64East));
	
	//FIFO 64 TO 65
fifo fifo_proc64_to_proc65(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc64East),
	.full(fullProc64East),
	.dataIn(dataOutProc64East),
	.rd(rdProc65West),
	.empty(emptyProc65West),
	.dataOut(dataInProc65West));
	
	//FIFO 65 TO 56 
fifo fifo_proc65_to_proc56(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc65North),
	.full(fullProc65North),
	.dataIn(dataOutProc65North),
	.rd(rdProc56South),
	.empty(emptyProc56South),
	.dataOut(dataInProc56South));
	
	//FIFO 56 TO 65
fifo fifo_proc56_to_proc65(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc56South),
	.full(fullProc56South),
	.dataIn(dataOutProc56South),
	.rd(rdProc65North),
	.empty(emptyProc65North),
	.dataOut(dataInProc65North));

	//FIFO 66 TO 65 
fifo fifo_proc66_to_proc65(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc66West),
	.full(fullProc66West),
	.dataIn(dataOutProc66West),
	.rd(rdProc65East),
	.empty(emptyProc65East),
	.dataOut(dataInProc65East));
	
	//FIFO 65 TO 66
fifo fifo_proc65_to_proc66(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc65East),
	.full(fullProc65East),
	.dataIn(dataOutProc65East),
	.rd(rdProc66West),
	.empty(emptyProc66West),
	.dataOut(dataInProc66West));
	
	//FIFO 66 TO 57 
fifo fifo_proc66_to_proc57(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc66North),
	.full(fullProc66North),
	.dataIn(dataOutProc66North),
	.rd(rdProc57South),
	.empty(emptyProc57South),
	.dataOut(dataInProc57South));
	
	//FIFO 57 TO 66
fifo fifo_proc57_to_proc66(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc57South),
	.full(fullProc57South),
	.dataIn(dataOutProc57South),
	.rd(rdProc66North),
	.empty(emptyProc66North),
	.dataOut(dataInProc66North));

	//FIFO 67 TO 66 
fifo fifo_proc67_to_proc66(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc67West),
	.full(fullProc67West),
	.dataIn(dataOutProc67West),
	.rd(rdProc66East),
	.empty(emptyProc66East),
	.dataOut(dataInProc66East));
	
	//FIFO 66 TO 67
fifo fifo_proc66_to_proc67(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc66East),
	.full(fullProc66East),
	.dataIn(dataOutProc66East),
	.rd(rdProc67West),
	.empty(emptyProc67West),
	.dataOut(dataInProc67West));
	
	//FIFO 67 TO 58 
fifo fifo_proc67_to_proc58(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc67North),
	.full(fullProc67North),
	.dataIn(dataOutProc67North),
	.rd(rdProc58South),
	.empty(emptyProc58South),
	.dataOut(dataInProc58South));
	
	//FIFO 58 TO 67
fifo fifo_proc58_to_proc67(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc58South),
	.full(fullProc58South),
	.dataIn(dataOutProc58South),
	.rd(rdProc67North),
	.empty(emptyProc67North),
	.dataOut(dataInProc67North));

	//FIFO 68 TO 67 
fifo fifo_proc68_to_proc67(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc68West),
	.full(fullProc68West),
	.dataIn(dataOutProc68West),
	.rd(rdProc67East),
	.empty(emptyProc67East),
	.dataOut(dataInProc67East));
	
	//FIFO 67 TO 68
fifo fifo_proc67_to_proc68(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc67East),
	.full(fullProc67East),
	.dataIn(dataOutProc67East),
	.rd(rdProc68West),
	.empty(emptyProc68West),
	.dataOut(dataInProc68West));
	
	//FIFO 68 TO 59 
fifo fifo_proc68_to_proc59(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc68North),
	.full(fullProc68North),
	.dataIn(dataOutProc68North),
	.rd(rdProc59South),
	.empty(emptyProc59South),
	.dataOut(dataInProc59South));
	
	//FIFO 59 TO 68
fifo fifo_proc59_to_proc68(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc59South),
	.full(fullProc59South),
	.dataIn(dataOutProc59South),
	.rd(rdProc68North),
	.empty(emptyProc68North),
	.dataOut(dataInProc68North));

	//FIFO 69 TO 68 
fifo fifo_proc69_to_proc68(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc69West),
	.full(fullProc69West),
	.dataIn(dataOutProc69West),
	.rd(rdProc68East),
	.empty(emptyProc68East),
	.dataOut(dataInProc68East));
	
	//FIFO 68 TO 69
fifo fifo_proc68_to_proc69(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc68East),
	.full(fullProc68East),
	.dataIn(dataOutProc68East),
	.rd(rdProc69West),
	.empty(emptyProc69West),
	.dataOut(dataInProc69West));
	
	//FIFO 69 TO 60 
fifo fifo_proc69_to_proc60(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc69North),
	.full(fullProc69North),
	.dataIn(dataOutProc69North),
	.rd(rdProc60South),
	.empty(emptyProc60South),
	.dataOut(dataInProc60South));
	
	//FIFO 60 TO 69
fifo fifo_proc60_to_proc69(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc60South),
	.full(fullProc60South),
	.dataIn(dataOutProc60South),
	.rd(rdProc69North),
	.empty(emptyProc69North),
	.dataOut(dataInProc69North));

	//FIFO 70 TO 69 
fifo fifo_proc70_to_proc69(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc70West),
	.full(fullProc70West),
	.dataIn(dataOutProc70West),
	.rd(rdProc69East),
	.empty(emptyProc69East),
	.dataOut(dataInProc69East));
	
	//FIFO 69 TO 70
fifo fifo_proc69_to_proc70(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc69East),
	.full(fullProc69East),
	.dataIn(dataOutProc69East),
	.rd(rdProc70West),
	.empty(emptyProc70West),
	.dataOut(dataInProc70West));
	
	//FIFO 70 TO 61 
fifo fifo_proc70_to_proc61(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc70North),
	.full(fullProc70North),
	.dataIn(dataOutProc70North),
	.rd(rdProc61South),
	.empty(emptyProc61South),
	.dataOut(dataInProc61South));
	
	//FIFO 61 TO 70
fifo fifo_proc61_to_proc70(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc61South),
	.full(fullProc61South),
	.dataIn(dataOutProc61South),
	.rd(rdProc70North),
	.empty(emptyProc70North),
	.dataOut(dataInProc70North));

	//FIFO 71 TO 70 
fifo fifo_proc71_to_proc70(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc71West),
	.full(fullProc71West),
	.dataIn(dataOutProc71West),
	.rd(rdProc70East),
	.empty(emptyProc70East),
	.dataOut(dataInProc70East));
	
	//FIFO 70 TO 71
fifo fifo_proc70_to_proc71(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc70East),
	.full(fullProc70East),
	.dataIn(dataOutProc70East),
	.rd(rdProc71West),
	.empty(emptyProc71West),
	.dataOut(dataInProc71West));
	
	//FIFO 71 TO 62 
fifo fifo_proc71_to_proc62(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc71North),
	.full(fullProc71North),
	.dataIn(dataOutProc71North),
	.rd(rdProc62South),
	.empty(emptyProc62South),
	.dataOut(dataInProc62South));
	
	//FIFO 62 TO 71
fifo fifo_proc62_to_proc71(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc62South),
	.full(fullProc62South),
	.dataIn(dataOutProc62South),
	.rd(rdProc71North),
	.empty(emptyProc71North),
	.dataOut(dataInProc71North));

	//FIFO 72 TO 63 
fifo fifo_proc72_to_proc63(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc72North),
	.full(fullProc72North),
	.dataIn(dataOutProc72North),
	.rd(rdProc63South),
	.empty(emptyProc63South),
	.dataOut(dataInProc63South));
	
	//FIFO 63 TO 72
fifo fifo_proc63_to_proc72(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc63South),
	.full(fullProc63South),
	.dataIn(dataOutProc63South),
	.rd(rdProc72North),
	.empty(emptyProc72North),
	.dataOut(dataInProc72North));

	//FIFO 73 TO 72 
fifo fifo_proc73_to_proc72(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc73West),
	.full(fullProc73West),
	.dataIn(dataOutProc73West),
	.rd(rdProc72East),
	.empty(emptyProc72East),
	.dataOut(dataInProc72East));
	
	//FIFO 72 TO 73
fifo fifo_proc72_to_proc73(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc72East),
	.full(fullProc72East),
	.dataIn(dataOutProc72East),
	.rd(rdProc73West),
	.empty(emptyProc73West),
	.dataOut(dataInProc73West));
	
	//FIFO 73 TO 64 
fifo fifo_proc73_to_proc64(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc73North),
	.full(fullProc73North),
	.dataIn(dataOutProc73North),
	.rd(rdProc64South),
	.empty(emptyProc64South),
	.dataOut(dataInProc64South));
	
	//FIFO 64 TO 73
fifo fifo_proc64_to_proc73(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc64South),
	.full(fullProc64South),
	.dataIn(dataOutProc64South),
	.rd(rdProc73North),
	.empty(emptyProc73North),
	.dataOut(dataInProc73North));

	//FIFO 74 TO 73 
fifo fifo_proc74_to_proc73(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc74West),
	.full(fullProc74West),
	.dataIn(dataOutProc74West),
	.rd(rdProc73East),
	.empty(emptyProc73East),
	.dataOut(dataInProc73East));
	
	//FIFO 73 TO 74
fifo fifo_proc73_to_proc74(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc73East),
	.full(fullProc73East),
	.dataIn(dataOutProc73East),
	.rd(rdProc74West),
	.empty(emptyProc74West),
	.dataOut(dataInProc74West));
	
	//FIFO 74 TO 65 
fifo fifo_proc74_to_proc65(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc74North),
	.full(fullProc74North),
	.dataIn(dataOutProc74North),
	.rd(rdProc65South),
	.empty(emptyProc65South),
	.dataOut(dataInProc65South));
	
	//FIFO 65 TO 74
fifo fifo_proc65_to_proc74(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc65South),
	.full(fullProc65South),
	.dataIn(dataOutProc65South),
	.rd(rdProc74North),
	.empty(emptyProc74North),
	.dataOut(dataInProc74North));

	//FIFO 75 TO 74 
fifo fifo_proc75_to_proc74(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc75West),
	.full(fullProc75West),
	.dataIn(dataOutProc75West),
	.rd(rdProc74East),
	.empty(emptyProc74East),
	.dataOut(dataInProc74East));
	
	//FIFO 74 TO 75
fifo fifo_proc74_to_proc75(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc74East),
	.full(fullProc74East),
	.dataIn(dataOutProc74East),
	.rd(rdProc75West),
	.empty(emptyProc75West),
	.dataOut(dataInProc75West));
	
	//FIFO 75 TO 66 
fifo fifo_proc75_to_proc66(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc75North),
	.full(fullProc75North),
	.dataIn(dataOutProc75North),
	.rd(rdProc66South),
	.empty(emptyProc66South),
	.dataOut(dataInProc66South));
	
	//FIFO 66 TO 75
fifo fifo_proc66_to_proc75(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc66South),
	.full(fullProc66South),
	.dataIn(dataOutProc66South),
	.rd(rdProc75North),
	.empty(emptyProc75North),
	.dataOut(dataInProc75North));

	//FIFO 76 TO 75 
fifo fifo_proc76_to_proc75(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc76West),
	.full(fullProc76West),
	.dataIn(dataOutProc76West),
	.rd(rdProc75East),
	.empty(emptyProc75East),
	.dataOut(dataInProc75East));
	
	//FIFO 75 TO 76
fifo fifo_proc75_to_proc76(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc75East),
	.full(fullProc75East),
	.dataIn(dataOutProc75East),
	.rd(rdProc76West),
	.empty(emptyProc76West),
	.dataOut(dataInProc76West));
	
	//FIFO 76 TO 67 
fifo fifo_proc76_to_proc67(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc76North),
	.full(fullProc76North),
	.dataIn(dataOutProc76North),
	.rd(rdProc67South),
	.empty(emptyProc67South),
	.dataOut(dataInProc67South));
	
	//FIFO 67 TO 76
fifo fifo_proc67_to_proc76(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc67South),
	.full(fullProc67South),
	.dataIn(dataOutProc67South),
	.rd(rdProc76North),
	.empty(emptyProc76North),
	.dataOut(dataInProc76North));

	//FIFO 77 TO 76 
fifo fifo_proc77_to_proc76(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc77West),
	.full(fullProc77West),
	.dataIn(dataOutProc77West),
	.rd(rdProc76East),
	.empty(emptyProc76East),
	.dataOut(dataInProc76East));
	
	//FIFO 76 TO 77
fifo fifo_proc76_to_proc77(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc76East),
	.full(fullProc76East),
	.dataIn(dataOutProc76East),
	.rd(rdProc77West),
	.empty(emptyProc77West),
	.dataOut(dataInProc77West));
	
	//FIFO 77 TO 68 
fifo fifo_proc77_to_proc68(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc77North),
	.full(fullProc77North),
	.dataIn(dataOutProc77North),
	.rd(rdProc68South),
	.empty(emptyProc68South),
	.dataOut(dataInProc68South));
	
	//FIFO 68 TO 77
fifo fifo_proc68_to_proc77(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc68South),
	.full(fullProc68South),
	.dataIn(dataOutProc68South),
	.rd(rdProc77North),
	.empty(emptyProc77North),
	.dataOut(dataInProc77North));

	//FIFO 78 TO 77 
fifo fifo_proc78_to_proc77(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc78West),
	.full(fullProc78West),
	.dataIn(dataOutProc78West),
	.rd(rdProc77East),
	.empty(emptyProc77East),
	.dataOut(dataInProc77East));
	
	//FIFO 77 TO 78
fifo fifo_proc77_to_proc78(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc77East),
	.full(fullProc77East),
	.dataIn(dataOutProc77East),
	.rd(rdProc78West),
	.empty(emptyProc78West),
	.dataOut(dataInProc78West));
	
	//FIFO 78 TO 69 
fifo fifo_proc78_to_proc69(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc78North),
	.full(fullProc78North),
	.dataIn(dataOutProc78North),
	.rd(rdProc69South),
	.empty(emptyProc69South),
	.dataOut(dataInProc69South));
	
	//FIFO 69 TO 78
fifo fifo_proc69_to_proc78(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc69South),
	.full(fullProc69South),
	.dataIn(dataOutProc69South),
	.rd(rdProc78North),
	.empty(emptyProc78North),
	.dataOut(dataInProc78North));

	//FIFO 79 TO 78 
fifo fifo_proc79_to_proc78(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc79West),
	.full(fullProc79West),
	.dataIn(dataOutProc79West),
	.rd(rdProc78East),
	.empty(emptyProc78East),
	.dataOut(dataInProc78East));
	
	//FIFO 78 TO 79
fifo fifo_proc78_to_proc79(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc78East),
	.full(fullProc78East),
	.dataIn(dataOutProc78East),
	.rd(rdProc79West),
	.empty(emptyProc79West),
	.dataOut(dataInProc79West));
	
	//FIFO 79 TO 70 
fifo fifo_proc79_to_proc70(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc79North),
	.full(fullProc79North),
	.dataIn(dataOutProc79North),
	.rd(rdProc70South),
	.empty(emptyProc70South),
	.dataOut(dataInProc70South));
	
	//FIFO 70 TO 79
fifo fifo_proc70_to_proc79(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc70South),
	.full(fullProc70South),
	.dataIn(dataOutProc70South),
	.rd(rdProc79North),
	.empty(emptyProc79North),
	.dataOut(dataInProc79North));

	//FIFO 80 TO 79 
fifo fifo_proc80_to_proc79(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc80West),
	.full(fullProc80West),
	.dataIn(dataOutProc80West),
	.rd(rdProc79East),
	.empty(emptyProc79East),
	.dataOut(dataInProc79East));
	
	//FIFO 79 TO 80
fifo fifo_proc79_to_proc80(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc79East),
	.full(fullProc79East),
	.dataIn(dataOutProc79East),
	.rd(rdProc80West),
	.empty(emptyProc80West),
	.dataOut(dataInProc80West));
	
	//FIFO 80 TO 71 
fifo fifo_proc80_to_proc71(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc80North),
	.full(fullProc80North),
	.dataIn(dataOutProc80North),
	.rd(rdProc71South),
	.empty(emptyProc71South),
	.dataOut(dataInProc71South));
	
	//FIFO 71 TO 80
fifo fifo_proc71_to_proc80(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc71South),
	.full(fullProc71South),
	.dataIn(dataOutProc71South),
	.rd(rdProc80North),
	.empty(emptyProc80North),
	.dataOut(dataInProc80North));

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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
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
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		12: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = ~resetn;
			boot_dwe12 = ~resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		13: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = ~resetn;
			boot_dwe13 = ~resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		14: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = ~resetn;
			boot_dwe14 = ~resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		15: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = ~resetn;
			boot_dwe15 = ~resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		16: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = ~resetn;
			boot_dwe16 = ~resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		17: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = ~resetn;
			boot_dwe17 = ~resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		18: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = ~resetn;
			boot_dwe18 = ~resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		19: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = ~resetn;
			boot_dwe19 = ~resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		20: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = ~resetn;
			boot_dwe20 = ~resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		21: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = ~resetn;
			boot_dwe21 = ~resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		22: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = ~resetn;
			boot_dwe22 = ~resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		23: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = ~resetn;
			boot_dwe23 = ~resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		24: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = ~resetn;
			boot_dwe24 = ~resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		25: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = ~resetn;
			boot_dwe25 = ~resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		26: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = ~resetn;
			boot_dwe26 = ~resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		27: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = ~resetn;
			boot_dwe27 = ~resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		28: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = ~resetn;
			boot_dwe28 = ~resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		29: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = ~resetn;
			boot_dwe29 = ~resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		30: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = ~resetn;
			boot_dwe30 = ~resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		31: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = ~resetn;
			boot_dwe31 = ~resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		32: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = ~resetn;
			boot_dwe32 = ~resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		33: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = ~resetn;
			boot_dwe33 = ~resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		34: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = ~resetn;
			boot_dwe34 = ~resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		35: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = ~resetn;
			boot_dwe35 = ~resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		36: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = ~resetn;
			boot_dwe36 = ~resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		37: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = ~resetn;
			boot_dwe37 = ~resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		38: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = ~resetn;
			boot_dwe38 = ~resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		39: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = ~resetn;
			boot_dwe39 = ~resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		40: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = ~resetn;
			boot_dwe40 = ~resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		41: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = ~resetn;
			boot_dwe41 = ~resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		42: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = ~resetn;
			boot_dwe42 = ~resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		43: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = ~resetn;
			boot_dwe43 = ~resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		44: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = ~resetn;
			boot_dwe44 = ~resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		45: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = ~resetn;
			boot_dwe45 = ~resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		46: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = ~resetn;
			boot_dwe46 = ~resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		47: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = ~resetn;
			boot_dwe47 = ~resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		48: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = ~resetn;
			boot_dwe48 = ~resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		49: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = ~resetn;
			boot_dwe49 = ~resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		50: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = ~resetn;
			boot_dwe50 = ~resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		51: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = ~resetn;
			boot_dwe51 = ~resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		52: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = ~resetn;
			boot_dwe52 = ~resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		53: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = ~resetn;
			boot_dwe53 = ~resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		54: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = ~resetn;
			boot_dwe54 = ~resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		55: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = ~resetn;
			boot_dwe55 = ~resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		56: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = ~resetn;
			boot_dwe56 = ~resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		57: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = ~resetn;
			boot_dwe57 = ~resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		58: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = ~resetn;
			boot_dwe58 = ~resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		59: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = ~resetn;
			boot_dwe59 = ~resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		60: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = ~resetn;
			boot_dwe60 = ~resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		61: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = ~resetn;
			boot_dwe61 = ~resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		62: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = ~resetn;
			boot_dwe62 = ~resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		63: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = ~resetn;
			boot_dwe63 = ~resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		64: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = ~resetn;
			boot_dwe64 = ~resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		65: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = ~resetn;
			boot_dwe65 = ~resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		66: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = ~resetn;
			boot_dwe66 = ~resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		67: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = ~resetn;
			boot_dwe67 = ~resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		68: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = ~resetn;
			boot_dwe68 = ~resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		69: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = ~resetn;
			boot_dwe69 = ~resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		70: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = ~resetn;
			boot_dwe70 = ~resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		71: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = ~resetn;
			boot_dwe71 = ~resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		72: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = ~resetn;
			boot_dwe72 = ~resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		73: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = ~resetn;
			boot_dwe73 = ~resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		74: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = ~resetn;
			boot_dwe74 = ~resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		75: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = ~resetn;
			boot_dwe75 = ~resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		76: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = ~resetn;
			boot_dwe76 = ~resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		77: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = ~resetn;
			boot_dwe77 = ~resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		78: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = ~resetn;
			boot_dwe78 = ~resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		79: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = ~resetn;
			boot_dwe79 = ~resetn;
			boot_iwe80 = resetn;
			boot_dwe80 = resetn;
		end
		80: begin
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
			boot_iwe11 = resetn;
			boot_dwe11 = resetn;
			boot_iwe12 = resetn;
			boot_dwe12 = resetn;
			boot_iwe13 = resetn;
			boot_dwe13 = resetn;
			boot_iwe14 = resetn;
			boot_dwe14 = resetn;
			boot_iwe15 = resetn;
			boot_dwe15 = resetn;
			boot_iwe16 = resetn;
			boot_dwe16 = resetn;
			boot_iwe17 = resetn;
			boot_dwe17 = resetn;
			boot_iwe18 = resetn;
			boot_dwe18 = resetn;
			boot_iwe19 = resetn;
			boot_dwe19 = resetn;
			boot_iwe20 = resetn;
			boot_dwe20 = resetn;
			boot_iwe21 = resetn;
			boot_dwe21 = resetn;
			boot_iwe22 = resetn;
			boot_dwe22 = resetn;
			boot_iwe23 = resetn;
			boot_dwe23 = resetn;
			boot_iwe24 = resetn;
			boot_dwe24 = resetn;
			boot_iwe25 = resetn;
			boot_dwe25 = resetn;
			boot_iwe26 = resetn;
			boot_dwe26 = resetn;
			boot_iwe27 = resetn;
			boot_dwe27 = resetn;
			boot_iwe28 = resetn;
			boot_dwe28 = resetn;
			boot_iwe29 = resetn;
			boot_dwe29 = resetn;
			boot_iwe30 = resetn;
			boot_dwe30 = resetn;
			boot_iwe31 = resetn;
			boot_dwe31 = resetn;
			boot_iwe32 = resetn;
			boot_dwe32 = resetn;
			boot_iwe33 = resetn;
			boot_dwe33 = resetn;
			boot_iwe34 = resetn;
			boot_dwe34 = resetn;
			boot_iwe35 = resetn;
			boot_dwe35 = resetn;
			boot_iwe36 = resetn;
			boot_dwe36 = resetn;
			boot_iwe37 = resetn;
			boot_dwe37 = resetn;
			boot_iwe38 = resetn;
			boot_dwe38 = resetn;
			boot_iwe39 = resetn;
			boot_dwe39 = resetn;
			boot_iwe40 = resetn;
			boot_dwe40 = resetn;
			boot_iwe41 = resetn;
			boot_dwe41 = resetn;
			boot_iwe42 = resetn;
			boot_dwe42 = resetn;
			boot_iwe43 = resetn;
			boot_dwe43 = resetn;
			boot_iwe44 = resetn;
			boot_dwe44 = resetn;
			boot_iwe45 = resetn;
			boot_dwe45 = resetn;
			boot_iwe46 = resetn;
			boot_dwe46 = resetn;
			boot_iwe47 = resetn;
			boot_dwe47 = resetn;
			boot_iwe48 = resetn;
			boot_dwe48 = resetn;
			boot_iwe49 = resetn;
			boot_dwe49 = resetn;
			boot_iwe50 = resetn;
			boot_dwe50 = resetn;
			boot_iwe51 = resetn;
			boot_dwe51 = resetn;
			boot_iwe52 = resetn;
			boot_dwe52 = resetn;
			boot_iwe53 = resetn;
			boot_dwe53 = resetn;
			boot_iwe54 = resetn;
			boot_dwe54 = resetn;
			boot_iwe55 = resetn;
			boot_dwe55 = resetn;
			boot_iwe56 = resetn;
			boot_dwe56 = resetn;
			boot_iwe57 = resetn;
			boot_dwe57 = resetn;
			boot_iwe58 = resetn;
			boot_dwe58 = resetn;
			boot_iwe59 = resetn;
			boot_dwe59 = resetn;
			boot_iwe60 = resetn;
			boot_dwe60 = resetn;
			boot_iwe61 = resetn;
			boot_dwe61 = resetn;
			boot_iwe62 = resetn;
			boot_dwe62 = resetn;
			boot_iwe63 = resetn;
			boot_dwe63 = resetn;
			boot_iwe64 = resetn;
			boot_dwe64 = resetn;
			boot_iwe65 = resetn;
			boot_dwe65 = resetn;
			boot_iwe66 = resetn;
			boot_dwe66 = resetn;
			boot_iwe67 = resetn;
			boot_dwe67 = resetn;
			boot_iwe68 = resetn;
			boot_dwe68 = resetn;
			boot_iwe69 = resetn;
			boot_dwe69 = resetn;
			boot_iwe70 = resetn;
			boot_dwe70 = resetn;
			boot_iwe71 = resetn;
			boot_dwe71 = resetn;
			boot_iwe72 = resetn;
			boot_dwe72 = resetn;
			boot_iwe73 = resetn;
			boot_dwe73 = resetn;
			boot_iwe74 = resetn;
			boot_dwe74 = resetn;
			boot_iwe75 = resetn;
			boot_dwe75 = resetn;
			boot_iwe76 = resetn;
			boot_dwe76 = resetn;
			boot_iwe77 = resetn;
			boot_dwe77 = resetn;
			boot_iwe78 = resetn;
			boot_dwe78 = resetn;
			boot_iwe79 = resetn;
			boot_dwe79 = resetn;
			boot_iwe80 = ~resetn;
			boot_dwe80 = ~resetn;
		end
		81: begin
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
			boot_iwe12 = 0;
			boot_dwe12 = 0;
			boot_iwe13 = 0;
			boot_dwe13 = 0;
			boot_iwe14 = 0;
			boot_dwe14 = 0;
			boot_iwe15 = 0;
			boot_dwe15 = 0;
			boot_iwe16 = 0;
			boot_dwe16 = 0;
			boot_iwe17 = 0;
			boot_dwe17 = 0;
			boot_iwe18 = 0;
			boot_dwe18 = 0;
			boot_iwe19 = 0;
			boot_dwe19 = 0;
			boot_iwe20 = 0;
			boot_dwe20 = 0;
			boot_iwe21 = 0;
			boot_dwe21 = 0;
			boot_iwe22 = 0;
			boot_dwe22 = 0;
			boot_iwe23 = 0;
			boot_dwe23 = 0;
			boot_iwe24 = 0;
			boot_dwe24 = 0;
			boot_iwe25 = 0;
			boot_dwe25 = 0;
			boot_iwe26 = 0;
			boot_dwe26 = 0;
			boot_iwe27 = 0;
			boot_dwe27 = 0;
			boot_iwe28 = 0;
			boot_dwe28 = 0;
			boot_iwe29 = 0;
			boot_dwe29 = 0;
			boot_iwe30 = 0;
			boot_dwe30 = 0;
			boot_iwe31 = 0;
			boot_dwe31 = 0;
			boot_iwe32 = 0;
			boot_dwe32 = 0;
			boot_iwe33 = 0;
			boot_dwe33 = 0;
			boot_iwe34 = 0;
			boot_dwe34 = 0;
			boot_iwe35 = 0;
			boot_dwe35 = 0;
			boot_iwe36 = 0;
			boot_dwe36 = 0;
			boot_iwe37 = 0;
			boot_dwe37 = 0;
			boot_iwe38 = 0;
			boot_dwe38 = 0;
			boot_iwe39 = 0;
			boot_dwe39 = 0;
			boot_iwe40 = 0;
			boot_dwe40 = 0;
			boot_iwe41 = 0;
			boot_dwe41 = 0;
			boot_iwe42 = 0;
			boot_dwe42 = 0;
			boot_iwe43 = 0;
			boot_dwe43 = 0;
			boot_iwe44 = 0;
			boot_dwe44 = 0;
			boot_iwe45 = 0;
			boot_dwe45 = 0;
			boot_iwe46 = 0;
			boot_dwe46 = 0;
			boot_iwe47 = 0;
			boot_dwe47 = 0;
			boot_iwe48 = 0;
			boot_dwe48 = 0;
			boot_iwe49 = 0;
			boot_dwe49 = 0;
			boot_iwe50 = 0;
			boot_dwe50 = 0;
			boot_iwe51 = 0;
			boot_dwe51 = 0;
			boot_iwe52 = 0;
			boot_dwe52 = 0;
			boot_iwe53 = 0;
			boot_dwe53 = 0;
			boot_iwe54 = 0;
			boot_dwe54 = 0;
			boot_iwe55 = 0;
			boot_dwe55 = 0;
			boot_iwe56 = 0;
			boot_dwe56 = 0;
			boot_iwe57 = 0;
			boot_dwe57 = 0;
			boot_iwe58 = 0;
			boot_dwe58 = 0;
			boot_iwe59 = 0;
			boot_dwe59 = 0;
			boot_iwe60 = 0;
			boot_dwe60 = 0;
			boot_iwe61 = 0;
			boot_dwe61 = 0;
			boot_iwe62 = 0;
			boot_dwe62 = 0;
			boot_iwe63 = 0;
			boot_dwe63 = 0;
			boot_iwe64 = 0;
			boot_dwe64 = 0;
			boot_iwe65 = 0;
			boot_dwe65 = 0;
			boot_iwe66 = 0;
			boot_dwe66 = 0;
			boot_iwe67 = 0;
			boot_dwe67 = 0;
			boot_iwe68 = 0;
			boot_dwe68 = 0;
			boot_iwe69 = 0;
			boot_dwe69 = 0;
			boot_iwe70 = 0;
			boot_dwe70 = 0;
			boot_iwe71 = 0;
			boot_dwe71 = 0;
			boot_iwe72 = 0;
			boot_dwe72 = 0;
			boot_iwe73 = 0;
			boot_dwe73 = 0;
			boot_iwe74 = 0;
			boot_dwe74 = 0;
			boot_iwe75 = 0;
			boot_dwe75 = 0;
			boot_iwe76 = 0;
			boot_dwe76 = 0;
			boot_iwe77 = 0;
			boot_dwe77 = 0;
			boot_iwe78 = 0;
			boot_dwe78 = 0;
			boot_iwe79 = 0;
			boot_dwe79 = 0;
			boot_iwe80 = 0;
			boot_dwe80 = 0;
		end		
	endcase
end
endmodule