module core(
    input logic clk, 
    input logic resetn
);

// Instruction Fetching
logic [2:0] imm;
logic [3:0] pc;
logic J;
logic C;
logic [1:0] D;
logic Sreg;
logic S;
logic carry;
logic carrydff;
logic [3:0] regIn;
logic [3:0] regA, regB, regO;
logic [3:0]AluOut;
logic [7:0] inst;
logic enA, enB, enO;
// jump logic 
logic pc_load;
assign pc_load = J | (C & carrydff);

counter_n_bit pc_inst(
    .clk(clk),
    .resetn(resetn),
    .load_data({1'b0,imm}),
    .load(pc_load),
    .en(1'b1),   
    .count(pc)
);


// Instruction memory
imem imem_inst(
    .addr(pc),
    .inst(inst)
);

// Decoding instruction 

assign J = inst[7];
assign C = inst[6];
assign D = inst[5:4];
assign Sreg = inst[3];
assign imm = inst[2:0];
assign S = inst[2];

// Generating enables for register O, A and B
decoder decoder_inst(
    .in(D),
    .out({enO,enB,enA})
);

// registers 

// Mux for selecting inputs for register (regIn)
mux2x1 mux1(
    .in2(AluOut),
    .in1({1'b0,imm}),
    .sel(Sreg),
    .out(regIn)
);

// Register RA (regA)
register reg_A(
    .clk(clk),
    .resetn(resetn),
    .wen(enA),
    .D(regIn),
    .Q(regA)
);

// Register RB (regB)
register reg_B(
    .clk(clk),
    .resetn(resetn),
    .wen(enB),
    .D(regIn),
    .Q(regB)
);

// Register RO (regO)
register reg_O(
    .clk(clk),
    .resetn(resetn),
    .wen(enO),
    .D(regA),
    .Q(regO)
);

// ALU

alu alu_inst(
//    .clk(clk),
    .opcode(S),
    .a(regA),
    .b(regB),
    .out(AluOut),
    .carry(carry)
);

always @(posedge clk,negedge resetn) begin

    if(~resetn)
    carrydff<=0;
    else
    carrydff<=carry;


end

endmodule : core