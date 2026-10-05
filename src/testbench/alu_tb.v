`timescale 1ns/1ps

module alu_tb;

    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALUControl;

    wire [31:0] Result;
    wire Zero;

    alu dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Zero(Zero)
    );

    initial begin

        // ADD
        A = 10;
        B = 20;
        ALUControl = 4'b0000;
        #10;

        $display("ADD: %d + %d = %d", A, B, Result);

        // SUB
        A = 20;
        B = 10;
        ALUControl = 4'b0001;
        #10;

        $display("SUB: %d - %d = %d", A, B, Result);

        // AND
        A = 8'hF0;
        B = 8'h0F;
        ALUControl = 4'b0010;
        #10;

        $display("AND: %h & %h = %h", A, B, Result);

        // OR
        A = 8'hF0;
        B = 8'h0F;
        ALUControl = 4'b0011;
        #10;

        $display("OR: %h | %h = %h", A, B, Result);

        // XOR
        A = 8'hFF;
        B = 8'h0F;
        ALUControl = 4'b0100;
        #10;

        $display("XOR: %h ^ %h = %h", A, B, Result);

        // SLT
        A = 5;
        B = 10;
        ALUControl = 4'b0101;
        #10;

        $display("SLT: %d < %d = %d", A, B, Result);

        $finish;

    end

endmodule
