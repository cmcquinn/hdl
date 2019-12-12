
# ad77684 interface

create_bd_port -dir I adc_clk
create_bd_port -dir I adc_valid
create_bd_port -dir I -from 31 -to 0 adc_data
create_bd_port -dir I -from 31 -to 0 adc_gpio_0_i
create_bd_port -dir O -from 31 -to 0 adc_gpio_0_o
create_bd_port -dir O -from 31 -to 0 adc_gpio_0_t
create_bd_port -dir I -from 31 -to 0 adc_gpio_1_i
create_bd_port -dir O -from 31 -to 0 adc_gpio_1_o
create_bd_port -dir O -from 31 -to 0 adc_gpio_1_t

# instances

ad_ip_instance axi_dmac ad77684_dma
ad_ip_parameter ad77684_dma CONFIG.DMA_TYPE_SRC 2
ad_ip_parameter ad77684_dma CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter ad77684_dma CONFIG.CYCLIC 0
ad_ip_parameter ad77684_dma CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter ad77684_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter ad77684_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter ad77684_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter ad77684_dma CONFIG.DMA_DATA_WIDTH_SRC 32

# ps7-hp0

ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP0 1

# gpio

ad_ip_instance axi_gpio ad77684_gpio
ad_ip_parameter ad77684_gpio CONFIG.C_IS_DUAL 1
ad_ip_parameter ad77684_gpio CONFIG.C_GPIO_WIDTH 32
ad_ip_parameter ad77684_gpio CONFIG.C_GPIO2_WIDTH 32
ad_ip_parameter ad77684_gpio CONFIG.C_INTERRUPT_PRESENT 1

# interconnects

ad_connect  adc_clk ad77684_dma/fifo_wr_clk
ad_connect  adc_valid ad77684_dma/fifo_wr_en
ad_connect  adc_data ad77684_dma/fifo_wr_din
ad_connect  adc_gpio_0_i ad77684_gpio/gpio_io_i
ad_connect  adc_gpio_0_o ad77684_gpio/gpio_io_o
ad_connect  adc_gpio_0_t ad77684_gpio/gpio_io_t
ad_connect  adc_gpio_1_i ad77684_gpio/gpio2_io_i
ad_connect  adc_gpio_1_o ad77684_gpio/gpio2_io_o
ad_connect  adc_gpio_1_t ad77684_gpio/gpio2_io_t

# interrupts

ad_cpu_interrupt ps-13 mb-13  ad77684_dma/irq
ad_cpu_interrupt ps-12 mb-12  ad77684_gpio/ip2intc_irpt

# cpu / memory interconnects

ad_cpu_interconnect 0x7C400000 ad77684_dma
ad_cpu_interconnect 0x7C420000 ad77684_gpio

ad_mem_hp0_interconnect sys_cpu_clk sys_ps7/S_AXI_HP0
ad_mem_hp0_interconnect sys_cpu_clk ad77684_dma/m_dest_axi

