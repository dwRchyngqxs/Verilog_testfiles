#ifndef _SEQUENCER_H_
#define _SEQUENCER_H_

#if RLDRAMII
#define RW_MGR_NUM_DM_PER_WRITE_GROUP (1)
#else
#define RW_MGR_NUM_DM_PER_WRITE_GROUP (RW_MGR_MEM_DATA_MASK_WIDTH / RW_MGR_MEM_IF_WRITE_DQS_WIDTH)
#endif

#define RW_MGR_NUM_DQS_PER_WRITE_GROUP (RW_MGR_MEM_IF_READ_DQS_WIDTH / RW_MGR_MEM_IF_WRITE_DQS_WIDTH)

#define RW_MGR_RUN_SINGLE_GROUP BASE_RW_MGR
#define RW_MGR_RUN_ALL_GROUPS BASE_RW_MGR + 0x0400

#define RW_MGR_DI_0 BASE_RW_MGR + 0x0020
#define RW_MGR_DI_1 BASE_RW_MGR + 0x0024
#define RW_MGR_DI_2 BASE_RW_MGR + 0x0028
#define RW_MGR_DI_3 BASE_RW_MGR + 0x002C

#define RW_MGR_LOAD_CNTR_0 BASE_RW_MGR + 0x0800
#define RW_MGR_LOAD_CNTR_1 BASE_RW_MGR + 0x0804
#define RW_MGR_LOAD_CNTR_2 BASE_RW_MGR + 0x0808
#define RW_MGR_LOAD_CNTR_3 BASE_RW_MGR + 0x080C

#define RW_MGR_LOAD_JUMP_ADD_0 BASE_RW_MGR + 0x0C00
#define RW_MGR_LOAD_JUMP_ADD_1 BASE_RW_MGR + 0x0C04
#define RW_MGR_LOAD_JUMP_ADD_2 BASE_RW_MGR + 0x0C08
#define RW_MGR_LOAD_JUMP_ADD_3 BASE_RW_MGR + 0x0C0C

#define RW_MGR_RESET_READ_DATAPATH BASE_RW_MGR + 0x1000
#define RW_MGR_SOFT_RESET BASE_RW_MGR + 0x2000

#define RW_MGR_SET_CS_AND_ODT_MASK BASE_RW_MGR + 0x1400

#define RW_MGR_RANK_NONE 0xFF
#define RW_MGR_RANK_ALL 0x00

#define RW_MGR_ODT_MODE_OFF 0
#define RW_MGR_ODT_MODE_READ_WRITE 1

#define NUM_CALIB_REPEAT	1

#define NUM_READ_TESTS			7
#define NUM_READ_PB_TESTS		7
#define NUM_WRITE_TESTS			15
#define NUM_WRITE_PB_TESTS		31

#define PASS_ALL_BITS			1
#define PASS_ONE_BIT			0

/* calibration stages */

#define CAL_STAGE_NIL			0
#define CAL_STAGE_VFIFO			1
#define CAL_STAGE_WLEVEL		2
#define CAL_STAGE_LFIFO			3
#define CAL_STAGE_WRITES		4
#define CAL_STAGE_FULLTEST		5


#define MAX_RANKS			(RW_MGR_MEM_NUMBER_OF_RANKS)
#define MAX_DQS				(RW_MGR_MEM_IF_WRITE_DQS_WIDTH > RW_MGR_MEM_IF_READ_DQS_WIDTH ? RW_MGR_MEM_IF_WRITE_DQS_WIDTH : RW_MGR_MEM_IF_READ_DQS_WIDTH)
#define MAX_DQ				(RW_MGR_MEM_DATA_WIDTH)
#define MAX_DM				(RW_MGR_MEM_DATA_MASK_WIDTH)

/* length of VFIFO, from SW_MACROS */
#define VFIFO_SIZE			(READ_VALID_FIFO_SIZE)

/* Memory for data transfer between TCL scripts and NIOS.
 *
 * - First word is a command request.
 * - The remaining words are part of the transfer.
 */

/* Define the base address of each manager. */

/* MarkW: how should these base addresses be done for A-V? */
#define BASE_PTR_MGR 					SEQUENCER_PTR_MGR_INST_BASE
#if HARD_PHY
#define BASE_PHY_MGR 					(0x00088000)
#define BASE_RW_MGR 					(0x00090000)
#define BASE_DATA_MGR 					(0x00098000)
#else
#define BASE_PHY_MGR 					SEQUENCER_PHY_MGR_INST_BASE
#define BASE_RW_MGR  					SEQUENCER_RW_MGR_INST_BASE
#define BASE_DATA_MGR					SEQUENCER_DATA_MGR_INST_BASE
#endif
#define BASE_SCC_MGR					SEQUENCER_SCC_MGR_INST_BASE
#define BASE_REG_FILE					SEQUENCER_REG_FILE_INST_BASE

