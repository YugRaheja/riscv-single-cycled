module controller(
  input logic [6:0] Op,
  input logic       Eq,
  input logic [2:0] Funct3,
  input logic       Funct7b5,
 output logic       ALUResultSrc,
 output logic       ResultSrc,
 output logic       MemWrite,
 output logic       PCSrc,
 output logic       RegWrite,
 output logic [1:0] ALUSrc, ImmSrc,
 output logic [1:0] ALUControl
 );
 
 
 logic        Branch, Jump;
 logic        Sub, ALUOp;
 
 logic [10:0] controls;
 
 //Main Decoder
 always_comb
   case(Op)
   //RegWrite_ImmSrc_ALUSrc_ALUOp_ALUResultSrc__MemWrite_ResultSrc_Branch_Jump
     7'b0000011: controls = 11'b1_00_01_0_0_0_1_0_0; //lw
     7'b0100011: controls = 11'b0_01_01_0_0_1_0_0_0; //sw
     7'b0110011: controls = 11'b1_xx_00_1_0_0_0_0_0; //R-type
     7'b0010011: controls = 11'b1_00_01_1_0_0_0_0_0; //I-type ALU
     7'b1100011: controls = 11'b0_10_11_0_0_0_0_1_0; //beq
     7'b1101111: controls = 11'b1_11_11_0_1_0_0_0_1; //jal
     default:    controls = 11'bx_xx_xx_x_x_x_x_x_x; //Non-implemented instructions 
    endcase


  assign {RegWrite, ImmSrc, ALUSrc, ALUOp, ALUResultSrc, MemWrite, ResultSrc, Branch, Jump} = controls;
  
  //ALU Control Logic
  assign Sub = ALUOp & ((Funct3 == 3'b000) & Funct7b5 & Op[5] | (Funct3 == 3'b010)); //Subtract or SLT
  assign ALUControl = {Sub, ALUOp};
  
  //PCSrc Logic
  assign PCSrc = Branch & Eq | Jump;
  
endmodule