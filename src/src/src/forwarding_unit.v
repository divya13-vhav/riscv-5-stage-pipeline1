module forwarding_unit (
    input [4:0] rs1_ex,
    input [4:0] rs2_ex,

    input [4:0] rd_mem,
    input       RegWrite_mem,

    input [4:0] rd_wb,
    input       RegWrite_wb,

    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB
);

    always @(*) begin

        // Default: use values from ID/EX register
        ForwardA = 2'b00;
        ForwardB = 2'b00;

        // Forward from EX/MEM to EX
        if (RegWrite_mem &&
            (rd_mem != 5'd0) &&
            (rd_mem == rs1_ex)) begin

            ForwardA = 2'b10;
        end

        if (RegWrite_mem &&
            (rd_mem != 5'd0) &&
            (rd_mem == rs2_ex)) begin

            ForwardB = 2'b10;
        end

        // Forward from MEM/WB to EX
        if (RegWrite_wb &&
            (rd_wb != 5'd0) &&
            (rd_wb == rs1_ex) &&
            !(RegWrite_mem &&
              (rd_mem != 5'd0) &&
              (rd_mem == rs1_ex))) begin

            ForwardA = 2'b01;
        end

        if (RegWrite_wb &&
            (rd_wb != 5'd0) &&
            (rd_wb == rs2_ex) &&
            !(RegWrite_mem &&
              (rd_mem != 5'd0) &&
              (rd_mem == rs2_ex))) begin

            ForwardB = 2'b01;
        end

    end

endmodule
