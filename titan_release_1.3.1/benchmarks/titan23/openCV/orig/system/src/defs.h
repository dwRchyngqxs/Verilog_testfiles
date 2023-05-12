/******************** ScaleImageCache *********************/

/***** package *****/
package pkg_scaleCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //

	// physical size
	parameter int scaleRowSize = supportedImageWidth;
	parameter int scaleColSize = supportedImageHeight;
	
	// row and col bits needed
	parameter int scaleRowBits = log2(scaleRowSize - 1);	
	parameter int scaleColBits = log2(scaleColSize - 1);


	// bits/words needed to construct the whole memory
	parameter int scaleAddressBits = log2( (scaleRowSize * scaleColSize) - 1);	
	parameter int scaleWords = (scaleRowSize * scaleColSize);
	
	// minimum word size needed to store the intergral image
	parameter int scaleDepth = inputImageDepth;		
	
	// ---- private params ---- //		
	parameter int	WORD_SIZE = scaleDepth;
	parameter int	WORDS = scaleWords;	
	parameter int 	COL_WIDTH = scaleColBits;
	parameter int 	ROW_WIDTH = scaleRowBits;	
	parameter int	ADDR_WIDTH = scaleAddressBits;
	
endpackage
/******************** Scale Param Generation *********************/

/***** package *****/
package pkg_scaleParamGeneration;
	
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset,
		S_Ready, 
		S_IndexScaleCount,
		S_CalcNewX,
		S_CalcNewY,
		S_CalcInvS,
		S_CalcXS,
		S_CalcYS,
		S_WaitForDiv,
		S_ReadInvS,
		S_ReadXS,
		S_ReadXY,
		S_CalcNewWinSize,
		S_Done} STATES_t; 
              
endpackage
/******************** ImageCache *********************/

/***** package *****/
package pkg_imageCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //

	// physical size
	parameter int rowSize = supportedImageWidth;
	parameter int colSize = supportedImageHeight;

	
	// row and col bits needed
	parameter int rowBits = log2(rowSize);	
	parameter int colBits = log2(colSize);

	// bits/words needed to construct the whole memory
	parameter int addressBits = log2( (rowSize * colSize) - 1);	
	parameter int words = (rowSize * colSize);
	
	
	// minimum word size needed to store the intergral image
	//parameter int depth = inputImageDepth;		
	
	// ---- private params ---- //		
	parameter int	WORD_SIZE 		= inputImageDepth;
	parameter int	WORDS 			= words;	
	parameter int 	COL_WIDTH 		= colBits;
	parameter int 	ROW_WIDTH 		= rowBits;	
	parameter int	ADDR_WIDTH		= addressBits;
	
endpackage
/******************** resultStore *********************/

/***** package *****/
package pkg_resultStore;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	parameter int CORE_COUNTER_WIDTH = log2(cores);
   parameter int CORES = cores;
  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StoreLocal,
		S_PopulateFIFO,
		S_Exit,
		S_Finish } STATES_t; 
              
endpackage



/******************** Integral Image Generation *********************/

/***** package *****/
package pkg_integralImageGeneration;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
  
	// integral counter sizes
	parameter int INTEGRAL_Y_COUNTER_WIDTH = pkg_integralImageCache::integralColBits;
	parameter int INTEGRAL_X_COUNTER_WIDTH = pkg_integralImageCache::integralRowBits;
  	parameter int INTEGRAL_DATA_WIDTH = pkg_integralImageCache::integralImageDepth;
  	parameter int SQ_DATA_WIDTH = pkg_SQImageCache::SQImageDepth;
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_FillRowOne,
		S_FillColOne,
		S_Ready,
		S_Index,
		S_Read,
		S_CalcRow,
		S_CalcRes,
		S_Write,
		S_Done } STATES_t; 
              
endpackage


/******************** SQImageCache *********************/