/* Register file addresses. */
#define REG_FILE_SIGNATURE				(BASE_REG_FILE + 0x0000)
#define REG_FILE_DEBUG_DATA_ADDR		(BASE_REG_FILE + 0x0004)
#define REG_FILE_CUR_STAGE              (BASE_REG_FILE + 0x0008)
#define REG_FILE_FOM                    (BASE_REG_FILE + 0x000C)
#define REG_FILE_FAILING_STAGE          (BASE_REG_FILE + 0x0010)
#define REG_FILE_DEBUG1                 (BASE_REG_FILE + 0x0014)
#define REG_FILE_DEBUG2                 (BASE_REG_FILE + 0x0018)
#define REG_FILE_DTAPS_PER_PTAP         (BASE_REG_FILE + 0x001C)
#define REG_FILE_TRK_SAMPLE_COUNT       (BASE_REG_FILE + 0x0020)
#define REG_FILE_TRK_LONGIDLE_CNT       (BASE_REG_FILE + 0x0024)
#define REG_FILE_MUX_DELAY              (BASE_REG_FILE + 0x0028)
#define REG_FILE_TRK_VFIFO_WAIT         (BASE_REG_FILE + 0x002C)
#define REG_FILE_TRK_RW_MGR_ADDR        (BASE_REG_FILE + 0x0030)

/* PHY manager configuration registers. */

#define PHY_MGR_PHY_RLAT				(BASE_PHY_MGR + 0x4000)
#define PHY_MGR_RESET_MEM_STBL			(BASE_PHY_MGR + 0x4004)
#define PHY_MGR_MUX_SEL					(BASE_PHY_MGR + 0x4008)
#define PHY_MGR_CAL_STATUS				(BASE_PHY_MGR + 0x400c)
#define PHY_MGR_CAL_DEBUG_INFO			(BASE_PHY_MGR + 0x4010)
#define PHY_MGR_VFIFO_RD_EN_OVRD		(BASE_PHY_MGR + 0x4014)
#if CALIBRATE_BIT_SLIPS
#define PHY_MGR_FR_SHIFT				(BASE_PHY_MGR + 0x4020)
#if MULTIPLE_AFI_WLAT
#define PHY_MGR_AFI_WLAT				(BASE_PHY_MGR + 0x4020 + 4*RW_MGR_MEM_IF_WRITE_DQS_WIDTH)
#else
#define PHY_MGR_AFI_WLAT				(BASE_PHY_MGR + 0x4018)
#endif
#else
#define PHY_MGR_AFI_WLAT				(BASE_PHY_MGR + 0x4018)
#endif
#define PHY_MGR_AFI_RLAT				(BASE_PHY_MGR + 0x401c)

#define PHY_MGR_CAL_SUCCESS				(1)
#define PHY_MGR_CAL_FAIL				(2)

/* PHY manager command addresses. */

#define PHY_MGR_CMD_INC_VFIFO_FR		(BASE_PHY_MGR + 0x0000)
#define PHY_MGR_CMD_INC_VFIFO_HR		(BASE_PHY_MGR + 0x0004)
#define PHY_MGR_CMD_INC_VFIFO_HARD_PHY	(BASE_PHY_MGR + 0x0004)
#define PHY_MGR_CMD_FIFO_RESET			(BASE_PHY_MGR + 0x0008)
#define PHY_MGR_CMD_INC_VFIFO_FR_HR		(BASE_PHY_MGR + 0x000C)
#define PHY_MGR_CMD_INC_VFIFO_QR		(BASE_PHY_MGR + 0x0010)

/* PHY manager parameters. */

#define PHY_MGR_MAX_RLAT_WIDTH			(BASE_PHY_MGR + 0x0000)
#define PHY_MGR_MAX_AFI_WLAT_WIDTH 		(BASE_PHY_MGR + 0x0004)
#define PHY_MGR_MAX_AFI_RLAT_WIDTH 		(BASE_PHY_MGR + 0x0008)
#define PHY_MGR_CALIB_SKIP_STEPS		(BASE_PHY_MGR + 0x000c)
#define PHY_MGR_CALIB_VFIFO_OFFSET		(BASE_PHY_MGR + 0x0010)
#define PHY_MGR_CALIB_LFIFO_OFFSET		(BASE_PHY_MGR + 0x0014)
#define PHY_MGR_RDIMM					(BASE_PHY_MGR + 0x0018)
#define PHY_MGR_MEM_T_WL				(BASE_PHY_MGR + 0x001c)
#define PHY_MGR_MEM_T_RL				(BASE_PHY_MGR + 0x0020)

