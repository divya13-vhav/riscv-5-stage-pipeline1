module hazard_detection (
    input [4:0] rs1_id,
    input [4:0] rs2_id,

    input [4:0] rd_ex,
    input       MemRead_ex,

    output reg PCWrite,
    output reg IF_ID_Write,
    output reg ControlStall
);

    always @(*) begin

        // Default: no stall
        PCWrite      = 1'b1;
        IF_ID_Write  = 1'b1;
        ControlStall = 1'b0;

        // Load-use hazard
        if (MemRead_ex &&
            (rd_ex != 5'd0) &&
            ((rd_ex == rs1_id) || (rd_ex == rs2_id))) begin

            // Stall the pipeline
            PCWrite      = 1'b0;
            IF_ID_Write  = 1'b0;
            ControlStall = 1'b1;

        end

    end

endmodule