/***** package *****/
package pkg_SQImageCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// physical size
	parameter int SQRowSize = supportedImageWidth+1;	
	parameter int SQColSize = supportedImageHeight+1;
	
	// row and col bits needed
	parameter int SQRowBits = log2(SQRowSize -1);	
	parameter int SQColBits = log2(SQColSize -1);
	
	// bits needed if blocked
	parameter int SQBlocksPerRow = CielingADivideB(SQRowSize,windowCacheBlocking);
	parameter int SQBlockBits = log2(SQBlocksPerRow - 1);

	// total address space bits
	parameter int SQAddressBits = log2((SQBlocksPerRow * SQColSize) -1);
	parameter int SQWords = SQBlocksPerRow * SQColSize;
	// minimum word size needed to store the sq image
	parameter int SQImageDepth = log2( supportedImageHeight * supportedImageWidth * (1 << inputImageDepth) * (1 << inputImageDepth) );
	
	
	// ---- private params ---- //	
	
	parameter int	WORD_SIZE = SQImageDepth;
	parameter int	TOTALWORDS = SQWords;
	parameter int	WORDS = windowCacheBlocking;	
	parameter int 	COL_WIDTH = SQColBits;
	parameter int 	ROW_WIDTH = SQRowBits;
	parameter int 	BLOCKS = SQBlocksPerRow;
	parameter int  BLOCK_WIDTH = SQBlockBits;
	parameter int	ADDR_WIDTH = SQAddressBits;	
	parameter int	ELM_WIDTH = elementBits;
	
endpackage

	
/***** interface *****/
interface intf_SQImageCache_Write;
	import  pkg_SQImageCache::*;
	logic unsigned [COL_WIDTH-1:0] waddrY;
	logic unsigned [ROW_WIDTH-1:0] waddrX;
	logic unsigned [WORD_SIZE-1:0] wdata; 	
	logic we;
endinterface

/***** interface *****/
interface intf_SQImageCache_Read;
	import  pkg_SQImageCache::*;
	logic unsigned [COL_WIDTH-1:0] raddrY;
	logic unsigned [BLOCK_WIDTH -1:0] raddrXBlock;
	logic unsigned [WORDS-1:0][WORD_SIZE-1:0] q;		
endinterface
/******************** cascadeCache *********************/

/***** package *****/
package pkg_cascadeCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //	

	// number of bits to store cascade information
	parameter int cascadeCacheDataBits = fixedbits;
	
	// number of bits/words construct the whole memory
	parameter int cascadeAddressBits = log2( (numberOfFeatures*4) - 1);
	parameter int cascadeWords = numberOfFeatures*4;
	
	
	// number of bits required to count stages and classifiers
	parameter int cascadeStageBits = log2( supportedCascadeStages ); 
	parameter int cascadeClassifierBits = log2( supportedCascadeClassifiers);	
	
	// ---- private params ---- //		
	parameter int	ADDR_WIDTH = cascadeAddressBits;
	parameter int	WORDS = cascadeWords;
	parameter int	WORD_SIZE = cascadeCacheDataBits;
	
endpackage
/******************** procLoader *********************/

/***** package *****/
package pkg_procLoader;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
  
	// integral counter sizes
	parameter int INTEGRAL_Y_COUNTER_WIDTH = pkg_integralImageCache::integralColBits;
	parameter int INTEGRAL_X_COUNTER_WIDTH = pkg_integralImageCache::integralRowBits;
	parameter int INTEGRAL_BLOCK_COUNTER_WIDTH = pkg_integralImageCache::integralBlockBits; 
	
	parameter int SQ_Y_COUNTER_WIDTH = pkg_SQImageCache::SQColBits;
	parameter int SQ_BLOCK_COUNTER_WIDTH = pkg_SQImageCache::SQBlockBits; 
  
	// window counter sizes
	parameter int WINDOW_Y_COUNTER_WIDTH = pkg_windowCache::windowBits;
	parameter int WINDOW_BLOCK_COUNTER_WIDTH = pkg_windowCache::windowBlockBits; 
  
	// how many cycles to fill each core with its first piece of data
	parameter int NUM_PROC_OFFSETS = globalDefinitions::CielingADivideB(cores,windowCacheBlocking);
	parameter int PROC_OFFSETS_BITS = globalDefinitions::log2(NUM_PROC_OFFSETS);
	
	// Words per Read
	parameter int WINDOW_BLOCKING = globalDefinitions::windowCacheBlocking;
	parameter int CORES = globalDefinitions::cores;
	
	// bits needed to count which element inside a block read was requested
	parameter int ELEM_WIDTH = globalDefinitions::elementBits;

  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StoreLocal,
		S_StartVarA,
		S_LoadVarA,
		S_StartVarB,
		S_LoadVarB,
		S_StartVarC,
		S_LoadVarC,
		S_StartVarD,
		S_LoadVarD,
		S_EmptyVar,
		S_StartCount,
		S_StreamData,
		S_EmptyPipeline,
		S_Done } STATES_t; 
              
endpackage



interface intf_procLoader_control;
	import globalDefinitions::*;
	
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;
		
	logic start;	
	logic done;
	logic ready;

endinterface



/******************** WindowCache *********************/