/* Data Manager */
#define DATA_MGR_MEM_T_WL				(BASE_DATA_MGR + 0x0004)
#define DATA_MGR_MEM_T_ADD                              (BASE_DATA_MGR + 0x0008)
#define DATA_MGR_MEM_T_RL				(BASE_DATA_MGR + 0x000C)

#if HARD_PHY
	#define MEM_T_WL_ADD DATA_MGR_MEM_T_WL
	#define MEM_T_RL_ADD DATA_MGR_MEM_T_RL
#else
	#define MEM_T_WL_ADD PHY_MGR_MEM_T_WL
	#define MEM_T_RL_ADD PHY_MGR_MEM_T_RL
#endif

#define CALIB_SKIP_DELAY_LOOPS			(1 << 0)
#define CALIB_SKIP_ALL_BITS_CHK			(1 << 1)
#define CALIB_SKIP_DELAY_SWEEPS			(1 << 2)
#define CALIB_SKIP_VFIFO				(1 << 3)
#define CALIB_SKIP_LFIFO				(1 << 4)
#define CALIB_SKIP_WLEVEL				(1 << 5)
#define CALIB_SKIP_WRITES				(1 << 6)
#define CALIB_SKIP_FULL_TEST			(1 << 7)
#define CALIB_SKIP_ALL					(CALIB_SKIP_VFIFO | CALIB_SKIP_LFIFO | CALIB_SKIP_WLEVEL | CALIB_SKIP_WRITES | CALIB_SKIP_FULL_TEST)
#define CALIB_IN_RTL_SIM				(1 << 8)

/* Scan chain manager command addresses */

#if STRATIXV
// Stratix V uses an offset for DQS_EN_DELAY to better balance the paths
#define DQS_EN_DELAY_OFFSET	128
#else
#define DQS_EN_DELAY_OFFSET	0
#endif

#define WRITE_SCC_DQS_IN_DELAY(group, delay)	IOWR_32DIRECT(SCC_MGR_DQS_IN_DELAY, (group) << 2, delay) 
#define WRITE_SCC_DQS_EN_DELAY(group, delay)	IOWR_32DIRECT(SCC_MGR_DQS_EN_DELAY, (group) << 2, (delay) + DQS_EN_DELAY_OFFSET) 
#define WRITE_SCC_DQS_EN_PHASE(group, phase)	IOWR_32DIRECT(SCC_MGR_DQS_EN_PHASE, (group) << 2, phase) 
#define WRITE_SCC_DQDQS_OUT_PHASE(group, phase)	IOWR_32DIRECT(SCC_MGR_DQDQS_OUT_PHASE, (group) << 2, phase) 
#define WRITE_SCC_OCT_OUT1_DELAY(group, delay)	IOWR_32DIRECT(SCC_MGR_OCT_OUT1_DELAY, (group) << 2, delay) 
#define WRITE_SCC_OCT_OUT2_DELAY(group, delay)	IOWR_32DIRECT(SCC_MGR_OCT_OUT2_DELAY, (group) << 2, delay) 
#define WRITE_SCC_DQS_BYPASS(group, bypass)     IOWR_32DIRECT(SCC_MGR_DQS_BYPASS, (group) << 2, bypass)

#define WRITE_SCC_DQ_OUT1_DELAY(pin, delay)		IOWR_32DIRECT(SCC_MGR_IO_OUT1_DELAY, (pin) << 2, delay) 
#define WRITE_SCC_DQ_OUT2_DELAY(pin, delay)		IOWR_32DIRECT(SCC_MGR_IO_OUT2_DELAY, (pin) << 2, delay) 
#define WRITE_SCC_DQ_IN_DELAY(pin, delay)		IOWR_32DIRECT(SCC_MGR_IO_IN_DELAY, (pin) << 2, delay) 
#define WRITE_SCC_DQ_BYPASS(pin, bypass) 	    IOWR_32DIRECT(SCC_MGR_DQ_BYPASS, (pin) << 2, bypass)
#define WRITE_SCC_RFIFO_MODE(pin, mode) 	    IOWR_32DIRECT(SCC_MGR_RFIFO_MODE, (pin) << 2, mode)

