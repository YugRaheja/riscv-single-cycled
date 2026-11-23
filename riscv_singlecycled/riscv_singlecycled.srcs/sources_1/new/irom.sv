module irom(input  logic [31:0] a,
            output logic [31:0] rd);
            
  logic [31:0] ROM [63:0];
  
  initial
    $readmemh("riscvtest.memfile", ROM);
    
    assign rd = ROM[a[7:2]]; //Word aligned


endmodule