/***** package *****/
package pkg_windowCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// bits needed for X,Y access is not blocked
	parameter int windowBits = log2(supportedWindowSize-1);

	// bits needed for X,Y, access if blocked
	parameter int windowBlocksPerRow = CielingADivideB(supportedWindowSize,windowCacheBlocking);
	parameter int windowBlockBits = log2(windowBlocksPerRow-1);
	
	// bits needed to construct the whole memory
	parameter int windowAddressBits = log2( (windowBlocksPerRow * supportedWindowSize) - 1 );
	parameter int windowWords = windowBlocksPerRow * supportedWindowSize;
	
	// bits needed to store the virtual window size as it increases in size
	parameter int windowScaleSizeBits = (supportedImageWidth < supportedImageHeight)  ? log2(supportedImageWidth) : log2(supportedImageHeight); 
	
	
	// ---- private params ---- //		
	parameter int	ADDR_WIDTH = windowAddressBits;
	parameter int	TOTALWORDS		= windowWords;
	parameter int	WORD_SIZE = pkg_integralImageCache::integralImageDepth;
	parameter int	WORDS = windowCacheBlocking;
	parameter int	INDEX_WIDTH = windowBits;
	parameter int 	BLOCKS = windowBlocksPerRow;
	parameter int	BLOCK_WIDTH = windowBlockBits;
	parameter int	ELM_WIDTH = elementBits;
	

	
	
endpackage
/******************** procLoader *********************/

/***** package *****/
package pkg_winLoader;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
  
	// integral counter sizes
	parameter int INTEGRAL_Y_COUNTER_WIDTH = pkg_integralImageCache::integralColBits;
	parameter int INTEGRAL_X_COUNTER_WIDTH = pkg_integralImageCache::integralRowBits;
	parameter int INTEGRAL_BLOCK_COUNTER_WIDTH = pkg_integralImageCache::integralBlockBits; 

	// window counter sizes
	parameter int WINDOW_Y_COUNTER_WIDTH = pkg_windowCache::windowBits;
	parameter int WINDOW_BLOCK_COUNTER_WIDTH = pkg_windowCache::windowBlockBits; 
  
	// how many cycles to fill each core with its first piece of data
	parameter int NUM_PROC_OFFSETS = globalDefinitions::CielingADivideB(cores,windowCacheBlocking);
	parameter int PROC_OFFSETS_BITS = globalDefinitions::log2(NUM_PROC_OFFSETS);
	
	// Words per Read
	parameter int WINDOW_BLOCKING = globalDefinitions::windowCacheBlocking;
	parameter int CORES = globalDefinitions::cores;
	
	// bits needed to count which element inside a block read was requested
	parameter int ELEM_WIDTH = globalDefinitions::elementBits;

  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StoreLocal,
		S_StartCount,
		S_StreamData,
		S_EmptyPipeline,
		S_Done } STATES_t; 
              
endpackage



/*
interface intf_procLoader_control;
	import globalDefinitions::*;
	
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;
		
	logic start;	
	logic done;
	logic ready;

endinterface
*/



/******************** Computation *********************/

/***** package *****/
package pkg_computation;
	import globalDefinitions::*;
	
	// ---- public params ---- //		

	// ---- private params --- //	

endpackage
/******************** featureCache *********************/

/***** package *****/
package pkg_featureCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //	
   
	// integer representation of X,Y location indexing into a window
	parameter int featureDataBits = pkg_windowCache::windowBits * 2;
	parameter int featureWords = numberOfFeatures*4;
	
	// number of bits construct the whole memory
	parameter int freatureAddressBits = log2( (numberOfFeatures*4) - 1);
	
	// ---- private params ---- //
		
	parameter int	ADDR_WIDTH = freatureAddressBits;
	parameter int	WORDS = featureWords;
	parameter int	WORD_SIZE = featureDataBits; 
	
endpackage
/******************** Master Controler *********************/

/***** package *****/
package pkg_masterControler;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	parameter int CORE_COUNTER_WIDTH = log2( cores );
   parameter int CORES = cores;
  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_CalcScaleVars,
		S_Scale,
		S_GenIntegralImages,
		S_LoadVar,
		S_LoadWindow,
		S_StartVar,
		S_StartFeat,
		S_StoreRes,
		S_Finish,
		S_FinishScale,
		S_WriteExitCode,
		S_Done	} STATES_t; 
              
endpackage



/******************** procLoader *********************/

/***** package *****/
package pkg_resize;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	parameter int FIXED=11;
  
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StartCalcSF,
		S_StartPixelGen,
		S_Index,	
		S_Done } STATES_t; 
              
