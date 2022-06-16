`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2022 10:26:26 AM
// Design Name: 
// Module Name: neuron_20
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module neuron_20(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,bias,cout);

input signed [15:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20;
input signed [7:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,bias;
output signed [31:0] cout;

assign cout = ((in1*w1)+(in2*w2)+(in3*w3)+(in4*w4)+(in5*w5)+(in6*w6)+(in7*w7)+(in8*w8)+(in9*w9)+(in10*w10)+(in11*w11)+(in12*w12)+(in13*w13)+(in14*w14)+(in15*w15)+(in16*w16)+(in17*w17)+(in18*w18)+(in19*w19)+(in20*w20)+bias);

endmodule