#define WRITE_SCC_DQS_IO_OUT1_DELAY(delay)	IOWR_32DIRECT(SCC_MGR_IO_OUT1_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS) << 2, delay) 
#define WRITE_SCC_DQS_IO_OUT2_DELAY(delay)	IOWR_32DIRECT(SCC_MGR_IO_OUT2_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS) << 2, delay) 
#define WRITE_SCC_DQS_IO_IN_DELAY(delay)	IOWR_32DIRECT(SCC_MGR_IO_IN_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS) << 2, delay) 

#define WRITE_SCC_DM_IO_OUT1_DELAY(pin, delay)	IOWR_32DIRECT(SCC_MGR_IO_OUT1_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2, delay) 
#define WRITE_SCC_DM_IO_OUT2_DELAY(pin, delay)	IOWR_32DIRECT(SCC_MGR_IO_OUT2_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2, delay) 
#define WRITE_SCC_DM_IO_IN_DELAY(pin, delay)	IOWR_32DIRECT(SCC_MGR_IO_IN_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2, delay) 
#define WRITE_SCC_DM_BYPASS(pin, bypass) 	    IOWR_32DIRECT(SCC_MGR_DQ_BYPASS, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2, bypass) 

#define READ_SCC_DQS_IN_DELAY(group)	IORD_32DIRECT(SCC_MGR_DQS_IN_DELAY, (group) << 2) 
#define READ_SCC_DQS_EN_DELAY(group)	(IORD_32DIRECT(SCC_MGR_DQS_EN_DELAY, (group) << 2) - DQS_EN_DELAY_OFFSET)
#define READ_SCC_DQS_EN_PHASE(group)	IORD_32DIRECT(SCC_MGR_DQS_EN_PHASE, (group) << 2) 
#define READ_SCC_DQDQS_OUT_PHASE(group)	IORD_32DIRECT(SCC_MGR_DQDQS_OUT_PHASE, (group) << 2) 
#define READ_SCC_OCT_OUT1_DELAY(group)	IORD_32DIRECT(SCC_MGR_OCT_OUT1_DELAY, (group) << 2) 
#define READ_SCC_OCT_OUT2_DELAY(group)	IORD_32DIRECT(SCC_MGR_OCT_OUT2_DELAY, (group) << 2) 
#define READ_SCC_DQS_BYPASS(group) 		IORD_32DIRECT(SCC_MGR_DQS_BYPASS, (group) << 2)

#define READ_SCC_DQ_OUT1_DELAY(pin)		IORD_32DIRECT(SCC_MGR_IO_OUT1_DELAY, (pin) << 2) 
#define READ_SCC_DQ_OUT2_DELAY(pin)		IORD_32DIRECT(SCC_MGR_IO_OUT2_DELAY, (pin) << 2) 
#define READ_SCC_DQ_IN_DELAY(pin)		IORD_32DIRECT(SCC_MGR_IO_IN_DELAY, (pin) << 2) 
#define READ_SCC_DQ_BYPASS(pin) 	    IOWR_32DIRECT(SCC_MGR_DQ_BYPASS, (pin) << 2)
#define READ_SCC_RFIFO_MODE(pin) 	    IOWR_32DIRECT(SCC_MGR_RFIFO_MODE, (pin) << 2)

#define READ_SCC_DQS_IO_OUT1_DELAY()	IORD_32DIRECT(SCC_MGR_IO_OUT1_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS) << 2) 
#define READ_SCC_DQS_IO_OUT2_DELAY()	IORD_32DIRECT(SCC_MGR_IO_OUT2_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS) << 2) 
#define READ_SCC_DQS_IO_IN_DELAY()	IORD_32DIRECT(SCC_MGR_IO_IN_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS) << 2) 

#define READ_SCC_DM_IO_OUT1_DELAY(pin)	IORD_32DIRECT(SCC_MGR_IO_OUT1_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2) 
#define READ_SCC_DM_IO_OUT2_DELAY(pin)	IORD_32DIRECT(SCC_MGR_IO_OUT2_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2) 
#define READ_SCC_DM_IO_IN_DELAY(pin)	IORD_32DIRECT(SCC_MGR_IO_IN_DELAY, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2) 
#define READ_SCC_DM_BYPASS(pin) 	    IOWR_32DIRECT(SCC_MGR_DQ_BYPASS, (RW_MGR_MEM_DQ_PER_WRITE_DQS + 1 + pin) << 2)


