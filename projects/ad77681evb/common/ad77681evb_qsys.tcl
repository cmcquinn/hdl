
    # dma
	
	add_instance axi_dmac_0 axi_dmac 
	set_instance_parameter_value axi_dmac_0 {DMA_DATA_WIDTH_SRC} {32}
	set_instance_parameter_value axi_dmac_0 {DMA_DATA_WIDTH_DEST} {64}
	set_instance_parameter_value axi_dmac_0 {DMA_2D_TRANSFER} {0}
	set_instance_parameter_value axi_dmac_0 {DMA_LENGTH_WIDTH} {24}
	set_instance_parameter_value axi_dmac_0 {AXI_SLICE_DEST} {0}
    set_instance_parameter_value axi_dmac_0 {AXI_SLICE_SRC} {0}
	set_instance_parameter_value axi_dmac_0 {SYNC_TRANSFER_START} {0}
	set_instance_parameter_value axi_dmac_0 {CYCLIC} {1}
	set_instance_parameter_value axi_dmac_0 {DMA_TYPE_DEST} {0}
    set_instance_parameter_value axi_dmac_0 {DMA_TYPE_SRC} {1}
	set_instance_parameter_value axi_dmac_0 {FIFO_SIZE} {8}
	set_instance_parameter_value axi_dmac_0 {HAS_AXIS_TLAST} {0}
	
	add_connection axi_dmac_0.m_dest_axi sys_hps.f2h_sdram0_data
	add_connection sys_clk.clk axi_dmac_0.if_s_axis_aclk
    add_connection sys_clk.clk axi_dmac_0.s_axi_clock
	add_connection sys_clk.clk_reset axi_dmac_0.m_dest_axi_reset
    add_connection sys_clk.clk_reset axi_dmac_0.s_axi_reset
	add_connection sys_dma_clk.clk axi_dmac_0.m_dest_axi_clock
	add_connection sys_dma_clk.clk_reset axi_dmac_0.m_dest_axi_reset
			   
	# SPI Engine
	
    # axi_spi_engine
   
    add_instance axi_spi_engine_0 axi_spi_engine
    set_instance_parameter_value axi_spi_engine_0 {DATA_WIDTH}  {32}
    set_instance_parameter_value axi_spi_engine_0 {MM_IF_TYPE}  {0}
    set_instance_parameter_value axi_spi_engine_0 {NUM_OF_SDI}  {1}
    set_instance_parameter_value axi_spi_engine_0 {NUM_OFFLOAD} {1}
	
	add_connection sys_clk.clk axi_spi_engine_0.if_spi_clk
    add_connection sys_clk.clk axi_spi_engine_0.s_axi_clock
	add_connection sys_clk.clk_reset axi_spi_engine_0.if_spi_resetn
	add_connection sys_hps.h2f_reset axi_spi_engine_0.if_spi_resetn
    add_connection sys_hps.h2f_reset axi_spi_engine_0.s_axi_reset
		
	# spi_engine_execution
	
	add_instance spi_engine_execution_0 spi_engine_execution
    set_instance_parameter_value spi_engine_execution_0 {DATA_WIDTH} {32}
    set_instance_parameter_value spi_engine_execution_0 {NUM_OF_SDI} {1}
	
	add_connection sys_clk.clk spi_engine_execution_0.if_clk
	add_connection sys_clk.clk_reset spi_engine_execution_0.if_resetn
	add_connection sys_hps.h2f_reset spi_engine_execution_0.if_resetn
	add_interface spi_engine_execution_0_if_active conduit end
    set_interface_property spi_engine_execution_0_if_active EXPORT_OF spi_engine_execution_0.if_active
	add_interface spi_engine_execution_0_if_cs conduit end
    set_interface_property spi_engine_execution_0_if_cs EXPORT_OF spi_engine_execution_0.if_cs
    add_interface spi_engine_execution_0_if_sclk clock source
    set_interface_property spi_engine_execution_0_if_sclk EXPORT_OF spi_engine_execution_0.if_sclk
    add_interface spi_engine_execution_0_if_sdi conduit end
    set_interface_property spi_engine_execution_0_if_sdi EXPORT_OF spi_engine_execution_0.if_sdi
    add_interface spi_engine_execution_0_if_sdo conduit end
    set_interface_property spi_engine_execution_0_if_sdo EXPORT_OF spi_engine_execution_0.if_sdo
    add_interface spi_engine_execution_0_if_sdo_t conduit end
    set_interface_property spi_engine_execution_0_if_sdo_t EXPORT_OF spi_engine_execution_0.if_sdo_t
    add_interface spi_engine_execution_0_if_three_wire conduit end
    set_interface_property spi_engine_execution_0_if_three_wire EXPORT_OF spi_engine_execution_0.if_three_wire
		
	# spi_engine_interconnect
	
    add_instance spi_engine_interconnect_0 spi_engine_interconnect
    set_instance_parameter_value spi_engine_interconnect_0 {DATA_WIDTH} {32}
    set_instance_parameter_value spi_engine_interconnect_0 {NUM_OF_SDI} {1}
	
	add_connection sys_clk.clk spi_engine_interconnect_0.if_clk
	add_connection sys_clk.clk_reset spi_engine_interconnect_0.if_resestn
	add_connection sys_hps.h2f_reset spi_engine_interconnect_0.if_resestn
		
	# spi_engine_offload
	
	add_instance spi_engine_offload_0 spi_engine_offload
    set_instance_parameter_value spi_engine_offload_0 {ASYNC_TRIG} {1}
    set_instance_parameter_value spi_engine_offload_0 {DATA_WIDTH} {32}
    set_instance_parameter_value spi_engine_offload_0 {NUM_OF_SDI} {1}
	
	add_connection sys_clk.clk spi_engine_offload_0.if_ctrl_clk
    add_connection sys_clk.clk spi_engine_offload_0.if_spi_clk
	add_connection sys_hps.h2f_reset spi_engine_offload_0.if_spi_resetn
	add_interface spi_engine_offload_0_if_trigger conduit end
    set_interface_property spi_engine_offload_0_if_trigger EXPORT_OF spi_engine_offload_0.if_trigger
    
	# SPI Engine connections
	
	add_connection axi_spi_engine_0.cmd_if spi_engine_interconnect_0.s0_cmd_if 
	add_connection axi_spi_engine_0.sdo_if spi_engine_interconnect_0.s0_sdo_if 
	add_connection spi_engine_execution_0.sdi_if spi_engine_interconnect_0.m_sdi_if 
    add_connection spi_engine_execution_0.sync_if spi_engine_interconnect_0.m_sync_if 
    add_connection spi_engine_interconnect_0.m_cmd_if spi_engine_execution_0.cmd_if 
    add_connection spi_engine_interconnect_0.m_sdo_if spi_engine_execution_0.sdo_if 
    add_connection spi_engine_interconnect_0.s0_sdi_if axi_spi_engine_0.sdi_if 
    add_connection spi_engine_interconnect_0.s0_sync_if axi_spi_engine_0.sync_if 
    add_connection spi_engine_interconnect_0.s1_sdi_if spi_engine_offload_0.sdi_if 
    add_connection spi_engine_interconnect_0.s1_sync_if spi_engine_offload_0.sync_if 
    add_connection spi_engine_offload_0.cmd_if spi_engine_interconnect_0.s1_cmd_if 
	add_connection spi_engine_offload_0.ctrl_cmd_if axi_spi_engine_0.offload0_cmd_if
	add_connection spi_engine_offload_0.ctrl_sdo_if axi_spi_engine_0.offload0_sdo_if
	add_connection spi_engine_offload_0.if_ctrl_enable axi_spi_engine_0.if_offload0_enable
	add_connection spi_engine_offload_0.if_ctrl_enabled axi_spi_engine_0.if_offload0_enabled
	add_connection spi_engine_offload_0.if_ctrl_mem_reset axi_spi_engine_0.if_offload0_mem_reset
	add_connection spi_engine_offload_0.offload_sdi_if axi_dmac_0.s_axis
    add_connection spi_engine_offload_0.sdo_if spi_engine_interconnect_0.s1_sdo_if
	
	
	# cpu interconnects

	ad_cpu_interconnect 0x00020000 axi_dmac_0.s_axi
	ad_cpu_interconnect 0x00028000 axi_spi_engine_0.s_axi
	
	#interrupts
	
	ad_cpu_interrupt 3 axi_dmac_0.interrupt_sender
	ad_cpu_interrupt 4 axi_spi_engine_0.interrupt_sender