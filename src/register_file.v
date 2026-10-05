module register_file (
    input clk,
    input reset,

    input RegWrite,

    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    input [31:0] WriteData,

    output [31:0] ReadData1,
    output [31:0] ReadData2
);

    // 32 registers, each 32 bits wide
    reg [31:0] registers [0:31];

    integer i;

    // Write operation
    always @(posedge clk or posedge reset) begin

        if (reset) begin

            // Reset all registers to zero
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;

        end

        else begin

            // x0 must always remain zero
            if (RegWrite && (rd != 5'd0))
                registers[rd] <= WriteData;

        end

    end

    // Read ports
    assign ReadData1 =
        (rs1 == 5'd0) ? 32'd0 : registers[rs1];

    assign ReadData2 =
        (rs2 == 5'd0) ? 32'd0 : registers[rs2];

endmodule
