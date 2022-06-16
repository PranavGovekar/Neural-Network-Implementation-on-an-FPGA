`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2022 01:15:10 AM
// Design Name: 
// Module Name: neuron_10
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


module neuron_10(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,bias,cout);

input signed [15:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10;
input signed [7:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,bias;
output signed [31:0] cout;

assign cout = ((in1*w1)+(in2*w2)+(in3*w3)+(in4*w4)+(in5*w5)+(in6*w6)+(in7*w7)+(in8*w8)+(in9*w9)+(in10*w10)+bias);

endmodule
