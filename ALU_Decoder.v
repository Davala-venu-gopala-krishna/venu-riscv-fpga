

module ALU_Decoder(ALUOp,funct3,funct7,op,ALUControl,dummy3,dummy2);

    input [1:0]ALUOp;
    input [2:0]funct3;
   input [6:0]funct7,op;
    output [2:0]ALUControl;
    output [5:0] dummy2,dummy3;

    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                        (ALUOp == 2'b01) ? 3'b001 :
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} == 2'b11)) ? 3'b001 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} != 2'b11)) ? 3'b000 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 :  
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b001)) ? 3'b100 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b011)) ? 3'b110 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b100)) ? 3'b111 : 
                                                                  3'b000 ;
     assign  dummy2= {funct7[6],funct7[4:0]};
     assign dummy3={op[6],op[4:0]};                                                           
endmodule