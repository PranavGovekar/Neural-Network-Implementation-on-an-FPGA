`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
// Create Date: 04/27/2022 07:56:24 PM
// Design Name: 
// Module Name: top_level
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


module top_level(final_out); // toplevel module with final_out output directly to 7 segment display

output reg [6:0] final_out; // final_out output directly to 7 segment display

reg signed [7:0] weights_256 [0:2559]; // 2-D array declared to store 2560 (i.e 1 neuron = 256 weights therefore 10 neurons = 2560 weights) in 8 bit size

// memory reading code for weights from text file directly into the above array
initial
    begin
        $readmemb ("weights_256.mem", weights_256);
    end
// memory reding done

// all declarations for input layer neurons i.e 256 input neurons    
wire signed [7:0] bias_inlayer1 = 0; // 8 bit signed value of bias
wire signed [7:0] bias_inlayer2 = -4;
wire signed [7:0] bias_inlayer3 = -4;
wire signed [7:0] bias_inlayer4 = 9;
wire signed [7:0] bias_inlayer5 = 8;
wire signed [7:0] bias_inlayer6 = 5;
wire signed [7:0] bias_inlayer7 = 10;
wire signed [7:0] bias_inlayer8 = 11;
wire signed [7:0] bias_inlayer9 = 1;
wire signed [7:0] bias_inlayer10 = -1;
    
wire signed [0:2047] weights_inlayer1; //bitstream of 256 weights of 8 bit size
wire signed [0:2047] weights_inlayer2;
wire signed [0:2047] weights_inlayer3;
wire signed [0:2047] weights_inlayer4;
wire signed [0:2047] weights_inlayer5;
wire signed [0:2047] weights_inlayer6;
wire signed [0:2047] weights_inlayer7;
wire signed [0:2047] weights_inlayer8;
wire signed [0:2047] weights_inlayer9;
wire signed [0:2047] weights_inlayer10;

wire signed [31:0] out_inlayer1; // outputs in 16 bit signed size
wire signed [31:0] out_inlayer2;
wire signed [31:0] out_inlayer3;
wire signed [31:0] out_inlayer4;
wire signed [31:0] out_inlayer5;
wire signed [31:0] out_inlayer6;
wire signed [31:0] out_inlayer7;
wire signed [31:0] out_inlayer8;
wire signed [31:0] out_inlayer9;
wire signed [31:0] out_inlayer10;
// declarations for 256 input neuron ends

// all declarations for hidden layer neurons i.e 10 input neurons x 20
wire signed [7:0] bias_hidlayer1 = -10; // 8 bit signed value of bias
wire signed [7:0] bias_hidlayer2 = -8;
wire signed [7:0] bias_hidlayer3 = 3;
wire signed [7:0] bias_hidlayer4 = 7;
wire signed [7:0] bias_hidlayer5 = 5;
wire signed [7:0] bias_hidlayer6 = 8;
wire signed [7:0] bias_hidlayer7 = -10;
wire signed [7:0] bias_hidlayer8 = -4;
wire signed [7:0] bias_hidlayer9 = 9;
wire signed [7:0] bias_hidlayer10 = -3;
wire signed [7:0] bias_hidlayer11 = 5; 
wire signed [7:0] bias_hidlayer12 = -7;
wire signed [7:0] bias_hidlayer13 = -3;
wire signed [7:0] bias_hidlayer14 = 3;
wire signed [7:0] bias_hidlayer15 = -9;
wire signed [7:0] bias_hidlayer16 = -3;
wire signed [7:0] bias_hidlayer17 = -4;
wire signed [7:0] bias_hidlayer18 = 0;
wire signed [7:0] bias_hidlayer19 = -8;
wire signed [7:0] bias_hidlayer20 = 3;

wire signed [7:0] w1_hidlayer1 = -36;// handwritten fixed weights for hidden layer :)
wire signed [7:0] w2_hidlayer1 = -6;
wire signed [7:0] w3_hidlayer1 = -60;
wire signed [7:0] w4_hidlayer1 = 51;
wire signed [7:0] w5_hidlayer1 =-71;
wire signed [7:0] w6_hidlayer1 = 7;
wire signed [7:0] w7_hidlayer1 = 13;
wire signed [7:0] w8_hidlayer1 = -83;
wire signed [7:0] w9_hidlayer1 = 47;
wire signed [7:0] w10_hidlayer1 = 0;

wire signed [7:0] w1_hidlayer2 = -2;
wire signed [7:0] w2_hidlayer2 = -72;
wire signed [7:0] w3_hidlayer2 = -18;
wire signed [7:0] w4_hidlayer2 = 14;
wire signed [7:0] w5_hidlayer2 = 46;
wire signed [7:0] w6_hidlayer2 = 2;
wire signed [7:0] w7_hidlayer2 = -42;
wire signed [7:0] w8_hidlayer2 = 19;
wire signed [7:0] w9_hidlayer2 = 49;
wire signed [7:0] w10_hidlayer2 = -52;

wire signed [7:0] w1_hidlayer3 = -27;
wire signed [7:0] w2_hidlayer3 = 37;
wire signed [7:0] w3_hidlayer3 = -7;
wire signed [7:0] w4_hidlayer3 = 69;
wire signed [7:0] w5_hidlayer3 = 56;
wire signed [7:0] w6_hidlayer3 = -63;
wire signed [7:0] w7_hidlayer3 = -13;
wire signed [7:0] w8_hidlayer3 = 16;
wire signed [7:0] w9_hidlayer3 = 29;
wire signed [7:0] w10_hidlayer3 = 34;

wire signed [7:0] w1_hidlayer4 = -10;
wire signed [7:0] w2_hidlayer4 = 32;
wire signed [7:0] w3_hidlayer4 = -113;
wire signed [7:0] w4_hidlayer4 = 27;
wire signed [7:0] w5_hidlayer4 = 47;
wire signed [7:0] w6_hidlayer4 = 14;
wire signed [7:0] w7_hidlayer4 = 48;
wire signed [7:0] w8_hidlayer4 = 0;
wire signed [7:0] w9_hidlayer4 = -6;
wire signed [7:0] w10_hidlayer4 = -35;

wire signed [7:0] w1_hidlayer5 = -8;
wire signed [7:0] w2_hidlayer5 = 13;
wire signed [7:0] w3_hidlayer5 = 19;
wire signed [7:0] w4_hidlayer5 = -87;
wire signed [7:0] w5_hidlayer5 = 24;
wire signed [7:0] w6_hidlayer5 = 34;
wire signed [7:0] w7_hidlayer5 = 34;
wire signed [7:0] w8_hidlayer5 = -45;
wire signed [7:0] w9_hidlayer5 = 14;
wire signed [7:0] w10_hidlayer5 = -10;

wire signed [7:0] w1_hidlayer6 = 26;
wire signed [7:0] w2_hidlayer6 = 48;
wire signed [7:0] w3_hidlayer6 = 37;
wire signed [7:0] w4_hidlayer6 = 38;
wire signed [7:0] w5_hidlayer6 = 80;
wire signed [7:0] w6_hidlayer6 = 69;
wire signed [7:0] w7_hidlayer6 = 85;
wire signed [7:0] w8_hidlayer6 = -6;
wire signed [7:0] w9_hidlayer6 = 88;
wire signed [7:0] w10_hidlayer6 = 78;

wire signed [7:0] w1_hidlayer7 = 26;
wire signed [7:0] w2_hidlayer7 = -10;
wire signed [7:0] w3_hidlayer7 = 31;
wire signed [7:0] w4_hidlayer7 = 11;
wire signed [7:0] w5_hidlayer7 = 2;
wire signed [7:0] w6_hidlayer7 = -13;
wire signed [7:0] w7_hidlayer7 = -5;
wire signed [7:0] w8_hidlayer7 = -5;
wire signed [7:0] w9_hidlayer7 = -31;
wire signed [7:0] w10_hidlayer7 = 21;

wire signed [7:0] w1_hidlayer8 = -29;
wire signed [7:0] w2_hidlayer8 = 19;
wire signed [7:0] w3_hidlayer8 = 21;
wire signed [7:0] w4_hidlayer8 = 51;
wire signed [7:0] w5_hidlayer8 = 3;
wire signed [7:0] w6_hidlayer8 = 48;
wire signed [7:0] w7_hidlayer8 = -47;
wire signed [7:0] w8_hidlayer8 = 6;
wire signed [7:0] w9_hidlayer8 = -2;
wire signed [7:0] w10_hidlayer8 = -9;

wire signed [7:0] w1_hidlayer9 = -29;
wire signed [7:0] w2_hidlayer9 = 100;
wire signed [7:0] w3_hidlayer9 = 82;
wire signed [7:0] w4_hidlayer9 = 109;
wire signed [7:0] w5_hidlayer9 = 85;
wire signed [7:0] w6_hidlayer9 = 13;
wire signed [7:0] w7_hidlayer9 = 10;
wire signed [7:0] w8_hidlayer9 = 126;
wire signed [7:0] w9_hidlayer9 = 115;
wire signed [7:0] w10_hidlayer9 = 1;

wire signed [7:0] w1_hidlayer10 = 37;
wire signed [7:0] w2_hidlayer10 = 60;
wire signed [7:0] w3_hidlayer10 = -20;
wire signed [7:0] w4_hidlayer10 = 51;
wire signed [7:0] w5_hidlayer10 = -67;
wire signed [7:0] w6_hidlayer10 = 71;
wire signed [7:0] w7_hidlayer10 = 79;
wire signed [7:0] w8_hidlayer10 = 19;
wire signed [7:0] w9_hidlayer10 = 34;
wire signed [7:0] w10_hidlayer10 = 71;

wire signed [7:0] w1_hidlayer11 = 6;
wire signed [7:0] w2_hidlayer11 = -14;
wire signed [7:0] w3_hidlayer11 = 11;
wire signed [7:0] w4_hidlayer11 = -81;
wire signed [7:0] w5_hidlayer11 = 48;
wire signed [7:0] w6_hidlayer11 = 53;
wire signed [7:0] w7_hidlayer11 = -16;
wire signed [7:0] w8_hidlayer11 = 71;
wire signed [7:0] w9_hidlayer11 = -9;
wire signed [7:0] w10_hidlayer11 = -35;

wire signed [7:0] w1_hidlayer12 = 3;
wire signed [7:0] w2_hidlayer12 = 83;
wire signed [7:0] w3_hidlayer12 = -5;
wire signed [7:0] w4_hidlayer12 = -39;
wire signed [7:0] w5_hidlayer12 = -25;
wire signed [7:0] w6_hidlayer12 = 37;
wire signed [7:0] w7_hidlayer12 = 19;
wire signed [7:0] w8_hidlayer12 = 39;
wire signed [7:0] w9_hidlayer12 = -61;
wire signed [7:0] w10_hidlayer12 = 45;

wire signed [7:0] w1_hidlayer13 = -29;
wire signed [7:0] w2_hidlayer13 = -41;
wire signed [7:0] w3_hidlayer13 = -12;
wire signed [7:0] w4_hidlayer13 = -24;
wire signed [7:0] w5_hidlayer13 = 38;
wire signed [7:0] w6_hidlayer13 = 28;
wire signed [7:0] w7_hidlayer13 = -41;
wire signed [7:0] w8_hidlayer13 = -24;
wire signed [7:0] w9_hidlayer13 = 28;
wire signed [7:0] w10_hidlayer13 = 21;

wire signed [7:0] w1_hidlayer14 = 4;
wire signed [7:0] w2_hidlayer14 = -80;
wire signed [7:0] w3_hidlayer14 = 77;
wire signed [7:0] w4_hidlayer14 = -52;
wire signed [7:0] w5_hidlayer14 = 40;
wire signed [7:0] w6_hidlayer14 = 1;
wire signed [7:0] w7_hidlayer14 = 60;
wire signed [7:0] w8_hidlayer14 = -9;
wire signed [7:0] w9_hidlayer14 = 68;
wire signed [7:0] w10_hidlayer14 = 63;

wire signed [7:0] w1_hidlayer15 = -30;
wire signed [7:0] w2_hidlayer15 = 127;
wire signed [7:0] w3_hidlayer15 = -12;
wire signed [7:0] w4_hidlayer15 = 30;
wire signed [7:0] w5_hidlayer15 = 34;
wire signed [7:0] w6_hidlayer15 = -23;
wire signed [7:0] w7_hidlayer15 = -41;
wire signed [7:0] w8_hidlayer15 = 1;
wire signed [7:0] w9_hidlayer15 = 54;
wire signed [7:0] w10_hidlayer15 = -58;

wire signed [7:0] w1_hidlayer16 = 33;
wire signed [7:0] w2_hidlayer16 = 36;
wire signed [7:0] w3_hidlayer16 = 36;
wire signed [7:0] w4_hidlayer16 = -33;
wire signed [7:0] w5_hidlayer16 = -4;
wire signed [7:0] w6_hidlayer16 = -16;
wire signed [7:0] w7_hidlayer16 = 24;
wire signed [7:0] w8_hidlayer16 = 15;
wire signed [7:0] w9_hidlayer16 = -29;
wire signed [7:0] w10_hidlayer16 = -16;

wire signed [7:0] w1_hidlayer17 = 14;
wire signed [7:0] w2_hidlayer17 = 70;
wire signed [7:0] w3_hidlayer17 = 10;
wire signed [7:0] w4_hidlayer17 = 59;
wire signed [7:0] w5_hidlayer17 = 70;
wire signed [7:0] w6_hidlayer17 = 32;
wire signed [7:0] w7_hidlayer17 = -16;
wire signed [7:0] w8_hidlayer17 = -43;
wire signed [7:0] w9_hidlayer17 = -36;
wire signed [7:0] w10_hidlayer17 = -3;

wire signed [7:0] w1_hidlayer18 = 0;
wire signed [7:0] w2_hidlayer18 = 67;
wire signed [7:0] w3_hidlayer18 = -17;
wire signed [7:0] w4_hidlayer18 = 16;
wire signed [7:0] w5_hidlayer18 = -53;
wire signed [7:0] w6_hidlayer18 = 27;
wire signed [7:0] w7_hidlayer18 = 42;
wire signed [7:0] w8_hidlayer18 = 31;
wire signed [7:0] w9_hidlayer18 = -45;
wire signed [7:0] w10_hidlayer18 = -31;

wire signed [7:0] w1_hidlayer19 = 14;
wire signed [7:0] w2_hidlayer19 = 81;
wire signed [7:0] w3_hidlayer19 = 35;
wire signed [7:0] w4_hidlayer19 = -28;
wire signed [7:0] w5_hidlayer19 = -38;
wire signed [7:0] w6_hidlayer19 = -19;
wire signed [7:0] w7_hidlayer19 = 28;
wire signed [7:0] w8_hidlayer19 = -19;
wire signed [7:0] w9_hidlayer19 = 57;
wire signed [7:0] w10_hidlayer19 = -23;

wire signed [7:0] w1_hidlayer20 = -7;
wire signed [7:0] w2_hidlayer20 = 7;
wire signed [7:0] w3_hidlayer20 = -50;
wire signed [7:0] w4_hidlayer20 = -34;
wire signed [7:0] w5_hidlayer20 = 24;
wire signed [7:0] w6_hidlayer20 = -48;
wire signed [7:0] w7_hidlayer20 = 36;
wire signed [7:0] w8_hidlayer20 = 36;
wire signed [7:0] w9_hidlayer20 = 14;
wire signed [7:0] w10_hidlayer20 = 6;

wire signed [31:0] out_hidlayer1;
wire signed [31:0] out_hidlayer2;
wire signed [31:0] out_hidlayer3;
wire signed [31:0] out_hidlayer4;
wire signed [31:0] out_hidlayer5;
wire signed [31:0] out_hidlayer6;
wire signed [31:0] out_hidlayer7;
wire signed [31:0] out_hidlayer8;
wire signed [31:0] out_hidlayer9;
wire signed [31:0] out_hidlayer10;
wire signed [31:0] out_hidlayer11;
wire signed [31:0] out_hidlayer12;
wire signed [31:0] out_hidlayer13;
wire signed [31:0] out_hidlayer14;
wire signed [31:0] out_hidlayer15;
wire signed [31:0] out_hidlayer16;
wire signed [31:0] out_hidlayer17;
wire signed [31:0] out_hidlayer18;
wire signed [31:0] out_hidlayer19;
wire signed [31:0] out_hidlayer20;
// end of hidden layer (HARD WORK INNIT? :))

// output layer
wire signed [7:0] bias_outlayer1 = 0; // 8 bit signed value of bias
wire signed [7:0] bias_outlayer2 = 0;
wire signed [7:0] bias_outlayer3 = 0;
wire signed [7:0] bias_outlayer4 = 0;
wire signed [7:0] bias_outlayer5 = 0;
wire signed [7:0] bias_outlayer6 = 0;
wire signed [7:0] bias_outlayer7 = 0;
wire signed [7:0] bias_outlayer8 = -4;
wire signed [7:0] bias_outlayer9 = 0;
wire signed [7:0] bias_outlayer10 = 3;


wire signed [7:0] w1_outlayer1 = 39;// handwritten fixed weights for output layer :)
wire signed [7:0] w2_outlayer1 = -9;
wire signed [7:0] w3_outlayer1 = -4;
wire signed [7:0] w4_outlayer1 = -20;
wire signed [7:0] w5_outlayer1 = -4;
wire signed [7:0] w6_outlayer1 = 4;
wire signed [7:0] w7_outlayer1 = -54;
wire signed [7:0] w8_outlayer1 = -39;
wire signed [7:0] w9_outlayer1 = 0;
wire signed [7:0] w10_outlayer1 = 10;
wire signed [7:0] w11_outlayer1 = -6;
wire signed [7:0] w12_outlayer1 = -24;
wire signed [7:0] w13_outlayer1 = -45;
wire signed [7:0] w14_outlayer1 = 11;
wire signed [7:0] w15_outlayer1 = -43;
wire signed [7:0] w16_outlayer1 = -61;
wire signed [7:0] w17_outlayer1 = -62;
wire signed [7:0] w18_outlayer1 = -16;
wire signed [7:0] w19_outlayer1 = 10;
wire signed [7:0] w20_outlayer1 = -15;


wire signed [7:0] w1_outlayer2 = -14;
wire signed [7:0] w2_outlayer2 = -57;
wire signed [7:0] w3_outlayer2 = -6;
wire signed [7:0] w4_outlayer2 = -15;
wire signed [7:0] w5_outlayer2 = -51;
wire signed [7:0] w6_outlayer2 = -17;
wire signed [7:0] w7_outlayer2 = -44;
wire signed [7:0] w8_outlayer2 = -17;
wire signed [7:0] w9_outlayer2 = 19;
wire signed [7:0] w10_outlayer2 = -16;
wire signed [7:0] w11_outlayer2 = 23;
wire signed [7:0] w12_outlayer2 = 15;
wire signed [7:0] w13_outlayer2 = -127;
wire signed [7:0] w14_outlayer2 = -7;
wire signed [7:0] w15_outlayer2 = -34;
wire signed [7:0] w16_outlayer2 = 11;
wire signed [7:0] w17_outlayer2 = -28;
wire signed [7:0] w18_outlayer2 = 3;
wire signed [7:0] w19_outlayer2 = -46;
wire signed [7:0] w20_outlayer2 = -14;

wire signed [7:0] w1_outlayer3 = -39;
wire signed [7:0] w2_outlayer3 = -37;
wire signed [7:0] w3_outlayer3 = 8;
wire signed [7:0] w4_outlayer3 = -18;
wire signed [7:0] w5_outlayer3 = -8;
wire signed [7:0] w6_outlayer3 = 6;
wire signed [7:0] w7_outlayer3 = -52;
wire signed [7:0] w8_outlayer3 = -25;
wire signed [7:0] w9_outlayer3 = 8;
wire signed [7:0] w10_outlayer3 = 3;
wire signed [7:0] w11_outlayer3 = -2;
wire signed [7:0] w12_outlayer3 = 0;
wire signed [7:0] w13_outlayer3 = -31;
wire signed [7:0] w14_outlayer3 = -7;
wire signed [7:0] w15_outlayer3 = 5;
wire signed [7:0] w16_outlayer3 = -28;
wire signed [7:0] w17_outlayer3 = -13;
wire signed [7:0] w18_outlayer3 = -4;
wire signed [7:0] w19_outlayer3 =11;
wire signed [7:0] w20_outlayer3 = -12;


wire signed [7:0] w1_outlayer4 = -58;
wire signed [7:0] w2_outlayer4 = -3;
wire signed [7:0] w3_outlayer4 = -10;
wire signed [7:0] w4_outlayer4 = -16;
wire signed [7:0] w5_outlayer4 = -1;
wire signed [7:0] w6_outlayer4 = 3;
wire signed [7:0] w7_outlayer4 = -26;
wire signed [7:0] w8_outlayer4 = -32;
wire signed [7:0] w9_outlayer4 = 5;
wire signed [7:0] w10_outlayer4 = 1;
wire signed [7:0] w11_outlayer4 = -6;
wire signed [7:0] w12_outlayer4 = -5;
wire signed [7:0] w13_outlayer4 = -61;
wire signed [7:0] w14_outlayer4 = 5;
wire signed [7:0] w15_outlayer4 = -28;
wire signed [7:0] w16_outlayer4 = 1;
wire signed [7:0] w17_outlayer4 = -2;
wire signed [7:0] w18_outlayer4 = 11;
wire signed [7:0] w19_outlayer4 = 9;
wire signed [7:0] w20_outlayer4 = -17;

wire signed [7:0] w1_outlayer5 = -13;
wire signed [7:0] w2_outlayer5 = -40;
wire signed [7:0] w3_outlayer5 = 13;
wire signed [7:0] w4_outlayer5 = -29;
wire signed [7:0] w5_outlayer5 = -32;
wire signed [7:0] w6_outlayer5 = 6;
wire signed [7:0] w7_outlayer5 = -10;
wire signed [7:0] w8_outlayer5 = -1;
wire signed [7:0] w9_outlayer5 = 16;
wire signed [7:0] w10_outlayer5 = -18;
wire signed [7:0] w11_outlayer5 = 0;
wire signed [7:0] w12_outlayer5 = -14;
wire signed [7:0] w13_outlayer5 = -11;
wire signed [7:0] w14_outlayer5 = 4;
wire signed [7:0] w15_outlayer5 = -52;
wire signed [7:0] w16_outlayer5 = -32;
wire signed [7:0] w17_outlayer5 = 10;
wire signed [7:0] w18_outlayer5 = -45;
wire signed [7:0] w19_outlayer5 = -17;
wire signed [7:0] w20_outlayer5 = -56;

wire signed [7:0] w1_outlayer6 = -47;
wire signed [7:0] w2_outlayer6 = -45;
wire signed [7:0] w3_outlayer6 = 3;
wire signed [7:0] w4_outlayer6 = 34;
wire signed [7:0] w5_outlayer6 = 5;
wire signed [7:0] w6_outlayer6 = 3;
wire signed [7:0] w7_outlayer6 = -36;
wire signed [7:0] w8_outlayer6 = -71;
wire signed [7:0] w9_outlayer6 = 5;
wire signed [7:0] w10_outlayer6 = 3;
wire signed [7:0] w11_outlayer6 = -5;
wire signed [7:0] w12_outlayer6 = -16;
wire signed [7:0] w13_outlayer6 = 22;
wire signed [7:0] w14_outlayer6 = 0;
wire signed [7:0] w15_outlayer6 = -24;
wire signed [7:0] w16_outlayer6 = -15;
wire signed [7:0] w17_outlayer6 = 5;
wire signed [7:0] w18_outlayer6 = 9;
wire signed [7:0] w19_outlayer6 = -20;
wire signed [7:0] w20_outlayer6 = 5;

wire signed [7:0] w1_outlayer7 = -24;
wire signed [7:0] w2_outlayer7 = 34;
wire signed [7:0] w3_outlayer7 = -3;
wire signed [7:0] w4_outlayer7 = 3;
wire signed [7:0] w5_outlayer7 = 4;
wire signed [7:0] w6_outlayer7 = 4;
wire signed [7:0] w7_outlayer7 = -38;
wire signed [7:0] w8_outlayer7 = -17;
wire signed [7:0] w9_outlayer7 = 13;
wire signed [7:0] w10_outlayer7 =-3;
wire signed [7:0] w11_outlayer7 = 19;
wire signed [7:0] w12_outlayer7 = -36;
wire signed [7:0] w13_outlayer7 = -12;
wire signed [7:0] w14_outlayer7 = -1;
wire signed [7:0] w15_outlayer7 = 15;
wire signed [7:0] w16_outlayer7 = -63;
wire signed [7:0] w17_outlayer7 = -42;
wire signed [7:0] w18_outlayer7 = -47;
wire signed [7:0] w19_outlayer7 = -29;
wire signed [7:0] w20_outlayer7 = 4;


wire signed [7:0] w1_outlayer8 = -3;
wire signed [7:0] w2_outlayer8 = -27;
wire signed [7:0] w3_outlayer8 = -14;
wire signed [7:0] w4_outlayer8 = -2;
wire signed [7:0] w5_outlayer8 = -35;
wire signed [7:0] w6_outlayer8 = 3;
wire signed [7:0] w7_outlayer8 = -50;
wire signed [7:0] w8_outlayer8 = -1;
wire signed [7:0] w9_outlayer8 = 6;
wire signed [7:0] w10_outlayer8 = 15;
wire signed [7:0] w11_outlayer8 = 0;
wire signed [7:0] w12_outlayer8 = 13;
wire signed [7:0] w13_outlayer8 = -56;
wire signed [7:0] w14_outlayer8 = -19;
wire signed [7:0] w15_outlayer8 = -24;
wire signed [7:0] w16_outlayer8 = -37;
wire signed [7:0] w17_outlayer8 = 5;
wire signed [7:0] w18_outlayer8 = 9;
wire signed [7:0] w19_outlayer8 = -19;
wire signed [7:0] w20_outlayer8 = -58;

wire signed [7:0] w1_outlayer9 = -80;
wire signed [7:0] w2_outlayer9 = -35;
wire signed [7:0] w3_outlayer9 = -4;
wire signed [7:0] w4_outlayer9 = -44;
wire signed [7:0] w5_outlayer9 = -30;
wire signed [7:0] w6_outlayer9 = 6;
wire signed [7:0] w7_outlayer9 = -5;
wire signed [7:0] w8_outlayer9 = -78;
wire signed [7:0] w9_outlayer9 = 1;
wire signed [7:0] w10_outlayer9 = 4;
wire signed [7:0] w11_outlayer9 = -5;
wire signed [7:0] w12_outlayer9 = 6;
wire signed [7:0] w13_outlayer9 = -33;
wire signed [7:0] w14_outlayer9 = 12;
wire signed [7:0] w15_outlayer9 = -50;
wire signed [7:0] w16_outlayer9 = -24;
wire signed [7:0] w17_outlayer9 = -25;
wire signed [7:0] w18_outlayer9 = -18;
wire signed [7:0] w19_outlayer9 = -21;
wire signed [7:0] w20_outlayer9 = 3;


wire signed [7:0] w1_outlayer10 = -16;
wire signed [7:0] w2_outlayer10 = -62;
wire signed [7:0] w3_outlayer10 = -22;
wire signed [7:0] w4_outlayer10 = -22;
wire signed [7:0] w5_outlayer10 = 5;
wire signed [7:0] w6_outlayer10 = 10;
wire signed [7:0] w7_outlayer10 = -31;
wire signed [7:0] w8_outlayer10 = -10;
wire signed [7:0] w9_outlayer10 = -1;
wire signed [7:0] w10_outlayer10 = 2;
wire signed [7:0] w11_outlayer10 = 13;
wire signed [7:0] w12_outlayer10 = -1;
wire signed [7:0] w13_outlayer10 = 16;
wire signed [7:0] w14_outlayer10 = 6;
wire signed [7:0] w15_outlayer10 = -90;
wire signed [7:0] w16_outlayer10 = -15;
wire signed [7:0] w17_outlayer10 = -6;
wire signed [7:0] w18_outlayer10 = -18;
wire signed [7:0] w19_outlayer10 = -35;
wire signed [7:0] w20_outlayer10 = -38;

wire signed [31:0] out_outlayer1;
wire signed [31:0] out_outlayer2;
wire signed [31:0] out_outlayer3;
wire signed [31:0] out_outlayer4;
wire signed [31:0] out_outlayer5;
wire signed [31:0] out_outlayer6;
wire signed [31:0] out_outlayer7;
wire signed [31:0] out_outlayer8;
wire signed [31:0] out_outlayer9;
wire signed [31:0] out_outlayer10;
// end of outlayer

// now we divide/assign the weights bitsteam in 10 parts for each neuron for weights
// ps: i know this method is kind of not effecient, Since we have so many inputs so it cannot be avoided but this one the cleanest of all and it works!  
// solution to this is to send all inputs biases etc. in serial format but then it bottlenecks the whole system
assign weights_inlayer1 = {weights_256[0],weights_256[1],weights_256[2],weights_256[3],weights_256[4],weights_256[5],weights_256[6],weights_256[7],weights_256[8],weights_256[9],weights_256[10],weights_256[11],weights_256[12],weights_256[13],weights_256[14],weights_256[15],weights_256[16],weights_256[17],weights_256[18],weights_256[19],weights_256[20],weights_256[21],weights_256[22],weights_256[23],weights_256[24],weights_256[25],weights_256[26],weights_256[27],weights_256[28],weights_256[29],weights_256[30],weights_256[31],weights_256[32],weights_256[33],weights_256[34],weights_256[35],weights_256[36],weights_256[37],weights_256[38],weights_256[39],weights_256[40],weights_256[41],weights_256[42],weights_256[43],weights_256[44],weights_256[45],weights_256[46],weights_256[47],weights_256[48],weights_256[49],weights_256[50],weights_256[51],weights_256[52],weights_256[53],weights_256[54],weights_256[55],weights_256[56],weights_256[57],weights_256[58],weights_256[59],weights_256[60],weights_256[61],weights_256[62],weights_256[63],weights_256[64],weights_256[65],weights_256[66],weights_256[67],weights_256[68],weights_256[69],weights_256[70],weights_256[71],weights_256[72],weights_256[73],weights_256[74],weights_256[75],weights_256[76],weights_256[77],weights_256[78],weights_256[79],weights_256[80],weights_256[81],weights_256[82],weights_256[83],weights_256[84],weights_256[85],weights_256[86],weights_256[87],weights_256[88],weights_256[89],weights_256[90],weights_256[91],weights_256[92],weights_256[93],weights_256[94],weights_256[95],weights_256[96],weights_256[97],weights_256[98],weights_256[99],weights_256[100],weights_256[101],weights_256[102],weights_256[103],weights_256[104],weights_256[105],weights_256[106],weights_256[107],weights_256[108],weights_256[109],weights_256[110],weights_256[111],weights_256[112],weights_256[113],weights_256[114],weights_256[115],weights_256[116],weights_256[117],weights_256[118],weights_256[119],weights_256[120],weights_256[121],weights_256[122],weights_256[123],weights_256[124],weights_256[125],weights_256[126],weights_256[127],weights_256[128],weights_256[129],weights_256[130],weights_256[131],weights_256[132],weights_256[133],weights_256[134],weights_256[135],weights_256[136],weights_256[137],weights_256[138],weights_256[139],weights_256[140],weights_256[141],weights_256[142],weights_256[143],weights_256[144],weights_256[145],weights_256[146],weights_256[147],weights_256[148],weights_256[149],weights_256[150],weights_256[151],weights_256[152],weights_256[153],weights_256[154],weights_256[155],weights_256[156],weights_256[157],weights_256[158],weights_256[159],weights_256[160],weights_256[161],weights_256[162],weights_256[163],weights_256[164],weights_256[165],weights_256[166],weights_256[167],weights_256[168],weights_256[169],weights_256[170],weights_256[171],weights_256[172],weights_256[173],weights_256[174],weights_256[175],weights_256[176],weights_256[177],weights_256[178],weights_256[179],weights_256[180],weights_256[181],weights_256[182],weights_256[183],weights_256[184],weights_256[185],weights_256[186],weights_256[187],weights_256[188],weights_256[189],weights_256[190],weights_256[191],weights_256[192],weights_256[193],weights_256[194],weights_256[195],weights_256[196],weights_256[197],weights_256[198],weights_256[199],weights_256[200],weights_256[201],weights_256[202],weights_256[203],weights_256[204],weights_256[205],weights_256[206],weights_256[207],weights_256[208],weights_256[209],weights_256[210],weights_256[211],weights_256[212],weights_256[213],weights_256[214],weights_256[215],weights_256[216],weights_256[217],weights_256[218],weights_256[219],weights_256[220],weights_256[221],weights_256[222],weights_256[223],weights_256[224],weights_256[225],weights_256[226],weights_256[227],weights_256[228],weights_256[229],weights_256[230],weights_256[231],weights_256[232],weights_256[233],weights_256[234],weights_256[235],weights_256[236],weights_256[237],weights_256[238],weights_256[239],weights_256[240],weights_256[241],weights_256[242],weights_256[243],weights_256[244],weights_256[245],weights_256[246],weights_256[247],weights_256[248],weights_256[249],weights_256[250],weights_256[251],weights_256[252],weights_256[253],weights_256[254],weights_256[255]};
assign weights_inlayer2 = {weights_256[256],weights_256[257],weights_256[258],weights_256[259],weights_256[260],weights_256[261],weights_256[262],weights_256[263],weights_256[264],weights_256[265],weights_256[266],weights_256[267],weights_256[268],weights_256[269],weights_256[270],weights_256[271],weights_256[272],weights_256[273],weights_256[274],weights_256[275],weights_256[276],weights_256[277],weights_256[278],weights_256[279],weights_256[280],weights_256[281],weights_256[282],weights_256[283],weights_256[284],weights_256[285],weights_256[286],weights_256[287],weights_256[288],weights_256[289],weights_256[290],weights_256[291],weights_256[292],weights_256[293],weights_256[294],weights_256[295],weights_256[296],weights_256[297],weights_256[298],weights_256[299],weights_256[300],weights_256[301],weights_256[302],weights_256[303],weights_256[304],weights_256[305],weights_256[306],weights_256[307],weights_256[308],weights_256[309],weights_256[310],weights_256[311],weights_256[312],weights_256[313],weights_256[314],weights_256[315],weights_256[316],weights_256[317],weights_256[318],weights_256[319],weights_256[320],weights_256[321],weights_256[322],weights_256[323],weights_256[324],weights_256[325],weights_256[326],weights_256[327],weights_256[328],weights_256[329],weights_256[330],weights_256[331],weights_256[332],weights_256[333],weights_256[334],weights_256[335],weights_256[336],weights_256[337],weights_256[338],weights_256[339],weights_256[340],weights_256[341],weights_256[342],weights_256[343],weights_256[344],weights_256[345],weights_256[346],weights_256[347],weights_256[348],weights_256[349],weights_256[350],weights_256[351],weights_256[352],weights_256[353],weights_256[354],weights_256[355],weights_256[356],weights_256[357],weights_256[358],weights_256[359],weights_256[360],weights_256[361],weights_256[362],weights_256[363],weights_256[364],weights_256[365],weights_256[366],weights_256[367],weights_256[368],weights_256[369],weights_256[370],weights_256[371],weights_256[372],weights_256[373],weights_256[374],weights_256[375],weights_256[376],weights_256[377],weights_256[378],weights_256[379],weights_256[380],weights_256[381],weights_256[382],weights_256[383],weights_256[384],weights_256[385],weights_256[386],weights_256[387],weights_256[388],weights_256[389],weights_256[390],weights_256[391],weights_256[392],weights_256[393],weights_256[394],weights_256[395],weights_256[396],weights_256[397],weights_256[398],weights_256[399],weights_256[400],weights_256[401],weights_256[402],weights_256[403],weights_256[404],weights_256[405],weights_256[406],weights_256[407],weights_256[408],weights_256[409],weights_256[410],weights_256[411],weights_256[412],weights_256[413],weights_256[414],weights_256[415],weights_256[416],weights_256[417],weights_256[418],weights_256[419],weights_256[420],weights_256[421],weights_256[422],weights_256[423],weights_256[424],weights_256[425],weights_256[426],weights_256[427],weights_256[428],weights_256[429],weights_256[430],weights_256[431],weights_256[432],weights_256[433],weights_256[434],weights_256[435],weights_256[436],weights_256[437],weights_256[438],weights_256[439],weights_256[440],weights_256[441],weights_256[442],weights_256[443],weights_256[444],weights_256[445],weights_256[446],weights_256[447],weights_256[448],weights_256[449],weights_256[450],weights_256[451],weights_256[452],weights_256[453],weights_256[454],weights_256[455],weights_256[456],weights_256[457],weights_256[458],weights_256[459],weights_256[460],weights_256[461],weights_256[462],weights_256[463],weights_256[464],weights_256[465],weights_256[466],weights_256[467],weights_256[468],weights_256[469],weights_256[470],weights_256[471],weights_256[472],weights_256[473],weights_256[474],weights_256[475],weights_256[476],weights_256[477],weights_256[478],weights_256[479],weights_256[480],weights_256[481],weights_256[482],weights_256[483],weights_256[484],weights_256[485],weights_256[486],weights_256[487],weights_256[488],weights_256[489],weights_256[490],weights_256[491],weights_256[492],weights_256[493],weights_256[494],weights_256[495],weights_256[496],weights_256[497],weights_256[498],weights_256[499],weights_256[500],weights_256[501],weights_256[502],weights_256[503],weights_256[504],weights_256[505],weights_256[506],weights_256[507],weights_256[508],weights_256[509],weights_256[510],weights_256[511]};
assign weights_inlayer3 = {weights_256[512],weights_256[513],weights_256[514],weights_256[515],weights_256[516],weights_256[517],weights_256[518],weights_256[519],weights_256[520],weights_256[521],weights_256[522],weights_256[523],weights_256[524],weights_256[525],weights_256[526],weights_256[527],weights_256[528],weights_256[529],weights_256[530],weights_256[531],weights_256[532],weights_256[533],weights_256[534],weights_256[535],weights_256[536],weights_256[537],weights_256[538],weights_256[539],weights_256[540],weights_256[541],weights_256[542],weights_256[543],weights_256[544],weights_256[545],weights_256[546],weights_256[547],weights_256[548],weights_256[549],weights_256[550],weights_256[551],weights_256[552],weights_256[553],weights_256[554],weights_256[555],weights_256[556],weights_256[557],weights_256[558],weights_256[559],weights_256[560],weights_256[561],weights_256[562],weights_256[563],weights_256[564],weights_256[565],weights_256[566],weights_256[567],weights_256[568],weights_256[569],weights_256[570],weights_256[571],weights_256[572],weights_256[573],weights_256[574],weights_256[575],weights_256[576],weights_256[577],weights_256[578],weights_256[579],weights_256[580],weights_256[581],weights_256[582],weights_256[583],weights_256[584],weights_256[585],weights_256[586],weights_256[587],weights_256[588],weights_256[589],weights_256[590],weights_256[591],weights_256[592],weights_256[593],weights_256[594],weights_256[595],weights_256[596],weights_256[597],weights_256[598],weights_256[599],weights_256[600],weights_256[601],weights_256[602],weights_256[603],weights_256[604],weights_256[605],weights_256[606],weights_256[607],weights_256[608],weights_256[609],weights_256[610],weights_256[611],weights_256[612],weights_256[613],weights_256[614],weights_256[615],weights_256[616],weights_256[617],weights_256[618],weights_256[619],weights_256[620],weights_256[621],weights_256[622],weights_256[623],weights_256[624],weights_256[625],weights_256[626],weights_256[627],weights_256[628],weights_256[629],weights_256[630],weights_256[631],weights_256[632],weights_256[633],weights_256[634],weights_256[635],weights_256[636],weights_256[637],weights_256[638],weights_256[639],weights_256[640],weights_256[641],weights_256[642],weights_256[643],weights_256[644],weights_256[645],weights_256[646],weights_256[647],weights_256[648],weights_256[649],weights_256[650],weights_256[651],weights_256[652],weights_256[653],weights_256[654],weights_256[655],weights_256[656],weights_256[657],weights_256[658],weights_256[659],weights_256[660],weights_256[661],weights_256[662],weights_256[663],weights_256[664],weights_256[665],weights_256[666],weights_256[667],weights_256[668],weights_256[669],weights_256[670],weights_256[671],weights_256[672],weights_256[673],weights_256[674],weights_256[675],weights_256[676],weights_256[677],weights_256[678],weights_256[679],weights_256[680],weights_256[681],weights_256[682],weights_256[683],weights_256[684],weights_256[685],weights_256[686],weights_256[687],weights_256[688],weights_256[689],weights_256[690],weights_256[691],weights_256[692],weights_256[693],weights_256[694],weights_256[695],weights_256[696],weights_256[697],weights_256[698],weights_256[699],weights_256[700],weights_256[701],weights_256[702],weights_256[703],weights_256[704],weights_256[705],weights_256[706],weights_256[707],weights_256[708],weights_256[709],weights_256[710],weights_256[711],weights_256[712],weights_256[713],weights_256[714],weights_256[715],weights_256[716],weights_256[717],weights_256[718],weights_256[719],weights_256[720],weights_256[721],weights_256[722],weights_256[723],weights_256[724],weights_256[725],weights_256[726],weights_256[727],weights_256[728],weights_256[729],weights_256[730],weights_256[731],weights_256[732],weights_256[733],weights_256[734],weights_256[735],weights_256[736],weights_256[737],weights_256[738],weights_256[739],weights_256[740],weights_256[741],weights_256[742],weights_256[743],weights_256[744],weights_256[745],weights_256[746],weights_256[747],weights_256[748],weights_256[749],weights_256[750],weights_256[751],weights_256[752],weights_256[753],weights_256[754],weights_256[755],weights_256[756],weights_256[757],weights_256[758],weights_256[759],weights_256[760],weights_256[761],weights_256[762],weights_256[763],weights_256[764],weights_256[765],weights_256[766],weights_256[767]};
assign weights_inlayer4 = {weights_256[768],weights_256[769],weights_256[770],weights_256[771],weights_256[772],weights_256[773],weights_256[774],weights_256[775],weights_256[776],weights_256[777],weights_256[778],weights_256[779],weights_256[780],weights_256[781],weights_256[782],weights_256[783],weights_256[784],weights_256[785],weights_256[786],weights_256[787],weights_256[788],weights_256[789],weights_256[790],weights_256[791],weights_256[792],weights_256[793],weights_256[794],weights_256[795],weights_256[796],weights_256[797],weights_256[798],weights_256[799],weights_256[800],weights_256[801],weights_256[802],weights_256[803],weights_256[804],weights_256[805],weights_256[806],weights_256[807],weights_256[808],weights_256[809],weights_256[810],weights_256[811],weights_256[812],weights_256[813],weights_256[814],weights_256[815],weights_256[816],weights_256[817],weights_256[818],weights_256[819],weights_256[820],weights_256[821],weights_256[822],weights_256[823],weights_256[824],weights_256[825],weights_256[826],weights_256[827],weights_256[828],weights_256[829],weights_256[830],weights_256[831],weights_256[832],weights_256[833],weights_256[834],weights_256[835],weights_256[836],weights_256[837],weights_256[838],weights_256[839],weights_256[840],weights_256[841],weights_256[842],weights_256[843],weights_256[844],weights_256[845],weights_256[846],weights_256[847],weights_256[848],weights_256[849],weights_256[850],weights_256[851],weights_256[852],weights_256[853],weights_256[854],weights_256[855],weights_256[856],weights_256[857],weights_256[858],weights_256[859],weights_256[860],weights_256[861],weights_256[862],weights_256[863],weights_256[864],weights_256[865],weights_256[866],weights_256[867],weights_256[868],weights_256[869],weights_256[870],weights_256[871],weights_256[872],weights_256[873],weights_256[874],weights_256[875],weights_256[876],weights_256[877],weights_256[878],weights_256[879],weights_256[880],weights_256[881],weights_256[882],weights_256[883],weights_256[884],weights_256[885],weights_256[886],weights_256[887],weights_256[888],weights_256[889],weights_256[890],weights_256[891],weights_256[892],weights_256[893],weights_256[894],weights_256[895],weights_256[896],weights_256[897],weights_256[898],weights_256[899],weights_256[900],weights_256[901],weights_256[902],weights_256[903],weights_256[904],weights_256[905],weights_256[906],weights_256[907],weights_256[908],weights_256[909],weights_256[910],weights_256[911],weights_256[912],weights_256[913],weights_256[914],weights_256[915],weights_256[916],weights_256[917],weights_256[918],weights_256[919],weights_256[920],weights_256[921],weights_256[922],weights_256[923],weights_256[924],weights_256[925],weights_256[926],weights_256[927],weights_256[928],weights_256[929],weights_256[930],weights_256[931],weights_256[932],weights_256[933],weights_256[934],weights_256[935],weights_256[936],weights_256[937],weights_256[938],weights_256[939],weights_256[940],weights_256[941],weights_256[942],weights_256[943],weights_256[944],weights_256[945],weights_256[946],weights_256[947],weights_256[948],weights_256[949],weights_256[950],weights_256[951],weights_256[952],weights_256[953],weights_256[954],weights_256[955],weights_256[956],weights_256[957],weights_256[958],weights_256[959],weights_256[960],weights_256[961],weights_256[962],weights_256[963],weights_256[964],weights_256[965],weights_256[966],weights_256[967],weights_256[968],weights_256[969],weights_256[970],weights_256[971],weights_256[972],weights_256[973],weights_256[974],weights_256[975],weights_256[976],weights_256[977],weights_256[978],weights_256[979],weights_256[980],weights_256[981],weights_256[982],weights_256[983],weights_256[984],weights_256[985],weights_256[986],weights_256[987],weights_256[988],weights_256[989],weights_256[990],weights_256[991],weights_256[992],weights_256[993],weights_256[994],weights_256[995],weights_256[996],weights_256[997],weights_256[998],weights_256[999],weights_256[1000],weights_256[1001],weights_256[1002],weights_256[1003],weights_256[1004],weights_256[1005],weights_256[1006],weights_256[1007],weights_256[1008],weights_256[1009],weights_256[1010],weights_256[1011],weights_256[1012],weights_256[1013],weights_256[1014],weights_256[1015],weights_256[1016],weights_256[1017],weights_256[1018],weights_256[1019],weights_256[1020],weights_256[1021],weights_256[1022],weights_256[1023]};
assign weights_inlayer5 = {weights_256[1024],weights_256[1025],weights_256[1026],weights_256[1027],weights_256[1028],weights_256[1029],weights_256[1030],weights_256[1031],weights_256[1032],weights_256[1033],weights_256[1034],weights_256[1035],weights_256[1036],weights_256[1037],weights_256[1038],weights_256[1039],weights_256[1040],weights_256[1041],weights_256[1042],weights_256[1043],weights_256[1044],weights_256[1045],weights_256[1046],weights_256[1047],weights_256[1048],weights_256[1049],weights_256[1050],weights_256[1051],weights_256[1052],weights_256[1053],weights_256[1054],weights_256[1055],weights_256[1056],weights_256[1057],weights_256[1058],weights_256[1059],weights_256[1060],weights_256[1061],weights_256[1062],weights_256[1063],weights_256[1064],weights_256[1065],weights_256[1066],weights_256[1067],weights_256[1068],weights_256[1069],weights_256[1070],weights_256[1071],weights_256[1072],weights_256[1073],weights_256[1074],weights_256[1075],weights_256[1076],weights_256[1077],weights_256[1078],weights_256[1079],weights_256[1080],weights_256[1081],weights_256[1082],weights_256[1083],weights_256[1084],weights_256[1085],weights_256[1086],weights_256[1087],weights_256[1088],weights_256[1089],weights_256[1090],weights_256[1091],weights_256[1092],weights_256[1093],weights_256[1094],weights_256[1095],weights_256[1096],weights_256[1097],weights_256[1098],weights_256[1099],weights_256[1100],weights_256[1101],weights_256[1102],weights_256[1103],weights_256[1104],weights_256[1105],weights_256[1106],weights_256[1107],weights_256[1108],weights_256[1109],weights_256[1110],weights_256[1111],weights_256[1112],weights_256[1113],weights_256[1114],weights_256[1115],weights_256[1116],weights_256[1117],weights_256[1118],weights_256[1119],weights_256[1120],weights_256[1121],weights_256[1122],weights_256[1123],weights_256[1124],weights_256[1125],weights_256[1126],weights_256[1127],weights_256[1128],weights_256[1129],weights_256[1130],weights_256[1131],weights_256[1132],weights_256[1133],weights_256[1134],weights_256[1135],weights_256[1136],weights_256[1137],weights_256[1138],weights_256[1139],weights_256[1140],weights_256[1141],weights_256[1142],weights_256[1143],weights_256[1144],weights_256[1145],weights_256[1146],weights_256[1147],weights_256[1148],weights_256[1149],weights_256[1150],weights_256[1151],weights_256[1152],weights_256[1153],weights_256[1154],weights_256[1155],weights_256[1156],weights_256[1157],weights_256[1158],weights_256[1159],weights_256[1160],weights_256[1161],weights_256[1162],weights_256[1163],weights_256[1164],weights_256[1165],weights_256[1166],weights_256[1167],weights_256[1168],weights_256[1169],weights_256[1170],weights_256[1171],weights_256[1172],weights_256[1173],weights_256[1174],weights_256[1175],weights_256[1176],weights_256[1177],weights_256[1178],weights_256[1179],weights_256[1180],weights_256[1181],weights_256[1182],weights_256[1183],weights_256[1184],weights_256[1185],weights_256[1186],weights_256[1187],weights_256[1188],weights_256[1189],weights_256[1190],weights_256[1191],weights_256[1192],weights_256[1193],weights_256[1194],weights_256[1195],weights_256[1196],weights_256[1197],weights_256[1198],weights_256[1199],weights_256[1200],weights_256[1201],weights_256[1202],weights_256[1203],weights_256[1204],weights_256[1205],weights_256[1206],weights_256[1207],weights_256[1208],weights_256[1209],weights_256[1210],weights_256[1211],weights_256[1212],weights_256[1213],weights_256[1214],weights_256[1215],weights_256[1216],weights_256[1217],weights_256[1218],weights_256[1219],weights_256[1220],weights_256[1221],weights_256[1222],weights_256[1223],weights_256[1224],weights_256[1225],weights_256[1226],weights_256[1227],weights_256[1228],weights_256[1229],weights_256[1230],weights_256[1231],weights_256[1232],weights_256[1233],weights_256[1234],weights_256[1235],weights_256[1236],weights_256[1237],weights_256[1238],weights_256[1239],weights_256[1240],weights_256[1241],weights_256[1242],weights_256[1243],weights_256[1244],weights_256[1245],weights_256[1246],weights_256[1247],weights_256[1248],weights_256[1249],weights_256[1250],weights_256[1251],weights_256[1252],weights_256[1253],weights_256[1254],weights_256[1255],weights_256[1256],weights_256[1257],weights_256[1258],weights_256[1259],weights_256[1260],weights_256[1261],weights_256[1262],weights_256[1263],weights_256[1264],weights_256[1265],weights_256[1266],weights_256[1267],weights_256[1268],weights_256[1269],weights_256[1270],weights_256[1271],weights_256[1272],weights_256[1273],weights_256[1274],weights_256[1275],weights_256[1276],weights_256[1277],weights_256[1278],weights_256[1279]};
assign weights_inlayer6 = {weights_256[1280],weights_256[1281],weights_256[1282],weights_256[1283],weights_256[1284],weights_256[1285],weights_256[1286],weights_256[1287],weights_256[1288],weights_256[1289],weights_256[1290],weights_256[1291],weights_256[1292],weights_256[1293],weights_256[1294],weights_256[1295],weights_256[1296],weights_256[1297],weights_256[1298],weights_256[1299],weights_256[1300],weights_256[1301],weights_256[1302],weights_256[1303],weights_256[1304],weights_256[1305],weights_256[1306],weights_256[1307],weights_256[1308],weights_256[1309],weights_256[1310],weights_256[1311],weights_256[1312],weights_256[1313],weights_256[1314],weights_256[1315],weights_256[1316],weights_256[1317],weights_256[1318],weights_256[1319],weights_256[1320],weights_256[1321],weights_256[1322],weights_256[1323],weights_256[1324],weights_256[1325],weights_256[1326],weights_256[1327],weights_256[1328],weights_256[1329],weights_256[1330],weights_256[1331],weights_256[1332],weights_256[1333],weights_256[1334],weights_256[1335],weights_256[1336],weights_256[1337],weights_256[1338],weights_256[1339],weights_256[1340],weights_256[1341],weights_256[1342],weights_256[1343],weights_256[1344],weights_256[1345],weights_256[1346],weights_256[1347],weights_256[1348],weights_256[1349],weights_256[1350],weights_256[1351],weights_256[1352],weights_256[1353],weights_256[1354],weights_256[1355],weights_256[1356],weights_256[1357],weights_256[1358],weights_256[1359],weights_256[1360],weights_256[1361],weights_256[1362],weights_256[1363],weights_256[1364],weights_256[1365],weights_256[1366],weights_256[1367],weights_256[1368],weights_256[1369],weights_256[1370],weights_256[1371],weights_256[1372],weights_256[1373],weights_256[1374],weights_256[1375],weights_256[1376],weights_256[1377],weights_256[1378],weights_256[1379],weights_256[1380],weights_256[1381],weights_256[1382],weights_256[1383],weights_256[1384],weights_256[1385],weights_256[1386],weights_256[1387],weights_256[1388],weights_256[1389],weights_256[1390],weights_256[1391],weights_256[1392],weights_256[1393],weights_256[1394],weights_256[1395],weights_256[1396],weights_256[1397],weights_256[1398],weights_256[1399],weights_256[1400],weights_256[1401],weights_256[1402],weights_256[1403],weights_256[1404],weights_256[1405],weights_256[1406],weights_256[1407],weights_256[1408],weights_256[1409],weights_256[1410],weights_256[1411],weights_256[1412],weights_256[1413],weights_256[1414],weights_256[1415],weights_256[1416],weights_256[1417],weights_256[1418],weights_256[1419],weights_256[1420],weights_256[1421],weights_256[1422],weights_256[1423],weights_256[1424],weights_256[1425],weights_256[1426],weights_256[1427],weights_256[1428],weights_256[1429],weights_256[1430],weights_256[1431],weights_256[1432],weights_256[1433],weights_256[1434],weights_256[1435],weights_256[1436],weights_256[1437],weights_256[1438],weights_256[1439],weights_256[1440],weights_256[1441],weights_256[1442],weights_256[1443],weights_256[1444],weights_256[1445],weights_256[1446],weights_256[1447],weights_256[1448],weights_256[1449],weights_256[1450],weights_256[1451],weights_256[1452],weights_256[1453],weights_256[1454],weights_256[1455],weights_256[1456],weights_256[1457],weights_256[1458],weights_256[1459],weights_256[1460],weights_256[1461],weights_256[1462],weights_256[1463],weights_256[1464],weights_256[1465],weights_256[1466],weights_256[1467],weights_256[1468],weights_256[1469],weights_256[1470],weights_256[1471],weights_256[1472],weights_256[1473],weights_256[1474],weights_256[1475],weights_256[1476],weights_256[1477],weights_256[1478],weights_256[1479],weights_256[1480],weights_256[1481],weights_256[1482],weights_256[1483],weights_256[1484],weights_256[1485],weights_256[1486],weights_256[1487],weights_256[1488],weights_256[1489],weights_256[1490],weights_256[1491],weights_256[1492],weights_256[1493],weights_256[1494],weights_256[1495],weights_256[1496],weights_256[1497],weights_256[1498],weights_256[1499],weights_256[1500],weights_256[1501],weights_256[1502],weights_256[1503],weights_256[1504],weights_256[1505],weights_256[1506],weights_256[1507],weights_256[1508],weights_256[1509],weights_256[1510],weights_256[1511],weights_256[1512],weights_256[1513],weights_256[1514],weights_256[1515],weights_256[1516],weights_256[1517],weights_256[1518],weights_256[1519],weights_256[1520],weights_256[1521],weights_256[1522],weights_256[1523],weights_256[1524],weights_256[1525],weights_256[1526],weights_256[1527],weights_256[1528],weights_256[1529],weights_256[1530],weights_256[1531],weights_256[1532],weights_256[1533],weights_256[1534],weights_256[1535]};
assign weights_inlayer7 = {weights_256[1536],weights_256[1537],weights_256[1538],weights_256[1539],weights_256[1540],weights_256[1541],weights_256[1542],weights_256[1543],weights_256[1544],weights_256[1545],weights_256[1546],weights_256[1547],weights_256[1548],weights_256[1549],weights_256[1550],weights_256[1551],weights_256[1552],weights_256[1553],weights_256[1554],weights_256[1555],weights_256[1556],weights_256[1557],weights_256[1558],weights_256[1559],weights_256[1560],weights_256[1561],weights_256[1562],weights_256[1563],weights_256[1564],weights_256[1565],weights_256[1566],weights_256[1567],weights_256[1568],weights_256[1569],weights_256[1570],weights_256[1571],weights_256[1572],weights_256[1573],weights_256[1574],weights_256[1575],weights_256[1576],weights_256[1577],weights_256[1578],weights_256[1579],weights_256[1580],weights_256[1581],weights_256[1582],weights_256[1583],weights_256[1584],weights_256[1585],weights_256[1586],weights_256[1587],weights_256[1588],weights_256[1589],weights_256[1590],weights_256[1591],weights_256[1592],weights_256[1593],weights_256[1594],weights_256[1595],weights_256[1596],weights_256[1597],weights_256[1598],weights_256[1599],weights_256[1600],weights_256[1601],weights_256[1602],weights_256[1603],weights_256[1604],weights_256[1605],weights_256[1606],weights_256[1607],weights_256[1608],weights_256[1609],weights_256[1610],weights_256[1611],weights_256[1612],weights_256[1613],weights_256[1614],weights_256[1615],weights_256[1616],weights_256[1617],weights_256[1618],weights_256[1619],weights_256[1620],weights_256[1621],weights_256[1622],weights_256[1623],weights_256[1624],weights_256[1625],weights_256[1626],weights_256[1627],weights_256[1628],weights_256[1629],weights_256[1630],weights_256[1631],weights_256[1632],weights_256[1633],weights_256[1634],weights_256[1635],weights_256[1636],weights_256[1637],weights_256[1638],weights_256[1639],weights_256[1640],weights_256[1641],weights_256[1642],weights_256[1643],weights_256[1644],weights_256[1645],weights_256[1646],weights_256[1647],weights_256[1648],weights_256[1649],weights_256[1650],weights_256[1651],weights_256[1652],weights_256[1653],weights_256[1654],weights_256[1655],weights_256[1656],weights_256[1657],weights_256[1658],weights_256[1659],weights_256[1660],weights_256[1661],weights_256[1662],weights_256[1663],weights_256[1664],weights_256[1665],weights_256[1666],weights_256[1667],weights_256[1668],weights_256[1669],weights_256[1670],weights_256[1671],weights_256[1672],weights_256[1673],weights_256[1674],weights_256[1675],weights_256[1676],weights_256[1677],weights_256[1678],weights_256[1679],weights_256[1680],weights_256[1681],weights_256[1682],weights_256[1683],weights_256[1684],weights_256[1685],weights_256[1686],weights_256[1687],weights_256[1688],weights_256[1689],weights_256[1690],weights_256[1691],weights_256[1692],weights_256[1693],weights_256[1694],weights_256[1695],weights_256[1696],weights_256[1697],weights_256[1698],weights_256[1699],weights_256[1700],weights_256[1701],weights_256[1702],weights_256[1703],weights_256[1704],weights_256[1705],weights_256[1706],weights_256[1707],weights_256[1708],weights_256[1709],weights_256[1710],weights_256[1711],weights_256[1712],weights_256[1713],weights_256[1714],weights_256[1715],weights_256[1716],weights_256[1717],weights_256[1718],weights_256[1719],weights_256[1720],weights_256[1721],weights_256[1722],weights_256[1723],weights_256[1724],weights_256[1725],weights_256[1726],weights_256[1727],weights_256[1728],weights_256[1729],weights_256[1730],weights_256[1731],weights_256[1732],weights_256[1733],weights_256[1734],weights_256[1735],weights_256[1736],weights_256[1737],weights_256[1738],weights_256[1739],weights_256[1740],weights_256[1741],weights_256[1742],weights_256[1743],weights_256[1744],weights_256[1745],weights_256[1746],weights_256[1747],weights_256[1748],weights_256[1749],weights_256[1750],weights_256[1751],weights_256[1752],weights_256[1753],weights_256[1754],weights_256[1755],weights_256[1756],weights_256[1757],weights_256[1758],weights_256[1759],weights_256[1760],weights_256[1761],weights_256[1762],weights_256[1763],weights_256[1764],weights_256[1765],weights_256[1766],weights_256[1767],weights_256[1768],weights_256[1769],weights_256[1770],weights_256[1771],weights_256[1772],weights_256[1773],weights_256[1774],weights_256[1775],weights_256[1776],weights_256[1777],weights_256[1778],weights_256[1779],weights_256[1780],weights_256[1781],weights_256[1782],weights_256[1783],weights_256[1784],weights_256[1785],weights_256[1786],weights_256[1787],weights_256[1788],weights_256[1789],weights_256[1790],weights_256[1791]};
assign weights_inlayer8 = {weights_256[1792],weights_256[1793],weights_256[1794],weights_256[1795],weights_256[1796],weights_256[1797],weights_256[1798],weights_256[1799],weights_256[1800],weights_256[1801],weights_256[1802],weights_256[1803],weights_256[1804],weights_256[1805],weights_256[1806],weights_256[1807],weights_256[1808],weights_256[1809],weights_256[1810],weights_256[1811],weights_256[1812],weights_256[1813],weights_256[1814],weights_256[1815],weights_256[1816],weights_256[1817],weights_256[1818],weights_256[1819],weights_256[1820],weights_256[1821],weights_256[1822],weights_256[1823],weights_256[1824],weights_256[1825],weights_256[1826],weights_256[1827],weights_256[1828],weights_256[1829],weights_256[1830],weights_256[1831],weights_256[1832],weights_256[1833],weights_256[1834],weights_256[1835],weights_256[1836],weights_256[1837],weights_256[1838],weights_256[1839],weights_256[1840],weights_256[1841],weights_256[1842],weights_256[1843],weights_256[1844],weights_256[1845],weights_256[1846],weights_256[1847],weights_256[1848],weights_256[1849],weights_256[1850],weights_256[1851],weights_256[1852],weights_256[1853],weights_256[1854],weights_256[1855],weights_256[1856],weights_256[1857],weights_256[1858],weights_256[1859],weights_256[1860],weights_256[1861],weights_256[1862],weights_256[1863],weights_256[1864],weights_256[1865],weights_256[1866],weights_256[1867],weights_256[1868],weights_256[1869],weights_256[1870],weights_256[1871],weights_256[1872],weights_256[1873],weights_256[1874],weights_256[1875],weights_256[1876],weights_256[1877],weights_256[1878],weights_256[1879],weights_256[1880],weights_256[1881],weights_256[1882],weights_256[1883],weights_256[1884],weights_256[1885],weights_256[1886],weights_256[1887],weights_256[1888],weights_256[1889],weights_256[1890],weights_256[1891],weights_256[1892],weights_256[1893],weights_256[1894],weights_256[1895],weights_256[1896],weights_256[1897],weights_256[1898],weights_256[1899],weights_256[1900],weights_256[1901],weights_256[1902],weights_256[1903],weights_256[1904],weights_256[1905],weights_256[1906],weights_256[1907],weights_256[1908],weights_256[1909],weights_256[1910],weights_256[1911],weights_256[1912],weights_256[1913],weights_256[1914],weights_256[1915],weights_256[1916],weights_256[1917],weights_256[1918],weights_256[1919],weights_256[1920],weights_256[1921],weights_256[1922],weights_256[1923],weights_256[1924],weights_256[1925],weights_256[1926],weights_256[1927],weights_256[1928],weights_256[1929],weights_256[1930],weights_256[1931],weights_256[1932],weights_256[1933],weights_256[1934],weights_256[1935],weights_256[1936],weights_256[1937],weights_256[1938],weights_256[1939],weights_256[1940],weights_256[1941],weights_256[1942],weights_256[1943],weights_256[1944],weights_256[1945],weights_256[1946],weights_256[1947],weights_256[1948],weights_256[1949],weights_256[1950],weights_256[1951],weights_256[1952],weights_256[1953],weights_256[1954],weights_256[1955],weights_256[1956],weights_256[1957],weights_256[1958],weights_256[1959],weights_256[1960],weights_256[1961],weights_256[1962],weights_256[1963],weights_256[1964],weights_256[1965],weights_256[1966],weights_256[1967],weights_256[1968],weights_256[1969],weights_256[1970],weights_256[1971],weights_256[1972],weights_256[1973],weights_256[1974],weights_256[1975],weights_256[1976],weights_256[1977],weights_256[1978],weights_256[1979],weights_256[1980],weights_256[1981],weights_256[1982],weights_256[1983],weights_256[1984],weights_256[1985],weights_256[1986],weights_256[1987],weights_256[1988],weights_256[1989],weights_256[1990],weights_256[1991],weights_256[1992],weights_256[1993],weights_256[1994],weights_256[1995],weights_256[1996],weights_256[1997],weights_256[1998],weights_256[1999],weights_256[2000],weights_256[2001],weights_256[2002],weights_256[2003],weights_256[2004],weights_256[2005],weights_256[2006],weights_256[2007],weights_256[2008],weights_256[2009],weights_256[2010],weights_256[2011],weights_256[2012],weights_256[2013],weights_256[2014],weights_256[2015],weights_256[2016],weights_256[2017],weights_256[2018],weights_256[2019],weights_256[2020],weights_256[2021],weights_256[2022],weights_256[2023],weights_256[2024],weights_256[2025],weights_256[2026],weights_256[2027],weights_256[2028],weights_256[2029],weights_256[2030],weights_256[2031],weights_256[2032],weights_256[2033],weights_256[2034],weights_256[2035],weights_256[2036],weights_256[2037],weights_256[2038],weights_256[2039],weights_256[2040],weights_256[2041],weights_256[2042],weights_256[2043],weights_256[2044],weights_256[2045],weights_256[2046],weights_256[2047]};
assign weights_inlayer9 = {weights_256[2048],weights_256[2049],weights_256[2050],weights_256[2051],weights_256[2052],weights_256[2053],weights_256[2054],weights_256[2055],weights_256[2056],weights_256[2057],weights_256[2058],weights_256[2059],weights_256[2060],weights_256[2061],weights_256[2062],weights_256[2063],weights_256[2064],weights_256[2065],weights_256[2066],weights_256[2067],weights_256[2068],weights_256[2069],weights_256[2070],weights_256[2071],weights_256[2072],weights_256[2073],weights_256[2074],weights_256[2075],weights_256[2076],weights_256[2077],weights_256[2078],weights_256[2079],weights_256[2080],weights_256[2081],weights_256[2082],weights_256[2083],weights_256[2084],weights_256[2085],weights_256[2086],weights_256[2087],weights_256[2088],weights_256[2089],weights_256[2090],weights_256[2091],weights_256[2092],weights_256[2093],weights_256[2094],weights_256[2095],weights_256[2096],weights_256[2097],weights_256[2098],weights_256[2099],weights_256[2100],weights_256[2101],weights_256[2102],weights_256[2103],weights_256[2104],weights_256[2105],weights_256[2106],weights_256[2107],weights_256[2108],weights_256[2109],weights_256[2110],weights_256[2111],weights_256[2112],weights_256[2113],weights_256[2114],weights_256[2115],weights_256[2116],weights_256[2117],weights_256[2118],weights_256[2119],weights_256[2120],weights_256[2121],weights_256[2122],weights_256[2123],weights_256[2124],weights_256[2125],weights_256[2126],weights_256[2127],weights_256[2128],weights_256[2129],weights_256[2130],weights_256[2131],weights_256[2132],weights_256[2133],weights_256[2134],weights_256[2135],weights_256[2136],weights_256[2137],weights_256[2138],weights_256[2139],weights_256[2140],weights_256[2141],weights_256[2142],weights_256[2143],weights_256[2144],weights_256[2145],weights_256[2146],weights_256[2147],weights_256[2148],weights_256[2149],weights_256[2150],weights_256[2151],weights_256[2152],weights_256[2153],weights_256[2154],weights_256[2155],weights_256[2156],weights_256[2157],weights_256[2158],weights_256[2159],weights_256[2160],weights_256[2161],weights_256[2162],weights_256[2163],weights_256[2164],weights_256[2165],weights_256[2166],weights_256[2167],weights_256[2168],weights_256[2169],weights_256[2170],weights_256[2171],weights_256[2172],weights_256[2173],weights_256[2174],weights_256[2175],weights_256[2176],weights_256[2177],weights_256[2178],weights_256[2179],weights_256[2180],weights_256[2181],weights_256[2182],weights_256[2183],weights_256[2184],weights_256[2185],weights_256[2186],weights_256[2187],weights_256[2188],weights_256[2189],weights_256[2190],weights_256[2191],weights_256[2192],weights_256[2193],weights_256[2194],weights_256[2195],weights_256[2196],weights_256[2197],weights_256[2198],weights_256[2199],weights_256[2200],weights_256[2201],weights_256[2202],weights_256[2203],weights_256[2204],weights_256[2205],weights_256[2206],weights_256[2207],weights_256[2208],weights_256[2209],weights_256[2210],weights_256[2211],weights_256[2212],weights_256[2213],weights_256[2214],weights_256[2215],weights_256[2216],weights_256[2217],weights_256[2218],weights_256[2219],weights_256[2220],weights_256[2221],weights_256[2222],weights_256[2223],weights_256[2224],weights_256[2225],weights_256[2226],weights_256[2227],weights_256[2228],weights_256[2229],weights_256[2230],weights_256[2231],weights_256[2232],weights_256[2233],weights_256[2234],weights_256[2235],weights_256[2236],weights_256[2237],weights_256[2238],weights_256[2239],weights_256[2240],weights_256[2241],weights_256[2242],weights_256[2243],weights_256[2244],weights_256[2245],weights_256[2246],weights_256[2247],weights_256[2248],weights_256[2249],weights_256[2250],weights_256[2251],weights_256[2252],weights_256[2253],weights_256[2254],weights_256[2255],weights_256[2256],weights_256[2257],weights_256[2258],weights_256[2259],weights_256[2260],weights_256[2261],weights_256[2262],weights_256[2263],weights_256[2264],weights_256[2265],weights_256[2266],weights_256[2267],weights_256[2268],weights_256[2269],weights_256[2270],weights_256[2271],weights_256[2272],weights_256[2273],weights_256[2274],weights_256[2275],weights_256[2276],weights_256[2277],weights_256[2278],weights_256[2279],weights_256[2280],weights_256[2281],weights_256[2282],weights_256[2283],weights_256[2284],weights_256[2285],weights_256[2286],weights_256[2287],weights_256[2288],weights_256[2289],weights_256[2290],weights_256[2291],weights_256[2292],weights_256[2293],weights_256[2294],weights_256[2295],weights_256[2296],weights_256[2297],weights_256[2298],weights_256[2299],weights_256[2300],weights_256[2301],weights_256[2302],weights_256[2303]};
assign weights_inlayer10 = {weights_256[2304],weights_256[2305],weights_256[2306],weights_256[2307],weights_256[2308],weights_256[2309],weights_256[2310],weights_256[2311],weights_256[2312],weights_256[2313],weights_256[2314],weights_256[2315],weights_256[2316],weights_256[2317],weights_256[2318],weights_256[2319],weights_256[2320],weights_256[2321],weights_256[2322],weights_256[2323],weights_256[2324],weights_256[2325],weights_256[2326],weights_256[2327],weights_256[2328],weights_256[2329],weights_256[2330],weights_256[2331],weights_256[2332],weights_256[2333],weights_256[2334],weights_256[2335],weights_256[2336],weights_256[2337],weights_256[2338],weights_256[2339],weights_256[2340],weights_256[2341],weights_256[2342],weights_256[2343],weights_256[2344],weights_256[2345],weights_256[2346],weights_256[2347],weights_256[2348],weights_256[2349],weights_256[2350],weights_256[2351],weights_256[2352],weights_256[2353],weights_256[2354],weights_256[2355],weights_256[2356],weights_256[2357],weights_256[2358],weights_256[2359],weights_256[2360],weights_256[2361],weights_256[2362],weights_256[2363],weights_256[2364],weights_256[2365],weights_256[2366],weights_256[2367],weights_256[2368],weights_256[2369],weights_256[2370],weights_256[2371],weights_256[2372],weights_256[2373],weights_256[2374],weights_256[2375],weights_256[2376],weights_256[2377],weights_256[2378],weights_256[2379],weights_256[2380],weights_256[2381],weights_256[2382],weights_256[2383],weights_256[2384],weights_256[2385],weights_256[2386],weights_256[2387],weights_256[2388],weights_256[2389],weights_256[2390],weights_256[2391],weights_256[2392],weights_256[2393],weights_256[2394],weights_256[2395],weights_256[2396],weights_256[2397],weights_256[2398],weights_256[2399],weights_256[2400],weights_256[2401],weights_256[2402],weights_256[2403],weights_256[2404],weights_256[2405],weights_256[2406],weights_256[2407],weights_256[2408],weights_256[2409],weights_256[2410],weights_256[2411],weights_256[2412],weights_256[2413],weights_256[2414],weights_256[2415],weights_256[2416],weights_256[2417],weights_256[2418],weights_256[2419],weights_256[2420],weights_256[2421],weights_256[2422],weights_256[2423],weights_256[2424],weights_256[2425],weights_256[2426],weights_256[2427],weights_256[2428],weights_256[2429],weights_256[2430],weights_256[2431],weights_256[2432],weights_256[2433],weights_256[2434],weights_256[2435],weights_256[2436],weights_256[2437],weights_256[2438],weights_256[2439],weights_256[2440],weights_256[2441],weights_256[2442],weights_256[2443],weights_256[2444],weights_256[2445],weights_256[2446],weights_256[2447],weights_256[2448],weights_256[2449],weights_256[2450],weights_256[2451],weights_256[2452],weights_256[2453],weights_256[2454],weights_256[2455],weights_256[2456],weights_256[2457],weights_256[2458],weights_256[2459],weights_256[2460],weights_256[2461],weights_256[2462],weights_256[2463],weights_256[2464],weights_256[2465],weights_256[2466],weights_256[2467],weights_256[2468],weights_256[2469],weights_256[2470],weights_256[2471],weights_256[2472],weights_256[2473],weights_256[2474],weights_256[2475],weights_256[2476],weights_256[2477],weights_256[2478],weights_256[2479],weights_256[2480],weights_256[2481],weights_256[2482],weights_256[2483],weights_256[2484],weights_256[2485],weights_256[2486],weights_256[2487],weights_256[2488],weights_256[2489],weights_256[2490],weights_256[2491],weights_256[2492],weights_256[2493],weights_256[2494],weights_256[2495],weights_256[2496],weights_256[2497],weights_256[2498],weights_256[2499],weights_256[2500],weights_256[2501],weights_256[2502],weights_256[2503],weights_256[2504],weights_256[2505],weights_256[2506],weights_256[2507],weights_256[2508],weights_256[2509],weights_256[2510],weights_256[2511],weights_256[2512],weights_256[2513],weights_256[2514],weights_256[2515],weights_256[2516],weights_256[2517],weights_256[2518],weights_256[2519],weights_256[2520],weights_256[2521],weights_256[2522],weights_256[2523],weights_256[2524],weights_256[2525],weights_256[2526],weights_256[2527],weights_256[2528],weights_256[2529],weights_256[2530],weights_256[2531],weights_256[2532],weights_256[2533],weights_256[2534],weights_256[2535],weights_256[2536],weights_256[2537],weights_256[2538],weights_256[2539],weights_256[2540],weights_256[2541],weights_256[2542],weights_256[2543],weights_256[2544],weights_256[2545],weights_256[2546],weights_256[2547],weights_256[2548],weights_256[2549],weights_256[2550],weights_256[2551],weights_256[2552],weights_256[2553],weights_256[2554],weights_256[2555],weights_256[2556],weights_256[2557],weights_256[2558],weights_256[2559]};
// assignments ends

//input layer instantiation total 10 neurons 
neuron_256 in_layer1(weights_inlayer1,bias_inlayer1,out_inlayer1);
neuron_256 in_layer2(weights_inlayer2,bias_inlayer2,out_inlayer2);
neuron_256 in_layer3(weights_inlayer3,bias_inlayer3,out_inlayer3);
neuron_256 in_layer4(weights_inlayer4,bias_inlayer4,out_inlayer4);
neuron_256 in_layer5(weights_inlayer5,bias_inlayer5,out_inlayer5);
neuron_256 in_layer6(weights_inlayer6,bias_inlayer6,out_inlayer6);
neuron_256 in_layer7(weights_inlayer7,bias_inlayer7,out_inlayer7);
neuron_256 in_layer8(weights_inlayer8,bias_inlayer8,out_inlayer8);
neuron_256 in_layer9(weights_inlayer9,bias_inlayer9,out_inlayer9);
neuron_256 in_layer10(weights_inlayer10,bias_inlayer10,out_inlayer10);
//input layer ends

//hidden layer instantiation of 20 neurons
neuron_10 hid_layer1(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer1,w2_hidlayer1,w3_hidlayer1,w4_hidlayer1,w5_hidlayer1,w6_hidlayer1,w7_hidlayer1,w8_hidlayer1,w9_hidlayer1,w10_hidlayer1,bias_hidlayer1,out_hidlayer1);
neuron_10 hid_layer2(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer2,w2_hidlayer2,w3_hidlayer2,w4_hidlayer2,w5_hidlayer2,w6_hidlayer2,w7_hidlayer2,w8_hidlayer2,w9_hidlayer2,w10_hidlayer2,bias_hidlayer2,out_hidlayer2);
neuron_10 hid_layer3(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer3,w2_hidlayer3,w3_hidlayer3,w4_hidlayer3,w5_hidlayer3,w6_hidlayer3,w7_hidlayer3,w8_hidlayer3,w9_hidlayer3,w10_hidlayer3,bias_hidlayer3,out_hidlayer3);
neuron_10 hid_layer4(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer4,w2_hidlayer4,w3_hidlayer4,w4_hidlayer4,w5_hidlayer4,w6_hidlayer4,w7_hidlayer4,w8_hidlayer4,w9_hidlayer4,w10_hidlayer4,bias_hidlayer4,out_hidlayer4);
neuron_10 hid_layer5(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer5,w2_hidlayer5,w3_hidlayer5,w4_hidlayer5,w5_hidlayer5,w6_hidlayer5,w7_hidlayer5,w8_hidlayer5,w9_hidlayer5,w10_hidlayer5,bias_hidlayer5,out_hidlayer5);
neuron_10 hid_layer6(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer6,w2_hidlayer6,w3_hidlayer6,w4_hidlayer6,w5_hidlayer6,w6_hidlayer6,w7_hidlayer6,w8_hidlayer6,w9_hidlayer6,w10_hidlayer6,bias_hidlayer6,out_hidlayer6);
neuron_10 hid_layer7(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer7,w2_hidlayer7,w3_hidlayer7,w4_hidlayer7,w5_hidlayer7,w6_hidlayer7,w7_hidlayer7,w8_hidlayer7,w9_hidlayer7,w10_hidlayer7,bias_hidlayer7,out_hidlayer7);
neuron_10 hid_layer8(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer8,w2_hidlayer8,w3_hidlayer8,w4_hidlayer8,w5_hidlayer8,w6_hidlayer8,w7_hidlayer8,w8_hidlayer8,w9_hidlayer8,w10_hidlayer8,bias_hidlayer8,out_hidlayer8);
neuron_10 hid_layer9(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer9,w2_hidlayer9,w3_hidlayer9,w4_hidlayer9,w5_hidlayer9,w6_hidlayer9,w7_hidlayer9,w8_hidlayer9,w9_hidlayer9,w10_hidlayer9,bias_hidlayer9,out_hidlayer9);
neuron_10 hid_layer10(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer10,w2_hidlayer10,w3_hidlayer10,w4_hidlayer10,w5_hidlayer10,w6_hidlayer10,w7_hidlayer10,w8_hidlayer10,w9_hidlayer10,w10_hidlayer10,bias_hidlayer10,out_hidlayer10);
neuron_10 hid_layer11(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer11,w2_hidlayer11,w3_hidlayer11,w4_hidlayer11,w5_hidlayer11,w6_hidlayer11,w7_hidlayer11,w8_hidlayer11,w9_hidlayer11,w10_hidlayer11,bias_hidlayer11,out_hidlayer11);
neuron_10 hid_layer12(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer12,w2_hidlayer12,w3_hidlayer12,w4_hidlayer12,w5_hidlayer12,w6_hidlayer12,w7_hidlayer12,w8_hidlayer12,w9_hidlayer12,w10_hidlayer12,bias_hidlayer12,out_hidlayer12);
neuron_10 hid_layer13(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer13,w2_hidlayer13,w3_hidlayer13,w4_hidlayer13,w5_hidlayer13,w6_hidlayer13,w7_hidlayer13,w8_hidlayer13,w9_hidlayer13,w10_hidlayer13,bias_hidlayer13,out_hidlayer13);
neuron_10 hid_layer14(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer14,w2_hidlayer14,w3_hidlayer14,w4_hidlayer14,w5_hidlayer14,w6_hidlayer14,w7_hidlayer14,w8_hidlayer14,w9_hidlayer14,w10_hidlayer14,bias_hidlayer14,out_hidlayer14);
neuron_10 hid_layer15(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer15,w2_hidlayer15,w3_hidlayer15,w4_hidlayer15,w5_hidlayer15,w6_hidlayer15,w7_hidlayer15,w8_hidlayer15,w9_hidlayer15,w10_hidlayer15,bias_hidlayer15,out_hidlayer15);
neuron_10 hid_layer16(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer16,w2_hidlayer16,w3_hidlayer16,w4_hidlayer16,w5_hidlayer16,w6_hidlayer16,w7_hidlayer16,w8_hidlayer16,w9_hidlayer16,w10_hidlayer16,bias_hidlayer16,out_hidlayer16);
neuron_10 hid_layer17(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer17,w2_hidlayer17,w3_hidlayer17,w4_hidlayer17,w5_hidlayer17,w6_hidlayer17,w7_hidlayer17,w8_hidlayer17,w9_hidlayer17,w10_hidlayer17,bias_hidlayer17,out_hidlayer17);
neuron_10 hid_layer18(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer18,w2_hidlayer18,w3_hidlayer18,w4_hidlayer18,w5_hidlayer18,w6_hidlayer18,w7_hidlayer18,w8_hidlayer18,w9_hidlayer18,w10_hidlayer18,bias_hidlayer18,out_hidlayer18);
neuron_10 hid_layer19(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer19,w2_hidlayer19,w3_hidlayer19,w4_hidlayer19,w5_hidlayer19,w6_hidlayer19,w7_hidlayer19,w8_hidlayer19,w9_hidlayer19,w10_hidlayer19,bias_hidlayer19,out_hidlayer19);
neuron_10 hid_layer20(out_inlayer1,out_inlayer2,out_inlayer3,out_inlayer4,out_inlayer5,out_inlayer6,out_inlayer7,out_inlayer8,out_inlayer9,out_inlayer10,w1_hidlayer20,w2_hidlayer20,w3_hidlayer20,w4_hidlayer20,w5_hidlayer20,w6_hidlayer20,w7_hidlayer20,w8_hidlayer20,w9_hidlayer20,w10_hidlayer20,bias_hidlayer20,out_hidlayer20);
//hidden layer ends

// the final layer containing 10 neurons of 20 inputs
neuron_20 out_layer1(out_hidlayer1,out_hidlayer2,out_hidlayer3,out_hidlayer4,out_hidlayer5,out_hidlayer6,out_hidlayer7,out_hidlayer8,out_hidlayer9,out_hidlayer10,out_hidlayer11,out_hidlayer12,out_hidlayer13,out_hidlayer14,out_hidlayer15,out_hidlayer16,out_hidlayer17,out_hidlayer18,out_hidlayer19,out_hidlayer20,w1_outlayer1,w2_outlayer1,w3_outlayer1,w4_outlayer1,w5_outlayer1,w6_outlayer1,w7_outlayer1,w8_outlayer1,w9_outlayer1,w10_outlayer1,w11_outlayer1,w12_outlayer1,w13_outlayer1,w14_outlayer1,w15_outlayer1,w16_outlayer1,w17_outlayer1,w18_outlayer1,w19_outlayer1,w20_outlayer1,bias_outlayer1,out_outlayer1);
neuron_20 out_layer2(out_hidlayer1,out_hidlayer2,out_hidlayer3,out_hidlayer4,out_hidlayer5,out_hidlayer6,out_hidlayer7,out_hidlayer8,out_hidlayer9,out_hidlayer10,out_hidlayer11,out_hidlayer12,out_hidlayer13,out_hidlayer14,out_hidlayer15,out_hidlayer16,out_hidlayer17,out_hidlayer18,out_hidlayer19,out_hidlayer20,w1_outlayer2,w2_outlayer2,w3_outlayer2,w4_outlayer2,w5_outlayer2,w6_outlayer2,w7_outlayer2,w8_outlayer2,w9_outlayer2,w10_outlayer2,w11_outlayer2,w12_outlayer2,w13_outlayer2,w14_outlayer2,w15_outlayer2,w16_outlayer2,w17_outlayer2,w18_outlayer2,w19_outlayer2,w20_outlayer2,bias_outlayer2,out_outlayer2);
neuron_20 out_layer3(out_hidlayer1,out_hidlayer2,out_hidlayer3,out_hidlayer4,out_hidlayer5,out_hidlayer6,out_hidlayer7,out_hidlayer8,out_hidlayer9,out_hidlayer10,out_hidlayer11,out_hidlayer12,out_hidlayer13,out_hidlayer14,out_hidlayer15,out_hidlayer16,out_hidlayer17,out_hidlayer18,out_hidlayer19,out_hidlayer20,w1_outlayer3,w2_outlayer3,w3_outlayer3,w4_outlayer3,w5_outlayer3,w6_outlayer3,w7_outlayer3,w8_outlayer3,w9_outlayer3,w10_outlayer3,w11_outlayer3,w12_outlayer3,w13_outlayer3,w14_outlayer3,w15_outlayer3,w16_outlayer3,w17_outlayer3,w18_outlayer3,w19_outlayer3,w20_outlayer3,bias_outlayer3,out_outlayer3);
neuron_20 out_layer4(out_hidlayer1,out_hidlayer2,out_hidlayer3,out_hidlayer4,out_hidlayer5,out_hidlayer6,out_hidlayer7,out_hidlayer8,out_hidlayer9,out_hidlayer10,out_hidlayer11,out_hidlayer12,out_hidlayer13,out_hidlayer14,out_hidlayer15,out_hidlayer16,out_hidlayer17,out_hidlayer18,out_hidlayer19,out_hidlayer20,w1_outlayer4,w2_outlayer4,w3_outlayer4,w4_outlayer4,w5_outlayer4,w6_outlayer4,w7_outlayer4,w8_outlayer4,w9_outlayer4,w10_outlayer4,w11_outlayer4,w12_outlayer4,w13_outlayer4,w14_outlayer4,w15_outlayer4,w16_outlayer4,w17_outlayer4,w18_outlayer4,w19_outlayer4,w20_outlayer4,bias_outlayer4,out_outlayer4);
neuron_20 out_layer5(out_hidlayer1,out_hidlayer2,out_hidlayer3,out_hidlayer4,out_hidlayer5,out_hidlayer6,out_hidlayer7,out_hidlayer8,out_hidlayer9,out_hidlayer10,out_hidlayer11,out_hidlayer12,out_hidlayer13,out_hidlayer14,out_hidlayer15,out_hidlayer16,out_hidlayer17,out_hidlayer18,out_hidlayer19,out_hidlayer20,w1_outlayer5,w2_outlayer5,w3_outlayer5,w4_outlayer5,w5_outlayer5,w6_outlayer5,w7_outlayer5,w8_outlayer5,w9_outlayer5,w10_outlayer5,w11_outlayer5,w12_outlayer5,w13_outlayer5,w14_outlayer5,w15_outlayer5,w16_outlayer5,w17_outlayer5,w18_outlayer5,w19_outlayer5,w20_outlayer5,bias_outlayer5,out_outlayer5);

//end of final layer (phew!)

always@(out_outlayer1 or out_outlayer2 or out_outlayer3 or out_outlayer4 or out_outlayer5 or out_outlayer6 or out_outlayer7 or out_outlayer8 or out_outlayer9 or out_outlayer10)
    begin
        if (out_outlayer1 > 0)
            final_out = 7'b1000000;
        else if (out_outlayer2 > 0)
            final_out = 7'b1111001;
        else if (out_outlayer3 > 0)
            final_out = 7'b0100100;
        else if (out_outlayer4 > 0)
            final_out = 7'b0110000;
        else if (out_outlayer5 > 0)
            final_out = 7'b0011001;
        else
            final_out =  7'b1111111;
    end

endmodule