endpackage


/******************** sfGeneration *********************/

/***** package *****/
package pkg_sfGeneration;
	
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_DXYP5,
		S_FXYP5,
		S_FXYNORM,
		S_FS,
		S_Done } STATES_t; 
              
endpackage


/******************** VarienceCache *********************/

/***** package *****/
package pkg_varianceCache;
	import globalDefinitions::*;

	// ---- public params ---- //
	
	// ---- private params ---- //
	
	parameter int	ADDR_WIDTH = 2;
	parameter int	WORD_SIZE_SQ = pkg_SQImageCache::SQImageDepth;
	parameter int	WORD_SIZE = pkg_integralImageCache::integralImageDepth;
	parameter int	ELM_WIDTH = elementBits;

	
endpackage
/******************** procLoader *********************/

/***** package *****/
package pkg_varLoader;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
  
	// integral counter sizes
	parameter int INTEGRAL_Y_COUNTER_WIDTH = pkg_integralImageCache::integralColBits;
	parameter int INTEGRAL_X_COUNTER_WIDTH = pkg_integralImageCache::integralRowBits;
	parameter int INTEGRAL_BLOCK_COUNTER_WIDTH = pkg_integralImageCache::integralBlockBits; 
 
	// how many cycles to fill each core with its first piece of data
	parameter int NUM_PROC_OFFSETS = globalDefinitions::CielingADivideB(cores,windowCacheBlocking);
	parameter int PROC_OFFSETS_BITS = globalDefinitions::log2(NUM_PROC_OFFSETS);
	
	// Words per Read
	parameter int WINDOW_BLOCKING = globalDefinitions::windowCacheBlocking;
	parameter int CORES = globalDefinitions::cores;
	
	// bits needed to count which element inside a block read was requested
	parameter int ELEM_WIDTH = globalDefinitions::elementBits;

  	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StoreLocal,
		S_StartVarA,
		S_LoadVarA,
		S_StartVarB,
		S_LoadVarB,
		S_StartVarC,
		S_LoadVarC,
		S_StartVarD,
		S_LoadVarD,
		S_EmptyVar,
		S_Done } STATES_t; 
              
endpackage


/*
interface intf_procLoader_control;
	import globalDefinitions::*;
	
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;
		
	logic start;	
	logic done;
	logic ready;

endinterface
*/



/******************** featureEvaluator *********************/

/***** package *****/
package pkg_featureEvaluator;
  
	// ---- public params ---- //	
    
	// ---- private params ---- //
	
	// ---- local enums ----- //
	
	// define cascade states	
	typedef enum logic [4:0] { 
		CS_Reset, 
		CS_Ready,
		CS_GetVarianceNormilizationThres,
		CS_Stall,
		CS_GetSize,
		CS_CountStages,
		CS_StageThreshold,      
		CS_CountClassifiers, 
		CS_ClassifierThreshold,
		CS_GetAlpha1, 
		CS_GetAlpha2, 
		CS_GetWeight1, 
		CS_GetWeight2,
		CS_GetWeight3,  
		CS_Done } CS_t;   
              
  // define feature states	
	typedef enum logic [4:0] {
		FS_Reset,
		FS_Init,
		FS_Ready,	
		FS_Stall,						
		FS_F1A,
		FS_F1B,
		FS_F1C,
		FS_F1D,
		FS_F2A,
		FS_F2B,
		FS_F2C,
		FS_F2D,
		FS_F3A,
		FS_F3B,
		FS_F3C,
		FS_F3D  } FS_t; 
  
endpackage
// architecture package for the multiscale detector

package globalDefinitions ;

	// user architecture paramiters ----------------------------------
	
	// largest supported input image
	parameter int supportedImageHeight = 245;
	parameter int supportedImageWidth = 325;
	parameter int inputImageDepth = 8;	
	
	// number of system cores
	// (currently must be a multiple of windowCacheBlocking)
	parameter int cores = 64;
		
	// largest supported number of features in the cascade classifier
	parameter int numberOfFeatures = 7500;


	// acceptable fixed point precision error when determing 
	// that two large numbers A-B = 0 (currently 0.05 << fixed)
	parameter int thresholdBias = 13107;
	
	// largest supported classifier window size
	parameter int logicalWindowSize = 30;
	
	
	// how many words per cycle can cores be filed with image data
	// (for now leave as power of 2 for computer reason)
	parameter int windowCacheBlocking = 4;
		

	// params which effect only small number of registers used for counting -------------------------
	//	all generated classifiers should be well under these limits ----------------------------------

	// largest supported number stages in any given cascade
	parameter int supportedCascadeStages = 1024;
	
	// largest supported classifiers per stage in any given cascade
	parameter int supportedCascadeClassifiers = 4096;
	
	// largest number of supported scale interations
  parameter int supportedScaleIterations = 256; 
  
  
  // number of successful detections that can be stored inbetween reads back to the main system
  parameter int resultQueueDepth = 256; 

