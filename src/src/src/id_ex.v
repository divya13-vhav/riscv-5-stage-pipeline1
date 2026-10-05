module id_ex (
    input clk,
    input reset,
    input flush,

    // Data from ID stage
    input [31:0] pc_in,
    input [31:0] read_data1_in,
    input [31:0] read_data2_in,
    input [31:0] immediate_in,

    input [4:0] rs1_in,
    input [4:0] rs2_in,
    input [4:0] rd_in,

    // Control signals
    input RegWrite_in,
    input MemRead_in,
    input MemWrite_in,
    input MemToReg_in,
    input ALUSrc_in,
    input Branch_in,
    input BranchNE_in,

    input [3:0] ALUControl_in,

    // Outputs to EX stage
    output reg [31:0] pc_out,
    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out,
    output reg [31:0] immediate_out,

    output reg [4:0] rs1_out,
    output reg [4:0] rs2_out,
    output reg [4:0] rd_out,

    output reg RegWrite_out,
    output reg MemRead_out,
    output reg MemWrite_out,
    output reg MemToReg_out,
    output reg ALUSrc_out,
    output reg Branch_out,
    output reg BranchNE_out,

    output reg [3:0] ALUControl_out
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            pc_out          <= 32'd0;
            read_data1_out  <= 32'd0;
            read_data2_out  <= 32'd0;
            immediate_out   <= 32'd0;

            rs1_out         <= 5'd0;
            rs2_out         <= 5'd0;
            rd_out          <= 5'd0;

            RegWrite_out    <= 1'b0;
            MemRead_out     <= 1'b0;
            MemWrite_out    <= 1'b0;
            MemToReg_out    <= 1'b0;
            ALUSrc_out      <= 1'b0;
            Branch_out      <= 1'b0;
            BranchNE_out    <= 1'b0;

            ALUControl_out  <= 4'b0000;
        end

        else if (flush) begin
            // Insert a NOP
            pc_out          <= 32'd0;
            read_data1_out  <= 32'd0;
            read_data2_out  <= 32'd0;
            immediate_out   <= 32'd0;

            rs1_out         <= 5'd0;
            rs2_out         <= 5'd0;
            rd_out          <= 5'd0;

            RegWrite_out    <= 1'b0;
            MemRead_out     <= 1'b0;
            MemWrite_out    <= 1'b0;
            MemToReg_out    <= 1'b0;
            ALUSrc_out      <= 1'b0;
            Branch_out      <= 1'b0;
            BranchNE_out    <= 1'b0;

            ALUControl_out  <= 4'b0000;
        end

        else begin
            pc_out          <= pc_in;
            read_data1_out  <= read_data1_in;
            read_data2_out  <= read_data2_in;
            immediate_out   <= immediate_in;

            rs1_out         <= rs1_in;
            rs2_out         <= rs2_in;
            rd_out          <= rd_in;

            RegWrite_out    <= RegWrite_in;
            MemRead_out     <= MemRead_in;
            MemWrite_out    <= MemWrite_in;
            MemToReg_out    <= MemToReg_in;
            ALUSrc_out      <= ALUSrc_in;
            Branch_out      <= Branch_in;
            BranchNE_out    <= BranchNE_in;

            ALUControl_out  <= ALUControl_in;
        end

    end

endmodule
