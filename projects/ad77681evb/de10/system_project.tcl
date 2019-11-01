
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project ad77681evb_de10

source $ad_hdl_dir/projects/common/de10/de10_system_assign.tcl

# files


# SPI interface

set_location_assignment PIN_AH12 -to ad77681_spi_clk       ; ##   Arduino_IO13
set_location_assignment PIN_AH11 -to ad77681_spi_miso      ; ##   Arduino_IO12
set_location_assignment PIN_AG16 -to ad77681_spi_mosi      ; ##   Arduino_IO11
set_location_assignment PIN_AF15 -to ad77681_spi_cs        ; ##   Arduino_IO10

set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_spi_clk
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_spi_miso
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_spi_mosi
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_spi_cs

# reset and GPIO signals

set_location_assignment PIN_AG9  -to ad77681_reset         ; ##   Arduino_IO3
set_location_assignment PIN_AE15 -to ad77681_fda_dis       ; ##   Arduino_IO9
set_location_assignment PIN_AF17 -to ad77681_fda_mode      ; ##   Arduino_IO8
set_location_assignment PIN_U13  -to ad77681_dac_buf_en    ; ##   Arduino_IO5

set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_reset
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_fda_dis
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_fda_mode
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_dac_buf_en

# synchronization and timing

set_location_assignment PIN_AG10 -to ad77681_drdy          ; ##   Arduino_IO2
set_location_assignment PIN_AG8  -to ad77681_sync_in       ; ##   Arduino_IO6

set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_drdy
set_instance_assignment -name IO_STANDARD LVCMOS33 -to ad77681_sync_in