// the fixed point decimal/integral percision
parameter int fixed = 18;
parameter int fixedInt = 18;	

	// global derived architecture paramiters from user selected params ----------------------------------	
	
	// total bits in a fixed point number
	parameter int fixedbits = fixed + fixedInt;
	parameter int scaleBits = log2(supportedScaleIterations - 1); 
	
	// minimum bit need to access block memory one elemnt at a time
	parameter int elementBits = log2( windowCacheBlocking - 1 );
	
	// physical dim of memory needed for memory
	parameter int supportedWindowSize = logicalWindowSize+1;
	
	






	
	// user enums tasks and functions ----------------------------------
		
	// take the log2 of a number and return the closest int rounded up
	// number of bits need to express the input number
	// input of 32 results in 6 not 5 becasue 32 = 100000;
	function automatic int log2 (input int n);
		//n = n - 1;		
		log2=0;
		
		if(n <= 1) return (1);			
				
		while( n >= 1 ) begin
			log2++;		
			n = n/2;			
		end
		
		return log2;
	endfunction

	// devide a by b and return the closet int rounded up
	function automatic int CielingADivideB(input int a, input int b);		
		if ( a % b == 0) return (a/b);
		else return(a/b + 1);
	endfunction
	
	
	
	
	

	
endpackage
/******************** ResultQueue *********************/

/***** package *****/
package pkg_resultQueue;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// bits need to store x location of detected object
	parameter int resultQueueXBits = pkg_integralImageCache::integralRowBits;
	
	// bits need to store Y location of detected object
	parameter int resultQueueYBits = pkg_integralImageCache::integralColBits;
	
	// bits need to store how many times the origonal image has been scaled
	parameter int resultQueueScaleBits = log2(supportedScaleIterations);
	
	
	// ---- private params ---- //
	
	parameter int	WIDTH = resultQueueXBits + resultQueueYBits + resultQueueScaleBits;
	parameter int	DEPTH = resultQueueDepth;
	
endpackage




/***** interface *****/
interface intf_resultQueue_Write;
	import  pkg_resultQueue::*;
	logic unsigned [WIDTH-1:0] data;
	logic full; 	
	logic we;
endinterface

/***** interface *****/
interface intf_resultQueue_Read;
	import pkg_resultQueue::*;
	logic unsigned [WIDTH-1:0] q;
	logic empty;
	logic re;	
endinterface
package structs;

/*************************************************/
/************ Image Memory Structures ************/
/*************************************************/

//-----image-----//
typedef struct {
	logic unsigned [pkg_imageCache::COL_WIDTH -1:0] waddrY;
	logic unsigned [pkg_imageCache::ROW_WIDTH -1:0] waddrX;
	logic unsigned [32-1:0] wdata; 
	logic we;
} struct_imageCache_Write;

typedef struct {
	logic unsigned [pkg_imageCache::COL_WIDTH -1:0] raddrY;
	logic unsigned [pkg_imageCache::ROW_WIDTH -1:0] raddrX;
} struct_imageCache_Read_In;

typedef struct {
	logic unsigned [pkg_imageCache::WORD_SIZE -1:0] q;	
} struct_imageCache_Read_Out;	


//-----scale image-----//
typedef struct {
	logic unsigned [pkg_scaleCache::COL_WIDTH -1:0] waddrY;
	logic unsigned [pkg_scaleCache::ROW_WIDTH -1:0] waddrX;
	logic unsigned [pkg_scaleCache::WORD_SIZE-1:0] wdata; 
	logic we;
} struct_scaleCache_Write;

typedef struct {
	logic unsigned [pkg_scaleCache::COL_WIDTH -1:0] raddrY;
	logic unsigned [pkg_scaleCache::ROW_WIDTH -1:0] raddrX;
} struct_scaleCache_Read_In;

typedef struct {
	logic unsigned [pkg_scaleCache::WORD_SIZE-1:0] q;	
} struct_scaleCache_Read_Out;	


//-----integral image-----//
typedef struct {
	logic unsigned [pkg_integralImageCache::COL_WIDTH -1:0] waddrY;
	logic unsigned [pkg_integralImageCache::ROW_WIDTH -1:0] waddrX;
	logic unsigned [pkg_integralImageCache::WORD_SIZE-1:0] wdata; 
	logic we;
} struct_integralImageCache_Write;

