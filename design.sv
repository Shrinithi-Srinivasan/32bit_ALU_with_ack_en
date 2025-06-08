module ALU(
    input [31:0] A,       
    input [31:0] B,       
    input [2:0] opcode,   
    input enable,      
    output reg [31:0] result, 
    output reg ack       
);
    always @ (A, B, opcode, enable) begin
        if (enable) begin
            case (opcode)
                3'b000: result = A + B; // A + B
                3'b001: result = A - B;  // A - B
                3'b010: result = A + 1;  // A + 1
                3'b011: result = A - 1;  // A - 1
                3'b100: result = A;   // A
                3'b101: result = ~A;  // A Complement (bitwise NOT of A)
                3'b110: result = A | B;  // A OR B
                3'b111: result = A & B;  // A AND B
                default: result = 32'bz; // Tri-state for invalid opcodes
            endcase
            ack = 1; 
        end else begin
            result = 32'bz; 
            ack = 0;       
        end
    end
endmodule