#set_location_assignment PIN_AJ8   -to rx_ref_clk            ; ## B20  FMCA_GBTCLK1_M2C_P
#set_location_assignment PIN_AJ7   -to "rx_ref_clk(n)"       ; ## B21  FMCA_GBTCLK1_M2C_N
#set_location_assignment PIN_AV5   -to rx_serial_data[0]     ; ## A10  FMCA_DP3_M2C_P
#set_location_assignment PIN_AV6   -to "rx_serial_data[0](n)"; ## A11  FMCA_DP3_M2C_N
#set_location_assignment PIN_AW7   -to rx_serial_data[1]     ; ## C06  FMCA_DP0_M2C_P
#set_location_assignment PIN_AW8   -to "rx_serial_data[1](n)"; ## C07  FMCA_DP0_M2C_N
#set_location_assignment PIN_AY5   -to rx_serial_data[2]     ; ## A06  FMCA_DP2_M2C_P
#set_location_assignment PIN_AY6   -to "rx_serial_data[2](n)"; ## A07  FMCA_DP2_M2C_N
#set_location_assignment PIN_BA7   -to rx_serial_data[3]     ; ## A02  FMCA_DP1_M2C_P
#set_location_assignment PIN_BA8   -to "rx_serial_data[3](n)"; ## A03  FMCA_DP1_M2C_N
#set_location_assignment PIN_AT10  -to rx_sync               ; ## D08  FMCA_LA01_CC_P
#set_location_assignment PIN_AR11  -to "rx_sync(n)"          ; ## D09  FMCA_LA01_CC_N
#set_location_assignment PIN_AR20  -to rx_sysref             ; ## G09  FMCA_LA03_P
#set_location_assignment PIN_AR19  -to "rx_sysref(n)"        ; ## G10  FMCA_LA03_N
#set_location_assignment PIN_AL8   -to tx_ref_clk            ; ## D04  FMCA_GBTCLK0_M2C_P
#set_location_assignment PIN_AL7   -to "tx_ref_clk(n)"       ; ## D05  FMCA_GBTCLK0_M2C_N
#set_location_assignment PIN_BC3   -to tx_serial_data[0]     ; ## A30  FMCA_DP3_C2M_P (tx_data_p[0])
#set_location_assignment PIN_BC4   -to "tx_serial_data[0](n)"; ## A31  FMCA_DP3_C2M_N (tx_data_n[0])
#set_location_assignment PIN_BC7   -to tx_serial_data[1]     ; ## C02  FMCA_DP0_C2M_P (tx_data_p[3])
#set_location_assignment PIN_BC8   -to "tx_serial_data[1](n)"; ## C03  FMCA_DP0_C2M_N (tx_data_n[3])
#set_location_assignment PIN_BB5   -to tx_serial_data[2]     ; ## A26  FMCA_DP2_C2M_P (tx_data_p[1])
#set_location_assignment PIN_BB6   -to "tx_serial_data[2](n)"; ## A27  FMCA_DP2_C2M_N (tx_data_n[1])
#set_location_assignment PIN_BD5   -to tx_serial_data[3]     ; ## A22  FMCA_DP1_C2M_P (tx_data_p[2])
#set_location_assignment PIN_BD6   -to "tx_serial_data[3](n)"; ## A23  FMCA_DP1_C2M_N (tx_data_n[2])
#set_location_assignment PIN_AR22  -to tx_sync               ; ## H07  FMCA_LA02_P
#set_location_assignment PIN_AT22  -to "tx_sync(n)"          ; ## H08  FMCA_LA02_N
#set_location_assignment PIN_AN20  -to tx_sysref             ; ## H10  FMCA_LA04_P
#set_location_assignment PIN_AP19  -to "tx_sysref(n)"        ; ## H11  FMCA_LA04_N
#
#set_instance_assignment -name IO_STANDARD LVDS -to rx_ref_clk
#set_instance_assignment -name IO_STANDARD LVDS -to "rx_ref_clk(n)"
#set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to rx_serial_data
#set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to rx_serial_data
#set_instance_assignment -name IO_STANDARD LVDS -to rx_sync
#set_instance_assignment -name IO_STANDARD LVDS -to "rx_sync(n)"
#set_instance_assignment -name IO_STANDARD LVDS -to rx_sysref
#set_instance_assignment -name IO_STANDARD LVDS -to "rx_sysref(n)"
#set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_sysref
#
#set_instance_assignment -name IO_STANDARD LVDS -to tx_ref_clk
#set_instance_assignment -name IO_STANDARD LVDS -to "tx_ref_clk(n)"
#set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to tx_serial_data
#set_instance_assignment -name XCVR_VCCR_VCCT_VOLTAGE 1_0V -to tx_serial_data
#set_instance_assignment -name IO_STANDARD LVDS -to tx_sync
#set_instance_assignment -name IO_STANDARD LVDS -to "tx_sync(n)"
#set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to tx_sync
#set_instance_assignment -name IO_STANDARD LVDS -to tx_sysref
#set_instance_assignment -name IO_STANDARD LVDS -to "tx_sysref(n)"
#set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to tx_sysref
#
## Merge RX and TX into single transceiver
#for {set i 0} {$i < 4} {incr i} {
#  set_instance_assignment -name XCVR_RECONFIG_GROUP xcvr_${i} -to rx_serial_data[${i}]
#  set_instance_assignment -name XCVR_RECONFIG_GROUP xcvr_${i} -to tx_serial_data[${i}]
#}
#
## gpio
#
#set_location_assignment PIN_AT17  -to trig                  ; ## H13  FMCA_LA07_P
#set_location_assignment PIN_AU17  -to "trig(n)"             ; ## H14  FMCA_LA07_N
#set_location_assignment PIN_AR14  -to adc_fdb               ; ## H17  FMCA_LA11_N
#set_location_assignment PIN_AT14  -to adc_fda               ; ## H16  FMCA_LA11_P
#set_location_assignment PIN_AR16  -to dac_irq               ; ## G15  FMCA_LA12_P
#set_location_assignment PIN_AP17  -to clkd_status[1]        ; ## D18  FMCA_LA13_N
#set_location_assignment PIN_AR17  -to clkd_status[0]        ; ## D17  FMCA_LA13_P
#set_location_assignment PIN_AV14  -to adc_pd                ; ## C10  FMCA_LA06_P
#set_location_assignment PIN_AP16  -to dac_txen              ; ## G16  FMCA_LA12_N
#set_location_assignment PIN_AT15  -to dac_reset             ; ## C15  FMCA_LA10_N
#set_location_assignment PIN_AP18  -to clkd_sync             ; ## G12  FMCA_LA08_P
#
#set_instance_assignment -name IO_STANDARD LVDS -to trig
#
## spi
#
#set_location_assignment PIN_AV11  -to spi_csn_clk           ; ## D11  FMCA_LA05_P
#set_location_assignment PIN_AR15  -to spi_csn_dac           ; ## C14  FMCA_LA10_P
#set_location_assignment PIN_AV13  -to spi_csn_adc           ; ## D15  FMCA_LA09_N
#set_location_assignment PIN_AW11  -to spi_clk               ; ## D12  FMCA_LA05_N
#set_location_assignment PIN_AW13  -to spi_sdio              ; ## D14  FMCA_LA09_P
#set_location_assignment PIN_AN19  -to spi_dir               ; ## G13  FMCA_LA08_N
#
## set optimization to get a better timing closure
#set_global_assignment -name OPTIMIZATION_MODE "HIGH PERFORMANCE EFFORT"

#execute_flow -compile