typedef struct {
  logic unsigned [pkg_integralImageCache::WORD_SIZE-1:0] q;	
} struct_integralImageCache_Write_Out;

typedef struct {
	logic unsigned [pkg_integralImageCache::COL_WIDTH -1:0] raddrY;
	logic unsigned [pkg_integralImageCache::BLOCK_WIDTH -1:0] raddrXBlock;
} struct_integralImageCache_Read_In;

typedef struct {
	logic unsigned [pkg_integralImageCache::WORDS-1:0][pkg_integralImageCache::WORD_SIZE-1:0] q;	
} struct_integralImageCache_Read_Out;


//-----sqaure integral image-----//	
typedef struct { 
	logic unsigned [pkg_SQImageCache::COL_WIDTH-1:0] waddrY;
	logic unsigned [pkg_SQImageCache::ROW_WIDTH-1:0] waddrX;
	logic unsigned [pkg_SQImageCache::WORD_SIZE-1:0] wdata; 	
	logic we;
}struct_SQImageCache_Write;

typedef struct { 
  logic unsigned [pkg_SQImageCache::WORD_SIZE-1:0] q;	
}struct_SQImageCache_Write_Out;

typedef struct { 
	logic unsigned [pkg_SQImageCache::COL_WIDTH-1:0] raddrY;
	logic unsigned [pkg_SQImageCache::BLOCK_WIDTH -1:0] raddrXBlock;	
}struct_SQImageCache_Read_In;

typedef struct { 
	logic unsigned [pkg_SQImageCache::WORDS-1:0][pkg_SQImageCache::WORD_SIZE-1:0] q;		
}struct_SQImageCache_Read_Out;


//----- window image -----//	
typedef struct { 
	logic unsigned [pkg_windowCache::INDEX_WIDTH-1:0] waddrY;
	logic unsigned [pkg_windowCache::BLOCK_WIDTH-1:0] waddrBlock;
	logic unsigned [pkg_windowCache::WORDS-1:0][pkg_windowCache::WORD_SIZE-1:0] wdata; 	
	logic we;
	logic dblBuf;
} struct_windowCache_Write;

typedef struct {   
	logic unsigned [pkg_windowCache::INDEX_WIDTH-1:0] raddrX;
	logic unsigned [pkg_windowCache::INDEX_WIDTH-1:0] raddrY;
}struct_windowCache_Read_In;

typedef struct {
	logic unsigned [pkg_windowCache::WORD_SIZE-1:0] q;	
}struct_windowCache_Read_Out;


//-----varience cache-----//	
typedef struct {  
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] waddr;
	logic unsigned [ pkg_varianceCache::WORD_SIZE-1:0] wdata; 
	logic we;
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] waddrSQ;		
	logic unsigned [ pkg_varianceCache::WORD_SIZE_SQ-1:0] wdataSQ;
	logic weSQ;	
	logic dblBuf;	
} struct_varianceCache_Write;

typedef struct {
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] raddr;
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] raddrSQ;	
} struct_varianceCache_Read_in;

typedef struct {  
	logic unsigned [ pkg_varianceCache::WORD_SIZE-1:0] q;
	logic unsigned [ pkg_varianceCache::WORD_SIZE_SQ-1:0] qSQ;
} struct_varianceCache_Read_out;





/************************************************************/
/************ Non Image Memory Memory Structures ************/
/************************************************************/

//-----cascade cache-----//	
typedef struct {  	
	logic unsigned [pkg_cascadeCache::ADDR_WIDTH-1:0] waddr;
	logic signed [pkg_cascadeCache::WORD_SIZE-1:0] wdata; 
	logic we;	 	
} struct_cascadeCache_Write;

typedef struct {  	
	logic unsigned [pkg_cascadeCache::ADDR_WIDTH-1:0] raddr;		
}struct_cascadeCache_Read_In;

typedef struct {  	
	logic signed [pkg_cascadeCache::WORD_SIZE-1:0] q;		
}struct_cascadeCache_Read_Out;


//-----feature cache-----//	
typedef struct {  	
	logic unsigned [pkg_featureCache::ADDR_WIDTH-1:0] waddr;
	logic unsigned [pkg_featureCache::WORD_SIZE-1:0] wdata; 
	bit we;		
}struct_featureCache_Write;

typedef struct { 
	logic unsigned [pkg_featureCache::ADDR_WIDTH-1:0] raddr;		
}struct_featureCache_Read_In;

