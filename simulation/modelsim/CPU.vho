-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "04/04/2019 09:56:26"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Top IS
    PORT (
	LEDR : BUFFER std_logic_vector(9 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 0);
	KEY : IN std_logic_vector(1 DOWNTO 0)
	);
END Top;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[0]~inputCLKENA0_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \Processor|control_unit|future_state.fetch_1048~combout\ : std_logic;
SIGNAL \Processor|control_unit|present_state.fetch~0_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \Processor|control_unit|present_state.fetch~q\ : std_logic;
SIGNAL \Processor|control_unit|future_state.cycle1_1042~combout\ : std_logic;
SIGNAL \Processor|control_unit|present_state.cycle1~q\ : std_logic;
SIGNAL \Processor|control_unit|future_state.cycle2_1036~combout\ : std_logic;
SIGNAL \Processor|control_unit|present_state.cycle2~q\ : std_logic;
SIGNAL \Processor|control_unit|future_state.cycle3_1030~combout\ : std_logic;
SIGNAL \Processor|control_unit|present_state.cycle3~q\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux8~0_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux7~0_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux6~0_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux5~0_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux4~0_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux3~0_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux2~0_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux1~0_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \Processor|MUX1|Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_future_state.cycle1_1042~combout\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_future_state.cycle2_1036~combout\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_future_state.fetch_1048~combout\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_future_state.cycle3_1030~combout\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_present_state.cycle1~q\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_present_state.cycle2~q\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_present_state.fetch~q\ : std_logic;
SIGNAL \Processor|control_unit|ALT_INV_present_state.cycle3~q\ : std_logic;

BEGIN

LEDR <= ww_LEDR;
ww_SW <= SW;
ww_KEY <= KEY;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_KEY[0]~inputCLKENA0_outclk\ <= NOT \KEY[0]~inputCLKENA0_outclk\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_SW[9]~input_o\ <= NOT \SW[9]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\Processor|control_unit|ALT_INV_future_state.cycle1_1042~combout\ <= NOT \Processor|control_unit|future_state.cycle1_1042~combout\;
\Processor|control_unit|ALT_INV_future_state.cycle2_1036~combout\ <= NOT \Processor|control_unit|future_state.cycle2_1036~combout\;
\Processor|control_unit|ALT_INV_future_state.fetch_1048~combout\ <= NOT \Processor|control_unit|future_state.fetch_1048~combout\;
\Processor|control_unit|ALT_INV_future_state.cycle3_1030~combout\ <= NOT \Processor|control_unit|future_state.cycle3_1030~combout\;
\Processor|control_unit|ALT_INV_present_state.cycle1~q\ <= NOT \Processor|control_unit|present_state.cycle1~q\;
\Processor|control_unit|ALT_INV_present_state.cycle2~q\ <= NOT \Processor|control_unit|present_state.cycle2~q\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\Processor|control_unit|ALT_INV_present_state.fetch~q\ <= NOT \Processor|control_unit|present_state.fetch~q\;
\Processor|control_unit|ALT_INV_present_state.cycle3~q\ <= NOT \Processor|control_unit|present_state.cycle3~q\;

-- Location: IOOBUF_X52_Y0_N2
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|control_unit|present_state.cycle3~q\,
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X52_Y0_N19
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X60_Y0_N2
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X80_Y0_N2
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X60_Y0_N19
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X80_Y0_N19
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X84_Y0_N2
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X89_Y6_N5
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X89_Y8_N5
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X89_Y6_N22
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Processor|MUX1|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOIBUF_X36_Y0_N1
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: CLKCTRL_G4
\KEY[0]~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \KEY[0]~input_o\,
	outclk => \KEY[0]~inputCLKENA0_outclk\);

-- Location: IOIBUF_X12_Y0_N18
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LABCELL_X12_Y1_N6
\Processor|control_unit|future_state.fetch_1048\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|control_unit|future_state.fetch_1048~combout\ = ( \SW[0]~input_o\ & ( \Processor|control_unit|present_state.cycle3~q\ ) ) # ( !\SW[0]~input_o\ & ( \Processor|control_unit|present_state.cycle3~q\ & ( 
-- \Processor|control_unit|future_state.fetch_1048~combout\ ) ) ) # ( !\SW[0]~input_o\ & ( !\Processor|control_unit|present_state.cycle3~q\ & ( \Processor|control_unit|future_state.fetch_1048~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Processor|control_unit|ALT_INV_future_state.fetch_1048~combout\,
	datae => \ALT_INV_SW[0]~input_o\,
	dataf => \Processor|control_unit|ALT_INV_present_state.cycle3~q\,
	combout => \Processor|control_unit|future_state.fetch_1048~combout\);

-- Location: LABCELL_X12_Y1_N15
\Processor|control_unit|present_state.fetch~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|control_unit|present_state.fetch~0_combout\ = ( !\Processor|control_unit|future_state.fetch_1048~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Processor|control_unit|ALT_INV_future_state.fetch_1048~combout\,
	combout => \Processor|control_unit|present_state.fetch~0_combout\);

-- Location: IOIBUF_X36_Y0_N18
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: FF_X12_Y1_N17
\Processor|control_unit|present_state.fetch\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~inputCLKENA0_outclk\,
	d => \Processor|control_unit|present_state.fetch~0_combout\,
	clrn => \KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Processor|control_unit|present_state.fetch~q\);

