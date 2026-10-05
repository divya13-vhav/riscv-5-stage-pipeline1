module branch_unit (
    input        Branch,
    input        BranchNE,

    input  [31:0] ReadData1,
    input  [31:0] ReadData2,

    output reg   BranchTaken
);

    always @(*) begin

        BranchTaken = 1'b0;

        // BEQ
        if (Branch && !BranchNE) begin
            if (ReadData1 == ReadData2)
                BranchTaken = 1'b1;
        end

        // BNE
        else if (Branch && BranchNE) begin
            if (ReadData1 != ReadData2)
                BranchTaken = 1'b1;
        end

    end

endmodule