typedef struct { 
	logic unsigned [pkg_featureCache::WORD_SIZE-1:0] q;		
}struct_featureCache_Read_Out;


//-----result queue-----//	
typedef struct { 
	logic unsigned [pkg_resultQueue::WIDTH-1:0] data;	
	logic we;
} struct_resultQueue_Write_In;

typedef struct { 
	logic full; 
} struct_resultQueue_Write_Out;

typedef struct { 
	logic re;	
} struct_resultQueue_Read_In;

typedef struct { 
	logic unsigned [pkg_resultQueue::WIDTH-1:0] q;
	logic empty;
} struct_resultQueue_Read_Out;





/************************************************************/
/************ Processing and Control Structure **************/
/************************************************************/

//----- integral image generation control -----//
typedef struct {  
	bit ready;
	bit done;
} struct_integralImageGeneration_control_out;

typedef struct {  
	bit start;
	bit taken;	
	logic unsigned [pkg_integralImageGeneration::INTEGRAL_Y_COUNTER_WIDTH-1:0] sizeY;
	logic unsigned [pkg_integralImageGeneration::INTEGRAL_X_COUNTER_WIDTH-1:0] sizeX;
} struct_integralImageGeneration_control_in;


//----- processor loader control -----//
typedef struct { 
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;		
	logic start;
}struct_procLoader_control_in;

typedef struct { 
	logic done;
	logic ready;	
	logic varLoaded;
	logic windowLoaded;
}struct_procLoader_control_out;


//----- window loader control -----//	
typedef struct { 
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;		
	logic start;
	logic ack;
	logic dblBuf;
}struct_winLoader_control_in;

typedef struct { 
	logic done;
	logic ready;	
}struct_winLoader_control_out;


//----- variance loader control -----//	
typedef struct { 
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;		
	logic start;
	logic ack;
	logic dblBuf;
}struct_varLoader_control_in;

typedef struct { 
	logic done;
	logic ready;	
}struct_varLoader_control_out;


//----- window alignment -----//	
typedef struct {  
	logic unsigned [pkg_windowAlignment::INDEX_WIDTH-1:0] waddrY; 
	logic unsigned [pkg_windowAlignment::INDEX_WIDTH-1:0] waddrBlock;
	logic unsigned [pkg_windowAlignment::WORDS-1:0][pkg_windowAlignment::WORD_SIZE-1:0] wdata; 
	logic we;
}struct_windowAlignment;


//----- processor control -----//	
typedef struct { 
	logic start;
	logic startVar;
	logic dblBufVar;
	logic dblBuf;
	logic [ globalDefinitions::log2(globalDefinitions::supportedCascadeStages) - 1 :0] numberOfStages;
	logic [globalDefinitions::fixedbits-1:0] inv_window_area;	
}struct_processor_control_in;

typedef struct { 
	logic ready;
	logic done;
	logic varReady;
}struct_processor_control_out;


//----- processor result -----//	
typedef struct {
	logic valid;
	logic passfail;		
} struct_processor_Result_Out;

typedef struct {
	logic taken;
} struct_processor_Result_In;


//----- store result control -----//	
typedef struct {
  logic ready;
} struct_resultStore_control_out;

typedef struct {
	logic start;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralRowBits-1:0] startX;
	logic [globalDefinitions::scaleBits-1:0] scale;
	bit exit;
} struct_resultStore_control_in;


//----- resize control -----//	
typedef struct {  
  logic ready;
  logic done;
} struct_resize_control_out;

typedef struct {
  logic start;
  logic taken;
  logic unsigned [pkg_imageCache::colBits-1:0] imageYSize;
  logic unsigned [pkg_imageCache::rowBits-1:0] imageXSize;
  logic unsigned [pkg_imageCache::colBits-1:0] targetYSize;
  logic unsigned [pkg_imageCache::rowBits-1:0] targetXSize;  
  logic unsigned [globalDefinitions::fixedbits-1:0] factorY;
  logic unsigned [globalDefinitions::fixedbits-1:0] factorX;
} struct_resize_control_in;


//----- resize parameter generation -----//	
typedef struct {
  logic start;
  logic taken;
  logic unsigned [globalDefinitions::fixedbits-1:0] factorY;
  logic unsigned [globalDefinitions::fixedbits-1:0] factorX;
  logic unsigned [globalDefinitions::fixed-1:0] dx;
  logic unsigned [globalDefinitions::fixed-1:0] dy;
 } struct_sfGeneration_in; 
 
 typedef struct {
  logic ready;
  logic done;
  logic unsigned [globalDefinitions::fixedbits-1:0] fx;
  logic unsigned [globalDefinitions::fixedbits-1:0] fy;
  logic unsigned [globalDefinitions::fixedbits-1:0] sx;
  logic unsigned [globalDefinitions::fixedbits-1:0] sy;
 } struct_sfGeneration_out;
 
 //----- resize scale pixel generation -----//	