#define SCC_MGR_GROUP_COUNTER			(BASE_SCC_MGR + 0x0000)
#define SCC_MGR_DQS_IN_DELAY			(BASE_SCC_MGR + 0x0100)
#define SCC_MGR_DQS_EN_PHASE			(BASE_SCC_MGR + 0x0200)
#define SCC_MGR_DQS_EN_DELAY			(BASE_SCC_MGR + 0x0300)
#define SCC_MGR_DQDQS_OUT_PHASE			(BASE_SCC_MGR + 0x0400)
#define SCC_MGR_OCT_OUT1_DELAY			(BASE_SCC_MGR + 0x0500)
#define SCC_MGR_OCT_OUT2_DELAY			(BASE_SCC_MGR + 0x0600)
#define SCC_MGR_IO_OUT1_DELAY			(BASE_SCC_MGR + 0x0700)
#define SCC_MGR_IO_OUT2_DELAY			(BASE_SCC_MGR + 0x0800)
#define SCC_MGR_IO_IN_DELAY				(BASE_SCC_MGR + 0x0900)
#define SCC_MGR_DQS_BYPASS				(BASE_SCC_MGR + 0x0A00)
#define SCC_MGR_DQ_BYPASS				(BASE_SCC_MGR + 0x0B00)
#define SCC_MGR_RFIFO_MODE				(BASE_SCC_MGR + 0x0C00)

#define SCC_MGR_DQS_ENA					(BASE_SCC_MGR + 0x0E00)
#define SCC_MGR_DQS_IO_ENA				(BASE_SCC_MGR + 0x0E04)
#define SCC_MGR_DQ_ENA					(BASE_SCC_MGR + 0x0E08)
#define SCC_MGR_DM_ENA					(BASE_SCC_MGR + 0x0E0C)
#define SCC_MGR_UPD						(BASE_SCC_MGR + 0x0E20)
#define SCC_MGR_AFI_CAL_INIT			(BASE_SCC_MGR + 0x0D00)

// PHY Debug mode flag constants
#define PHY_DEBUG_IN_DEBUG_MODE 0x00000001
#define PHY_DEBUG_ENABLE_CAL_RPT 0x00000002
#define PHY_DEBUG_ENABLE_MARGIN_RPT 0x00000004


/* Bitfield type changes depending on protocol */
#if QDRII
typedef long long t_btfld;
#else
typedef alt_u32 t_btfld;
#endif

#define RW_MGR_INST_ROM_WRITE BASE_RW_MGR + 0x1800
#define RW_MGR_AC_ROM_WRITE BASE_RW_MGR + 0x1C00

extern const alt_u32 inst_rom_init_size;
extern const alt_u32 inst_rom_init[];
extern const alt_u32 ac_rom_init_size;
extern const alt_u32 ac_rom_init[];



/* parameter variable holder */

typedef struct param_type {
	t_btfld dm_correct_mask;
	t_btfld read_correct_mask;
	t_btfld read_correct_mask_vg;
	t_btfld write_correct_mask;
	t_btfld write_correct_mask_vg;	

	/* set a particular entry to 1 if we need to skip a particular rank */

	alt_u32 skip_ranks[MAX_RANKS];

	/* set a particular entry to 1 if we need to skip a particular group */

	alt_u32 skip_groups;

} param_t;


/* global variable holder */

typedef struct gbl_type {

	alt_u32 phy_debug_mode_flags;

	/* current read latency */

	alt_u32 curr_read_lat;
	
	/* current write latency */
	
	alt_u32 curr_write_lat;

	/* error code */

	alt_u32 error_stage;
	alt_u32 error_group;

	/* figure-of-merit in, figure-of-merit out */

	alt_u32 fom_in;
	alt_u32 fom_out;

	//USER Number of RW Mgr NOP cycles between write command and write data
#if MULTIPLE_AFI_WLAT
	alt_u32 rw_wl_nop_cycles_per_group[RW_MGR_MEM_IF_WRITE_DQS_WIDTH];
#endif
	alt_u32 rw_wl_nop_cycles;
} gbl_t;

// External global variables
extern gbl_t *gbl;
extern param_t *param;

// External functions
alt_u32 rw_mgr_mem_calibrate_full_test (alt_u32 min_correct, t_btfld *bit_chk, alt_u32 test_dm);
extern alt_u32 run_mem_calibrate (void);
extern void rw_mgr_mem_calibrate_eye_diag_aid (void);
extern void rw_mgr_load_mrs_calib (void);
extern void rw_mgr_load_mrs_exec (void);
extern void rw_mgr_mem_initialize (void);

#endif
