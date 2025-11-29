

module Instruction_Memory(rst,A,RD);

  input rst;
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [1023:0];
  
  assign RD = (~rst) ? {32{1'b0}} : mem[A[31:2]];

  initial begin
    $readmemh("memfile.hex",mem);
  end



  initial begin
   // mem[0] = 32'h005314B3; //nand
    //mem[1] = 32'h005334B3; //nor
   // mem[1] = 32'h005374B3; //mul
    //mem[1] = 32'h005378B3; //and
     mem[5] = 32'h005304B3; //add
   //  mem[1] = 32'h005368B3; //or
// mem[0] = 32'h405304B3; //sub
// mem[0] = 32'h005324B3; //xor
  end

endmodule
