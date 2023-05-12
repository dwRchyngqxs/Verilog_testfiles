`timescale 1ns / 1ns
module system50(clk,resetn,boot_iaddr,boot_idata,boot_daddr,boot_ddata,reg_file_b_readdataout,processor_select);
	input clk;
	input resetn;
	input [6:0] processor_select;
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
	wire rdProc1West;
	wire emptyProc1West;
	wire [31:0] dataInProc1West;

	 //Processor 1 control and data signals
	wire wrProc1West;
	wire fullProc1West;
	wire [31:0] dataOutProc1West;

	 //Processor 2 control and data signals
	wire rdProc2East;
	wire emptyProc2East;
	wire [31:0] dataInProc2East;

	 //Processor 3 control and data signals
	wire rdProc3East;
	wire emptyProc3East;
	wire [31:0] dataInProc3East;

	 //Processor 3 control and data signals
	wire wrProc3West;
	wire fullProc3West;
	wire [31:0] dataOutProc3West;

	 //Processor 4 control and data signals
	wire rdProc4East;
	wire emptyProc4East;
	wire [31:0] dataInProc4East;

	 //Processor 4 control and data signals
	wire wrProc4West;
	wire fullProc4West;
	wire [31:0] dataOutProc4West;

	 //Processor 5 control and data signals
	wire rdProc5East;
	wire emptyProc5East;
	wire [31:0] dataInProc5East;

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
	wire wrProc6West;
	wire fullProc6West;
	wire [31:0] dataOutProc6West;

	 //Processor 7 control and data signals
	wire wrProc7South;
	wire fullProc7South;
	wire [31:0] dataOutProc7South;

	 //Processor 7 control and data signals
	wire rdProc7East;
	wire emptyProc7East;
	wire [31:0] dataInProc7East;

	 //Processor 7 control and data signals
	wire wrProc7West;
	wire fullProc7West;
	wire [31:0] dataOutProc7West;

	 //Processor 8 control and data signals
	wire rdProc8South;
	wire emptyProc8South;
	wire [31:0] dataInProc8South;

	 //Processor 8 control and data signals
	wire rdProc8East;
	wire emptyProc8East;
	wire [31:0] dataInProc8East;

	 //Processor 8 control and data signals
	wire wrProc8West;
	wire fullProc8West;
	wire [31:0] dataOutProc8West;

	 //Processor 9 control and data signals
	wire rdProc9South;
	wire emptyProc9South;
	wire [31:0] dataInProc9South;

	 //Processor 9 control and data signals
	wire wrProc9West;
	wire fullProc9West;
	wire [31:0] dataOutProc9West;

	 //Processor 10 control and data signals
	wire rdProc10North;
	wire emptyProc10North;
	wire [31:0] dataInProc10North;

	 //Processor 10 control and data signals
	wire wrProc10South;
	wire fullProc10South;
	wire [31:0] dataOutProc10South;

	 //Processor 11 control and data signals
	wire rdProc11South;
	wire emptyProc11South;
	wire [31:0] dataInProc11South;

	 //Processor 11 control and data signals
	wire wrProc11East;
	wire fullProc11East;
	wire [31:0] dataOutProc11East;

	 //Processor 12 control and data signals
	wire rdProc12South;
	wire emptyProc12South;
	wire [31:0] dataInProc12South;

	 //Processor 12 control and data signals
	wire wrProc12South;
	wire fullProc12South;
	wire [31:0] dataOutProc12South;

	 //Processor 12 control and data signals
	wire wrProc12East;
	wire fullProc12East;
	wire [31:0] dataOutProc12East;

	 //Processor 12 control and data signals
	wire rdProc12West;
	wire emptyProc12West;
	wire [31:0] dataInProc12West;

	 //Processor 13 control and data signals
	wire wrProc13East;
	wire fullProc13East;
	wire [31:0] dataOutProc13East;

	 //Processor 13 control and data signals
	wire rdProc13West;
	wire emptyProc13West;
	wire [31:0] dataInProc13West;

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
	wire rdProc16West;
	wire emptyProc16West;
	wire [31:0] dataInProc16West;

	 //Processor 16 control and data signals
	wire wrProc16West;
	wire fullProc16West;
	wire [31:0] dataOutProc16West;

	 //Processor 17 control and data signals
	wire rdProc17North;
	wire emptyProc17North;
	wire [31:0] dataInProc17North;

	 //Processor 17 control and data signals
	wire wrProc17West;
	wire fullProc17West;
	wire [31:0] dataOutProc17West;

	 //Processor 18 control and data signals
	wire wrProc18North;
	wire fullProc18North;
	wire [31:0] dataOutProc18North;

	 //Processor 18 control and data signals
	wire rdProc18South;
	wire emptyProc18South;
	wire [31:0] dataInProc18South;

	 //Processor 18 control and data signals
	wire rdProc18East;
	wire emptyProc18East;
	wire [31:0] dataInProc18East;

	 //Processor 18 control and data signals
	wire wrProc18East;
	wire fullProc18East;
	wire [31:0] dataOutProc18East;

	 //Processor 19 control and data signals
	wire wrProc19North;
	wire fullProc19North;
	wire [31:0] dataOutProc19North;

	 //Processor 19 control and data signals
	wire rdProc19South;
	wire emptyProc19South;
	wire [31:0] dataInProc19South;

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
	wire wrProc20South;
	wire fullProc20South;
	wire [31:0] dataOutProc20South;

	 //Processor 21 control and data signals
	wire wrProc21North;
	wire fullProc21North;
	wire [31:0] dataOutProc21North;

	 //Processor 21 control and data signals
	wire rdProc21South;
	wire emptyProc21South;
	wire [31:0] dataInProc21South;

	 //Processor 21 control and data signals
	wire wrProc21East;
	wire fullProc21East;
	wire [31:0] dataOutProc21East;

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
	wire wrProc22East;
	wire fullProc22East;
	wire [31:0] dataOutProc22East;

	 //Processor 22 control and data signals
	wire rdProc22West;
	wire emptyProc22West;
	wire [31:0] dataInProc22West;

	 //Processor 23 control and data signals
	wire rdProc23South;
	wire emptyProc23South;
	wire [31:0] dataInProc23South;

	 //Processor 23 control and data signals
	wire wrProc23East;
	wire fullProc23East;
	wire [31:0] dataOutProc23East;

	 //Processor 23 control and data signals
	wire rdProc23West;
	wire emptyProc23West;
	wire [31:0] dataInProc23West;

	 //Processor 24 control and data signals
	wire rdProc24North;
	wire emptyProc24North;
	wire [31:0] dataInProc24North;

	 //Processor 24 control and data signals
	wire wrProc24North;
	wire fullProc24North;
	wire [31:0] dataOutProc24North;

	 //Processor 24 control and data signals
	wire wrProc24South;
	wire fullProc24South;
	wire [31:0] dataOutProc24South;

	 //Processor 24 control and data signals
	wire wrProc24East;
	wire fullProc24East;
	wire [31:0] dataOutProc24East;

	 //Processor 24 control and data signals
	wire rdProc24West;
	wire emptyProc24West;
	wire [31:0] dataInProc24West;

	 //Processor 25 control and data signals
	wire rdProc25North;
	wire emptyProc25North;
	wire [31:0] dataInProc25North;

	 //Processor 25 control and data signals
	wire wrProc25South;
	wire fullProc25South;
	wire [31:0] dataOutProc25South;

	 //Processor 25 control and data signals
	wire wrProc25East;
	wire fullProc25East;
	wire [31:0] dataOutProc25East;

	 //Processor 25 control and data signals
	wire rdProc25West;
	wire emptyProc25West;
	wire [31:0] dataInProc25West;

	 //Processor 26 control and data signals
	wire rdProc26North;
	wire emptyProc26North;
	wire [31:0] dataInProc26North;

	 //Processor 26 control and data signals
	wire wrProc26North;
	wire fullProc26North;
	wire [31:0] dataOutProc26North;

	 //Processor 26 control and data signals
	wire rdProc26South;
	wire emptyProc26South;
	wire [31:0] dataInProc26South;

	 //Processor 26 control and data signals
	wire wrProc26South;
	wire fullProc26South;
	wire [31:0] dataOutProc26South;

	 //Processor 26 control and data signals
	wire rdProc26East;
	wire emptyProc26East;
	wire [31:0] dataInProc26East;

	 //Processor 26 control and data signals
	wire wrProc26East;
	wire fullProc26East;
	wire [31:0] dataOutProc26East;

	 //Processor 26 control and data signals
	wire rdProc26West;
	wire emptyProc26West;
	wire [31:0] dataInProc26West;

	 //Processor 27 control and data signals
	wire rdProc27South;
	wire Proc27South;
	wire [31:0] dataInProc27South;

	 //Processor 27 control and data signals
	wire wrProc27East;
	wire fullProc27East;
	wire [31:0] dataOutProc27East;

	 //Processor 27 control and data signals
	wire rdProc27West;
	wire emptyProc27West;
	wire [31:0] dataInProc27West;

	 //Processor 27 control and data signals
	wire wrProc27West;
	wire fullProc27West;
	wire [31:0] dataOutProc27West;

	 //Processor 28 control and data signals
	wire wrProc28North;
	wire fullProc28North;
	wire [31:0] dataOutProc28North;

	 //Processor 28 control and data signals
	wire wrProc28East;
	wire fullProc28East;
	wire [31:0] dataOutProc28East;

	 //Processor 28 control and data signals
	wire rdProc28West;
	wire emptyProc28West;
	wire [31:0] dataInProc28West;

	 //Processor 29 control and data signals
	wire wrProc29North;
	wire fullProc29North;
	wire [31:0] dataOutProc29North;

	 //Processor 29 control and data signals
	wire rdProc29West;
	wire emptyProc29West;
	wire [31:0] dataInProc29West;

	 //Processor 30 control and data signals
	wire rdProc30North;
	wire emptyProc30North;
	wire [31:0] dataInProc30North;

	 //Processor 30 control and data signals
	wire wrProc30South;
	wire fullProc30South;
	wire [31:0] dataOutProc30South;

	 //Processor 30 control and data signals
	wire wrProc30East;
	wire fullProc30East;
	wire [31:0] dataOutProc30East;

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
	wire rdProc31West;
	wire emptyProc31West;
	wire [31:0] dataInProc31West;

	 //Processor 32 control and data signals
	wire wrProc32North;
	wire fullProc32North;
	wire [31:0] dataOutProc32North;

	 //Processor 32 control and data signals
	wire rdProc32South;
	wire emptyProc32South;
	wire [31:0] dataInProc32South;

	 //Processor 32 control and data signals
	wire wrProc32East;
	wire fullProc32East;
	wire [31:0] dataOutProc32East;

	 //Processor 32 control and data signals
	wire wrProc32West;
	wire fullProc32West;
	wire [31:0] dataOutProc32West;

	 //Processor 33 control and data signals
	wire wrProc33North;
	wire fullProc33North;
	wire [31:0] dataOutProc33North;

	 //Processor 33 control and data signals
	wire rdProc33West;
	wire emptyProc33West;
	wire [31:0] dataInProc33West;

	 //Processor 34 control and data signals
	wire rdProc34North;
	wire emptyProc34North;
	wire [31:0] dataInProc34North;

	 //Processor 34 control and data signals
	wire wrProc34South;
	wire fullProc34South;
	wire [31:0] dataOutProc34South;

	 //Processor 35 control and data signals
	wire rdProc35North;
	wire emptyProc35North;
	wire [31:0] dataInProc35North;

	 //Processor 35 control and data signals
	wire wrProc35South;
	wire fullProc35South;
	wire [31:0] dataOutProc35South;

	 //Processor 35 control and data signals
	wire wrProc35East;
	wire fullProc35East;
	wire [31:0] dataOutProc35East;

	 //Processor 36 control and data signals
	wire rdProc36North;
	wire emptyProc36North;
	wire [31:0] dataInProc36North;

	 //Processor 36 control and data signals
	wire wrProc36North;
	wire fullProc36North;
	wire [31:0] dataOutProc36North;

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

	 //Processor 36 control and data signals
	wire rdProc36West;
	wire emptyProc36West;
	wire [31:0] dataInProc36West;

	 //Processor 37 control and data signals
	wire wrProc37North;
	wire fullProc37North;
	wire [31:0] dataOutProc37North;

	 //Processor 37 control and data signals
	wire wrProc37South;
	wire fullProc37South;
	wire [31:0] dataOutProc37South;

	 //Processor 37 control and data signals
	wire rdProc37East;
	wire emptyProc37East;
	wire [31:0] dataInProc37East;

	 //Processor 37 control and data signals
	wire rdProc37West;
	wire emptyProc37West;
	wire [31:0] dataInProc37West;

	 //Processor 37 control and data signals
	wire wrProc37West;
	wire fullProc37West;
	wire [31:0] dataOutProc37West;

	 //Processor 38 control and data signals
	wire rdProc38South;
	wire emptyProc38South;
	wire [31:0] dataInProc38South;

	 //Processor 38 control and data signals
	wire rdProc38East;
	wire emptyProc38East;
	wire [31:0] dataInProc38East;

	 //Processor 38 control and data signals
	wire wrProc38East;
	wire fullProc38East;
	wire [31:0] dataOutProc38East;

	 //Processor 38 control and data signals
	wire wrProc38West;
	wire fullProc38West;
	wire [31:0] dataOutProc38West;

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
	wire wrProc40East;
	wire fullProc40East;
	wire [31:0] dataOutProc40East;

	 //Processor 41 control and data signals
	wire rdProc41North;
	wire emptyProc41North;
	wire [31:0] dataInProc41North;

	 //Processor 41 control and data signals
	wire wrProc41North;
	wire fullProc41North;
	wire [31:0] dataOutProc41North;

	 //Processor 41 control and data signals
	wire wrProc41East;
	wire fullProc41East;
	wire [31:0] dataOutProc41East;

	 //Processor 41 control and data signals
	wire rdProc41West;
	wire emptyProc41West;
	wire [31:0] dataInProc41West;

	 //Processor 42 control and data signals
	wire wrProc42North;
	wire fullProc42North;
	wire [31:0] dataOutProc42North;

	 //Processor 42 control and data signals
	wire rdProc42East;
	wire emptyProc42East;
	wire [31:0] dataInProc42East;

	 //Processor 42 control and data signals
	wire rdProc42West;
	wire emptyProc42West;
	wire [31:0] dataInProc42West;

	 //Processor 43 control and data signals
	wire rdProc43East;
	wire emptyProc43East;
	wire [31:0] dataInProc43East;

	 //Processor 43 control and data signals
	wire wrProc43West;
	wire fullProc43West;
	wire [31:0] dataOutProc43West;

	 //Processor 44 control and data signals
	wire rdProc44North;
	wire emptyProc44North;
	wire [31:0] dataInProc44North;

	 //Processor 44 control and data signals
	wire rdProc44East;
	wire emptyProc44East;
	wire [31:0] dataInProc44East;

	 //Processor 44 control and data signals
	wire wrProc44West;
	wire fullProc44West;
	wire [31:0] dataOutProc44West;

	 //Processor 45 control and data signals
	wire rdProc45North;
	wire emptyProc45North;
	wire [31:0] dataInProc45North;

	 //Processor 45 control and data signals
	wire wrProc45West;
	wire fullProc45West;
	wire [31:0] dataOutProc45West;

	 //Processor 46 control and data signals
	wire rdProc46North;
	wire emptyProc46North;
	wire [31:0] dataInProc46North;

	 //Processor 46 control and data signals
	wire wrProc46East;
	wire fullProc46East;
	wire [31:0] dataOutProc46East;

	 //Processor 47 control and data signals
	wire rdProc47North;
	wire emptyProc47North;
	wire [31:0] dataInProc47North;

	 //Processor 47 control and data signals
	wire wrProc47East;
	wire fullProc47East;
	wire [31:0] dataOutProc47East;

	 //Processor 47 control and data signals
	wire rdProc47West;
	wire emptyProc47West;
	wire [31:0] dataInProc47West;

	 //Processor 48 control and data signals
	wire wrProc48North;
	wire fullProc48North;
	wire [31:0] dataOutProc48North;

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

	 //Processor 49 control and data signals
	wire rdProc49West;
	wire emptyProc49West;
	wire [31:0] dataInProc49West;

	 //Processor 49 control and data signals
	wire wrProc49West;
	wire fullProc49West;
	wire [31:0] dataOutProc49West;



//PROCESSOR 0
system proc0(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe0),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe0),
	.wrSouth(wrProc0South),
	.fullSouth(fullProc0South),
	.dataOutSouth(dataOutProc0South),
	.rdEast(rdProc0East),
	.emptyEast(emptyProc0East),
	.dataInEast(dataInProc0East),
	.wrEast(wrProc0East),
	.fullEast(fullProc0East),
	.dataOutEast(dataOutProc0East));

//PROCESSOR 1
system proc1(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe1),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe1),
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
	.rdEast(rdProc2East),
	.emptyEast(emptyProc2East),
	.dataInEast(dataInProc2East),
	.reg_file_b_readdataout(reg_file_b_readdataout));

//PROCESSOR 3
system proc3(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe3),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe3),
	.rdEast(rdProc3East),
	.emptyEast(emptyProc3East),
	.dataInEast(dataInProc3East),
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
	.rdEast(rdProc4East),
	.emptyEast(emptyProc4East),
	.dataInEast(dataInProc4East),
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
	.rdEast(rdProc5East),
	.emptyEast(emptyProc5East),
	.dataInEast(dataInProc5East),
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
	.wrSouth(wrProc7South),
	.fullSouth(fullProc7South),
	.dataOutSouth(dataOutProc7South),
	.rdEast(rdProc7East),
	.emptyEast(emptyProc7East),
	.dataInEast(dataInProc7East),
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
	.rdEast(rdProc8East),
	.emptyEast(emptyProc8East),
	.dataInEast(dataInProc8East),
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
	.rdSouth(rdProc9South),
	.emptySouth(emptyProc9South),
	.dataInSouth(dataInProc9South),
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
	.wrSouth(wrProc10South),
	.fullSouth(fullProc10South),
	.dataOutSouth(dataOutProc10South));

//PROCESSOR 11
system proc11(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe11),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe11),
	.rdSouth(rdProc11South),
	.emptySouth(emptyProc11South),
	.dataInSouth(dataInProc11South),
	.wrEast(wrProc11East),
	.fullEast(fullProc11East),
	.dataOutEast(dataOutProc11East));

//PROCESSOR 12
system proc12(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe12),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe12),
	.rdSouth(rdProc12South),
	.emptySouth(emptyProc12South),
	.dataInSouth(dataInProc12South),
	.wrSouth(wrProc12South),
	.fullSouth(fullProc12South),
	.dataOutSouth(dataOutProc12South),
	.wrEast(wrProc12East),
	.fullEast(fullProc12East),
	.dataOutEast(dataOutProc12East),
	.rdWest(rdProc12West),
	.emptyWest(emptyProc12West),
	.dataInWest(dataInProc12West));

//PROCESSOR 13
system proc13(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe13),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe13),
	.wrEast(wrProc13East),
	.fullEast(fullProc13East),
	.dataOutEast(dataOutProc13East),
	.rdWest(rdProc13West),
	.emptyWest(emptyProc13West),
	.dataInWest(dataInProc13West));

//PROCESSOR 14
system proc14(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe14),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe14),
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
	.dataInWest(dataInProc14West));

//PROCESSOR 15
system proc15(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe15),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe15),
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
	.rdSouth(rdProc18South),
	.emptySouth(emptyProc18South),
	.dataInSouth(dataInProc18South),
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
	.wrNorth(wrProc19North),
	.fullNorth(fullProc19North),
	.dataOutNorth(dataOutProc19North),
	.rdSouth(rdProc19South),
	.emptySouth(emptyProc19South),
	.dataInSouth(dataInProc19South),
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
	.wrSouth(wrProc20South),
	.fullSouth(fullProc20South),
	.dataOutSouth(dataOutProc20South));

//PROCESSOR 21
system proc21(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe21),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe21),
	.wrNorth(wrProc21North),
	.fullNorth(fullProc21North),
	.dataOutNorth(dataOutProc21North),
	.rdSouth(rdProc21South),
	.emptySouth(emptyProc21South),
	.dataInSouth(dataInProc21South),
	.wrEast(wrProc21East),
	.fullEast(fullProc21East),
	.dataOutEast(dataOutProc21East));

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
	.wrEast(wrProc22East),
	.fullEast(fullProc22East),
	.dataOutEast(dataOutProc22East),
	.rdWest(rdProc22West),
	.emptyWest(emptyProc22West),
	.dataInWest(dataInProc22West));

//PROCESSOR 23
system proc23(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe23),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe23),
	.rdSouth(rdProc23South),
	.emptySouth(emptyProc23South),
	.dataInSouth(dataInProc23South),
	.wrEast(wrProc23East),
	.fullEast(fullProc23East),
	.dataOutEast(dataOutProc23East),
	.rdWest(rdProc23West),
	.emptyWest(emptyProc23West),
	.dataInWest(dataInProc23West));

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
	.wrSouth(wrProc24South),
	.fullSouth(fullProc24South),
	.dataOutSouth(dataOutProc24South),
	.wrEast(wrProc24East),
	.fullEast(fullProc24East),
	.dataOutEast(dataOutProc24East),
	.rdWest(rdProc24West),
	.emptyWest(emptyProc24West),
	.dataInWest(dataInProc24West));

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
	.wrSouth(wrProc25South),
	.fullSouth(fullProc25South),
	.dataOutSouth(dataOutProc25South),
	.wrEast(wrProc25East),
	.fullEast(fullProc25East),
	.dataOutEast(dataOutProc25East),
	.rdWest(rdProc25West),
	.emptyWest(emptyProc25West),
	.dataInWest(dataInProc25West));

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
	.rdEast(rdProc26East),
	.emptyEast(emptyProc26East),
	.dataInEast(dataInProc26East),
	.wrEast(wrProc26East),
	.fullEast(fullProc26East),
	.dataOutEast(dataOutProc26East),
	.rdWest(rdProc26West),
	.emptyWest(emptyProc26West),
	.dataInWest(dataInProc26West));

//PROCESSOR 27
system proc27(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe27),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe27),
	.rdSouth(rdProc27South),
	.emptySouth(emptyProc27South),
	.dataInSouth(dataInProc27South),
	.wrEast(wrProc27East),
	.fullEast(fullProc27East),
	.dataOutEast(dataOutProc27East),
	.rdWest(rdProc27West),
	.emptyWest(emptyProc27West),
	.dataInWest(dataInProc27West),
	.wrWest(wrProc27West),
	.fullWest(fullProc27West),
	.dataOutWest(dataOutProc27West));

//PROCESSOR 28
system proc28(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe28),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe28),
	.wrNorth(wrProc28North),
	.fullNorth(fullProc28North),
	.dataOutNorth(dataOutProc28North),
	.wrEast(wrProc28East),
	.fullEast(fullProc28East),
	.dataOutEast(dataOutProc28East),
	.rdWest(rdProc28West),
	.emptyWest(emptyProc28West),
	.dataInWest(dataInProc28West));

//PROCESSOR 29
system proc29(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe29),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe29),
	.wrNorth(wrProc29North),
	.fullNorth(fullProc29North),
	.dataOutNorth(dataOutProc29North),
	.rdWest(rdProc29West),
	.emptyWest(emptyProc29West),
	.dataInWest(dataInProc29West));

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
	.wrSouth(wrProc30South),
	.fullSouth(fullProc30South),
	.dataOutSouth(dataOutProc30South),
	.wrEast(wrProc30East),
	.fullEast(fullProc30East),
	.dataOutEast(dataOutProc30East));

//PROCESSOR 31
system proc31(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe31),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe31),
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
	.rdWest(rdProc31West),
	.emptyWest(emptyProc31West),
	.dataInWest(dataInProc31West));

//PROCESSOR 32
system proc32(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe32),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe32),
	.wrNorth(wrProc32North),
	.fullNorth(fullProc32North),
	.dataOutNorth(dataOutProc32North),
	.rdSouth(rdProc32South),
	.emptySouth(emptyProc32South),
	.dataInSouth(dataInProc32South),
	.wrEast(wrProc32East),
	.fullEast(fullProc32East),
	.dataOutEast(dataOutProc32East),
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
	.wrNorth(wrProc33North),
	.fullNorth(fullProc33North),
	.dataOutNorth(dataOutProc33North),
	.rdWest(rdProc33West),
	.emptyWest(emptyProc33West),
	.dataInWest(dataInProc33West));

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
	.wrSouth(wrProc34South),
	.fullSouth(fullProc34South),
	.dataOutSouth(dataOutProc34South));

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
	.wrSouth(wrProc35South),
	.fullSouth(fullProc35South),
	.dataOutSouth(dataOutProc35South),
	.wrEast(wrProc35East),
	.fullEast(fullProc35East),
	.dataOutEast(dataOutProc35East));

//PROCESSOR 36
system proc36(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe36),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe36),
	.rdNorth(rdProc36North),
	.emptyNorth(emptyProc36North),
	.dataInNorth(dataInProc36North),
	.wrNorth(wrProc36North),
	.fullNorth(fullProc36North),
	.dataOutNorth(dataOutProc36North),
	.wrSouth(wrProc36South),
	.fullSouth(fullProc36South),
	.dataOutSouth(dataOutProc36South),
	.rdEast(rdProc36East),
	.emptyEast(emptyProc36East),
	.dataInEast(dataInProc36East),
	.wrEast(wrProc36East),
	.fullEast(fullProc36East),
	.dataOutEast(dataOutProc36East),
	.rdWest(rdProc36West),
	.emptyWest(emptyProc36West),
	.dataInWest(dataInProc36West));

//PROCESSOR 37
system proc37(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe37),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe37),
	.wrNorth(wrProc37North),
	.fullNorth(fullProc37North),
	.dataOutNorth(dataOutProc37North),
	.wrSouth(wrProc37South),
	.fullSouth(fullProc37South),
	.dataOutSouth(dataOutProc37South),
	.rdEast(rdProc37East),
	.emptyEast(emptyProc37East),
	.dataInEast(dataInProc37East),
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
	.rdSouth(rdProc38South),
	.emptySouth(emptyProc38South),
	.dataInSouth(dataInProc38South),
	.rdEast(rdProc38East),
	.emptyEast(emptyProc38East),
	.dataInEast(dataInProc38East),
	.wrEast(wrProc38East),
	.fullEast(fullProc38East),
	.dataOutEast(dataOutProc38East),
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
	.wrEast(wrProc40East),
	.fullEast(fullProc40East),
	.dataOutEast(dataOutProc40East));

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
	.wrEast(wrProc41East),
	.fullEast(fullProc41East),
	.dataOutEast(dataOutProc41East),
	.rdWest(rdProc41West),
	.emptyWest(emptyProc41West),
	.dataInWest(dataInProc41West));

//PROCESSOR 42
system proc42(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe42),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe42),
	.wrNorth(wrProc42North),
	.fullNorth(fullProc42North),
	.dataOutNorth(dataOutProc42North),
	.rdEast(rdProc42East),
	.emptyEast(emptyProc42East),
	.dataInEast(dataInProc42East),
	.rdWest(rdProc42West),
	.emptyWest(emptyProc42West),
	.dataInWest(dataInProc42West));

//PROCESSOR 43
system proc43(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe43),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe43),
	.rdEast(rdProc43East),
	.emptyEast(emptyProc43East),
	.dataInEast(dataInProc43East),
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
	.rdEast(rdProc44East),
	.emptyEast(emptyProc44East),
	.dataInEast(dataInProc44East),
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
	.rdNorth(rdProc45North),
	.emptyNorth(emptyProc45North),
	.dataInNorth(dataInProc45North),
	.wrWest(wrProc45West),
	.fullWest(fullProc45West),
	.dataOutWest(dataOutProc45West));

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
	.wrEast(wrProc46East),
	.fullEast(fullProc46East),
	.dataOutEast(dataOutProc46East));

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
	.wrEast(wrProc47East),
	.fullEast(fullProc47East),
	.dataOutEast(dataOutProc47East),
	.rdWest(rdProc47West),
	.emptyWest(emptyProc47West),
	.dataInWest(dataInProc47West));

//PROCESSOR 48
system proc48(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe48),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe48),
	.wrNorth(wrProc48North),
	.fullNorth(fullProc48North),
	.dataOutNorth(dataOutProc48North),
	.rdEast(rdProc48East),
	.emptyEast(emptyProc48East),
	.dataInEast(dataInProc48East),
	.wrEast(wrProc48East),
	.fullEast(fullProc48East),
	.dataOutEast(dataOutProc48East),
	.rdWest(rdProc48West),
	.emptyWest(emptyProc48West),
	.dataInWest(dataInProc48West));

//PROCESSOR 49
system proc49(.clk(clk),
	.resetn (resetn),
	.boot_iaddr(boot_iaddr),
	.boot_idata(boot_idata),
	.boot_iwe(boot_iwe49),
	.boot_daddr(boot_daddr),
	.boot_ddata(boot_ddata),
	.boot_dwe(boot_dwe49),
	.rdWest(rdProc49West),
	.emptyWest(emptyProc49West),
	.dataInWest(dataInProc49West),
	.wrWest(wrProc49West),
	.fullWest(fullProc49West),
	.dataOutWest(dataOutProc49West));

//FIFO 0 TO 10
fifo fifo_proc0_to_proc10(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc0South),
	.full(fullProc0South),
	.dataIn(dataOutProc0South),
	.rd(rdProc10North),
	.empty(emptyProc10North),
	.dataOut(dataInProc10North));

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

//FIFO 16 TO 6
fifo fifo_proc16_to_proc6(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc16North),
	.full(fullProc16North),
	.dataIn(dataOutProc16North),
	.rd(rdProc6South),
	.empty(emptyProc6South),
	.dataOut(dataInProc6South));

//FIFO 6 TO 16
fifo fifo_proc6_to_proc16(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc6South),
	.full(fullProc6South),
	.dataIn(dataOutProc6South),
	.rd(rdProc16North),
	.empty(emptyProc16North),
	.dataOut(dataInProc16North));

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

//FIFO 7 TO 17
fifo fifo_proc7_to_proc17(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc7South),
	.full(fullProc7South),
	.dataIn(dataOutProc7South),
	.rd(rdProc17North),
	.empty(emptyProc17North),
	.dataOut(dataInProc17North));

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

//FIFO 18 TO 8
fifo fifo_proc18_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc18North),
	.full(fullProc18North),
	.dataIn(dataOutProc18North),
	.rd(rdProc8South),
	.empty(emptyProc8South),
	.dataOut(dataInProc8South));

//FIFO 9 TO 8
fifo fifo_proc9_to_proc8(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc9West),
	.full(fullProc9West),
	.dataIn(dataOutProc9West),
	.rd(rdProc8East),
	.empty(emptyProc8East),
	.dataOut(dataInProc8East));

//FIFO 19 TO 9
fifo fifo_proc19_to_proc9(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc19North),
	.full(fullProc19North),
	.dataIn(dataOutProc19North),
	.rd(rdProc9South),
	.empty(emptyProc9South),
	.dataOut(dataInProc9South));

//FIFO 10 TO 20
fifo fifo_proc10_to_proc20(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc10South),
	.full(fullProc10South),
	.dataIn(dataOutProc10South),
	.rd(rdProc20North),
	.empty(emptyProc20North),
	.dataOut(dataInProc20North));

//FIFO 21 TO 11
fifo fifo_proc21_to_proc11(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc21North),
	.full(fullProc21North),
	.dataIn(dataOutProc21North),
	.rd(rdProc11South),
	.empty(emptyProc11South),
	.dataOut(dataInProc11South));

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

//FIFO 22 TO 12
fifo fifo_proc22_to_proc12(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc22North),
	.full(fullProc22North),
	.dataIn(dataOutProc22North),
	.rd(rdProc12South),
	.empty(emptyProc12South),
	.dataOut(dataInProc12South));

//FIFO 12 TO 22
fifo fifo_proc12_to_proc22(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc12South),
	.full(fullProc12South),
	.dataIn(dataOutProc12South),
	.rd(rdProc22North),
	.empty(emptyProc22North),
	.dataOut(dataInProc22North));

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

//FIFO 24 TO 14
fifo fifo_proc24_to_proc14(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc24North),
	.full(fullProc24North),
	.dataIn(dataOutProc24North),
	.rd(rdProc14South),
	.empty(emptyProc14South),
	.dataOut(dataInProc14South));

//FIFO 14 TO 24
fifo fifo_proc14_to_proc24(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc14South),
	.full(fullProc14South),
	.dataIn(dataOutProc14South),
	.rd(rdProc24North),
	.empty(emptyProc24North),
	.dataOut(dataInProc24North));

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

//FIFO 15 TO 25
fifo fifo_proc15_to_proc25(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc15South),
	.full(fullProc15South),
	.dataIn(dataOutProc15South),
	.rd(rdProc25North),
	.empty(emptyProc25North),
	.dataOut(dataInProc25North));

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

//FIFO 26 TO 16
fifo fifo_proc26_to_proc16(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc26North),
	.full(fullProc26North),
	.dataIn(dataOutProc26North),
	.rd(rdProc16South),
	.empty(emptyProc16South),
	.dataOut(dataInProc16South));

//FIFO 16 TO 26
fifo fifo_proc16_to_proc26(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc16South),
	.full(fullProc16South),
	.dataIn(dataOutProc16South),
	.rd(rdProc26North),
	.empty(emptyProc26North),
	.dataOut(dataInProc26North));

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

//FIFO 28 TO 18
fifo fifo_proc28_to_proc18(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc28North),
	.full(fullProc28North),
	.dataIn(dataOutProc28North),
	.rd(rdProc18South),
	.empty(emptyProc18South),
	.dataOut(dataInProc18South));

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

//FIFO 29 TO 19
fifo fifo_proc29_to_proc19(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc29North),
	.full(fullProc29North),
	.dataIn(dataOutProc29North),
	.rd(rdProc19South),
	.empty(emptyProc19South),
	.dataOut(dataInProc19South));

//FIFO 20 TO 30
fifo fifo_proc20_to_proc30(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc20South),
	.full(fullProc20South),
	.dataIn(dataOutProc20South),
	.rd(rdProc30North),
	.empty(emptyProc30North),
	.dataOut(dataInProc30North));

//FIFO 31 TO 21
fifo fifo_proc31_to_proc21(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc31North),
	.full(fullProc31North),
	.dataIn(dataOutProc31North),
	.rd(rdProc21South),
	.empty(emptyProc21South),
	.dataOut(dataInProc21South));

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

//FIFO 32 TO 22
fifo fifo_proc32_to_proc22(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc32North),
	.full(fullProc32North),
	.dataIn(dataOutProc32North),
	.rd(rdProc22South),
	.empty(emptyProc22South),
	.dataOut(dataInProc22South));

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

//FIFO 33 TO 23
fifo fifo_proc33_to_proc23(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc33North),
	.full(fullProc33North),
	.dataIn(dataOutProc33North),
	.rd(rdProc23South),
	.empty(emptyProc23South),
	.dataOut(dataInProc23South));

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

//FIFO 24 TO 34
fifo fifo_proc24_to_proc34(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc24South),
	.full(fullProc24South),
	.dataIn(dataOutProc24South),
	.rd(rdProc34North),
	.empty(emptyProc34North),
	.dataOut(dataInProc34North));

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

//FIFO 25 TO 35
fifo fifo_proc25_to_proc35(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc25South),
	.full(fullProc25South),
	.dataIn(dataOutProc25South),
	.rd(rdProc35North),
	.empty(emptyProc35North),
	.dataOut(dataInProc35North));

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

//FIFO 36 TO 26
fifo fifo_proc36_to_proc26(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc36North),
	.full(fullProc36North),
	.dataIn(dataOutProc36North),
	.rd(rdProc26South),
	.empty(emptyProc26South),
	.dataOut(dataInProc26South));

//FIFO 26 TO 36
fifo fifo_proc26_to_proc36(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc26South),
	.full(fullProc26South),
	.dataIn(dataOutProc26South),
	.rd(rdProc36North),
	.empty(emptyProc36North),
	.dataOut(dataInProc36North));

//FIFO 27 TO 26
fifo fifo_proc27_to_proc26(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc27West),
	.full(fullProc27West),
	.dataIn(dataOutProc27West),
	.rd(rdProc26East),
	.empty(emptyProc26East),
	.dataOut(dataInProc26East));

//FIFO 26 TO 27
fifo fifo_proc26_to_proc27(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc26East),
	.full(fullProc26East),
	.dataIn(dataOutProc26East),
	.rd(rdProc27West),
	.empty(emptyProc27West),
	.dataOut(dataInProc27West));

//FIFO 37 TO 27
fifo fifo_proc37_to_proc27(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc37North),
	.full(fullProc37North),
	.dataIn(dataOutProc37North),
	.rd(rdProc27South),
	.empty(emptyProc27South),
	.dataOut(dataInProc27South));

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

//FIFO 30 TO 40
fifo fifo_proc30_to_proc40(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc30South),
	.full(fullProc30South),
	.dataIn(dataOutProc30South),
	.rd(rdProc40North),
	.empty(emptyProc40North),
	.dataOut(dataInProc40North));

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

//FIFO 41 TO 31
fifo fifo_proc41_to_proc31(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc41North),
	.full(fullProc41North),
	.dataIn(dataOutProc41North),
	.rd(rdProc31South),
	.empty(emptyProc31South),
	.dataOut(dataInProc31South));

//FIFO 31 TO 41
fifo fifo_proc31_to_proc41(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc31South),
	.full(fullProc31South),
	.dataIn(dataOutProc31South),
	.rd(rdProc41North),
	.empty(emptyProc41North),
	.dataOut(dataInProc41North));

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

//FIFO 42 TO 32
fifo fifo_proc42_to_proc32(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc42North),
	.full(fullProc42North),
	.dataIn(dataOutProc42North),
	.rd(rdProc32South),
	.empty(emptyProc32South),
	.dataOut(dataInProc32South));

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

//FIFO 34 TO 44
fifo fifo_proc34_to_proc44(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc34South),
	.full(fullProc34South),
	.dataIn(dataOutProc34South),
	.rd(rdProc44North),
	.empty(emptyProc44North),
	.dataOut(dataInProc44North));

//FIFO 35 TO 45
fifo fifo_proc35_to_proc45(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc35South),
	.full(fullProc35South),
	.dataIn(dataOutProc35South),
	.rd(rdProc45North),
	.empty(emptyProc45North),
	.dataOut(dataInProc45North));

//FIFO 35 TO 36
fifo fifo_proc35_to_proc36(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc35East),
	.full(fullProc35East),
	.dataIn(dataOutProc35East),
	.rd(rdProc36West),
	.empty(emptyProc36West),
	.dataOut(dataInProc36West));

//FIFO 36 TO 46
fifo fifo_proc36_to_proc46(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc36South),
	.full(fullProc36South),
	.dataIn(dataOutProc36South),
	.rd(rdProc46North),
	.empty(emptyProc46North),
	.dataOut(dataInProc46North));

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

//FIFO 37 TO 47
fifo fifo_proc37_to_proc47(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc37South),
	.full(fullProc37South),
	.dataIn(dataOutProc37South),
	.rd(rdProc47North),
	.empty(emptyProc47North),
	.dataOut(dataInProc47North));

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

//FIFO 48 TO 38
fifo fifo_proc48_to_proc38(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc48North),
	.full(fullProc48North),
	.dataIn(dataOutProc48North),
	.rd(rdProc38South),
	.empty(emptyProc38South),
	.dataOut(dataInProc38South));

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

//FIFO 45 TO 44
fifo fifo_proc45_to_proc44(
	.clk(clk),
	.resetn(resetn),
	.wr(wrProc45West),
	.full(fullProc45West),
	.dataIn(dataOutProc45West),
	.rd(rdProc44East),
	.empty(emptyProc44East),
	.dataOut(dataInProc44East));

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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
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
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		9: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 = ~resetn;
			boot_dwe9 = ~resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		10: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 = ~resetn;
			boot_dwe10 = ~resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		11: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 = ~resetn;
			boot_dwe11 = ~resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		12: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 = ~resetn;
			boot_dwe12 = ~resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		13: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 = ~resetn;
			boot_dwe13 = ~resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		14: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 = ~resetn;
			boot_dwe14 = ~resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		15: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 = ~resetn;
			boot_dwe15 = ~resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		16: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 = ~resetn;
			boot_dwe16 = ~resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		17: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 = ~resetn;
			boot_dwe17 = ~resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		18: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 = ~resetn;
			boot_dwe18 = ~resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		19: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 = ~resetn;
			boot_dwe19 = ~resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		20: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 = ~resetn;
			boot_dwe20 = ~resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		21: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 = ~resetn;
			boot_dwe21 = ~resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		22: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 = ~resetn;
			boot_dwe22 = ~resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		23: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 = ~resetn;
			boot_dwe23 = ~resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		24: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 = ~resetn;
			boot_dwe24 = ~resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		25: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 = ~resetn;
			boot_dwe25 = ~resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		26: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 = ~resetn;
			boot_dwe26 = ~resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		27: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 = ~resetn;
			boot_dwe27 = ~resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		28: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 = ~resetn;
			boot_dwe28 = ~resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		29: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 = ~resetn;
			boot_dwe29 = ~resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		30: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 = ~resetn;
			boot_dwe30 = ~resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		31: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 = ~resetn;
			boot_dwe31 = ~resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		32: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 = ~resetn;
			boot_dwe32 = ~resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		33: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 = ~resetn;
			boot_dwe33 = ~resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		34: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 = ~resetn;
			boot_dwe34 = ~resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		35: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 = ~resetn;
			boot_dwe35 = ~resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		36: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 = ~resetn;
			boot_dwe36 = ~resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		37: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 = ~resetn;
			boot_dwe37 = ~resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		38: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 = ~resetn;
			boot_dwe38 = ~resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		39: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 = ~resetn;
			boot_dwe39 = ~resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		40: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 = ~resetn;
			boot_dwe40 = ~resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		41: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 = ~resetn;
			boot_dwe41 = ~resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		42: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 = ~resetn;
			boot_dwe42 = ~resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		43: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 = ~resetn;
			boot_dwe43 = ~resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		44: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 = ~resetn;
			boot_dwe44 = ~resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		45: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 = ~resetn;
			boot_dwe45 = ~resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		46: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 = ~resetn;
			boot_dwe46 = ~resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		47: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 = ~resetn;
			boot_dwe47 = ~resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		48: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 = ~resetn;
			boot_dwe48 = ~resetn;
			boot_iwe49 =  resetn;
			boot_dwe49 =  resetn;
		end

		49: begin

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
			boot_iwe8 =  resetn;
			boot_dwe8 =  resetn;
			boot_iwe9 =  resetn;
			boot_dwe9 =  resetn;
			boot_iwe10 =  resetn;
			boot_dwe10 =  resetn;
			boot_iwe11 =  resetn;
			boot_dwe11 =  resetn;
			boot_iwe12 =  resetn;
			boot_dwe12 =  resetn;
			boot_iwe13 =  resetn;
			boot_dwe13 =  resetn;
			boot_iwe14 =  resetn;
			boot_dwe14 =  resetn;
			boot_iwe15 =  resetn;
			boot_dwe15 =  resetn;
			boot_iwe16 =  resetn;
			boot_dwe16 =  resetn;
			boot_iwe17 =  resetn;
			boot_dwe17 =  resetn;
			boot_iwe18 =  resetn;
			boot_dwe18 =  resetn;
			boot_iwe19 =  resetn;
			boot_dwe19 =  resetn;
			boot_iwe20 =  resetn;
			boot_dwe20 =  resetn;
			boot_iwe21 =  resetn;
			boot_dwe21 =  resetn;
			boot_iwe22 =  resetn;
			boot_dwe22 =  resetn;
			boot_iwe23 =  resetn;
			boot_dwe23 =  resetn;
			boot_iwe24 =  resetn;
			boot_dwe24 =  resetn;
			boot_iwe25 =  resetn;
			boot_dwe25 =  resetn;
			boot_iwe26 =  resetn;
			boot_dwe26 =  resetn;
			boot_iwe27 =  resetn;
			boot_dwe27 =  resetn;
			boot_iwe28 =  resetn;
			boot_dwe28 =  resetn;
			boot_iwe29 =  resetn;
			boot_dwe29 =  resetn;
			boot_iwe30 =  resetn;
			boot_dwe30 =  resetn;
			boot_iwe31 =  resetn;
			boot_dwe31 =  resetn;
			boot_iwe32 =  resetn;
			boot_dwe32 =  resetn;
			boot_iwe33 =  resetn;
			boot_dwe33 =  resetn;
			boot_iwe34 =  resetn;
			boot_dwe34 =  resetn;
			boot_iwe35 =  resetn;
			boot_dwe35 =  resetn;
			boot_iwe36 =  resetn;
			boot_dwe36 =  resetn;
			boot_iwe37 =  resetn;
			boot_dwe37 =  resetn;
			boot_iwe38 =  resetn;
			boot_dwe38 =  resetn;
			boot_iwe39 =  resetn;
			boot_dwe39 =  resetn;
			boot_iwe40 =  resetn;
			boot_dwe40 =  resetn;
			boot_iwe41 =  resetn;
			boot_dwe41 =  resetn;
			boot_iwe42 =  resetn;
			boot_dwe42 =  resetn;
			boot_iwe43 =  resetn;
			boot_dwe43 =  resetn;
			boot_iwe44 =  resetn;
			boot_dwe44 =  resetn;
			boot_iwe45 =  resetn;
			boot_dwe45 =  resetn;
			boot_iwe46 =  resetn;
			boot_dwe46 =  resetn;
			boot_iwe47 =  resetn;
			boot_dwe47 =  resetn;
			boot_iwe48 =  resetn;
			boot_dwe48 =  resetn;
			boot_iwe49 = ~resetn;
			boot_dwe49 = ~resetn;
		end

		50: begin

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
		end

	endcase
end
endmodule