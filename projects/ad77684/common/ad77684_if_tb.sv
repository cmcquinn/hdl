`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Makronos Diagnostics
// Engineer: Cameron McQuinn
// 
// Create Date: 12/12/2019 03:14:45 PM
// Design Name: ad7768-4 Interface Testbench
// Module Name: ad77684_if_tb
// Project Name: Wireless CT Vibration and Temperature Data Acquisition
// Target Devices: Simulation
// Tool Versions: 
// Description: Testbench for validating the AD7768-4 interface verilog code.
// 
// Dependencies: 
// 
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ad77684_if_tb(

    );
    
    bit clk;
    reg ready;
    bit ready_load;
    bit [7:0] data;

    // data path interface
    bit adc_clk;
    bit adc_valid;
    bit [31:0] adc_data;

    // control interface
    bit sshot;
    bit [ 1:0]  format;
    bit crc_enable;
    bit crc_4_or_16_n;
    bit [ 35:0] status_clr;
    bit [ 35:0] status;
    
    bit [31:0] test_data [0:7];

    ad77684_if ad77684_if_i 
    (
        .clk_in(clk),
        .ready_in(ready),
        .data_in(data),
        .adc_clk(adc_clk),
        .adc_valid(adc_valid),
        .adc_data(adc_data),
        .up_sshot(sshot),
        .up_format(format),
        .up_crc_enable(crc_enable),
        .up_crc_4_or_16_n(crc_4_or_16_n),
        .up_status_clr(status_clr),
        .up_status(status)
    );

    

    always #5 clk = ~clk;
    
    bit [7:0] i = 8'd31;
    bit enable = 1'b0;
    always @(posedge clk) begin
        if ((ready == 0) && (enable == 0)) begin
            enable = 1;
        end else if ((enable) && (i > 0)) begin
            for (int j = 0; j < 8'd8; j++) begin
                data[j] = test_data[j][i];
            end
            i--;
        end else begin
            enable = 0;
            i = 8'd31;
            data = 8'd0;
        end
    end
    
    always @(posedge clk) begin
        ready <= ready_load;
        ready_load = 1'b0;
    end
        
    
    initial begin
//        foreach(test_data[,i]) begin
//            test_data[i] = $urandom_range(0,127);
//            $display("test_data[%d] = %d", i, test_data[i]);
//        end
        test_data[0] = 32'h0xFFFFFF;
        
        ready_load = 1; 
    end
endmodule
