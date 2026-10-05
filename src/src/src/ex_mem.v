module ex_mem (
    input clk,
    input reset,

    // Data from EX stage
    input [31:0] alu_result_in,
    input [31:0] write_data_in,
    input [31:0] branch_target_in,

    input branch_taken_in,

    input [4:0] rd_in,

    // Control signals
    input RegWrite_in,
    input MemRead_in,
    input MemWrite_in,
    input MemToReg_in,

    // Data to MEM stage
    output reg [31:0] alu_result_out,
    output reg [31:0] write_data_out,
    output reg [31:0] branch_target_out,

    output reg branch_taken_out,

    output reg [4:0] rd_out,

    // Control signals to MEM stage
    output reg RegWrite_out,
    output reg MemRead_out,
    output reg MemWrite_out,
    output reg MemToReg_out
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin

            alu_result_out    <= 32'd0;
            write_data_out    <= 32'd0;
            branch_target_out <= 32'd0;

            branch_taken_out  <= 1'b0;

            rd_out            <= 5'd0;

            RegWrite_out      <= 1'b0;
            MemRead_out       <= 1'b0;
            MemWrite_out      <= 1'b0;
            MemToReg_out      <= 1'b0;

        end

        else begin

            alu_result_out    <= alu_result_in;
            write_data_out    <= write_data_in;
            branch_target_out <= branch_target_in;

            branch_taken_out  <= branch_taken_in;

            rd_out            <= rd_in;

            RegWrite_out      <= RegWrite_in;
            MemRead_out       <= MemRead_in;
            MemWrite_out      <= MemWrite_in;
            MemToReg_out      <= MemToReg_in;

        end

    end

endmodule