-- Location: LABCELL_X12_Y1_N42
\Processor|control_unit|future_state.cycle1_1042\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|control_unit|future_state.cycle1_1042~combout\ = ( \Processor|control_unit|future_state.cycle1_1042~combout\ & ( \Processor|control_unit|present_state.fetch~q\ & ( !\SW[0]~input_o\ ) ) ) # ( 
-- \Processor|control_unit|future_state.cycle1_1042~combout\ & ( !\Processor|control_unit|present_state.fetch~q\ ) ) # ( !\Processor|control_unit|future_state.cycle1_1042~combout\ & ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[0]~input_o\,
	datae => \Processor|control_unit|ALT_INV_future_state.cycle1_1042~combout\,
	dataf => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	combout => \Processor|control_unit|future_state.cycle1_1042~combout\);

-- Location: FF_X12_Y1_N44
\Processor|control_unit|present_state.cycle1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~inputCLKENA0_outclk\,
	d => \Processor|control_unit|future_state.cycle1_1042~combout\,
	clrn => \KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Processor|control_unit|present_state.cycle1~q\);

-- Location: LABCELL_X12_Y1_N39
\Processor|control_unit|future_state.cycle2_1036\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|control_unit|future_state.cycle2_1036~combout\ = ( \Processor|control_unit|future_state.cycle2_1036~combout\ & ( \Processor|control_unit|present_state.cycle1~q\ ) ) # ( !\Processor|control_unit|future_state.cycle2_1036~combout\ & ( 
-- \Processor|control_unit|present_state.cycle1~q\ & ( \SW[0]~input_o\ ) ) ) # ( \Processor|control_unit|future_state.cycle2_1036~combout\ & ( !\Processor|control_unit|present_state.cycle1~q\ & ( !\SW[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_SW[0]~input_o\,
	datae => \Processor|control_unit|ALT_INV_future_state.cycle2_1036~combout\,
	dataf => \Processor|control_unit|ALT_INV_present_state.cycle1~q\,
	combout => \Processor|control_unit|future_state.cycle2_1036~combout\);

-- Location: FF_X12_Y1_N41
\Processor|control_unit|present_state.cycle2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~inputCLKENA0_outclk\,
	d => \Processor|control_unit|future_state.cycle2_1036~combout\,
	clrn => \KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Processor|control_unit|present_state.cycle2~q\);

-- Location: LABCELL_X12_Y1_N33
\Processor|control_unit|future_state.cycle3_1030\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|control_unit|future_state.cycle3_1030~combout\ = ( \Processor|control_unit|future_state.cycle3_1030~combout\ & ( \Processor|control_unit|present_state.cycle2~q\ ) ) # ( !\Processor|control_unit|future_state.cycle3_1030~combout\ & ( 
-- \Processor|control_unit|present_state.cycle2~q\ & ( \SW[0]~input_o\ ) ) ) # ( \Processor|control_unit|future_state.cycle3_1030~combout\ & ( !\Processor|control_unit|present_state.cycle2~q\ & ( !\SW[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_SW[0]~input_o\,
	datae => \Processor|control_unit|ALT_INV_future_state.cycle3_1030~combout\,
	dataf => \Processor|control_unit|ALT_INV_present_state.cycle2~q\,
	combout => \Processor|control_unit|future_state.cycle3_1030~combout\);

-- Location: FF_X12_Y1_N35
\Processor|control_unit|present_state.cycle3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~inputCLKENA0_outclk\,
	d => \Processor|control_unit|future_state.cycle3_1030~combout\,
	clrn => \KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Processor|control_unit|present_state.cycle3~q\);

-- Location: IOIBUF_X16_Y0_N1
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LABCELL_X13_Y1_N27
\Processor|MUX1|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux8~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[1]~input_o\,
	combout => \Processor|MUX1|Mux8~0_combout\);

-- Location: IOIBUF_X8_Y0_N35
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LABCELL_X13_Y1_N42
\Processor|MUX1|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux7~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[2]~input_o\,
	combout => \Processor|MUX1|Mux7~0_combout\);

-- Location: IOIBUF_X4_Y0_N52
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: LABCELL_X13_Y1_N51
\Processor|MUX1|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux6~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000000000000001010101010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	combout => \Processor|MUX1|Mux6~0_combout\);

-- Location: IOIBUF_X2_Y0_N41
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LABCELL_X12_Y1_N54
\Processor|MUX1|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux5~0_combout\ = ( \SW[4]~input_o\ & ( !\Processor|control_unit|present_state.fetch~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[4]~input_o\,
	combout => \Processor|MUX1|Mux5~0_combout\);

-- Location: IOIBUF_X16_Y0_N18
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: LABCELL_X13_Y1_N57
\Processor|MUX1|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux4~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \Processor|MUX1|Mux4~0_combout\);

-- Location: IOIBUF_X4_Y0_N35
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: LABCELL_X12_Y1_N48
\Processor|MUX1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux3~0_combout\ = ( \SW[6]~input_o\ & ( !\Processor|control_unit|present_state.fetch~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[6]~input_o\,
	combout => \Processor|MUX1|Mux3~0_combout\);

-- Location: IOIBUF_X4_Y0_N1
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: LABCELL_X13_Y1_N15
\Processor|MUX1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux2~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[7]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[7]~input_o\,
	combout => \Processor|MUX1|Mux2~0_combout\);

-- Location: IOIBUF_X4_Y0_N18
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: LABCELL_X13_Y1_N30
\Processor|MUX1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux1~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[8]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[8]~input_o\,
	combout => \Processor|MUX1|Mux1~0_combout\);

-- Location: IOIBUF_X2_Y0_N58
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LABCELL_X13_Y1_N39
\Processor|MUX1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Processor|MUX1|Mux0~0_combout\ = ( !\Processor|control_unit|present_state.fetch~q\ & ( \SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Processor|control_unit|ALT_INV_present_state.fetch~q\,
	dataf => \ALT_INV_SW[9]~input_o\,
	combout => \Processor|MUX1|Mux0~0_combout\);

-- Location: LABCELL_X31_Y14_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