typedef struct {
  logic start;
  logic unsigned [globalDefinitions::fixedbits-1:0] fx;
  logic unsigned [globalDefinitions::fixedbits-1:0] fy;
  logic unsigned [globalDefinitions::fixedbits-1:0] sx;
  logic unsigned [globalDefinitions::fixedbits-1:0] sy;
  logic unsigned [globalDefinitions::fixed-1:0] dy;
  logic unsigned [globalDefinitions::fixed-1:0] dx;
 } struct_scalePixelGeneration_in; 
 
 typedef struct {
  logic ready;
 } struct_scalePixelGeneration_out;  
 
  //----- generate scaling params -----//	
typedef struct {
	logic start;   
	logic taken;
	logic unsigned [7 : 0 ] stages;
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] baseImageWidth;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] baseImageHeight;
	logic unsigned [globalDefinitions::fixedbits -1 : 0 ] baseScaleFactor;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] winSize;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] minWinSize;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv;
	
 } struct_scaleParams_in; 
 
 typedef struct {
	logic ready;
	logic done;
	logic unsigned [7 : 0 ] stages;
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] baseImageWidth;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] baseImageHeight;
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] scaleImageWidth;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] scaleImageHeight;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] scaleFactorX;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] scaleFactorY;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] winSize;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] minWinSize;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] trueWinSize;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv;
	logic unsigned [15:0] scaleCount;
 } struct_scaleParams_out;
 

endpackage
/******************** windowAlignment *********************/

/***** package *****/
package pkg_windowAlignment;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// ---- private params ---- //
	
	parameter int	ADDR_WIDTH = pkg_windowCache::windowAddressBits;
	parameter int	WORD_SIZE = pkg_integralImageCache::integralImageDepth;
	parameter int	WORDS = windowCacheBlocking;
	parameter int	INDEX_WIDTH = pkg_windowCache::windowBits;	
	
endpackage

	
/***** interface *****/
interface intf_windowAlignment;
	import pkg_windowAlignment::*;
	logic unsigned [INDEX_WIDTH-1:0] waddrY; 
	logic unsigned [INDEX_WIDTH-1:0] waddrBlock;
	logic unsigned [WORDS-1:0][WORD_SIZE-1:0] wdata; 
	logic we;
endinterface
/******************** IntegralImageCache *********************/

/***** package *****/
package pkg_integralImageCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //

	// physical size
	parameter int integralRowSize = supportedImageWidth  + 1;	
	parameter int integralColSize = supportedImageHeight + 1;
	
	// row and col bits needed
	parameter int integralRowBits = log2(integralRowSize - 1);	
	parameter int integralColBits = log2(integralColSize -1 );

	// bits/words needed if blocked
	parameter int integralBlocksPerRow = CielingADivideB(integralRowSize,windowCacheBlocking);
	parameter int integralBlockBits = log2(integralBlocksPerRow - 1);
	
	// addressable elements needed to construct the whole memory
	parameter int integralAddressBits = log2( (integralBlocksPerRow * integralColSize) - 1);	
	parameter int integralWords = integralBlocksPerRow * integralColSize;
	
	// minimum word size needed to store the intergral image
	parameter int integralImageDepth = log2( (supportedImageHeight * supportedImageWidth * (1 << inputImageDepth)));	
	
			

	// ---- private params ---- //		
	parameter int	WORD_SIZE 		= integralImageDepth;
	parameter int	TOTALWORDS		= integralWords;
	parameter int	WORDS 			= windowCacheBlocking;	
	parameter int 	COL_WIDTH 		= integralColBits;
	parameter int 	ROW_WIDTH 		= integralRowBits;	
	parameter int 	BLOCKS 			= integralBlocksPerRow;
	parameter int  BLOCK_WIDTH 	= integralBlockBits;
	parameter int	ADDR_WIDTH 		= integralAddressBits;
	parameter int	ELM_WIDTH 		= elementBits;

	
endpackage
/******************** scalePixelGeneration *********************/

/***** package *****/
package pkg_scalePixelGeneration;
	
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_ReadA,
		S_ReadB,
		S_ReadC,
		S_ReadD } STATES_t; 
              
endpackage
