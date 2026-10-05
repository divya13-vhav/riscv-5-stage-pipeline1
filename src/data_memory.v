module data_memory (
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] address,
    input [31:0] WriteData,
    output [31:0] ReadData
);

    // 256 words × 32 bits
    reg [31:0] memory [0:255];

    integer i;

    // Initialize memory
    initial begin
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'd0;
    end

    // Read operation
    assign ReadData = MemRead ? memory[address[9:2]] : 32'd0;

    // Write operation
    always @(posedge clk) begin
        if (MemWrite)
            memory[address[9:2]] <= WriteData;
    end

endmodule
