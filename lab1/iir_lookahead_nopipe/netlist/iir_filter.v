/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Fri Nov 12 16:56:33 2021
/////////////////////////////////////////////////////////////


module iir_filter ( clock, rst_n, din, a1, c2, c3, b0, b1, b2, vin, dout, vout
 );
  input [8:0] din;
  input [8:0] a1;
  input [8:0] c2;
  input [8:0] c3;
  input [8:0] b0;
  input [8:0] b1;
  input [8:0] b2;
  output [8:0] dout;
  input clock, rst_n, vin;
  output vout;
  wire   TMPtmpa_b0_9_, TMPtmpa_b0_8_, TMPtmpa_b0_7_, TMPtmpa_b0_6_,
         TMPtmpa_b0_13_, TMPtmpa_b0_12_, TMPtmpa_b0_11_, TMPtmpa_b0_10_,
         TMPq2_b2_9_, TMPq2_b2_8_, TMPq2_b2_7_, TMPq2_b2_6_, TMPq2_b2_13_,
         TMPq2_b2_12_, TMPq2_b2_11_, TMPq2_b2_10_, TMPq1_b1_9_, TMPq1_b1_8_,
         TMPq1_b1_7_, TMPq1_b1_6_, TMPq1_b1_13_, TMPq1_b1_12_, TMPq1_b1_11_,
         TMPq1_b1_10_, N21, N20, N19, N18, N17, N16, N15, N14, TMPqx_a1_9_,
         TMPqx_a1_8_, TMPqx_a1_7_, TMPqx_a1_6_, TMPqx_a1_12_, TMPqx_a1_11_,
         TMPqx_a1_10_, TMPq3_c3_9_, TMPq3_c3_8_, TMPq3_c3_7_, TMPq3_c3_6_,
         TMPq3_c3_12_, TMPq3_c3_11_, TMPq3_c3_10_, TMPq2_c2_9_, TMPq2_c2_8_,
         TMPq2_c2_7_, TMPq2_c2_6_, TMPq2_c2_12_, TMPq2_c2_11_, TMPq2_c2_10_,
         N9, N8, N7, N6, N5, N4, N3, N2, N13, N12, N11, N10, N1, N0, reg_x_n23,
         reg_x_n22, reg_x_n21, reg_x_n20, reg_x_n19, reg_x_n18, reg_x_n17,
         reg_x_n16, reg_x_n15, reg_x_n14, reg_x_n13, reg_x_n12, reg_x_n11,
         reg_x_n10, reg_x_n9, reg_x_n8, reg_x_n7, reg_x_n6, reg_x_n5, reg_x_n4,
         reg_x_n3, reg_x_n2, reg_x_n1, reg_1_n44, reg_1_n43, reg_1_n42,
         reg_1_n41, reg_1_n40, reg_1_n39, reg_1_n38, reg_1_n37, reg_1_n36,
         reg_1_n35, reg_1_n34, reg_1_n33, reg_1_n32, reg_1_n31, reg_1_n30,
         reg_1_n29, reg_1_n28, reg_1_n27, reg_1_n26, reg_1_n25, reg_1_n24,
         reg_1_n23, reg_1_n22, reg_2_n44, reg_2_n43, reg_2_n42, reg_2_n41,
         reg_2_n40, reg_2_n39, reg_2_n38, reg_2_n37, reg_2_n36, reg_2_n35,
         reg_2_n34, reg_2_n33, reg_2_n32, reg_2_n31, reg_2_n30, reg_2_n29,
         reg_2_n28, reg_2_n27, reg_2_n26, reg_2_n25, reg_2_n24, reg_2_n23,
         reg_2_n22, reg_3_n44, reg_3_n43, reg_3_n42, reg_3_n41, reg_3_n40,
         reg_3_n39, reg_3_n38, reg_3_n37, reg_3_n36, reg_3_n35, reg_3_n34,
         reg_3_n33, reg_3_n32, reg_3_n31, reg_3_n30, reg_3_n29, reg_3_n28,
         reg_3_n27, reg_3_n26, reg_3_n25, reg_3_n24, reg_3_n23, reg_3_n22,
         reg_dout_n26, reg_dout_n25, reg_dout_n24, reg_dout_n23, reg_dout_n22,
         reg_dout_n21, reg_dout_n20, reg_dout_n19, reg_dout_n18, reg_dout_n17,
         reg_dout_n16, reg_dout_n15, reg_dout_n14, reg_dout_n13, reg_dout_n12,
         reg_dout_n11, reg_dout_n10, reg_dout_n9, reg_dout_n8, reg_dout_n7,
         reg_dout_n6, reg_dout_n5, reg_dout_n4, reg_dout_n3, reg_dout_n2,
         reg_dout_n1, ff_1_n3, ff_1_n2, ff_1_n1, mult_50_n184, mult_50_n183,
         mult_50_n182, mult_50_n181, mult_50_n180, mult_50_n179, mult_50_n178,
         mult_50_n177, mult_50_n176, mult_50_n175, mult_50_n174, mult_50_n173,
         mult_50_n172, mult_50_n171, mult_50_n170, mult_50_n169, mult_50_n168,
         mult_50_n167, mult_50_n166, mult_50_n165, mult_50_n164, mult_50_n163,
         mult_50_n162, mult_50_n119, mult_50_n118, mult_50_n117, mult_50_n116,
         mult_50_n115, mult_50_n113, mult_50_n112, mult_50_n111, mult_50_n110,
         mult_50_n109, mult_50_n108, mult_50_n106, mult_50_n105, mult_50_n104,
         mult_50_n103, mult_50_n102, mult_50_n101, mult_50_n100, mult_50_n99,
         mult_50_n98, mult_50_n97, mult_50_n95, mult_50_n94, mult_50_n93,
         mult_50_n92, mult_50_n91, mult_50_n90, mult_50_n89, mult_50_n88,
         mult_50_n87, mult_50_n86, mult_50_n85, mult_50_n83, mult_50_n82,
         mult_50_n81, mult_50_n80, mult_50_n79, mult_50_n78, mult_50_n77,
         mult_50_n76, mult_50_n75, mult_50_n74, mult_50_n73, mult_50_n72,
         mult_50_n71, mult_50_n70, mult_50_n69, mult_50_n68, mult_50_n67,
         mult_50_n66, mult_50_n65, mult_50_n64, mult_50_n63, mult_50_n62,
         mult_50_n61, mult_50_n60, mult_50_n59, mult_50_n58, mult_50_n57,
         mult_50_n56, mult_50_n55, mult_50_n54, mult_50_n53, mult_50_n52,
         mult_50_n51, mult_50_n50, mult_50_n49, mult_50_n48, mult_50_n47,
         mult_50_n46, mult_50_n45, mult_50_n44, mult_50_n43, mult_50_n42,
         mult_50_n41, mult_50_n40, mult_50_n39, mult_50_n38, mult_50_n37,
         mult_50_n36, mult_50_n35, mult_50_n34, mult_50_n33, mult_50_n32,
         mult_50_n31, mult_50_n30, mult_50_n29, mult_50_n28, mult_50_n27,
         mult_50_n26, mult_50_n25, mult_50_n24, mult_50_n23, mult_50_n22,
         mult_50_n21, mult_50_n20, mult_50_n19, mult_50_n18, mult_50_n17,
         mult_50_n16, mult_50_n15, mult_50_n14, mult_50_n13, mult_50_n8,
         mult_50_n7, mult_50_n6, mult_50_n5, mult_50_n4, mult_50_n3,
         mult_50_n2, mult_50_n1, mult_51_n184, mult_51_n183, mult_51_n182,
         mult_51_n181, mult_51_n180, mult_51_n179, mult_51_n178, mult_51_n177,
         mult_51_n176, mult_51_n175, mult_51_n174, mult_51_n173, mult_51_n172,
         mult_51_n171, mult_51_n170, mult_51_n169, mult_51_n168, mult_51_n167,
         mult_51_n166, mult_51_n165, mult_51_n164, mult_51_n163, mult_51_n162,
         mult_51_n119, mult_51_n118, mult_51_n117, mult_51_n116, mult_51_n115,
         mult_51_n113, mult_51_n112, mult_51_n111, mult_51_n110, mult_51_n109,
         mult_51_n108, mult_51_n106, mult_51_n105, mult_51_n104, mult_51_n103,
         mult_51_n102, mult_51_n101, mult_51_n100, mult_51_n99, mult_51_n98,
         mult_51_n97, mult_51_n95, mult_51_n94, mult_51_n93, mult_51_n92,
         mult_51_n91, mult_51_n90, mult_51_n89, mult_51_n88, mult_51_n87,
         mult_51_n86, mult_51_n85, mult_51_n83, mult_51_n82, mult_51_n81,
         mult_51_n80, mult_51_n79, mult_51_n78, mult_51_n77, mult_51_n76,
         mult_51_n75, mult_51_n74, mult_51_n73, mult_51_n72, mult_51_n71,
         mult_51_n70, mult_51_n69, mult_51_n68, mult_51_n67, mult_51_n66,
         mult_51_n65, mult_51_n64, mult_51_n63, mult_51_n62, mult_51_n61,
         mult_51_n60, mult_51_n59, mult_51_n58, mult_51_n57, mult_51_n56,
         mult_51_n55, mult_51_n54, mult_51_n53, mult_51_n52, mult_51_n51,
         mult_51_n50, mult_51_n49, mult_51_n48, mult_51_n47, mult_51_n46,
         mult_51_n45, mult_51_n44, mult_51_n43, mult_51_n42, mult_51_n41,
         mult_51_n40, mult_51_n39, mult_51_n38, mult_51_n37, mult_51_n36,
         mult_51_n35, mult_51_n34, mult_51_n33, mult_51_n32, mult_51_n31,
         mult_51_n30, mult_51_n29, mult_51_n28, mult_51_n27, mult_51_n26,
         mult_51_n25, mult_51_n24, mult_51_n23, mult_51_n22, mult_51_n21,
         mult_51_n20, mult_51_n19, mult_51_n18, mult_51_n17, mult_51_n16,
         mult_51_n15, mult_51_n14, mult_51_n13, mult_51_n8, mult_51_n7,
         mult_51_n6, mult_51_n5, mult_51_n4, mult_51_n3, mult_51_n2,
         mult_51_n1, mult_52_n184, mult_52_n183, mult_52_n182, mult_52_n181,
         mult_52_n180, mult_52_n179, mult_52_n178, mult_52_n177, mult_52_n176,
         mult_52_n175, mult_52_n174, mult_52_n173, mult_52_n172, mult_52_n171,
         mult_52_n170, mult_52_n169, mult_52_n168, mult_52_n167, mult_52_n166,
         mult_52_n165, mult_52_n164, mult_52_n163, mult_52_n162, mult_52_n119,
         mult_52_n118, mult_52_n117, mult_52_n116, mult_52_n115, mult_52_n113,
         mult_52_n112, mult_52_n111, mult_52_n110, mult_52_n109, mult_52_n108,
         mult_52_n106, mult_52_n105, mult_52_n104, mult_52_n103, mult_52_n102,
         mult_52_n101, mult_52_n100, mult_52_n99, mult_52_n98, mult_52_n97,
         mult_52_n95, mult_52_n94, mult_52_n93, mult_52_n92, mult_52_n91,
         mult_52_n90, mult_52_n89, mult_52_n88, mult_52_n87, mult_52_n86,
         mult_52_n85, mult_52_n83, mult_52_n82, mult_52_n81, mult_52_n80,
         mult_52_n79, mult_52_n78, mult_52_n77, mult_52_n76, mult_52_n75,
         mult_52_n74, mult_52_n73, mult_52_n72, mult_52_n71, mult_52_n70,
         mult_52_n69, mult_52_n68, mult_52_n67, mult_52_n66, mult_52_n65,
         mult_52_n64, mult_52_n63, mult_52_n62, mult_52_n61, mult_52_n60,
         mult_52_n59, mult_52_n58, mult_52_n57, mult_52_n56, mult_52_n55,
         mult_52_n54, mult_52_n53, mult_52_n52, mult_52_n51, mult_52_n50,
         mult_52_n49, mult_52_n48, mult_52_n47, mult_52_n46, mult_52_n45,
         mult_52_n44, mult_52_n43, mult_52_n42, mult_52_n41, mult_52_n40,
         mult_52_n39, mult_52_n38, mult_52_n37, mult_52_n36, mult_52_n35,
         mult_52_n34, mult_52_n33, mult_52_n32, mult_52_n31, mult_52_n30,
         mult_52_n29, mult_52_n28, mult_52_n27, mult_52_n26, mult_52_n25,
         mult_52_n24, mult_52_n23, mult_52_n22, mult_52_n21, mult_52_n20,
         mult_52_n19, mult_52_n18, mult_52_n17, mult_52_n16, mult_52_n15,
         mult_52_n14, mult_52_n13, mult_52_n8, mult_52_n7, mult_52_n6,
         mult_52_n5, mult_52_n4, mult_52_n3, mult_52_n2, mult_52_n1,
         add_1_root_add_0_root_add_54_2_n1, add_0_root_add_0_root_add_54_2_n2,
         mult_47_n184, mult_47_n183, mult_47_n182, mult_47_n181, mult_47_n180,
         mult_47_n179, mult_47_n178, mult_47_n177, mult_47_n176, mult_47_n175,
         mult_47_n174, mult_47_n173, mult_47_n172, mult_47_n171, mult_47_n170,
         mult_47_n169, mult_47_n168, mult_47_n167, mult_47_n166, mult_47_n165,
         mult_47_n164, mult_47_n163, mult_47_n162, mult_47_n161, mult_47_n160,
         mult_47_n119, mult_47_n118, mult_47_n117, mult_47_n116, mult_47_n115,
         mult_47_n113, mult_47_n112, mult_47_n111, mult_47_n110, mult_47_n109,
         mult_47_n108, mult_47_n106, mult_47_n105, mult_47_n104, mult_47_n103,
         mult_47_n102, mult_47_n101, mult_47_n100, mult_47_n99, mult_47_n98,
         mult_47_n97, mult_47_n95, mult_47_n94, mult_47_n93, mult_47_n92,
         mult_47_n91, mult_47_n90, mult_47_n89, mult_47_n88, mult_47_n87,
         mult_47_n86, mult_47_n85, mult_47_n83, mult_47_n82, mult_47_n81,
         mult_47_n80, mult_47_n79, mult_47_n78, mult_47_n77, mult_47_n76,
         mult_47_n75, mult_47_n74, mult_47_n72, mult_47_n71, mult_47_n70,
         mult_47_n69, mult_47_n68, mult_47_n67, mult_47_n66, mult_47_n65,
         mult_47_n64, mult_47_n63, mult_47_n62, mult_47_n61, mult_47_n60,
         mult_47_n59, mult_47_n58, mult_47_n57, mult_47_n56, mult_47_n55,
         mult_47_n54, mult_47_n53, mult_47_n52, mult_47_n51, mult_47_n50,
         mult_47_n49, mult_47_n48, mult_47_n47, mult_47_n46, mult_47_n45,
         mult_47_n44, mult_47_n43, mult_47_n42, mult_47_n41, mult_47_n40,
         mult_47_n39, mult_47_n38, mult_47_n37, mult_47_n36, mult_47_n35,
         mult_47_n34, mult_47_n33, mult_47_n32, mult_47_n31, mult_47_n30,
         mult_47_n29, mult_47_n28, mult_47_n27, mult_47_n26, mult_47_n25,
         mult_47_n24, mult_47_n23, mult_47_n22, mult_47_n21, mult_47_n20,
         mult_47_n19, mult_47_n18, mult_47_n17, mult_47_n16, mult_47_n15,
         mult_47_n14, mult_47_n13, mult_47_n8, mult_47_n7, mult_47_n6,
         mult_47_n5, mult_47_n4, mult_47_n3, mult_47_n2, mult_45_n184,
         mult_45_n183, mult_45_n182, mult_45_n181, mult_45_n180, mult_45_n179,
         mult_45_n178, mult_45_n177, mult_45_n176, mult_45_n175, mult_45_n174,
         mult_45_n173, mult_45_n172, mult_45_n171, mult_45_n170, mult_45_n169,
         mult_45_n168, mult_45_n167, mult_45_n166, mult_45_n165, mult_45_n164,
         mult_45_n163, mult_45_n162, mult_45_n161, mult_45_n160, mult_45_n119,
         mult_45_n118, mult_45_n117, mult_45_n116, mult_45_n115, mult_45_n113,
         mult_45_n112, mult_45_n111, mult_45_n110, mult_45_n109, mult_45_n108,
         mult_45_n106, mult_45_n105, mult_45_n104, mult_45_n103, mult_45_n102,
         mult_45_n101, mult_45_n100, mult_45_n99, mult_45_n98, mult_45_n97,
         mult_45_n95, mult_45_n94, mult_45_n93, mult_45_n92, mult_45_n91,
         mult_45_n90, mult_45_n89, mult_45_n88, mult_45_n87, mult_45_n86,
         mult_45_n85, mult_45_n83, mult_45_n82, mult_45_n81, mult_45_n80,
         mult_45_n79, mult_45_n78, mult_45_n77, mult_45_n76, mult_45_n75,
         mult_45_n74, mult_45_n72, mult_45_n71, mult_45_n70, mult_45_n69,
         mult_45_n68, mult_45_n67, mult_45_n66, mult_45_n65, mult_45_n64,
         mult_45_n63, mult_45_n62, mult_45_n61, mult_45_n60, mult_45_n59,
         mult_45_n58, mult_45_n57, mult_45_n56, mult_45_n55, mult_45_n54,
         mult_45_n53, mult_45_n52, mult_45_n51, mult_45_n50, mult_45_n49,
         mult_45_n48, mult_45_n47, mult_45_n46, mult_45_n45, mult_45_n44,
         mult_45_n43, mult_45_n42, mult_45_n41, mult_45_n40, mult_45_n39,
         mult_45_n38, mult_45_n37, mult_45_n36, mult_45_n35, mult_45_n34,
         mult_45_n33, mult_45_n32, mult_45_n31, mult_45_n30, mult_45_n29,
         mult_45_n28, mult_45_n27, mult_45_n26, mult_45_n25, mult_45_n24,
         mult_45_n23, mult_45_n22, mult_45_n21, mult_45_n20, mult_45_n19,
         mult_45_n18, mult_45_n17, mult_45_n16, mult_45_n15, mult_45_n14,
         mult_45_n13, mult_45_n8, mult_45_n7, mult_45_n6, mult_45_n5,
         mult_45_n4, mult_45_n3, mult_45_n2, add_1_root_add_0_root_add_48_3_n2,
         mult_46_n184, mult_46_n183, mult_46_n182, mult_46_n181, mult_46_n180,
         mult_46_n179, mult_46_n178, mult_46_n177, mult_46_n176, mult_46_n175,
         mult_46_n174, mult_46_n173, mult_46_n172, mult_46_n171, mult_46_n170,
         mult_46_n169, mult_46_n168, mult_46_n167, mult_46_n166, mult_46_n165,
         mult_46_n164, mult_46_n163, mult_46_n162, mult_46_n161, mult_46_n160,
         mult_46_n119, mult_46_n118, mult_46_n117, mult_46_n116, mult_46_n115,
         mult_46_n113, mult_46_n112, mult_46_n111, mult_46_n110, mult_46_n109,
         mult_46_n108, mult_46_n106, mult_46_n105, mult_46_n104, mult_46_n103,
         mult_46_n102, mult_46_n101, mult_46_n100, mult_46_n99, mult_46_n98,
         mult_46_n97, mult_46_n95, mult_46_n94, mult_46_n93, mult_46_n92,
         mult_46_n91, mult_46_n90, mult_46_n89, mult_46_n88, mult_46_n87,
         mult_46_n86, mult_46_n85, mult_46_n83, mult_46_n82, mult_46_n81,
         mult_46_n80, mult_46_n79, mult_46_n78, mult_46_n77, mult_46_n76,
         mult_46_n75, mult_46_n74, mult_46_n72, mult_46_n71, mult_46_n70,
         mult_46_n69, mult_46_n68, mult_46_n67, mult_46_n66, mult_46_n65,
         mult_46_n64, mult_46_n63, mult_46_n62, mult_46_n61, mult_46_n60,
         mult_46_n59, mult_46_n58, mult_46_n57, mult_46_n56, mult_46_n55,
         mult_46_n54, mult_46_n53, mult_46_n52, mult_46_n51, mult_46_n50,
         mult_46_n49, mult_46_n48, mult_46_n47, mult_46_n46, mult_46_n45,
         mult_46_n44, mult_46_n43, mult_46_n42, mult_46_n41, mult_46_n40,
         mult_46_n39, mult_46_n38, mult_46_n37, mult_46_n36, mult_46_n35,
         mult_46_n34, mult_46_n33, mult_46_n32, mult_46_n31, mult_46_n30,
         mult_46_n29, mult_46_n28, mult_46_n27, mult_46_n26, mult_46_n25,
         mult_46_n24, mult_46_n23, mult_46_n22, mult_46_n21, mult_46_n20,
         mult_46_n19, mult_46_n18, mult_46_n17, mult_46_n16, mult_46_n15,
         mult_46_n14, mult_46_n13, mult_46_n8, mult_46_n7, mult_46_n6,
         mult_46_n5, mult_46_n4, mult_46_n3, mult_46_n2,
         add_2_root_add_0_root_add_48_3_n1, add_0_root_add_0_root_add_48_3_n1;
  wire   [6:0] q_reg2;
  wire   [6:0] q_reg3;
  wire   [6:0] q_regx;
  wire   [6:0] TMPa;
  wire   [6:0] q_reg1;
  wire   [7:0] TMPb;
  wire   [7:2] add_1_root_add_0_root_add_54_2_carry;
  wire   [7:2] add_0_root_add_0_root_add_54_2_carry;
  wire   [6:2] add_1_root_add_0_root_add_48_3_carry;
  wire   [6:2] add_2_root_add_0_root_add_48_3_carry;
  wire   [6:2] add_0_root_add_0_root_add_48_3_carry;
  assign dout[0] = 1'b0;

  BUF_X1 reg_x_U17 ( .A(vin), .Z(reg_x_n23) );
  NAND2_X1 reg_x_U16 ( .A1(din[8]), .A2(reg_x_n22), .ZN(reg_x_n7) );
  OAI21_X1 reg_x_U15 ( .B1(reg_x_n14), .B2(reg_x_n22), .A(reg_x_n7), .ZN(
        reg_x_n21) );
  NAND2_X1 reg_x_U14 ( .A1(din[7]), .A2(reg_x_n22), .ZN(reg_x_n6) );
  OAI21_X1 reg_x_U13 ( .B1(reg_x_n13), .B2(reg_x_n23), .A(reg_x_n6), .ZN(
        reg_x_n20) );
  NAND2_X1 reg_x_U12 ( .A1(din[6]), .A2(reg_x_n22), .ZN(reg_x_n5) );
  OAI21_X1 reg_x_U11 ( .B1(reg_x_n12), .B2(reg_x_n22), .A(reg_x_n5), .ZN(
        reg_x_n19) );
  NAND2_X1 reg_x_U10 ( .A1(din[5]), .A2(reg_x_n22), .ZN(reg_x_n4) );
  OAI21_X1 reg_x_U9 ( .B1(reg_x_n11), .B2(reg_x_n22), .A(reg_x_n4), .ZN(
        reg_x_n18) );
  NAND2_X1 reg_x_U8 ( .A1(din[4]), .A2(reg_x_n22), .ZN(reg_x_n3) );
  OAI21_X1 reg_x_U7 ( .B1(reg_x_n10), .B2(reg_x_n22), .A(reg_x_n3), .ZN(
        reg_x_n17) );
  NAND2_X1 reg_x_U6 ( .A1(din[3]), .A2(reg_x_n22), .ZN(reg_x_n2) );
  OAI21_X1 reg_x_U5 ( .B1(reg_x_n9), .B2(reg_x_n22), .A(reg_x_n2), .ZN(
        reg_x_n16) );
  NAND2_X1 reg_x_U4 ( .A1(reg_x_n23), .A2(din[2]), .ZN(reg_x_n1) );
  OAI21_X1 reg_x_U3 ( .B1(reg_x_n8), .B2(reg_x_n22), .A(reg_x_n1), .ZN(
        reg_x_n15) );
  BUF_X1 reg_x_U2 ( .A(vin), .Z(reg_x_n22) );
  DFFR_X1 reg_x_Q_reg_0_ ( .D(reg_x_n15), .CK(clock), .RN(rst_n), .Q(q_regx[0]), .QN(reg_x_n8) );
  DFFR_X1 reg_x_Q_reg_1_ ( .D(reg_x_n16), .CK(clock), .RN(rst_n), .Q(q_regx[1]), .QN(reg_x_n9) );
  DFFR_X1 reg_x_Q_reg_2_ ( .D(reg_x_n17), .CK(clock), .RN(rst_n), .Q(q_regx[2]), .QN(reg_x_n10) );
  DFFR_X1 reg_x_Q_reg_3_ ( .D(reg_x_n18), .CK(clock), .RN(rst_n), .Q(q_regx[3]), .QN(reg_x_n11) );
  DFFR_X1 reg_x_Q_reg_4_ ( .D(reg_x_n19), .CK(clock), .RN(rst_n), .Q(q_regx[4]), .QN(reg_x_n12) );
  DFFR_X1 reg_x_Q_reg_5_ ( .D(reg_x_n20), .CK(clock), .RN(rst_n), .Q(q_regx[5]), .QN(reg_x_n13) );
  DFFR_X1 reg_x_Q_reg_6_ ( .D(reg_x_n21), .CK(clock), .RN(rst_n), .Q(q_regx[6]), .QN(reg_x_n14) );
  BUF_X1 reg_1_U17 ( .A(vin), .Z(reg_1_n23) );
  NAND2_X1 reg_1_U16 ( .A1(reg_1_n23), .A2(TMPa[0]), .ZN(reg_1_n44) );
  OAI21_X1 reg_1_U15 ( .B1(reg_1_n37), .B2(reg_1_n22), .A(reg_1_n44), .ZN(
        reg_1_n30) );
  BUF_X1 reg_1_U14 ( .A(vin), .Z(reg_1_n22) );
  NAND2_X1 reg_1_U13 ( .A1(TMPa[6]), .A2(reg_1_n22), .ZN(reg_1_n38) );
  OAI21_X1 reg_1_U12 ( .B1(reg_1_n31), .B2(reg_1_n22), .A(reg_1_n38), .ZN(
        reg_1_n24) );
  NAND2_X1 reg_1_U11 ( .A1(TMPa[5]), .A2(reg_1_n22), .ZN(reg_1_n39) );
  OAI21_X1 reg_1_U10 ( .B1(reg_1_n32), .B2(reg_1_n23), .A(reg_1_n39), .ZN(
        reg_1_n25) );
  NAND2_X1 reg_1_U9 ( .A1(TMPa[4]), .A2(reg_1_n22), .ZN(reg_1_n40) );
  OAI21_X1 reg_1_U8 ( .B1(reg_1_n33), .B2(reg_1_n22), .A(reg_1_n40), .ZN(
        reg_1_n26) );
  NAND2_X1 reg_1_U7 ( .A1(TMPa[3]), .A2(reg_1_n22), .ZN(reg_1_n41) );
  OAI21_X1 reg_1_U6 ( .B1(reg_1_n34), .B2(reg_1_n22), .A(reg_1_n41), .ZN(
        reg_1_n27) );
  NAND2_X1 reg_1_U5 ( .A1(TMPa[2]), .A2(reg_1_n22), .ZN(reg_1_n42) );
  OAI21_X1 reg_1_U4 ( .B1(reg_1_n35), .B2(reg_1_n22), .A(reg_1_n42), .ZN(
        reg_1_n28) );
  NAND2_X1 reg_1_U3 ( .A1(TMPa[1]), .A2(reg_1_n22), .ZN(reg_1_n43) );
  OAI21_X1 reg_1_U2 ( .B1(reg_1_n36), .B2(reg_1_n22), .A(reg_1_n43), .ZN(
        reg_1_n29) );
  DFFR_X1 reg_1_Q_reg_0_ ( .D(reg_1_n30), .CK(clock), .RN(rst_n), .Q(q_reg1[0]), .QN(reg_1_n37) );
  DFFR_X1 reg_1_Q_reg_1_ ( .D(reg_1_n29), .CK(clock), .RN(rst_n), .Q(q_reg1[1]), .QN(reg_1_n36) );
  DFFR_X1 reg_1_Q_reg_2_ ( .D(reg_1_n28), .CK(clock), .RN(rst_n), .Q(q_reg1[2]), .QN(reg_1_n35) );
  DFFR_X1 reg_1_Q_reg_3_ ( .D(reg_1_n27), .CK(clock), .RN(rst_n), .Q(q_reg1[3]), .QN(reg_1_n34) );
  DFFR_X1 reg_1_Q_reg_4_ ( .D(reg_1_n26), .CK(clock), .RN(rst_n), .Q(q_reg1[4]), .QN(reg_1_n33) );
  DFFR_X1 reg_1_Q_reg_5_ ( .D(reg_1_n25), .CK(clock), .RN(rst_n), .Q(q_reg1[5]), .QN(reg_1_n32) );
  DFFR_X1 reg_1_Q_reg_6_ ( .D(reg_1_n24), .CK(clock), .RN(rst_n), .Q(q_reg1[6]), .QN(reg_1_n31) );
  BUF_X1 reg_2_U17 ( .A(vin), .Z(reg_2_n23) );
  NAND2_X1 reg_2_U16 ( .A1(q_reg1[6]), .A2(reg_2_n22), .ZN(reg_2_n38) );
  OAI21_X1 reg_2_U15 ( .B1(reg_2_n31), .B2(reg_2_n22), .A(reg_2_n38), .ZN(
        reg_2_n24) );
  NAND2_X1 reg_2_U14 ( .A1(q_reg1[5]), .A2(reg_2_n22), .ZN(reg_2_n39) );
  OAI21_X1 reg_2_U13 ( .B1(reg_2_n32), .B2(reg_2_n23), .A(reg_2_n39), .ZN(
        reg_2_n25) );
  NAND2_X1 reg_2_U12 ( .A1(q_reg1[4]), .A2(reg_2_n22), .ZN(reg_2_n40) );
  OAI21_X1 reg_2_U11 ( .B1(reg_2_n33), .B2(reg_2_n22), .A(reg_2_n40), .ZN(
        reg_2_n26) );
  NAND2_X1 reg_2_U10 ( .A1(q_reg1[3]), .A2(reg_2_n22), .ZN(reg_2_n41) );
  OAI21_X1 reg_2_U9 ( .B1(reg_2_n34), .B2(reg_2_n22), .A(reg_2_n41), .ZN(
        reg_2_n27) );
  NAND2_X1 reg_2_U8 ( .A1(q_reg1[2]), .A2(reg_2_n22), .ZN(reg_2_n42) );
  OAI21_X1 reg_2_U7 ( .B1(reg_2_n35), .B2(reg_2_n22), .A(reg_2_n42), .ZN(
        reg_2_n28) );
  NAND2_X1 reg_2_U6 ( .A1(q_reg1[1]), .A2(reg_2_n22), .ZN(reg_2_n43) );
  OAI21_X1 reg_2_U5 ( .B1(reg_2_n36), .B2(reg_2_n22), .A(reg_2_n43), .ZN(
        reg_2_n29) );
  NAND2_X1 reg_2_U4 ( .A1(reg_2_n23), .A2(q_reg1[0]), .ZN(reg_2_n44) );
  OAI21_X1 reg_2_U3 ( .B1(reg_2_n37), .B2(reg_2_n22), .A(reg_2_n44), .ZN(
        reg_2_n30) );
  BUF_X1 reg_2_U2 ( .A(vin), .Z(reg_2_n22) );
  DFFR_X1 reg_2_Q_reg_0_ ( .D(reg_2_n30), .CK(clock), .RN(rst_n), .Q(q_reg2[0]), .QN(reg_2_n37) );
  DFFR_X1 reg_2_Q_reg_1_ ( .D(reg_2_n29), .CK(clock), .RN(rst_n), .Q(q_reg2[1]), .QN(reg_2_n36) );
  DFFR_X1 reg_2_Q_reg_2_ ( .D(reg_2_n28), .CK(clock), .RN(rst_n), .Q(q_reg2[2]), .QN(reg_2_n35) );
  DFFR_X1 reg_2_Q_reg_3_ ( .D(reg_2_n27), .CK(clock), .RN(rst_n), .Q(q_reg2[3]), .QN(reg_2_n34) );
  DFFR_X1 reg_2_Q_reg_4_ ( .D(reg_2_n26), .CK(clock), .RN(rst_n), .Q(q_reg2[4]), .QN(reg_2_n33) );
  DFFR_X1 reg_2_Q_reg_5_ ( .D(reg_2_n25), .CK(clock), .RN(rst_n), .Q(q_reg2[5]), .QN(reg_2_n32) );
  DFFR_X1 reg_2_Q_reg_6_ ( .D(reg_2_n24), .CK(clock), .RN(rst_n), .Q(q_reg2[6]), .QN(reg_2_n31) );
  BUF_X1 reg_3_U17 ( .A(vin), .Z(reg_3_n23) );
  NAND2_X1 reg_3_U16 ( .A1(q_reg2[6]), .A2(reg_3_n22), .ZN(reg_3_n38) );
  OAI21_X1 reg_3_U15 ( .B1(reg_3_n31), .B2(reg_3_n22), .A(reg_3_n38), .ZN(
        reg_3_n24) );
  NAND2_X1 reg_3_U14 ( .A1(q_reg2[5]), .A2(reg_3_n22), .ZN(reg_3_n39) );
  OAI21_X1 reg_3_U13 ( .B1(reg_3_n32), .B2(reg_3_n23), .A(reg_3_n39), .ZN(
        reg_3_n25) );
  NAND2_X1 reg_3_U12 ( .A1(q_reg2[4]), .A2(reg_3_n22), .ZN(reg_3_n40) );
  OAI21_X1 reg_3_U11 ( .B1(reg_3_n33), .B2(reg_3_n22), .A(reg_3_n40), .ZN(
        reg_3_n26) );
  NAND2_X1 reg_3_U10 ( .A1(q_reg2[2]), .A2(reg_3_n22), .ZN(reg_3_n42) );
  OAI21_X1 reg_3_U9 ( .B1(reg_3_n35), .B2(reg_3_n22), .A(reg_3_n42), .ZN(
        reg_3_n28) );
  NAND2_X1 reg_3_U8 ( .A1(q_reg2[1]), .A2(reg_3_n22), .ZN(reg_3_n43) );
  OAI21_X1 reg_3_U7 ( .B1(reg_3_n36), .B2(reg_3_n22), .A(reg_3_n43), .ZN(
        reg_3_n29) );
  NAND2_X1 reg_3_U6 ( .A1(reg_3_n23), .A2(q_reg2[0]), .ZN(reg_3_n44) );
  OAI21_X1 reg_3_U5 ( .B1(reg_3_n37), .B2(reg_3_n22), .A(reg_3_n44), .ZN(
        reg_3_n30) );
  NAND2_X1 reg_3_U4 ( .A1(q_reg2[3]), .A2(reg_3_n22), .ZN(reg_3_n41) );
  OAI21_X1 reg_3_U3 ( .B1(reg_3_n34), .B2(reg_3_n22), .A(reg_3_n41), .ZN(
        reg_3_n27) );
  BUF_X1 reg_3_U2 ( .A(vin), .Z(reg_3_n22) );
  DFFR_X1 reg_3_Q_reg_0_ ( .D(reg_3_n30), .CK(clock), .RN(rst_n), .Q(q_reg3[0]), .QN(reg_3_n37) );
  DFFR_X1 reg_3_Q_reg_1_ ( .D(reg_3_n29), .CK(clock), .RN(rst_n), .Q(q_reg3[1]), .QN(reg_3_n36) );
  DFFR_X1 reg_3_Q_reg_2_ ( .D(reg_3_n28), .CK(clock), .RN(rst_n), .Q(q_reg3[2]), .QN(reg_3_n35) );
  DFFR_X1 reg_3_Q_reg_3_ ( .D(reg_3_n27), .CK(clock), .RN(rst_n), .Q(q_reg3[3]), .QN(reg_3_n34) );
  DFFR_X1 reg_3_Q_reg_4_ ( .D(reg_3_n26), .CK(clock), .RN(rst_n), .Q(q_reg3[4]), .QN(reg_3_n33) );
  DFFR_X1 reg_3_Q_reg_5_ ( .D(reg_3_n25), .CK(clock), .RN(rst_n), .Q(q_reg3[5]), .QN(reg_3_n32) );
  DFFR_X1 reg_3_Q_reg_6_ ( .D(reg_3_n24), .CK(clock), .RN(rst_n), .Q(q_reg3[6]), .QN(reg_3_n31) );
  BUF_X1 reg_dout_U19 ( .A(vin), .Z(reg_dout_n26) );
  BUF_X1 reg_dout_U18 ( .A(vin), .Z(reg_dout_n25) );
  NAND2_X1 reg_dout_U17 ( .A1(TMPb[7]), .A2(reg_dout_n25), .ZN(reg_dout_n5) );
  OAI21_X1 reg_dout_U16 ( .B1(reg_dout_n16), .B2(reg_dout_n25), .A(reg_dout_n5), .ZN(reg_dout_n24) );
  NAND2_X1 reg_dout_U15 ( .A1(TMPb[5]), .A2(reg_dout_n25), .ZN(reg_dout_n3) );
  OAI21_X1 reg_dout_U14 ( .B1(reg_dout_n14), .B2(reg_dout_n25), .A(reg_dout_n3), .ZN(reg_dout_n22) );
  NAND2_X1 reg_dout_U13 ( .A1(TMPb[2]), .A2(reg_dout_n25), .ZN(reg_dout_n8) );
  OAI21_X1 reg_dout_U12 ( .B1(reg_dout_n11), .B2(reg_dout_n26), .A(reg_dout_n8), .ZN(reg_dout_n19) );
  NAND2_X1 reg_dout_U11 ( .A1(TMPb[1]), .A2(reg_dout_n25), .ZN(reg_dout_n7) );
  OAI21_X1 reg_dout_U10 ( .B1(reg_dout_n10), .B2(reg_dout_n26), .A(reg_dout_n7), .ZN(reg_dout_n18) );
  NAND2_X1 reg_dout_U9 ( .A1(TMPb[6]), .A2(reg_dout_n25), .ZN(reg_dout_n4) );
  OAI21_X1 reg_dout_U8 ( .B1(reg_dout_n15), .B2(reg_dout_n25), .A(reg_dout_n4), 
        .ZN(reg_dout_n23) );
  NAND2_X1 reg_dout_U7 ( .A1(TMPb[4]), .A2(reg_dout_n25), .ZN(reg_dout_n2) );
  OAI21_X1 reg_dout_U6 ( .B1(reg_dout_n13), .B2(reg_dout_n25), .A(reg_dout_n2), 
        .ZN(reg_dout_n21) );
  NAND2_X1 reg_dout_U5 ( .A1(reg_dout_n26), .A2(TMPb[3]), .ZN(reg_dout_n1) );
  OAI21_X1 reg_dout_U4 ( .B1(reg_dout_n12), .B2(reg_dout_n26), .A(reg_dout_n1), 
        .ZN(reg_dout_n20) );
  NAND2_X1 reg_dout_U3 ( .A1(TMPb[0]), .A2(reg_dout_n25), .ZN(reg_dout_n6) );
  OAI21_X1 reg_dout_U2 ( .B1(reg_dout_n9), .B2(reg_dout_n25), .A(reg_dout_n6), 
        .ZN(reg_dout_n17) );
  DFFR_X1 reg_dout_Q_reg_0_ ( .D(reg_dout_n17), .CK(clock), .RN(rst_n), .Q(
        dout[1]), .QN(reg_dout_n9) );
  DFFR_X1 reg_dout_Q_reg_1_ ( .D(reg_dout_n18), .CK(clock), .RN(rst_n), .Q(
        dout[2]), .QN(reg_dout_n10) );
  DFFR_X1 reg_dout_Q_reg_2_ ( .D(reg_dout_n19), .CK(clock), .RN(rst_n), .Q(
        dout[3]), .QN(reg_dout_n11) );
  DFFR_X1 reg_dout_Q_reg_3_ ( .D(reg_dout_n20), .CK(clock), .RN(rst_n), .Q(
        dout[4]), .QN(reg_dout_n12) );
  DFFR_X1 reg_dout_Q_reg_4_ ( .D(reg_dout_n21), .CK(clock), .RN(rst_n), .Q(
        dout[5]), .QN(reg_dout_n13) );
  DFFR_X1 reg_dout_Q_reg_5_ ( .D(reg_dout_n22), .CK(clock), .RN(rst_n), .Q(
        dout[6]), .QN(reg_dout_n14) );
  DFFR_X1 reg_dout_Q_reg_6_ ( .D(reg_dout_n23), .CK(clock), .RN(rst_n), .Q(
        dout[7]), .QN(reg_dout_n15) );
  DFFR_X1 reg_dout_Q_reg_7_ ( .D(reg_dout_n24), .CK(clock), .RN(rst_n), .Q(
        dout[8]), .QN(reg_dout_n16) );
  NAND2_X1 ff_1_U3 ( .A1(1'b1), .A2(vin), .ZN(ff_1_n1) );
  OAI21_X1 ff_1_U2 ( .B1(ff_1_n2), .B2(1'b1), .A(ff_1_n1), .ZN(ff_1_n3) );
  DFFR_X1 ff_1_Q_reg ( .D(ff_1_n3), .CK(clock), .RN(rst_n), .Q(vout), .QN(
        ff_1_n2) );
  NOR2_X1 mult_50_U178 ( .A1(mult_50_n167), .A2(mult_50_n177), .ZN(
        mult_50_n100) );
  NAND2_X1 mult_50_U177 ( .A1(TMPa[2]), .A2(b0[8]), .ZN(mult_50_n101) );
  NOR2_X1 mult_50_U176 ( .A1(mult_50_n172), .A2(mult_50_n168), .ZN(
        mult_50_n102) );
  NOR2_X1 mult_50_U175 ( .A1(mult_50_n173), .A2(mult_50_n168), .ZN(
        mult_50_n103) );
  NOR2_X1 mult_50_U174 ( .A1(mult_50_n174), .A2(mult_50_n168), .ZN(
        mult_50_n104) );
  NOR2_X1 mult_50_U173 ( .A1(mult_50_n175), .A2(mult_50_n168), .ZN(
        mult_50_n105) );
  NOR2_X1 mult_50_U172 ( .A1(mult_50_n176), .A2(mult_50_n168), .ZN(
        mult_50_n106) );
  NAND2_X1 mult_50_U171 ( .A1(TMPa[1]), .A2(b0[8]), .ZN(mult_50_n108) );
  NOR2_X1 mult_50_U170 ( .A1(mult_50_n172), .A2(mult_50_n170), .ZN(
        mult_50_n109) );
  NOR2_X1 mult_50_U169 ( .A1(mult_50_n173), .A2(mult_50_n170), .ZN(
        mult_50_n110) );
  NOR2_X1 mult_50_U168 ( .A1(mult_50_n174), .A2(mult_50_n170), .ZN(
        mult_50_n111) );
  NOR2_X1 mult_50_U167 ( .A1(mult_50_n175), .A2(mult_50_n170), .ZN(
        mult_50_n112) );
  NOR2_X1 mult_50_U166 ( .A1(mult_50_n176), .A2(mult_50_n170), .ZN(
        mult_50_n113) );
  NAND2_X1 mult_50_U165 ( .A1(TMPa[0]), .A2(b0[8]), .ZN(mult_50_n115) );
  NOR2_X1 mult_50_U164 ( .A1(mult_50_n172), .A2(mult_50_n171), .ZN(
        mult_50_n116) );
  NOR2_X1 mult_50_U163 ( .A1(mult_50_n173), .A2(mult_50_n171), .ZN(
        mult_50_n117) );
  NOR2_X1 mult_50_U162 ( .A1(mult_50_n174), .A2(mult_50_n171), .ZN(
        mult_50_n118) );
  NOR2_X1 mult_50_U161 ( .A1(mult_50_n175), .A2(mult_50_n171), .ZN(
        mult_50_n119) );
  NAND2_X1 mult_50_U160 ( .A1(b0[6]), .A2(TMPa[3]), .ZN(mult_50_n184) );
  NAND2_X1 mult_50_U159 ( .A1(TMPa[5]), .A2(b0[4]), .ZN(mult_50_n183) );
  NAND2_X1 mult_50_U158 ( .A1(mult_50_n184), .A2(mult_50_n183), .ZN(
        mult_50_n41) );
  XNOR2_X1 mult_50_U157 ( .A(mult_50_n183), .B(mult_50_n184), .ZN(mult_50_n42)
         );
  AND2_X1 mult_50_U156 ( .A1(b0[8]), .A2(TMPa[6]), .ZN(mult_50_n73) );
  NAND2_X1 mult_50_U155 ( .A1(TMPa[6]), .A2(b0[7]), .ZN(mult_50_n74) );
  NAND2_X1 mult_50_U154 ( .A1(TMPa[6]), .A2(b0[6]), .ZN(mult_50_n75) );
  NAND2_X1 mult_50_U153 ( .A1(TMPa[6]), .A2(b0[5]), .ZN(mult_50_n76) );
  NAND2_X1 mult_50_U152 ( .A1(TMPa[6]), .A2(b0[4]), .ZN(mult_50_n77) );
  NAND2_X1 mult_50_U151 ( .A1(TMPa[6]), .A2(b0[3]), .ZN(mult_50_n78) );
  NAND2_X1 mult_50_U150 ( .A1(TMPa[6]), .A2(b0[2]), .ZN(mult_50_n79) );
  NOR4_X1 mult_50_U149 ( .A1(mult_50_n170), .A2(mult_50_n171), .A3(
        mult_50_n177), .A4(mult_50_n176), .ZN(mult_50_n181) );
  NOR2_X1 mult_50_U148 ( .A1(mult_50_n168), .A2(mult_50_n177), .ZN(
        mult_50_n182) );
  AOI222_X1 mult_50_U147 ( .A1(mult_50_n72), .A2(mult_50_n181), .B1(
        mult_50_n182), .B2(mult_50_n72), .C1(mult_50_n182), .C2(mult_50_n181), 
        .ZN(mult_50_n180) );
  OAI222_X1 mult_50_U146 ( .A1(mult_50_n180), .A2(mult_50_n169), .B1(
        mult_50_n169), .B2(mult_50_n166), .C1(mult_50_n180), .C2(mult_50_n166), 
        .ZN(mult_50_n179) );
  AOI222_X1 mult_50_U145 ( .A1(mult_50_n179), .A2(mult_50_n62), .B1(
        mult_50_n179), .B2(mult_50_n64), .C1(mult_50_n64), .C2(mult_50_n62), 
        .ZN(mult_50_n178) );
  OAI222_X1 mult_50_U144 ( .A1(mult_50_n178), .A2(mult_50_n162), .B1(
        mult_50_n178), .B2(mult_50_n164), .C1(mult_50_n164), .C2(mult_50_n162), 
        .ZN(mult_50_n8) );
  NAND2_X1 mult_50_U143 ( .A1(TMPa[5]), .A2(b0[8]), .ZN(mult_50_n80) );
  NOR2_X1 mult_50_U142 ( .A1(mult_50_n172), .A2(mult_50_n163), .ZN(mult_50_n81) );
  NOR2_X1 mult_50_U141 ( .A1(mult_50_n173), .A2(mult_50_n163), .ZN(mult_50_n82) );
  NOR2_X1 mult_50_U140 ( .A1(mult_50_n174), .A2(mult_50_n163), .ZN(mult_50_n83) );
  NOR2_X1 mult_50_U139 ( .A1(mult_50_n176), .A2(mult_50_n163), .ZN(mult_50_n85) );
  NOR2_X1 mult_50_U138 ( .A1(mult_50_n177), .A2(mult_50_n163), .ZN(mult_50_n86) );
  NAND2_X1 mult_50_U137 ( .A1(TMPa[4]), .A2(b0[8]), .ZN(mult_50_n87) );
  NOR2_X1 mult_50_U136 ( .A1(mult_50_n172), .A2(mult_50_n165), .ZN(mult_50_n88) );
  NOR2_X1 mult_50_U135 ( .A1(mult_50_n165), .A2(mult_50_n173), .ZN(mult_50_n89) );
  NOR2_X1 mult_50_U134 ( .A1(mult_50_n174), .A2(mult_50_n165), .ZN(mult_50_n90) );
  NOR2_X1 mult_50_U133 ( .A1(mult_50_n175), .A2(mult_50_n165), .ZN(mult_50_n91) );
  NOR2_X1 mult_50_U132 ( .A1(mult_50_n176), .A2(mult_50_n165), .ZN(mult_50_n92) );
  NOR2_X1 mult_50_U131 ( .A1(mult_50_n165), .A2(mult_50_n177), .ZN(mult_50_n93) );
  NAND2_X1 mult_50_U130 ( .A1(b0[8]), .A2(TMPa[3]), .ZN(mult_50_n94) );
  NOR2_X1 mult_50_U129 ( .A1(mult_50_n167), .A2(mult_50_n172), .ZN(mult_50_n95) );
  NOR2_X1 mult_50_U128 ( .A1(mult_50_n167), .A2(mult_50_n174), .ZN(mult_50_n97) );
  NOR2_X1 mult_50_U127 ( .A1(mult_50_n167), .A2(mult_50_n175), .ZN(mult_50_n98) );
  NOR2_X1 mult_50_U126 ( .A1(mult_50_n167), .A2(mult_50_n176), .ZN(mult_50_n99) );
  INV_X1 mult_50_U125 ( .A(b0[2]), .ZN(mult_50_n177) );
  INV_X1 mult_50_U124 ( .A(b0[6]), .ZN(mult_50_n173) );
  INV_X1 mult_50_U123 ( .A(b0[4]), .ZN(mult_50_n175) );
  INV_X1 mult_50_U122 ( .A(b0[3]), .ZN(mult_50_n176) );
  INV_X1 mult_50_U121 ( .A(b0[5]), .ZN(mult_50_n174) );
  INV_X1 mult_50_U120 ( .A(b0[7]), .ZN(mult_50_n172) );
  INV_X1 mult_50_U119 ( .A(mult_50_n1), .ZN(TMPtmpa_b0_13_) );
  INV_X1 mult_50_U118 ( .A(mult_50_n70), .ZN(mult_50_n166) );
  INV_X1 mult_50_U117 ( .A(mult_50_n68), .ZN(mult_50_n169) );
  INV_X1 mult_50_U116 ( .A(TMPa[0]), .ZN(mult_50_n171) );
  INV_X1 mult_50_U115 ( .A(mult_50_n61), .ZN(mult_50_n164) );
  INV_X1 mult_50_U114 ( .A(TMPa[5]), .ZN(mult_50_n163) );
  INV_X1 mult_50_U113 ( .A(TMPa[3]), .ZN(mult_50_n167) );
  INV_X1 mult_50_U112 ( .A(TMPa[2]), .ZN(mult_50_n168) );
  INV_X1 mult_50_U111 ( .A(TMPa[1]), .ZN(mult_50_n170) );
  INV_X1 mult_50_U110 ( .A(TMPa[4]), .ZN(mult_50_n165) );
  INV_X1 mult_50_U109 ( .A(mult_50_n54), .ZN(mult_50_n162) );
  HA_X1 mult_50_U44 ( .A(mult_50_n113), .B(mult_50_n119), .CO(mult_50_n71), 
        .S(mult_50_n72) );
  HA_X1 mult_50_U43 ( .A(mult_50_n100), .B(mult_50_n106), .CO(mult_50_n69), 
        .S(mult_50_n70) );
  FA_X1 mult_50_U42 ( .A(mult_50_n112), .B(mult_50_n118), .CI(mult_50_n71), 
        .CO(mult_50_n67), .S(mult_50_n68) );
  HA_X1 mult_50_U41 ( .A(mult_50_n93), .B(mult_50_n99), .CO(mult_50_n65), .S(
        mult_50_n66) );
  FA_X1 mult_50_U40 ( .A(mult_50_n105), .B(mult_50_n117), .CI(mult_50_n111), 
        .CO(mult_50_n63), .S(mult_50_n64) );
  FA_X1 mult_50_U39 ( .A(mult_50_n66), .B(mult_50_n69), .CI(mult_50_n67), .CO(
        mult_50_n61), .S(mult_50_n62) );
  HA_X1 mult_50_U38 ( .A(mult_50_n86), .B(mult_50_n92), .CO(mult_50_n59), .S(
        mult_50_n60) );
  FA_X1 mult_50_U37 ( .A(mult_50_n98), .B(mult_50_n116), .CI(mult_50_n104), 
        .CO(mult_50_n57), .S(mult_50_n58) );
  FA_X1 mult_50_U36 ( .A(mult_50_n65), .B(mult_50_n110), .CI(mult_50_n60), 
        .CO(mult_50_n55), .S(mult_50_n56) );
  FA_X1 mult_50_U35 ( .A(mult_50_n58), .B(mult_50_n63), .CI(mult_50_n56), .CO(
        mult_50_n53), .S(mult_50_n54) );
  HA_X1 mult_50_U34 ( .A(mult_50_n97), .B(mult_50_n91), .CO(mult_50_n51), .S(
        mult_50_n52) );
  FA_X1 mult_50_U33 ( .A(mult_50_n85), .B(mult_50_n103), .CI(mult_50_n109), 
        .CO(mult_50_n49), .S(mult_50_n50) );
  FA_X1 mult_50_U32 ( .A(mult_50_n79), .B(mult_50_n115), .CI(mult_50_n59), 
        .CO(mult_50_n47), .S(mult_50_n48) );
  FA_X1 mult_50_U31 ( .A(mult_50_n57), .B(mult_50_n52), .CI(mult_50_n50), .CO(
        mult_50_n45), .S(mult_50_n46) );
  FA_X1 mult_50_U30 ( .A(mult_50_n48), .B(mult_50_n55), .CI(mult_50_n46), .CO(
        mult_50_n43), .S(mult_50_n44) );
  FA_X1 mult_50_U27 ( .A(mult_50_n102), .B(mult_50_n90), .CI(mult_50_n108), 
        .CO(mult_50_n39), .S(mult_50_n40) );
  FA_X1 mult_50_U26 ( .A(mult_50_n51), .B(mult_50_n78), .CI(mult_50_n42), .CO(
        mult_50_n37), .S(mult_50_n38) );
  FA_X1 mult_50_U25 ( .A(mult_50_n47), .B(mult_50_n49), .CI(mult_50_n40), .CO(
        mult_50_n35), .S(mult_50_n36) );
  FA_X1 mult_50_U24 ( .A(mult_50_n45), .B(mult_50_n38), .CI(mult_50_n36), .CO(
        mult_50_n33), .S(mult_50_n34) );
  FA_X1 mult_50_U23 ( .A(mult_50_n83), .B(mult_50_n89), .CI(mult_50_n95), .CO(
        mult_50_n31), .S(mult_50_n32) );
  FA_X1 mult_50_U22 ( .A(mult_50_n77), .B(mult_50_n101), .CI(mult_50_n41), 
        .CO(mult_50_n29), .S(mult_50_n30) );
  FA_X1 mult_50_U21 ( .A(mult_50_n32), .B(mult_50_n39), .CI(mult_50_n37), .CO(
        mult_50_n27), .S(mult_50_n28) );
  FA_X1 mult_50_U20 ( .A(mult_50_n35), .B(mult_50_n30), .CI(mult_50_n28), .CO(
        mult_50_n25), .S(mult_50_n26) );
  FA_X1 mult_50_U19 ( .A(mult_50_n82), .B(mult_50_n88), .CI(mult_50_n94), .CO(
        mult_50_n23), .S(mult_50_n24) );
  FA_X1 mult_50_U18 ( .A(mult_50_n31), .B(mult_50_n76), .CI(mult_50_n29), .CO(
        mult_50_n21), .S(mult_50_n22) );
  FA_X1 mult_50_U17 ( .A(mult_50_n27), .B(mult_50_n24), .CI(mult_50_n22), .CO(
        mult_50_n19), .S(mult_50_n20) );
  FA_X1 mult_50_U16 ( .A(mult_50_n87), .B(mult_50_n81), .CI(mult_50_n75), .CO(
        mult_50_n17), .S(mult_50_n18) );
  FA_X1 mult_50_U15 ( .A(mult_50_n18), .B(mult_50_n23), .CI(mult_50_n21), .CO(
        mult_50_n15), .S(mult_50_n16) );
  FA_X1 mult_50_U14 ( .A(mult_50_n74), .B(mult_50_n80), .CI(mult_50_n17), .CO(
        mult_50_n13), .S(mult_50_n14) );
  FA_X1 mult_50_U8 ( .A(mult_50_n44), .B(mult_50_n53), .CI(mult_50_n8), .CO(
        mult_50_n7), .S(TMPtmpa_b0_6_) );
  FA_X1 mult_50_U7 ( .A(mult_50_n34), .B(mult_50_n43), .CI(mult_50_n7), .CO(
        mult_50_n6), .S(TMPtmpa_b0_7_) );
  FA_X1 mult_50_U6 ( .A(mult_50_n26), .B(mult_50_n33), .CI(mult_50_n6), .CO(
        mult_50_n5), .S(TMPtmpa_b0_8_) );
  FA_X1 mult_50_U5 ( .A(mult_50_n20), .B(mult_50_n25), .CI(mult_50_n5), .CO(
        mult_50_n4), .S(TMPtmpa_b0_9_) );
  FA_X1 mult_50_U4 ( .A(mult_50_n16), .B(mult_50_n19), .CI(mult_50_n4), .CO(
        mult_50_n3), .S(TMPtmpa_b0_10_) );
  FA_X1 mult_50_U3 ( .A(mult_50_n15), .B(mult_50_n14), .CI(mult_50_n3), .CO(
        mult_50_n2), .S(TMPtmpa_b0_11_) );
  FA_X1 mult_50_U2 ( .A(mult_50_n13), .B(mult_50_n73), .CI(mult_50_n2), .CO(
        mult_50_n1), .S(TMPtmpa_b0_12_) );
  NOR2_X1 mult_51_U178 ( .A1(mult_51_n167), .A2(mult_51_n177), .ZN(
        mult_51_n100) );
  NAND2_X1 mult_51_U177 ( .A1(q_reg1[2]), .A2(b1[8]), .ZN(mult_51_n101) );
  NOR2_X1 mult_51_U176 ( .A1(mult_51_n172), .A2(mult_51_n168), .ZN(
        mult_51_n102) );
  NOR2_X1 mult_51_U175 ( .A1(mult_51_n173), .A2(mult_51_n168), .ZN(
        mult_51_n103) );
  NOR2_X1 mult_51_U174 ( .A1(mult_51_n174), .A2(mult_51_n168), .ZN(
        mult_51_n104) );
  NOR2_X1 mult_51_U173 ( .A1(mult_51_n175), .A2(mult_51_n168), .ZN(
        mult_51_n105) );
  NOR2_X1 mult_51_U172 ( .A1(mult_51_n176), .A2(mult_51_n168), .ZN(
        mult_51_n106) );
  NAND2_X1 mult_51_U171 ( .A1(q_reg1[1]), .A2(b1[8]), .ZN(mult_51_n108) );
  NOR2_X1 mult_51_U170 ( .A1(mult_51_n172), .A2(mult_51_n170), .ZN(
        mult_51_n109) );
  NOR2_X1 mult_51_U169 ( .A1(mult_51_n173), .A2(mult_51_n170), .ZN(
        mult_51_n110) );
  NOR2_X1 mult_51_U168 ( .A1(mult_51_n174), .A2(mult_51_n170), .ZN(
        mult_51_n111) );
  NOR2_X1 mult_51_U167 ( .A1(mult_51_n175), .A2(mult_51_n170), .ZN(
        mult_51_n112) );
  NOR2_X1 mult_51_U166 ( .A1(mult_51_n176), .A2(mult_51_n170), .ZN(
        mult_51_n113) );
  NAND2_X1 mult_51_U165 ( .A1(q_reg1[0]), .A2(b1[8]), .ZN(mult_51_n115) );
  NOR2_X1 mult_51_U164 ( .A1(mult_51_n172), .A2(mult_51_n171), .ZN(
        mult_51_n116) );
  NOR2_X1 mult_51_U163 ( .A1(mult_51_n173), .A2(mult_51_n171), .ZN(
        mult_51_n117) );
  NOR2_X1 mult_51_U162 ( .A1(mult_51_n174), .A2(mult_51_n171), .ZN(
        mult_51_n118) );
  NOR2_X1 mult_51_U161 ( .A1(mult_51_n175), .A2(mult_51_n171), .ZN(
        mult_51_n119) );
  NAND2_X1 mult_51_U160 ( .A1(b1[6]), .A2(q_reg1[3]), .ZN(mult_51_n184) );
  NAND2_X1 mult_51_U159 ( .A1(q_reg1[5]), .A2(b1[4]), .ZN(mult_51_n183) );
  NAND2_X1 mult_51_U158 ( .A1(mult_51_n184), .A2(mult_51_n183), .ZN(
        mult_51_n41) );
  XNOR2_X1 mult_51_U157 ( .A(mult_51_n183), .B(mult_51_n184), .ZN(mult_51_n42)
         );
  AND2_X1 mult_51_U156 ( .A1(b1[8]), .A2(q_reg1[6]), .ZN(mult_51_n73) );
  NAND2_X1 mult_51_U155 ( .A1(q_reg1[6]), .A2(b1[7]), .ZN(mult_51_n74) );
  NAND2_X1 mult_51_U154 ( .A1(q_reg1[6]), .A2(b1[6]), .ZN(mult_51_n75) );
  NAND2_X1 mult_51_U153 ( .A1(q_reg1[6]), .A2(b1[5]), .ZN(mult_51_n76) );
  NAND2_X1 mult_51_U152 ( .A1(q_reg1[6]), .A2(b1[4]), .ZN(mult_51_n77) );
  NAND2_X1 mult_51_U151 ( .A1(q_reg1[6]), .A2(b1[3]), .ZN(mult_51_n78) );
  NAND2_X1 mult_51_U150 ( .A1(q_reg1[6]), .A2(b1[2]), .ZN(mult_51_n79) );
  NOR4_X1 mult_51_U149 ( .A1(mult_51_n170), .A2(mult_51_n171), .A3(
        mult_51_n177), .A4(mult_51_n176), .ZN(mult_51_n181) );
  NOR2_X1 mult_51_U148 ( .A1(mult_51_n168), .A2(mult_51_n177), .ZN(
        mult_51_n182) );
  AOI222_X1 mult_51_U147 ( .A1(mult_51_n72), .A2(mult_51_n181), .B1(
        mult_51_n182), .B2(mult_51_n72), .C1(mult_51_n182), .C2(mult_51_n181), 
        .ZN(mult_51_n180) );
  OAI222_X1 mult_51_U146 ( .A1(mult_51_n180), .A2(mult_51_n169), .B1(
        mult_51_n169), .B2(mult_51_n166), .C1(mult_51_n180), .C2(mult_51_n166), 
        .ZN(mult_51_n179) );
  AOI222_X1 mult_51_U145 ( .A1(mult_51_n179), .A2(mult_51_n62), .B1(
        mult_51_n179), .B2(mult_51_n64), .C1(mult_51_n64), .C2(mult_51_n62), 
        .ZN(mult_51_n178) );
  OAI222_X1 mult_51_U144 ( .A1(mult_51_n178), .A2(mult_51_n162), .B1(
        mult_51_n178), .B2(mult_51_n164), .C1(mult_51_n164), .C2(mult_51_n162), 
        .ZN(mult_51_n8) );
  NAND2_X1 mult_51_U143 ( .A1(q_reg1[5]), .A2(b1[8]), .ZN(mult_51_n80) );
  NOR2_X1 mult_51_U142 ( .A1(mult_51_n172), .A2(mult_51_n163), .ZN(mult_51_n81) );
  NOR2_X1 mult_51_U141 ( .A1(mult_51_n173), .A2(mult_51_n163), .ZN(mult_51_n82) );
  NOR2_X1 mult_51_U140 ( .A1(mult_51_n174), .A2(mult_51_n163), .ZN(mult_51_n83) );
  NOR2_X1 mult_51_U139 ( .A1(mult_51_n176), .A2(mult_51_n163), .ZN(mult_51_n85) );
  NOR2_X1 mult_51_U138 ( .A1(mult_51_n177), .A2(mult_51_n163), .ZN(mult_51_n86) );
  NAND2_X1 mult_51_U137 ( .A1(q_reg1[4]), .A2(b1[8]), .ZN(mult_51_n87) );
  NOR2_X1 mult_51_U136 ( .A1(mult_51_n172), .A2(mult_51_n165), .ZN(mult_51_n88) );
  NOR2_X1 mult_51_U135 ( .A1(mult_51_n165), .A2(mult_51_n173), .ZN(mult_51_n89) );
  NOR2_X1 mult_51_U134 ( .A1(mult_51_n174), .A2(mult_51_n165), .ZN(mult_51_n90) );
  NOR2_X1 mult_51_U133 ( .A1(mult_51_n175), .A2(mult_51_n165), .ZN(mult_51_n91) );
  NOR2_X1 mult_51_U132 ( .A1(mult_51_n176), .A2(mult_51_n165), .ZN(mult_51_n92) );
  NOR2_X1 mult_51_U131 ( .A1(mult_51_n165), .A2(mult_51_n177), .ZN(mult_51_n93) );
  NAND2_X1 mult_51_U130 ( .A1(b1[8]), .A2(q_reg1[3]), .ZN(mult_51_n94) );
  NOR2_X1 mult_51_U129 ( .A1(mult_51_n167), .A2(mult_51_n172), .ZN(mult_51_n95) );
  NOR2_X1 mult_51_U128 ( .A1(mult_51_n167), .A2(mult_51_n174), .ZN(mult_51_n97) );
  NOR2_X1 mult_51_U127 ( .A1(mult_51_n167), .A2(mult_51_n175), .ZN(mult_51_n98) );
  NOR2_X1 mult_51_U126 ( .A1(mult_51_n167), .A2(mult_51_n176), .ZN(mult_51_n99) );
  INV_X1 mult_51_U125 ( .A(b1[2]), .ZN(mult_51_n177) );
  INV_X1 mult_51_U124 ( .A(b1[6]), .ZN(mult_51_n173) );
  INV_X1 mult_51_U123 ( .A(b1[4]), .ZN(mult_51_n175) );
  INV_X1 mult_51_U122 ( .A(q_reg1[0]), .ZN(mult_51_n171) );
  INV_X1 mult_51_U121 ( .A(q_reg1[5]), .ZN(mult_51_n163) );
  INV_X1 mult_51_U120 ( .A(q_reg1[3]), .ZN(mult_51_n167) );
  INV_X1 mult_51_U119 ( .A(b1[3]), .ZN(mult_51_n176) );
  INV_X1 mult_51_U118 ( .A(q_reg1[2]), .ZN(mult_51_n168) );
  INV_X1 mult_51_U117 ( .A(q_reg1[1]), .ZN(mult_51_n170) );
  INV_X1 mult_51_U116 ( .A(q_reg1[4]), .ZN(mult_51_n165) );
  INV_X1 mult_51_U115 ( .A(b1[7]), .ZN(mult_51_n172) );
  INV_X1 mult_51_U114 ( .A(b1[5]), .ZN(mult_51_n174) );
  INV_X1 mult_51_U113 ( .A(mult_51_n1), .ZN(TMPq1_b1_13_) );
  INV_X1 mult_51_U112 ( .A(mult_51_n68), .ZN(mult_51_n169) );
  INV_X1 mult_51_U111 ( .A(mult_51_n54), .ZN(mult_51_n162) );
  INV_X1 mult_51_U110 ( .A(mult_51_n61), .ZN(mult_51_n164) );
  INV_X1 mult_51_U109 ( .A(mult_51_n70), .ZN(mult_51_n166) );
  HA_X1 mult_51_U44 ( .A(mult_51_n113), .B(mult_51_n119), .CO(mult_51_n71), 
        .S(mult_51_n72) );
  HA_X1 mult_51_U43 ( .A(mult_51_n100), .B(mult_51_n106), .CO(mult_51_n69), 
        .S(mult_51_n70) );
  FA_X1 mult_51_U42 ( .A(mult_51_n112), .B(mult_51_n118), .CI(mult_51_n71), 
        .CO(mult_51_n67), .S(mult_51_n68) );
  HA_X1 mult_51_U41 ( .A(mult_51_n93), .B(mult_51_n99), .CO(mult_51_n65), .S(
        mult_51_n66) );
  FA_X1 mult_51_U40 ( .A(mult_51_n105), .B(mult_51_n117), .CI(mult_51_n111), 
        .CO(mult_51_n63), .S(mult_51_n64) );
  FA_X1 mult_51_U39 ( .A(mult_51_n66), .B(mult_51_n69), .CI(mult_51_n67), .CO(
        mult_51_n61), .S(mult_51_n62) );
  HA_X1 mult_51_U38 ( .A(mult_51_n86), .B(mult_51_n92), .CO(mult_51_n59), .S(
        mult_51_n60) );
  FA_X1 mult_51_U37 ( .A(mult_51_n98), .B(mult_51_n116), .CI(mult_51_n104), 
        .CO(mult_51_n57), .S(mult_51_n58) );
  FA_X1 mult_51_U36 ( .A(mult_51_n65), .B(mult_51_n110), .CI(mult_51_n60), 
        .CO(mult_51_n55), .S(mult_51_n56) );
  FA_X1 mult_51_U35 ( .A(mult_51_n58), .B(mult_51_n63), .CI(mult_51_n56), .CO(
        mult_51_n53), .S(mult_51_n54) );
  HA_X1 mult_51_U34 ( .A(mult_51_n97), .B(mult_51_n91), .CO(mult_51_n51), .S(
        mult_51_n52) );
  FA_X1 mult_51_U33 ( .A(mult_51_n85), .B(mult_51_n103), .CI(mult_51_n109), 
        .CO(mult_51_n49), .S(mult_51_n50) );
  FA_X1 mult_51_U32 ( .A(mult_51_n79), .B(mult_51_n115), .CI(mult_51_n59), 
        .CO(mult_51_n47), .S(mult_51_n48) );
  FA_X1 mult_51_U31 ( .A(mult_51_n57), .B(mult_51_n52), .CI(mult_51_n50), .CO(
        mult_51_n45), .S(mult_51_n46) );
  FA_X1 mult_51_U30 ( .A(mult_51_n48), .B(mult_51_n55), .CI(mult_51_n46), .CO(
        mult_51_n43), .S(mult_51_n44) );
  FA_X1 mult_51_U27 ( .A(mult_51_n102), .B(mult_51_n90), .CI(mult_51_n108), 
        .CO(mult_51_n39), .S(mult_51_n40) );
  FA_X1 mult_51_U26 ( .A(mult_51_n51), .B(mult_51_n78), .CI(mult_51_n42), .CO(
        mult_51_n37), .S(mult_51_n38) );
  FA_X1 mult_51_U25 ( .A(mult_51_n47), .B(mult_51_n49), .CI(mult_51_n40), .CO(
        mult_51_n35), .S(mult_51_n36) );
  FA_X1 mult_51_U24 ( .A(mult_51_n45), .B(mult_51_n38), .CI(mult_51_n36), .CO(
        mult_51_n33), .S(mult_51_n34) );
  FA_X1 mult_51_U23 ( .A(mult_51_n83), .B(mult_51_n89), .CI(mult_51_n95), .CO(
        mult_51_n31), .S(mult_51_n32) );
  FA_X1 mult_51_U22 ( .A(mult_51_n77), .B(mult_51_n101), .CI(mult_51_n41), 
        .CO(mult_51_n29), .S(mult_51_n30) );
  FA_X1 mult_51_U21 ( .A(mult_51_n32), .B(mult_51_n39), .CI(mult_51_n37), .CO(
        mult_51_n27), .S(mult_51_n28) );
  FA_X1 mult_51_U20 ( .A(mult_51_n35), .B(mult_51_n30), .CI(mult_51_n28), .CO(
        mult_51_n25), .S(mult_51_n26) );
  FA_X1 mult_51_U19 ( .A(mult_51_n82), .B(mult_51_n88), .CI(mult_51_n94), .CO(
        mult_51_n23), .S(mult_51_n24) );
  FA_X1 mult_51_U18 ( .A(mult_51_n31), .B(mult_51_n76), .CI(mult_51_n29), .CO(
        mult_51_n21), .S(mult_51_n22) );
  FA_X1 mult_51_U17 ( .A(mult_51_n27), .B(mult_51_n24), .CI(mult_51_n22), .CO(
        mult_51_n19), .S(mult_51_n20) );
  FA_X1 mult_51_U16 ( .A(mult_51_n87), .B(mult_51_n81), .CI(mult_51_n75), .CO(
        mult_51_n17), .S(mult_51_n18) );
  FA_X1 mult_51_U15 ( .A(mult_51_n18), .B(mult_51_n23), .CI(mult_51_n21), .CO(
        mult_51_n15), .S(mult_51_n16) );
  FA_X1 mult_51_U14 ( .A(mult_51_n74), .B(mult_51_n80), .CI(mult_51_n17), .CO(
        mult_51_n13), .S(mult_51_n14) );
  FA_X1 mult_51_U8 ( .A(mult_51_n44), .B(mult_51_n53), .CI(mult_51_n8), .CO(
        mult_51_n7), .S(TMPq1_b1_6_) );
  FA_X1 mult_51_U7 ( .A(mult_51_n34), .B(mult_51_n43), .CI(mult_51_n7), .CO(
        mult_51_n6), .S(TMPq1_b1_7_) );
  FA_X1 mult_51_U6 ( .A(mult_51_n26), .B(mult_51_n33), .CI(mult_51_n6), .CO(
        mult_51_n5), .S(TMPq1_b1_8_) );
  FA_X1 mult_51_U5 ( .A(mult_51_n20), .B(mult_51_n25), .CI(mult_51_n5), .CO(
        mult_51_n4), .S(TMPq1_b1_9_) );
  FA_X1 mult_51_U4 ( .A(mult_51_n16), .B(mult_51_n19), .CI(mult_51_n4), .CO(
        mult_51_n3), .S(TMPq1_b1_10_) );
  FA_X1 mult_51_U3 ( .A(mult_51_n15), .B(mult_51_n14), .CI(mult_51_n3), .CO(
        mult_51_n2), .S(TMPq1_b1_11_) );
  FA_X1 mult_51_U2 ( .A(mult_51_n13), .B(mult_51_n73), .CI(mult_51_n2), .CO(
        mult_51_n1), .S(TMPq1_b1_12_) );
  NOR2_X1 mult_52_U178 ( .A1(mult_52_n167), .A2(mult_52_n177), .ZN(
        mult_52_n100) );
  NAND2_X1 mult_52_U177 ( .A1(q_reg2[2]), .A2(b2[8]), .ZN(mult_52_n101) );
  NOR2_X1 mult_52_U176 ( .A1(mult_52_n172), .A2(mult_52_n168), .ZN(
        mult_52_n102) );
  NOR2_X1 mult_52_U175 ( .A1(mult_52_n173), .A2(mult_52_n168), .ZN(
        mult_52_n103) );
  NOR2_X1 mult_52_U174 ( .A1(mult_52_n174), .A2(mult_52_n168), .ZN(
        mult_52_n104) );
  NOR2_X1 mult_52_U173 ( .A1(mult_52_n175), .A2(mult_52_n168), .ZN(
        mult_52_n105) );
  NOR2_X1 mult_52_U172 ( .A1(mult_52_n176), .A2(mult_52_n168), .ZN(
        mult_52_n106) );
  NAND2_X1 mult_52_U171 ( .A1(q_reg2[1]), .A2(b2[8]), .ZN(mult_52_n108) );
  NOR2_X1 mult_52_U170 ( .A1(mult_52_n172), .A2(mult_52_n170), .ZN(
        mult_52_n109) );
  NOR2_X1 mult_52_U169 ( .A1(mult_52_n173), .A2(mult_52_n170), .ZN(
        mult_52_n110) );
  NOR2_X1 mult_52_U168 ( .A1(mult_52_n174), .A2(mult_52_n170), .ZN(
        mult_52_n111) );
  NOR2_X1 mult_52_U167 ( .A1(mult_52_n175), .A2(mult_52_n170), .ZN(
        mult_52_n112) );
  NOR2_X1 mult_52_U166 ( .A1(mult_52_n176), .A2(mult_52_n170), .ZN(
        mult_52_n113) );
  NAND2_X1 mult_52_U165 ( .A1(q_reg2[0]), .A2(b2[8]), .ZN(mult_52_n115) );
  NOR2_X1 mult_52_U164 ( .A1(mult_52_n172), .A2(mult_52_n171), .ZN(
        mult_52_n116) );
  NOR2_X1 mult_52_U163 ( .A1(mult_52_n173), .A2(mult_52_n171), .ZN(
        mult_52_n117) );
  NOR2_X1 mult_52_U162 ( .A1(mult_52_n174), .A2(mult_52_n171), .ZN(
        mult_52_n118) );
  NOR2_X1 mult_52_U161 ( .A1(mult_52_n175), .A2(mult_52_n171), .ZN(
        mult_52_n119) );
  NAND2_X1 mult_52_U160 ( .A1(b2[6]), .A2(q_reg2[3]), .ZN(mult_52_n184) );
  NAND2_X1 mult_52_U159 ( .A1(q_reg2[5]), .A2(b2[4]), .ZN(mult_52_n183) );
  NAND2_X1 mult_52_U158 ( .A1(mult_52_n184), .A2(mult_52_n183), .ZN(
        mult_52_n41) );
  XNOR2_X1 mult_52_U157 ( .A(mult_52_n183), .B(mult_52_n184), .ZN(mult_52_n42)
         );
  AND2_X1 mult_52_U156 ( .A1(b2[8]), .A2(q_reg2[6]), .ZN(mult_52_n73) );
  NAND2_X1 mult_52_U155 ( .A1(q_reg2[6]), .A2(b2[7]), .ZN(mult_52_n74) );
  NAND2_X1 mult_52_U154 ( .A1(q_reg2[6]), .A2(b2[6]), .ZN(mult_52_n75) );
  NAND2_X1 mult_52_U153 ( .A1(q_reg2[6]), .A2(b2[5]), .ZN(mult_52_n76) );
  NAND2_X1 mult_52_U152 ( .A1(q_reg2[6]), .A2(b2[4]), .ZN(mult_52_n77) );
  NAND2_X1 mult_52_U151 ( .A1(q_reg2[6]), .A2(b2[3]), .ZN(mult_52_n78) );
  NAND2_X1 mult_52_U150 ( .A1(q_reg2[6]), .A2(b2[2]), .ZN(mult_52_n79) );
  NOR4_X1 mult_52_U149 ( .A1(mult_52_n170), .A2(mult_52_n171), .A3(
        mult_52_n177), .A4(mult_52_n176), .ZN(mult_52_n181) );
  NOR2_X1 mult_52_U148 ( .A1(mult_52_n168), .A2(mult_52_n177), .ZN(
        mult_52_n182) );
  AOI222_X1 mult_52_U147 ( .A1(mult_52_n72), .A2(mult_52_n181), .B1(
        mult_52_n182), .B2(mult_52_n72), .C1(mult_52_n182), .C2(mult_52_n181), 
        .ZN(mult_52_n180) );
  OAI222_X1 mult_52_U146 ( .A1(mult_52_n180), .A2(mult_52_n169), .B1(
        mult_52_n169), .B2(mult_52_n166), .C1(mult_52_n180), .C2(mult_52_n166), 
        .ZN(mult_52_n179) );
  AOI222_X1 mult_52_U145 ( .A1(mult_52_n179), .A2(mult_52_n62), .B1(
        mult_52_n179), .B2(mult_52_n64), .C1(mult_52_n64), .C2(mult_52_n62), 
        .ZN(mult_52_n178) );
  OAI222_X1 mult_52_U144 ( .A1(mult_52_n178), .A2(mult_52_n162), .B1(
        mult_52_n178), .B2(mult_52_n164), .C1(mult_52_n164), .C2(mult_52_n162), 
        .ZN(mult_52_n8) );
  NAND2_X1 mult_52_U143 ( .A1(q_reg2[5]), .A2(b2[8]), .ZN(mult_52_n80) );
  NOR2_X1 mult_52_U142 ( .A1(mult_52_n172), .A2(mult_52_n163), .ZN(mult_52_n81) );
  NOR2_X1 mult_52_U141 ( .A1(mult_52_n173), .A2(mult_52_n163), .ZN(mult_52_n82) );
  NOR2_X1 mult_52_U140 ( .A1(mult_52_n174), .A2(mult_52_n163), .ZN(mult_52_n83) );
  NOR2_X1 mult_52_U139 ( .A1(mult_52_n176), .A2(mult_52_n163), .ZN(mult_52_n85) );
  NOR2_X1 mult_52_U138 ( .A1(mult_52_n177), .A2(mult_52_n163), .ZN(mult_52_n86) );
  NAND2_X1 mult_52_U137 ( .A1(q_reg2[4]), .A2(b2[8]), .ZN(mult_52_n87) );
  NOR2_X1 mult_52_U136 ( .A1(mult_52_n172), .A2(mult_52_n165), .ZN(mult_52_n88) );
  NOR2_X1 mult_52_U135 ( .A1(mult_52_n165), .A2(mult_52_n173), .ZN(mult_52_n89) );
  NOR2_X1 mult_52_U134 ( .A1(mult_52_n174), .A2(mult_52_n165), .ZN(mult_52_n90) );
  NOR2_X1 mult_52_U133 ( .A1(mult_52_n175), .A2(mult_52_n165), .ZN(mult_52_n91) );
  NOR2_X1 mult_52_U132 ( .A1(mult_52_n176), .A2(mult_52_n165), .ZN(mult_52_n92) );
  NOR2_X1 mult_52_U131 ( .A1(mult_52_n165), .A2(mult_52_n177), .ZN(mult_52_n93) );
  NAND2_X1 mult_52_U130 ( .A1(b2[8]), .A2(q_reg2[3]), .ZN(mult_52_n94) );
  NOR2_X1 mult_52_U129 ( .A1(mult_52_n167), .A2(mult_52_n172), .ZN(mult_52_n95) );
  NOR2_X1 mult_52_U128 ( .A1(mult_52_n167), .A2(mult_52_n174), .ZN(mult_52_n97) );
  NOR2_X1 mult_52_U127 ( .A1(mult_52_n167), .A2(mult_52_n175), .ZN(mult_52_n98) );
  NOR2_X1 mult_52_U126 ( .A1(mult_52_n167), .A2(mult_52_n176), .ZN(mult_52_n99) );
  INV_X1 mult_52_U125 ( .A(b2[2]), .ZN(mult_52_n177) );
  INV_X1 mult_52_U124 ( .A(b2[6]), .ZN(mult_52_n173) );
  INV_X1 mult_52_U123 ( .A(b2[4]), .ZN(mult_52_n175) );
  INV_X1 mult_52_U122 ( .A(q_reg2[0]), .ZN(mult_52_n171) );
  INV_X1 mult_52_U121 ( .A(q_reg2[5]), .ZN(mult_52_n163) );
  INV_X1 mult_52_U120 ( .A(q_reg2[3]), .ZN(mult_52_n167) );
  INV_X1 mult_52_U119 ( .A(b2[3]), .ZN(mult_52_n176) );
  INV_X1 mult_52_U118 ( .A(b2[7]), .ZN(mult_52_n172) );
  INV_X1 mult_52_U117 ( .A(b2[5]), .ZN(mult_52_n174) );
  INV_X1 mult_52_U116 ( .A(q_reg2[2]), .ZN(mult_52_n168) );
  INV_X1 mult_52_U115 ( .A(q_reg2[1]), .ZN(mult_52_n170) );
  INV_X1 mult_52_U114 ( .A(q_reg2[4]), .ZN(mult_52_n165) );
  INV_X1 mult_52_U113 ( .A(mult_52_n1), .ZN(TMPq2_b2_13_) );
  INV_X1 mult_52_U112 ( .A(mult_52_n68), .ZN(mult_52_n169) );
  INV_X1 mult_52_U111 ( .A(mult_52_n54), .ZN(mult_52_n162) );
  INV_X1 mult_52_U110 ( .A(mult_52_n61), .ZN(mult_52_n164) );
  INV_X1 mult_52_U109 ( .A(mult_52_n70), .ZN(mult_52_n166) );
  HA_X1 mult_52_U44 ( .A(mult_52_n113), .B(mult_52_n119), .CO(mult_52_n71), 
        .S(mult_52_n72) );
  HA_X1 mult_52_U43 ( .A(mult_52_n100), .B(mult_52_n106), .CO(mult_52_n69), 
        .S(mult_52_n70) );
  FA_X1 mult_52_U42 ( .A(mult_52_n112), .B(mult_52_n118), .CI(mult_52_n71), 
        .CO(mult_52_n67), .S(mult_52_n68) );
  HA_X1 mult_52_U41 ( .A(mult_52_n93), .B(mult_52_n99), .CO(mult_52_n65), .S(
        mult_52_n66) );
  FA_X1 mult_52_U40 ( .A(mult_52_n105), .B(mult_52_n117), .CI(mult_52_n111), 
        .CO(mult_52_n63), .S(mult_52_n64) );
  FA_X1 mult_52_U39 ( .A(mult_52_n66), .B(mult_52_n69), .CI(mult_52_n67), .CO(
        mult_52_n61), .S(mult_52_n62) );
  HA_X1 mult_52_U38 ( .A(mult_52_n86), .B(mult_52_n92), .CO(mult_52_n59), .S(
        mult_52_n60) );
  FA_X1 mult_52_U37 ( .A(mult_52_n98), .B(mult_52_n116), .CI(mult_52_n104), 
        .CO(mult_52_n57), .S(mult_52_n58) );
  FA_X1 mult_52_U36 ( .A(mult_52_n65), .B(mult_52_n110), .CI(mult_52_n60), 
        .CO(mult_52_n55), .S(mult_52_n56) );
  FA_X1 mult_52_U35 ( .A(mult_52_n58), .B(mult_52_n63), .CI(mult_52_n56), .CO(
        mult_52_n53), .S(mult_52_n54) );
  HA_X1 mult_52_U34 ( .A(mult_52_n97), .B(mult_52_n91), .CO(mult_52_n51), .S(
        mult_52_n52) );
  FA_X1 mult_52_U33 ( .A(mult_52_n85), .B(mult_52_n103), .CI(mult_52_n109), 
        .CO(mult_52_n49), .S(mult_52_n50) );
  FA_X1 mult_52_U32 ( .A(mult_52_n79), .B(mult_52_n115), .CI(mult_52_n59), 
        .CO(mult_52_n47), .S(mult_52_n48) );
  FA_X1 mult_52_U31 ( .A(mult_52_n57), .B(mult_52_n52), .CI(mult_52_n50), .CO(
        mult_52_n45), .S(mult_52_n46) );
  FA_X1 mult_52_U30 ( .A(mult_52_n48), .B(mult_52_n55), .CI(mult_52_n46), .CO(
        mult_52_n43), .S(mult_52_n44) );
  FA_X1 mult_52_U27 ( .A(mult_52_n102), .B(mult_52_n90), .CI(mult_52_n108), 
        .CO(mult_52_n39), .S(mult_52_n40) );
  FA_X1 mult_52_U26 ( .A(mult_52_n51), .B(mult_52_n78), .CI(mult_52_n42), .CO(
        mult_52_n37), .S(mult_52_n38) );
  FA_X1 mult_52_U25 ( .A(mult_52_n47), .B(mult_52_n49), .CI(mult_52_n40), .CO(
        mult_52_n35), .S(mult_52_n36) );
  FA_X1 mult_52_U24 ( .A(mult_52_n45), .B(mult_52_n38), .CI(mult_52_n36), .CO(
        mult_52_n33), .S(mult_52_n34) );
  FA_X1 mult_52_U23 ( .A(mult_52_n83), .B(mult_52_n89), .CI(mult_52_n95), .CO(
        mult_52_n31), .S(mult_52_n32) );
  FA_X1 mult_52_U22 ( .A(mult_52_n77), .B(mult_52_n101), .CI(mult_52_n41), 
        .CO(mult_52_n29), .S(mult_52_n30) );
  FA_X1 mult_52_U21 ( .A(mult_52_n32), .B(mult_52_n39), .CI(mult_52_n37), .CO(
        mult_52_n27), .S(mult_52_n28) );
  FA_X1 mult_52_U20 ( .A(mult_52_n35), .B(mult_52_n30), .CI(mult_52_n28), .CO(
        mult_52_n25), .S(mult_52_n26) );
  FA_X1 mult_52_U19 ( .A(mult_52_n82), .B(mult_52_n88), .CI(mult_52_n94), .CO(
        mult_52_n23), .S(mult_52_n24) );
  FA_X1 mult_52_U18 ( .A(mult_52_n31), .B(mult_52_n76), .CI(mult_52_n29), .CO(
        mult_52_n21), .S(mult_52_n22) );
  FA_X1 mult_52_U17 ( .A(mult_52_n27), .B(mult_52_n24), .CI(mult_52_n22), .CO(
        mult_52_n19), .S(mult_52_n20) );
  FA_X1 mult_52_U16 ( .A(mult_52_n87), .B(mult_52_n81), .CI(mult_52_n75), .CO(
        mult_52_n17), .S(mult_52_n18) );
  FA_X1 mult_52_U15 ( .A(mult_52_n18), .B(mult_52_n23), .CI(mult_52_n21), .CO(
        mult_52_n15), .S(mult_52_n16) );
  FA_X1 mult_52_U14 ( .A(mult_52_n74), .B(mult_52_n80), .CI(mult_52_n17), .CO(
        mult_52_n13), .S(mult_52_n14) );
  FA_X1 mult_52_U8 ( .A(mult_52_n44), .B(mult_52_n53), .CI(mult_52_n8), .CO(
        mult_52_n7), .S(TMPq2_b2_6_) );
  FA_X1 mult_52_U7 ( .A(mult_52_n34), .B(mult_52_n43), .CI(mult_52_n7), .CO(
        mult_52_n6), .S(TMPq2_b2_7_) );
  FA_X1 mult_52_U6 ( .A(mult_52_n26), .B(mult_52_n33), .CI(mult_52_n6), .CO(
        mult_52_n5), .S(TMPq2_b2_8_) );
  FA_X1 mult_52_U5 ( .A(mult_52_n20), .B(mult_52_n25), .CI(mult_52_n5), .CO(
        mult_52_n4), .S(TMPq2_b2_9_) );
  FA_X1 mult_52_U4 ( .A(mult_52_n16), .B(mult_52_n19), .CI(mult_52_n4), .CO(
        mult_52_n3), .S(TMPq2_b2_10_) );
  FA_X1 mult_52_U3 ( .A(mult_52_n15), .B(mult_52_n14), .CI(mult_52_n3), .CO(
        mult_52_n2), .S(TMPq2_b2_11_) );
  FA_X1 mult_52_U2 ( .A(mult_52_n13), .B(mult_52_n73), .CI(mult_52_n2), .CO(
        mult_52_n1), .S(TMPq2_b2_12_) );
  XOR2_X1 add_1_root_add_0_root_add_54_2_U2 ( .A(TMPq2_b2_6_), .B(TMPq1_b1_6_), 
        .Z(N14) );
  AND2_X1 add_1_root_add_0_root_add_54_2_U1 ( .A1(TMPq2_b2_6_), .A2(
        TMPq1_b1_6_), .ZN(add_1_root_add_0_root_add_54_2_n1) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_1 ( .A(TMPq1_b1_7_), .B(TMPq2_b2_7_), 
        .CI(add_1_root_add_0_root_add_54_2_n1), .CO(
        add_1_root_add_0_root_add_54_2_carry[2]), .S(N15) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_2 ( .A(TMPq1_b1_8_), .B(TMPq2_b2_8_), 
        .CI(add_1_root_add_0_root_add_54_2_carry[2]), .CO(
        add_1_root_add_0_root_add_54_2_carry[3]), .S(N16) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_3 ( .A(TMPq1_b1_9_), .B(TMPq2_b2_9_), 
        .CI(add_1_root_add_0_root_add_54_2_carry[3]), .CO(
        add_1_root_add_0_root_add_54_2_carry[4]), .S(N17) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_4 ( .A(TMPq1_b1_10_), .B(
        TMPq2_b2_10_), .CI(add_1_root_add_0_root_add_54_2_carry[4]), .CO(
        add_1_root_add_0_root_add_54_2_carry[5]), .S(N18) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_5 ( .A(TMPq1_b1_11_), .B(
        TMPq2_b2_11_), .CI(add_1_root_add_0_root_add_54_2_carry[5]), .CO(
        add_1_root_add_0_root_add_54_2_carry[6]), .S(N19) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_6 ( .A(TMPq1_b1_12_), .B(
        TMPq2_b2_12_), .CI(add_1_root_add_0_root_add_54_2_carry[6]), .CO(
        add_1_root_add_0_root_add_54_2_carry[7]), .S(N20) );
  FA_X1 add_1_root_add_0_root_add_54_2_U1_7 ( .A(TMPq1_b1_13_), .B(
        TMPq2_b2_13_), .CI(add_1_root_add_0_root_add_54_2_carry[7]), .S(N21)
         );
  AND2_X1 add_0_root_add_0_root_add_54_2_U2 ( .A1(TMPtmpa_b0_6_), .A2(N14), 
        .ZN(add_0_root_add_0_root_add_54_2_n2) );
  XOR2_X1 add_0_root_add_0_root_add_54_2_U1 ( .A(TMPtmpa_b0_6_), .B(N14), .Z(
        TMPb[0]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_1 ( .A(N15), .B(TMPtmpa_b0_7_), .CI(
        add_0_root_add_0_root_add_54_2_n2), .CO(
        add_0_root_add_0_root_add_54_2_carry[2]), .S(TMPb[1]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_2 ( .A(N16), .B(TMPtmpa_b0_8_), .CI(
        add_0_root_add_0_root_add_54_2_carry[2]), .CO(
        add_0_root_add_0_root_add_54_2_carry[3]), .S(TMPb[2]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_3 ( .A(N17), .B(TMPtmpa_b0_9_), .CI(
        add_0_root_add_0_root_add_54_2_carry[3]), .CO(
        add_0_root_add_0_root_add_54_2_carry[4]), .S(TMPb[3]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_4 ( .A(N18), .B(TMPtmpa_b0_10_), 
        .CI(add_0_root_add_0_root_add_54_2_carry[4]), .CO(
        add_0_root_add_0_root_add_54_2_carry[5]), .S(TMPb[4]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_5 ( .A(N19), .B(TMPtmpa_b0_11_), 
        .CI(add_0_root_add_0_root_add_54_2_carry[5]), .CO(
        add_0_root_add_0_root_add_54_2_carry[6]), .S(TMPb[5]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_6 ( .A(N20), .B(TMPtmpa_b0_12_), 
        .CI(add_0_root_add_0_root_add_54_2_carry[6]), .CO(
        add_0_root_add_0_root_add_54_2_carry[7]), .S(TMPb[6]) );
  FA_X1 add_0_root_add_0_root_add_54_2_U1_7 ( .A(N21), .B(TMPtmpa_b0_13_), 
        .CI(add_0_root_add_0_root_add_54_2_carry[7]), .S(TMPb[7]) );
  NOR2_X1 mult_47_U179 ( .A1(mult_47_n165), .A2(mult_47_n175), .ZN(
        mult_47_n100) );
  NAND2_X1 mult_47_U178 ( .A1(q_regx[2]), .A2(a1[8]), .ZN(mult_47_n101) );
  NOR2_X1 mult_47_U177 ( .A1(mult_47_n170), .A2(mult_47_n166), .ZN(
        mult_47_n102) );
  NOR2_X1 mult_47_U176 ( .A1(mult_47_n171), .A2(mult_47_n166), .ZN(
        mult_47_n103) );
  NOR2_X1 mult_47_U175 ( .A1(mult_47_n172), .A2(mult_47_n166), .ZN(
        mult_47_n104) );
  NOR2_X1 mult_47_U174 ( .A1(mult_47_n173), .A2(mult_47_n166), .ZN(
        mult_47_n105) );
  NOR2_X1 mult_47_U173 ( .A1(mult_47_n174), .A2(mult_47_n166), .ZN(
        mult_47_n106) );
  NAND2_X1 mult_47_U172 ( .A1(q_regx[1]), .A2(a1[8]), .ZN(mult_47_n108) );
  NOR2_X1 mult_47_U171 ( .A1(mult_47_n170), .A2(mult_47_n168), .ZN(
        mult_47_n109) );
  NOR2_X1 mult_47_U170 ( .A1(mult_47_n171), .A2(mult_47_n168), .ZN(
        mult_47_n110) );
  NOR2_X1 mult_47_U169 ( .A1(mult_47_n172), .A2(mult_47_n168), .ZN(
        mult_47_n111) );
  NOR2_X1 mult_47_U168 ( .A1(mult_47_n173), .A2(mult_47_n168), .ZN(
        mult_47_n112) );
  NOR2_X1 mult_47_U167 ( .A1(mult_47_n174), .A2(mult_47_n168), .ZN(
        mult_47_n113) );
  NAND2_X1 mult_47_U166 ( .A1(q_regx[0]), .A2(a1[8]), .ZN(mult_47_n115) );
  NOR2_X1 mult_47_U165 ( .A1(mult_47_n170), .A2(mult_47_n169), .ZN(
        mult_47_n116) );
  NOR2_X1 mult_47_U164 ( .A1(mult_47_n171), .A2(mult_47_n169), .ZN(
        mult_47_n117) );
  NOR2_X1 mult_47_U163 ( .A1(mult_47_n172), .A2(mult_47_n169), .ZN(
        mult_47_n118) );
  NOR2_X1 mult_47_U162 ( .A1(mult_47_n173), .A2(mult_47_n169), .ZN(
        mult_47_n119) );
  NAND2_X1 mult_47_U161 ( .A1(a1[6]), .A2(q_regx[3]), .ZN(mult_47_n184) );
  NAND2_X1 mult_47_U160 ( .A1(q_regx[5]), .A2(a1[4]), .ZN(mult_47_n183) );
  NAND2_X1 mult_47_U159 ( .A1(mult_47_n184), .A2(mult_47_n183), .ZN(
        mult_47_n41) );
  XNOR2_X1 mult_47_U158 ( .A(mult_47_n183), .B(mult_47_n184), .ZN(mult_47_n42)
         );
  NAND2_X1 mult_47_U157 ( .A1(a1[7]), .A2(q_regx[6]), .ZN(mult_47_n74) );
  NAND2_X1 mult_47_U156 ( .A1(a1[6]), .A2(q_regx[6]), .ZN(mult_47_n75) );
  NAND2_X1 mult_47_U155 ( .A1(a1[5]), .A2(q_regx[6]), .ZN(mult_47_n76) );
  NAND2_X1 mult_47_U154 ( .A1(a1[4]), .A2(q_regx[6]), .ZN(mult_47_n77) );
  NAND2_X1 mult_47_U153 ( .A1(a1[3]), .A2(q_regx[6]), .ZN(mult_47_n78) );
  NAND2_X1 mult_47_U152 ( .A1(a1[2]), .A2(q_regx[6]), .ZN(mult_47_n79) );
  NOR4_X1 mult_47_U151 ( .A1(mult_47_n168), .A2(mult_47_n169), .A3(
        mult_47_n175), .A4(mult_47_n174), .ZN(mult_47_n181) );
  NOR2_X1 mult_47_U150 ( .A1(mult_47_n166), .A2(mult_47_n175), .ZN(
        mult_47_n182) );
  AOI222_X1 mult_47_U149 ( .A1(mult_47_n72), .A2(mult_47_n181), .B1(
        mult_47_n182), .B2(mult_47_n72), .C1(mult_47_n182), .C2(mult_47_n181), 
        .ZN(mult_47_n180) );
  OAI222_X1 mult_47_U148 ( .A1(mult_47_n180), .A2(mult_47_n167), .B1(
        mult_47_n167), .B2(mult_47_n164), .C1(mult_47_n180), .C2(mult_47_n164), 
        .ZN(mult_47_n179) );
  AOI222_X1 mult_47_U147 ( .A1(mult_47_n179), .A2(mult_47_n62), .B1(
        mult_47_n179), .B2(mult_47_n64), .C1(mult_47_n64), .C2(mult_47_n62), 
        .ZN(mult_47_n178) );
  OAI222_X1 mult_47_U146 ( .A1(mult_47_n178), .A2(mult_47_n160), .B1(
        mult_47_n178), .B2(mult_47_n162), .C1(mult_47_n162), .C2(mult_47_n160), 
        .ZN(mult_47_n8) );
  NAND2_X1 mult_47_U145 ( .A1(q_regx[5]), .A2(a1[8]), .ZN(mult_47_n80) );
  NOR2_X1 mult_47_U144 ( .A1(mult_47_n170), .A2(mult_47_n161), .ZN(mult_47_n81) );
  NOR2_X1 mult_47_U143 ( .A1(mult_47_n171), .A2(mult_47_n161), .ZN(mult_47_n82) );
  NOR2_X1 mult_47_U142 ( .A1(mult_47_n172), .A2(mult_47_n161), .ZN(mult_47_n83) );
  NOR2_X1 mult_47_U141 ( .A1(mult_47_n174), .A2(mult_47_n161), .ZN(mult_47_n85) );
  NOR2_X1 mult_47_U140 ( .A1(mult_47_n175), .A2(mult_47_n161), .ZN(mult_47_n86) );
  NAND2_X1 mult_47_U139 ( .A1(q_regx[4]), .A2(a1[8]), .ZN(mult_47_n87) );
  NOR2_X1 mult_47_U138 ( .A1(mult_47_n170), .A2(mult_47_n163), .ZN(mult_47_n88) );
  NOR2_X1 mult_47_U137 ( .A1(mult_47_n163), .A2(mult_47_n171), .ZN(mult_47_n89) );
  NOR2_X1 mult_47_U136 ( .A1(mult_47_n172), .A2(mult_47_n163), .ZN(mult_47_n90) );
  NOR2_X1 mult_47_U135 ( .A1(mult_47_n173), .A2(mult_47_n163), .ZN(mult_47_n91) );
  NOR2_X1 mult_47_U134 ( .A1(mult_47_n174), .A2(mult_47_n163), .ZN(mult_47_n92) );
  NOR2_X1 mult_47_U133 ( .A1(mult_47_n163), .A2(mult_47_n175), .ZN(mult_47_n93) );
  NAND2_X1 mult_47_U132 ( .A1(q_regx[3]), .A2(a1[8]), .ZN(mult_47_n94) );
  NOR2_X1 mult_47_U131 ( .A1(mult_47_n165), .A2(mult_47_n170), .ZN(mult_47_n95) );
  NOR2_X1 mult_47_U130 ( .A1(mult_47_n165), .A2(mult_47_n172), .ZN(mult_47_n97) );
  NOR2_X1 mult_47_U129 ( .A1(mult_47_n165), .A2(mult_47_n173), .ZN(mult_47_n98) );
  NOR2_X1 mult_47_U128 ( .A1(mult_47_n165), .A2(mult_47_n174), .ZN(mult_47_n99) );
  NAND2_X1 mult_47_U127 ( .A1(a1[8]), .A2(q_regx[6]), .ZN(mult_47_n176) );
  XNOR2_X1 mult_47_U126 ( .A(mult_47_n2), .B(mult_47_n13), .ZN(mult_47_n177)
         );
  XOR2_X1 mult_47_U125 ( .A(mult_47_n176), .B(mult_47_n177), .Z(TMPqx_a1_12_)
         );
  INV_X1 mult_47_U124 ( .A(a1[2]), .ZN(mult_47_n175) );
  INV_X1 mult_47_U123 ( .A(q_regx[0]), .ZN(mult_47_n169) );
  INV_X1 mult_47_U122 ( .A(a1[6]), .ZN(mult_47_n171) );
  INV_X1 mult_47_U121 ( .A(a1[4]), .ZN(mult_47_n173) );
  INV_X1 mult_47_U120 ( .A(q_regx[5]), .ZN(mult_47_n161) );
  INV_X1 mult_47_U119 ( .A(q_regx[3]), .ZN(mult_47_n165) );
  INV_X1 mult_47_U118 ( .A(q_regx[2]), .ZN(mult_47_n166) );
  INV_X1 mult_47_U117 ( .A(q_regx[1]), .ZN(mult_47_n168) );
  INV_X1 mult_47_U116 ( .A(a1[3]), .ZN(mult_47_n174) );
  INV_X1 mult_47_U115 ( .A(q_regx[4]), .ZN(mult_47_n163) );
  INV_X1 mult_47_U114 ( .A(a1[7]), .ZN(mult_47_n170) );
  INV_X1 mult_47_U113 ( .A(a1[5]), .ZN(mult_47_n172) );
  INV_X1 mult_47_U112 ( .A(mult_47_n68), .ZN(mult_47_n167) );
  INV_X1 mult_47_U111 ( .A(mult_47_n54), .ZN(mult_47_n160) );
  INV_X1 mult_47_U110 ( .A(mult_47_n61), .ZN(mult_47_n162) );
  INV_X1 mult_47_U109 ( .A(mult_47_n70), .ZN(mult_47_n164) );
  HA_X1 mult_47_U44 ( .A(mult_47_n113), .B(mult_47_n119), .CO(mult_47_n71), 
        .S(mult_47_n72) );
  HA_X1 mult_47_U43 ( .A(mult_47_n100), .B(mult_47_n106), .CO(mult_47_n69), 
        .S(mult_47_n70) );
  FA_X1 mult_47_U42 ( .A(mult_47_n112), .B(mult_47_n118), .CI(mult_47_n71), 
        .CO(mult_47_n67), .S(mult_47_n68) );
  HA_X1 mult_47_U41 ( .A(mult_47_n93), .B(mult_47_n99), .CO(mult_47_n65), .S(
        mult_47_n66) );
  FA_X1 mult_47_U40 ( .A(mult_47_n105), .B(mult_47_n117), .CI(mult_47_n111), 
        .CO(mult_47_n63), .S(mult_47_n64) );
  FA_X1 mult_47_U39 ( .A(mult_47_n66), .B(mult_47_n69), .CI(mult_47_n67), .CO(
        mult_47_n61), .S(mult_47_n62) );
  HA_X1 mult_47_U38 ( .A(mult_47_n86), .B(mult_47_n92), .CO(mult_47_n59), .S(
        mult_47_n60) );
  FA_X1 mult_47_U37 ( .A(mult_47_n98), .B(mult_47_n116), .CI(mult_47_n104), 
        .CO(mult_47_n57), .S(mult_47_n58) );
  FA_X1 mult_47_U36 ( .A(mult_47_n65), .B(mult_47_n110), .CI(mult_47_n60), 
        .CO(mult_47_n55), .S(mult_47_n56) );
  FA_X1 mult_47_U35 ( .A(mult_47_n58), .B(mult_47_n63), .CI(mult_47_n56), .CO(
        mult_47_n53), .S(mult_47_n54) );
  HA_X1 mult_47_U34 ( .A(mult_47_n97), .B(mult_47_n91), .CO(mult_47_n51), .S(
        mult_47_n52) );
  FA_X1 mult_47_U33 ( .A(mult_47_n85), .B(mult_47_n103), .CI(mult_47_n109), 
        .CO(mult_47_n49), .S(mult_47_n50) );
  FA_X1 mult_47_U32 ( .A(mult_47_n79), .B(mult_47_n115), .CI(mult_47_n59), 
        .CO(mult_47_n47), .S(mult_47_n48) );
  FA_X1 mult_47_U31 ( .A(mult_47_n57), .B(mult_47_n52), .CI(mult_47_n50), .CO(
        mult_47_n45), .S(mult_47_n46) );
  FA_X1 mult_47_U30 ( .A(mult_47_n48), .B(mult_47_n55), .CI(mult_47_n46), .CO(
        mult_47_n43), .S(mult_47_n44) );
  FA_X1 mult_47_U27 ( .A(mult_47_n102), .B(mult_47_n90), .CI(mult_47_n108), 
        .CO(mult_47_n39), .S(mult_47_n40) );
  FA_X1 mult_47_U26 ( .A(mult_47_n51), .B(mult_47_n78), .CI(mult_47_n42), .CO(
        mult_47_n37), .S(mult_47_n38) );
  FA_X1 mult_47_U25 ( .A(mult_47_n47), .B(mult_47_n49), .CI(mult_47_n40), .CO(
        mult_47_n35), .S(mult_47_n36) );
  FA_X1 mult_47_U24 ( .A(mult_47_n45), .B(mult_47_n38), .CI(mult_47_n36), .CO(
        mult_47_n33), .S(mult_47_n34) );
  FA_X1 mult_47_U23 ( .A(mult_47_n83), .B(mult_47_n89), .CI(mult_47_n95), .CO(
        mult_47_n31), .S(mult_47_n32) );
  FA_X1 mult_47_U22 ( .A(mult_47_n77), .B(mult_47_n101), .CI(mult_47_n41), 
        .CO(mult_47_n29), .S(mult_47_n30) );
  FA_X1 mult_47_U21 ( .A(mult_47_n32), .B(mult_47_n39), .CI(mult_47_n37), .CO(
        mult_47_n27), .S(mult_47_n28) );
  FA_X1 mult_47_U20 ( .A(mult_47_n35), .B(mult_47_n30), .CI(mult_47_n28), .CO(
        mult_47_n25), .S(mult_47_n26) );
  FA_X1 mult_47_U19 ( .A(mult_47_n82), .B(mult_47_n88), .CI(mult_47_n94), .CO(
        mult_47_n23), .S(mult_47_n24) );
  FA_X1 mult_47_U18 ( .A(mult_47_n31), .B(mult_47_n76), .CI(mult_47_n29), .CO(
        mult_47_n21), .S(mult_47_n22) );
  FA_X1 mult_47_U17 ( .A(mult_47_n27), .B(mult_47_n24), .CI(mult_47_n22), .CO(
        mult_47_n19), .S(mult_47_n20) );
  FA_X1 mult_47_U16 ( .A(mult_47_n87), .B(mult_47_n81), .CI(mult_47_n75), .CO(
        mult_47_n17), .S(mult_47_n18) );
  FA_X1 mult_47_U15 ( .A(mult_47_n18), .B(mult_47_n23), .CI(mult_47_n21), .CO(
        mult_47_n15), .S(mult_47_n16) );
  FA_X1 mult_47_U14 ( .A(mult_47_n74), .B(mult_47_n80), .CI(mult_47_n17), .CO(
        mult_47_n13), .S(mult_47_n14) );
  FA_X1 mult_47_U8 ( .A(mult_47_n44), .B(mult_47_n53), .CI(mult_47_n8), .CO(
        mult_47_n7), .S(TMPqx_a1_6_) );
  FA_X1 mult_47_U7 ( .A(mult_47_n34), .B(mult_47_n43), .CI(mult_47_n7), .CO(
        mult_47_n6), .S(TMPqx_a1_7_) );
  FA_X1 mult_47_U6 ( .A(mult_47_n26), .B(mult_47_n33), .CI(mult_47_n6), .CO(
        mult_47_n5), .S(TMPqx_a1_8_) );
  FA_X1 mult_47_U5 ( .A(mult_47_n20), .B(mult_47_n25), .CI(mult_47_n5), .CO(
        mult_47_n4), .S(TMPqx_a1_9_) );
  FA_X1 mult_47_U4 ( .A(mult_47_n16), .B(mult_47_n19), .CI(mult_47_n4), .CO(
        mult_47_n3), .S(TMPqx_a1_10_) );
  FA_X1 mult_47_U3 ( .A(mult_47_n15), .B(mult_47_n14), .CI(mult_47_n3), .CO(
        mult_47_n2), .S(TMPqx_a1_11_) );
  NOR2_X1 mult_45_U179 ( .A1(mult_45_n165), .A2(mult_45_n175), .ZN(
        mult_45_n100) );
  NAND2_X1 mult_45_U178 ( .A1(q_reg2[2]), .A2(c2[8]), .ZN(mult_45_n101) );
  NOR2_X1 mult_45_U177 ( .A1(mult_45_n170), .A2(mult_45_n166), .ZN(
        mult_45_n102) );
  NOR2_X1 mult_45_U176 ( .A1(mult_45_n171), .A2(mult_45_n166), .ZN(
        mult_45_n103) );
  NOR2_X1 mult_45_U175 ( .A1(mult_45_n172), .A2(mult_45_n166), .ZN(
        mult_45_n104) );
  NOR2_X1 mult_45_U174 ( .A1(mult_45_n173), .A2(mult_45_n166), .ZN(
        mult_45_n105) );
  NOR2_X1 mult_45_U173 ( .A1(mult_45_n174), .A2(mult_45_n166), .ZN(
        mult_45_n106) );
  NAND2_X1 mult_45_U172 ( .A1(q_reg2[1]), .A2(c2[8]), .ZN(mult_45_n108) );
  NOR2_X1 mult_45_U171 ( .A1(mult_45_n170), .A2(mult_45_n168), .ZN(
        mult_45_n109) );
  NOR2_X1 mult_45_U170 ( .A1(mult_45_n171), .A2(mult_45_n168), .ZN(
        mult_45_n110) );
  NOR2_X1 mult_45_U169 ( .A1(mult_45_n172), .A2(mult_45_n168), .ZN(
        mult_45_n111) );
  NOR2_X1 mult_45_U168 ( .A1(mult_45_n173), .A2(mult_45_n168), .ZN(
        mult_45_n112) );
  NOR2_X1 mult_45_U167 ( .A1(mult_45_n174), .A2(mult_45_n168), .ZN(
        mult_45_n113) );
  NAND2_X1 mult_45_U166 ( .A1(q_reg2[0]), .A2(c2[8]), .ZN(mult_45_n115) );
  NOR2_X1 mult_45_U165 ( .A1(mult_45_n170), .A2(mult_45_n169), .ZN(
        mult_45_n116) );
  NOR2_X1 mult_45_U164 ( .A1(mult_45_n171), .A2(mult_45_n169), .ZN(
        mult_45_n117) );
  NOR2_X1 mult_45_U163 ( .A1(mult_45_n172), .A2(mult_45_n169), .ZN(
        mult_45_n118) );
  NOR2_X1 mult_45_U162 ( .A1(mult_45_n173), .A2(mult_45_n169), .ZN(
        mult_45_n119) );
  NAND2_X1 mult_45_U161 ( .A1(c2[6]), .A2(q_reg2[3]), .ZN(mult_45_n184) );
  NAND2_X1 mult_45_U160 ( .A1(q_reg2[5]), .A2(c2[4]), .ZN(mult_45_n183) );
  NAND2_X1 mult_45_U159 ( .A1(mult_45_n184), .A2(mult_45_n183), .ZN(
        mult_45_n41) );
  XNOR2_X1 mult_45_U158 ( .A(mult_45_n183), .B(mult_45_n184), .ZN(mult_45_n42)
         );
  NAND2_X1 mult_45_U157 ( .A1(c2[7]), .A2(q_reg2[6]), .ZN(mult_45_n74) );
  NAND2_X1 mult_45_U156 ( .A1(c2[6]), .A2(q_reg2[6]), .ZN(mult_45_n75) );
  NAND2_X1 mult_45_U155 ( .A1(c2[5]), .A2(q_reg2[6]), .ZN(mult_45_n76) );
  NAND2_X1 mult_45_U154 ( .A1(c2[4]), .A2(q_reg2[6]), .ZN(mult_45_n77) );
  NAND2_X1 mult_45_U153 ( .A1(c2[3]), .A2(q_reg2[6]), .ZN(mult_45_n78) );
  NAND2_X1 mult_45_U152 ( .A1(c2[2]), .A2(q_reg2[6]), .ZN(mult_45_n79) );
  NOR4_X1 mult_45_U151 ( .A1(mult_45_n168), .A2(mult_45_n169), .A3(
        mult_45_n175), .A4(mult_45_n174), .ZN(mult_45_n181) );
  NOR2_X1 mult_45_U150 ( .A1(mult_45_n166), .A2(mult_45_n175), .ZN(
        mult_45_n182) );
  AOI222_X1 mult_45_U149 ( .A1(mult_45_n72), .A2(mult_45_n181), .B1(
        mult_45_n182), .B2(mult_45_n72), .C1(mult_45_n182), .C2(mult_45_n181), 
        .ZN(mult_45_n180) );
  OAI222_X1 mult_45_U148 ( .A1(mult_45_n180), .A2(mult_45_n167), .B1(
        mult_45_n167), .B2(mult_45_n164), .C1(mult_45_n180), .C2(mult_45_n164), 
        .ZN(mult_45_n179) );
  AOI222_X1 mult_45_U147 ( .A1(mult_45_n179), .A2(mult_45_n62), .B1(
        mult_45_n179), .B2(mult_45_n64), .C1(mult_45_n64), .C2(mult_45_n62), 
        .ZN(mult_45_n178) );
  OAI222_X1 mult_45_U146 ( .A1(mult_45_n178), .A2(mult_45_n160), .B1(
        mult_45_n178), .B2(mult_45_n162), .C1(mult_45_n162), .C2(mult_45_n160), 
        .ZN(mult_45_n8) );
  NAND2_X1 mult_45_U145 ( .A1(q_reg2[5]), .A2(c2[8]), .ZN(mult_45_n80) );
  NOR2_X1 mult_45_U144 ( .A1(mult_45_n170), .A2(mult_45_n161), .ZN(mult_45_n81) );
  NOR2_X1 mult_45_U143 ( .A1(mult_45_n171), .A2(mult_45_n161), .ZN(mult_45_n82) );
  NOR2_X1 mult_45_U142 ( .A1(mult_45_n172), .A2(mult_45_n161), .ZN(mult_45_n83) );
  NOR2_X1 mult_45_U141 ( .A1(mult_45_n174), .A2(mult_45_n161), .ZN(mult_45_n85) );
  NOR2_X1 mult_45_U140 ( .A1(mult_45_n175), .A2(mult_45_n161), .ZN(mult_45_n86) );
  NAND2_X1 mult_45_U139 ( .A1(q_reg2[4]), .A2(c2[8]), .ZN(mult_45_n87) );
  NOR2_X1 mult_45_U138 ( .A1(mult_45_n170), .A2(mult_45_n163), .ZN(mult_45_n88) );
  NOR2_X1 mult_45_U137 ( .A1(mult_45_n163), .A2(mult_45_n171), .ZN(mult_45_n89) );
  NOR2_X1 mult_45_U136 ( .A1(mult_45_n172), .A2(mult_45_n163), .ZN(mult_45_n90) );
  NOR2_X1 mult_45_U135 ( .A1(mult_45_n173), .A2(mult_45_n163), .ZN(mult_45_n91) );
  NOR2_X1 mult_45_U134 ( .A1(mult_45_n174), .A2(mult_45_n163), .ZN(mult_45_n92) );
  NOR2_X1 mult_45_U133 ( .A1(mult_45_n163), .A2(mult_45_n175), .ZN(mult_45_n93) );
  NAND2_X1 mult_45_U132 ( .A1(q_reg2[3]), .A2(c2[8]), .ZN(mult_45_n94) );
  NOR2_X1 mult_45_U131 ( .A1(mult_45_n165), .A2(mult_45_n170), .ZN(mult_45_n95) );
  NOR2_X1 mult_45_U130 ( .A1(mult_45_n165), .A2(mult_45_n172), .ZN(mult_45_n97) );
  NOR2_X1 mult_45_U129 ( .A1(mult_45_n165), .A2(mult_45_n173), .ZN(mult_45_n98) );
  NOR2_X1 mult_45_U128 ( .A1(mult_45_n165), .A2(mult_45_n174), .ZN(mult_45_n99) );
  NAND2_X1 mult_45_U127 ( .A1(c2[8]), .A2(q_reg2[6]), .ZN(mult_45_n176) );
  XNOR2_X1 mult_45_U126 ( .A(mult_45_n2), .B(mult_45_n13), .ZN(mult_45_n177)
         );
  XOR2_X1 mult_45_U125 ( .A(mult_45_n176), .B(mult_45_n177), .Z(TMPq2_c2_12_)
         );
  INV_X1 mult_45_U124 ( .A(c2[2]), .ZN(mult_45_n175) );
  INV_X1 mult_45_U123 ( .A(c2[6]), .ZN(mult_45_n171) );
  INV_X1 mult_45_U122 ( .A(c2[4]), .ZN(mult_45_n173) );
  INV_X1 mult_45_U121 ( .A(q_reg2[0]), .ZN(mult_45_n169) );
  INV_X1 mult_45_U120 ( .A(q_reg2[5]), .ZN(mult_45_n161) );
  INV_X1 mult_45_U119 ( .A(q_reg2[3]), .ZN(mult_45_n165) );
  INV_X1 mult_45_U118 ( .A(c2[3]), .ZN(mult_45_n174) );
  INV_X1 mult_45_U117 ( .A(c2[7]), .ZN(mult_45_n170) );
  INV_X1 mult_45_U116 ( .A(c2[5]), .ZN(mult_45_n172) );
  INV_X1 mult_45_U115 ( .A(q_reg2[2]), .ZN(mult_45_n166) );
  INV_X1 mult_45_U114 ( .A(q_reg2[1]), .ZN(mult_45_n168) );
  INV_X1 mult_45_U113 ( .A(q_reg2[4]), .ZN(mult_45_n163) );
  INV_X1 mult_45_U112 ( .A(mult_45_n68), .ZN(mult_45_n167) );
  INV_X1 mult_45_U111 ( .A(mult_45_n54), .ZN(mult_45_n160) );
  INV_X1 mult_45_U110 ( .A(mult_45_n61), .ZN(mult_45_n162) );
  INV_X1 mult_45_U109 ( .A(mult_45_n70), .ZN(mult_45_n164) );
  HA_X1 mult_45_U44 ( .A(mult_45_n113), .B(mult_45_n119), .CO(mult_45_n71), 
        .S(mult_45_n72) );
  HA_X1 mult_45_U43 ( .A(mult_45_n100), .B(mult_45_n106), .CO(mult_45_n69), 
        .S(mult_45_n70) );
  FA_X1 mult_45_U42 ( .A(mult_45_n112), .B(mult_45_n118), .CI(mult_45_n71), 
        .CO(mult_45_n67), .S(mult_45_n68) );
  HA_X1 mult_45_U41 ( .A(mult_45_n93), .B(mult_45_n99), .CO(mult_45_n65), .S(
        mult_45_n66) );
  FA_X1 mult_45_U40 ( .A(mult_45_n105), .B(mult_45_n117), .CI(mult_45_n111), 
        .CO(mult_45_n63), .S(mult_45_n64) );
  FA_X1 mult_45_U39 ( .A(mult_45_n66), .B(mult_45_n69), .CI(mult_45_n67), .CO(
        mult_45_n61), .S(mult_45_n62) );
  HA_X1 mult_45_U38 ( .A(mult_45_n86), .B(mult_45_n92), .CO(mult_45_n59), .S(
        mult_45_n60) );
  FA_X1 mult_45_U37 ( .A(mult_45_n98), .B(mult_45_n116), .CI(mult_45_n104), 
        .CO(mult_45_n57), .S(mult_45_n58) );
  FA_X1 mult_45_U36 ( .A(mult_45_n65), .B(mult_45_n110), .CI(mult_45_n60), 
        .CO(mult_45_n55), .S(mult_45_n56) );
  FA_X1 mult_45_U35 ( .A(mult_45_n58), .B(mult_45_n63), .CI(mult_45_n56), .CO(
        mult_45_n53), .S(mult_45_n54) );
  HA_X1 mult_45_U34 ( .A(mult_45_n97), .B(mult_45_n91), .CO(mult_45_n51), .S(
        mult_45_n52) );
  FA_X1 mult_45_U33 ( .A(mult_45_n85), .B(mult_45_n103), .CI(mult_45_n109), 
        .CO(mult_45_n49), .S(mult_45_n50) );
  FA_X1 mult_45_U32 ( .A(mult_45_n79), .B(mult_45_n115), .CI(mult_45_n59), 
        .CO(mult_45_n47), .S(mult_45_n48) );
  FA_X1 mult_45_U31 ( .A(mult_45_n57), .B(mult_45_n52), .CI(mult_45_n50), .CO(
        mult_45_n45), .S(mult_45_n46) );
  FA_X1 mult_45_U30 ( .A(mult_45_n48), .B(mult_45_n55), .CI(mult_45_n46), .CO(
        mult_45_n43), .S(mult_45_n44) );
  FA_X1 mult_45_U27 ( .A(mult_45_n102), .B(mult_45_n90), .CI(mult_45_n108), 
        .CO(mult_45_n39), .S(mult_45_n40) );
  FA_X1 mult_45_U26 ( .A(mult_45_n51), .B(mult_45_n78), .CI(mult_45_n42), .CO(
        mult_45_n37), .S(mult_45_n38) );
  FA_X1 mult_45_U25 ( .A(mult_45_n47), .B(mult_45_n49), .CI(mult_45_n40), .CO(
        mult_45_n35), .S(mult_45_n36) );
  FA_X1 mult_45_U24 ( .A(mult_45_n45), .B(mult_45_n38), .CI(mult_45_n36), .CO(
        mult_45_n33), .S(mult_45_n34) );
  FA_X1 mult_45_U23 ( .A(mult_45_n83), .B(mult_45_n89), .CI(mult_45_n95), .CO(
        mult_45_n31), .S(mult_45_n32) );
  FA_X1 mult_45_U22 ( .A(mult_45_n77), .B(mult_45_n101), .CI(mult_45_n41), 
        .CO(mult_45_n29), .S(mult_45_n30) );
  FA_X1 mult_45_U21 ( .A(mult_45_n32), .B(mult_45_n39), .CI(mult_45_n37), .CO(
        mult_45_n27), .S(mult_45_n28) );
  FA_X1 mult_45_U20 ( .A(mult_45_n35), .B(mult_45_n30), .CI(mult_45_n28), .CO(
        mult_45_n25), .S(mult_45_n26) );
  FA_X1 mult_45_U19 ( .A(mult_45_n82), .B(mult_45_n88), .CI(mult_45_n94), .CO(
        mult_45_n23), .S(mult_45_n24) );
  FA_X1 mult_45_U18 ( .A(mult_45_n31), .B(mult_45_n76), .CI(mult_45_n29), .CO(
        mult_45_n21), .S(mult_45_n22) );
  FA_X1 mult_45_U17 ( .A(mult_45_n27), .B(mult_45_n24), .CI(mult_45_n22), .CO(
        mult_45_n19), .S(mult_45_n20) );
  FA_X1 mult_45_U16 ( .A(mult_45_n87), .B(mult_45_n81), .CI(mult_45_n75), .CO(
        mult_45_n17), .S(mult_45_n18) );
  FA_X1 mult_45_U15 ( .A(mult_45_n18), .B(mult_45_n23), .CI(mult_45_n21), .CO(
        mult_45_n15), .S(mult_45_n16) );
  FA_X1 mult_45_U14 ( .A(mult_45_n74), .B(mult_45_n80), .CI(mult_45_n17), .CO(
        mult_45_n13), .S(mult_45_n14) );
  FA_X1 mult_45_U8 ( .A(mult_45_n44), .B(mult_45_n53), .CI(mult_45_n8), .CO(
        mult_45_n7), .S(TMPq2_c2_6_) );
  FA_X1 mult_45_U7 ( .A(mult_45_n34), .B(mult_45_n43), .CI(mult_45_n7), .CO(
        mult_45_n6), .S(TMPq2_c2_7_) );
  FA_X1 mult_45_U6 ( .A(mult_45_n26), .B(mult_45_n33), .CI(mult_45_n6), .CO(
        mult_45_n5), .S(TMPq2_c2_8_) );
  FA_X1 mult_45_U5 ( .A(mult_45_n20), .B(mult_45_n25), .CI(mult_45_n5), .CO(
        mult_45_n4), .S(TMPq2_c2_9_) );
  FA_X1 mult_45_U4 ( .A(mult_45_n16), .B(mult_45_n19), .CI(mult_45_n4), .CO(
        mult_45_n3), .S(TMPq2_c2_10_) );
  FA_X1 mult_45_U3 ( .A(mult_45_n15), .B(mult_45_n14), .CI(mult_45_n3), .CO(
        mult_45_n2), .S(TMPq2_c2_11_) );
  AND2_X1 add_1_root_add_0_root_add_48_3_U2 ( .A1(TMPq2_c2_6_), .A2(
        TMPqx_a1_6_), .ZN(add_1_root_add_0_root_add_48_3_n2) );
  XOR2_X1 add_1_root_add_0_root_add_48_3_U1 ( .A(TMPq2_c2_6_), .B(TMPqx_a1_6_), 
        .Z(N0) );
  FA_X1 add_1_root_add_0_root_add_48_3_U1_1 ( .A(TMPqx_a1_7_), .B(TMPq2_c2_7_), 
        .CI(add_1_root_add_0_root_add_48_3_n2), .CO(
        add_1_root_add_0_root_add_48_3_carry[2]), .S(N1) );
  FA_X1 add_1_root_add_0_root_add_48_3_U1_2 ( .A(TMPqx_a1_8_), .B(TMPq2_c2_8_), 
        .CI(add_1_root_add_0_root_add_48_3_carry[2]), .CO(
        add_1_root_add_0_root_add_48_3_carry[3]), .S(N2) );
  FA_X1 add_1_root_add_0_root_add_48_3_U1_3 ( .A(TMPqx_a1_9_), .B(TMPq2_c2_9_), 
        .CI(add_1_root_add_0_root_add_48_3_carry[3]), .CO(
        add_1_root_add_0_root_add_48_3_carry[4]), .S(N3) );
  FA_X1 add_1_root_add_0_root_add_48_3_U1_4 ( .A(TMPqx_a1_10_), .B(
        TMPq2_c2_10_), .CI(add_1_root_add_0_root_add_48_3_carry[4]), .CO(
        add_1_root_add_0_root_add_48_3_carry[5]), .S(N4) );
  FA_X1 add_1_root_add_0_root_add_48_3_U1_5 ( .A(TMPqx_a1_11_), .B(
        TMPq2_c2_11_), .CI(add_1_root_add_0_root_add_48_3_carry[5]), .CO(
        add_1_root_add_0_root_add_48_3_carry[6]), .S(N5) );
  FA_X1 add_1_root_add_0_root_add_48_3_U1_6 ( .A(TMPqx_a1_12_), .B(
        TMPq2_c2_12_), .CI(add_1_root_add_0_root_add_48_3_carry[6]), .S(N6) );
  NOR2_X1 mult_46_U179 ( .A1(mult_46_n165), .A2(mult_46_n175), .ZN(
        mult_46_n100) );
  NAND2_X1 mult_46_U178 ( .A1(q_reg3[2]), .A2(c3[8]), .ZN(mult_46_n101) );
  NOR2_X1 mult_46_U177 ( .A1(mult_46_n170), .A2(mult_46_n166), .ZN(
        mult_46_n102) );
  NOR2_X1 mult_46_U176 ( .A1(mult_46_n171), .A2(mult_46_n166), .ZN(
        mult_46_n103) );
  NOR2_X1 mult_46_U175 ( .A1(mult_46_n172), .A2(mult_46_n166), .ZN(
        mult_46_n104) );
  NOR2_X1 mult_46_U174 ( .A1(mult_46_n173), .A2(mult_46_n166), .ZN(
        mult_46_n105) );
  NOR2_X1 mult_46_U173 ( .A1(mult_46_n174), .A2(mult_46_n166), .ZN(
        mult_46_n106) );
  NAND2_X1 mult_46_U172 ( .A1(q_reg3[1]), .A2(c3[8]), .ZN(mult_46_n108) );
  NOR2_X1 mult_46_U171 ( .A1(mult_46_n170), .A2(mult_46_n168), .ZN(
        mult_46_n109) );
  NOR2_X1 mult_46_U170 ( .A1(mult_46_n171), .A2(mult_46_n168), .ZN(
        mult_46_n110) );
  NOR2_X1 mult_46_U169 ( .A1(mult_46_n172), .A2(mult_46_n168), .ZN(
        mult_46_n111) );
  NOR2_X1 mult_46_U168 ( .A1(mult_46_n173), .A2(mult_46_n168), .ZN(
        mult_46_n112) );
  NOR2_X1 mult_46_U167 ( .A1(mult_46_n174), .A2(mult_46_n168), .ZN(
        mult_46_n113) );
  NAND2_X1 mult_46_U166 ( .A1(q_reg3[0]), .A2(c3[8]), .ZN(mult_46_n115) );
  NOR2_X1 mult_46_U165 ( .A1(mult_46_n170), .A2(mult_46_n169), .ZN(
        mult_46_n116) );
  NOR2_X1 mult_46_U164 ( .A1(mult_46_n171), .A2(mult_46_n169), .ZN(
        mult_46_n117) );
  NOR2_X1 mult_46_U163 ( .A1(mult_46_n172), .A2(mult_46_n169), .ZN(
        mult_46_n118) );
  NOR2_X1 mult_46_U162 ( .A1(mult_46_n173), .A2(mult_46_n169), .ZN(
        mult_46_n119) );
  NAND2_X1 mult_46_U161 ( .A1(c3[6]), .A2(q_reg3[3]), .ZN(mult_46_n184) );
  NAND2_X1 mult_46_U160 ( .A1(q_reg3[5]), .A2(c3[4]), .ZN(mult_46_n183) );
  NAND2_X1 mult_46_U159 ( .A1(mult_46_n184), .A2(mult_46_n183), .ZN(
        mult_46_n41) );
  XNOR2_X1 mult_46_U158 ( .A(mult_46_n183), .B(mult_46_n184), .ZN(mult_46_n42)
         );
  NAND2_X1 mult_46_U157 ( .A1(c3[7]), .A2(q_reg3[6]), .ZN(mult_46_n74) );
  NAND2_X1 mult_46_U156 ( .A1(c3[6]), .A2(q_reg3[6]), .ZN(mult_46_n75) );
  NAND2_X1 mult_46_U155 ( .A1(c3[5]), .A2(q_reg3[6]), .ZN(mult_46_n76) );
  NAND2_X1 mult_46_U154 ( .A1(c3[4]), .A2(q_reg3[6]), .ZN(mult_46_n77) );
  NAND2_X1 mult_46_U153 ( .A1(c3[3]), .A2(q_reg3[6]), .ZN(mult_46_n78) );
  NAND2_X1 mult_46_U152 ( .A1(c3[2]), .A2(q_reg3[6]), .ZN(mult_46_n79) );
  NOR4_X1 mult_46_U151 ( .A1(mult_46_n168), .A2(mult_46_n169), .A3(
        mult_46_n175), .A4(mult_46_n174), .ZN(mult_46_n181) );
  NOR2_X1 mult_46_U150 ( .A1(mult_46_n166), .A2(mult_46_n175), .ZN(
        mult_46_n182) );
  AOI222_X1 mult_46_U149 ( .A1(mult_46_n72), .A2(mult_46_n181), .B1(
        mult_46_n182), .B2(mult_46_n72), .C1(mult_46_n182), .C2(mult_46_n181), 
        .ZN(mult_46_n180) );
  OAI222_X1 mult_46_U148 ( .A1(mult_46_n180), .A2(mult_46_n167), .B1(
        mult_46_n167), .B2(mult_46_n164), .C1(mult_46_n180), .C2(mult_46_n164), 
        .ZN(mult_46_n179) );
  AOI222_X1 mult_46_U147 ( .A1(mult_46_n179), .A2(mult_46_n62), .B1(
        mult_46_n179), .B2(mult_46_n64), .C1(mult_46_n64), .C2(mult_46_n62), 
        .ZN(mult_46_n178) );
  OAI222_X1 mult_46_U146 ( .A1(mult_46_n178), .A2(mult_46_n160), .B1(
        mult_46_n178), .B2(mult_46_n162), .C1(mult_46_n162), .C2(mult_46_n160), 
        .ZN(mult_46_n8) );
  NAND2_X1 mult_46_U145 ( .A1(q_reg3[5]), .A2(c3[8]), .ZN(mult_46_n80) );
  NOR2_X1 mult_46_U144 ( .A1(mult_46_n170), .A2(mult_46_n161), .ZN(mult_46_n81) );
  NOR2_X1 mult_46_U143 ( .A1(mult_46_n171), .A2(mult_46_n161), .ZN(mult_46_n82) );
  NOR2_X1 mult_46_U142 ( .A1(mult_46_n172), .A2(mult_46_n161), .ZN(mult_46_n83) );
  NOR2_X1 mult_46_U141 ( .A1(mult_46_n174), .A2(mult_46_n161), .ZN(mult_46_n85) );
  NOR2_X1 mult_46_U140 ( .A1(mult_46_n175), .A2(mult_46_n161), .ZN(mult_46_n86) );
  NAND2_X1 mult_46_U139 ( .A1(q_reg3[4]), .A2(c3[8]), .ZN(mult_46_n87) );
  NOR2_X1 mult_46_U138 ( .A1(mult_46_n170), .A2(mult_46_n163), .ZN(mult_46_n88) );
  NOR2_X1 mult_46_U137 ( .A1(mult_46_n163), .A2(mult_46_n171), .ZN(mult_46_n89) );
  NOR2_X1 mult_46_U136 ( .A1(mult_46_n172), .A2(mult_46_n163), .ZN(mult_46_n90) );
  NOR2_X1 mult_46_U135 ( .A1(mult_46_n173), .A2(mult_46_n163), .ZN(mult_46_n91) );
  NOR2_X1 mult_46_U134 ( .A1(mult_46_n174), .A2(mult_46_n163), .ZN(mult_46_n92) );
  NOR2_X1 mult_46_U133 ( .A1(mult_46_n163), .A2(mult_46_n175), .ZN(mult_46_n93) );
  NAND2_X1 mult_46_U132 ( .A1(q_reg3[3]), .A2(c3[8]), .ZN(mult_46_n94) );
  NOR2_X1 mult_46_U131 ( .A1(mult_46_n165), .A2(mult_46_n170), .ZN(mult_46_n95) );
  NOR2_X1 mult_46_U130 ( .A1(mult_46_n165), .A2(mult_46_n172), .ZN(mult_46_n97) );
  NOR2_X1 mult_46_U129 ( .A1(mult_46_n165), .A2(mult_46_n173), .ZN(mult_46_n98) );
  NOR2_X1 mult_46_U128 ( .A1(mult_46_n165), .A2(mult_46_n174), .ZN(mult_46_n99) );
  NAND2_X1 mult_46_U127 ( .A1(c3[8]), .A2(q_reg3[6]), .ZN(mult_46_n176) );
  XNOR2_X1 mult_46_U126 ( .A(mult_46_n2), .B(mult_46_n13), .ZN(mult_46_n177)
         );
  XOR2_X1 mult_46_U125 ( .A(mult_46_n176), .B(mult_46_n177), .Z(TMPq3_c3_12_)
         );
  INV_X1 mult_46_U124 ( .A(c3[2]), .ZN(mult_46_n175) );
  INV_X1 mult_46_U123 ( .A(q_reg3[0]), .ZN(mult_46_n169) );
  INV_X1 mult_46_U122 ( .A(c3[6]), .ZN(mult_46_n171) );
  INV_X1 mult_46_U121 ( .A(c3[4]), .ZN(mult_46_n173) );
  INV_X1 mult_46_U120 ( .A(q_reg3[5]), .ZN(mult_46_n161) );
  INV_X1 mult_46_U119 ( .A(q_reg3[3]), .ZN(mult_46_n165) );
  INV_X1 mult_46_U118 ( .A(q_reg3[2]), .ZN(mult_46_n166) );
  INV_X1 mult_46_U117 ( .A(q_reg3[1]), .ZN(mult_46_n168) );
  INV_X1 mult_46_U116 ( .A(c3[3]), .ZN(mult_46_n174) );
  INV_X1 mult_46_U115 ( .A(q_reg3[4]), .ZN(mult_46_n163) );
  INV_X1 mult_46_U114 ( .A(c3[7]), .ZN(mult_46_n170) );
  INV_X1 mult_46_U113 ( .A(c3[5]), .ZN(mult_46_n172) );
  INV_X1 mult_46_U112 ( .A(mult_46_n68), .ZN(mult_46_n167) );
  INV_X1 mult_46_U111 ( .A(mult_46_n54), .ZN(mult_46_n160) );
  INV_X1 mult_46_U110 ( .A(mult_46_n61), .ZN(mult_46_n162) );
  INV_X1 mult_46_U109 ( .A(mult_46_n70), .ZN(mult_46_n164) );
  HA_X1 mult_46_U44 ( .A(mult_46_n113), .B(mult_46_n119), .CO(mult_46_n71), 
        .S(mult_46_n72) );
  HA_X1 mult_46_U43 ( .A(mult_46_n100), .B(mult_46_n106), .CO(mult_46_n69), 
        .S(mult_46_n70) );
  FA_X1 mult_46_U42 ( .A(mult_46_n112), .B(mult_46_n118), .CI(mult_46_n71), 
        .CO(mult_46_n67), .S(mult_46_n68) );
  HA_X1 mult_46_U41 ( .A(mult_46_n93), .B(mult_46_n99), .CO(mult_46_n65), .S(
        mult_46_n66) );
  FA_X1 mult_46_U40 ( .A(mult_46_n105), .B(mult_46_n117), .CI(mult_46_n111), 
        .CO(mult_46_n63), .S(mult_46_n64) );
  FA_X1 mult_46_U39 ( .A(mult_46_n66), .B(mult_46_n69), .CI(mult_46_n67), .CO(
        mult_46_n61), .S(mult_46_n62) );
  HA_X1 mult_46_U38 ( .A(mult_46_n86), .B(mult_46_n92), .CO(mult_46_n59), .S(
        mult_46_n60) );
  FA_X1 mult_46_U37 ( .A(mult_46_n98), .B(mult_46_n116), .CI(mult_46_n104), 
        .CO(mult_46_n57), .S(mult_46_n58) );
  FA_X1 mult_46_U36 ( .A(mult_46_n65), .B(mult_46_n110), .CI(mult_46_n60), 
        .CO(mult_46_n55), .S(mult_46_n56) );
  FA_X1 mult_46_U35 ( .A(mult_46_n58), .B(mult_46_n63), .CI(mult_46_n56), .CO(
        mult_46_n53), .S(mult_46_n54) );
  HA_X1 mult_46_U34 ( .A(mult_46_n97), .B(mult_46_n91), .CO(mult_46_n51), .S(
        mult_46_n52) );
  FA_X1 mult_46_U33 ( .A(mult_46_n85), .B(mult_46_n103), .CI(mult_46_n109), 
        .CO(mult_46_n49), .S(mult_46_n50) );
  FA_X1 mult_46_U32 ( .A(mult_46_n79), .B(mult_46_n115), .CI(mult_46_n59), 
        .CO(mult_46_n47), .S(mult_46_n48) );
  FA_X1 mult_46_U31 ( .A(mult_46_n57), .B(mult_46_n52), .CI(mult_46_n50), .CO(
        mult_46_n45), .S(mult_46_n46) );
  FA_X1 mult_46_U30 ( .A(mult_46_n48), .B(mult_46_n55), .CI(mult_46_n46), .CO(
        mult_46_n43), .S(mult_46_n44) );
  FA_X1 mult_46_U27 ( .A(mult_46_n102), .B(mult_46_n90), .CI(mult_46_n108), 
        .CO(mult_46_n39), .S(mult_46_n40) );
  FA_X1 mult_46_U26 ( .A(mult_46_n51), .B(mult_46_n78), .CI(mult_46_n42), .CO(
        mult_46_n37), .S(mult_46_n38) );
  FA_X1 mult_46_U25 ( .A(mult_46_n47), .B(mult_46_n49), .CI(mult_46_n40), .CO(
        mult_46_n35), .S(mult_46_n36) );
  FA_X1 mult_46_U24 ( .A(mult_46_n45), .B(mult_46_n38), .CI(mult_46_n36), .CO(
        mult_46_n33), .S(mult_46_n34) );
  FA_X1 mult_46_U23 ( .A(mult_46_n83), .B(mult_46_n89), .CI(mult_46_n95), .CO(
        mult_46_n31), .S(mult_46_n32) );
  FA_X1 mult_46_U22 ( .A(mult_46_n77), .B(mult_46_n101), .CI(mult_46_n41), 
        .CO(mult_46_n29), .S(mult_46_n30) );
  FA_X1 mult_46_U21 ( .A(mult_46_n32), .B(mult_46_n39), .CI(mult_46_n37), .CO(
        mult_46_n27), .S(mult_46_n28) );
  FA_X1 mult_46_U20 ( .A(mult_46_n35), .B(mult_46_n30), .CI(mult_46_n28), .CO(
        mult_46_n25), .S(mult_46_n26) );
  FA_X1 mult_46_U19 ( .A(mult_46_n82), .B(mult_46_n88), .CI(mult_46_n94), .CO(
        mult_46_n23), .S(mult_46_n24) );
  FA_X1 mult_46_U18 ( .A(mult_46_n31), .B(mult_46_n76), .CI(mult_46_n29), .CO(
        mult_46_n21), .S(mult_46_n22) );
  FA_X1 mult_46_U17 ( .A(mult_46_n27), .B(mult_46_n24), .CI(mult_46_n22), .CO(
        mult_46_n19), .S(mult_46_n20) );
  FA_X1 mult_46_U16 ( .A(mult_46_n87), .B(mult_46_n81), .CI(mult_46_n75), .CO(
        mult_46_n17), .S(mult_46_n18) );
  FA_X1 mult_46_U15 ( .A(mult_46_n18), .B(mult_46_n23), .CI(mult_46_n21), .CO(
        mult_46_n15), .S(mult_46_n16) );
  FA_X1 mult_46_U14 ( .A(mult_46_n74), .B(mult_46_n80), .CI(mult_46_n17), .CO(
        mult_46_n13), .S(mult_46_n14) );
  FA_X1 mult_46_U8 ( .A(mult_46_n44), .B(mult_46_n53), .CI(mult_46_n8), .CO(
        mult_46_n7), .S(TMPq3_c3_6_) );
  FA_X1 mult_46_U7 ( .A(mult_46_n34), .B(mult_46_n43), .CI(mult_46_n7), .CO(
        mult_46_n6), .S(TMPq3_c3_7_) );
  FA_X1 mult_46_U6 ( .A(mult_46_n26), .B(mult_46_n33), .CI(mult_46_n6), .CO(
        mult_46_n5), .S(TMPq3_c3_8_) );
  FA_X1 mult_46_U5 ( .A(mult_46_n20), .B(mult_46_n25), .CI(mult_46_n5), .CO(
        mult_46_n4), .S(TMPq3_c3_9_) );
  FA_X1 mult_46_U4 ( .A(mult_46_n16), .B(mult_46_n19), .CI(mult_46_n4), .CO(
        mult_46_n3), .S(TMPq3_c3_10_) );
  FA_X1 mult_46_U3 ( .A(mult_46_n15), .B(mult_46_n14), .CI(mult_46_n3), .CO(
        mult_46_n2), .S(TMPq3_c3_11_) );
  XOR2_X1 add_2_root_add_0_root_add_48_3_U2 ( .A(TMPq3_c3_6_), .B(din[2]), .Z(
        N7) );
  AND2_X1 add_2_root_add_0_root_add_48_3_U1 ( .A1(TMPq3_c3_6_), .A2(din[2]), 
        .ZN(add_2_root_add_0_root_add_48_3_n1) );
  FA_X1 add_2_root_add_0_root_add_48_3_U1_1 ( .A(din[3]), .B(TMPq3_c3_7_), 
        .CI(add_2_root_add_0_root_add_48_3_n1), .CO(
        add_2_root_add_0_root_add_48_3_carry[2]), .S(N8) );
  FA_X1 add_2_root_add_0_root_add_48_3_U1_2 ( .A(din[4]), .B(TMPq3_c3_8_), 
        .CI(add_2_root_add_0_root_add_48_3_carry[2]), .CO(
        add_2_root_add_0_root_add_48_3_carry[3]), .S(N9) );
  FA_X1 add_2_root_add_0_root_add_48_3_U1_3 ( .A(din[5]), .B(TMPq3_c3_9_), 
        .CI(add_2_root_add_0_root_add_48_3_carry[3]), .CO(
        add_2_root_add_0_root_add_48_3_carry[4]), .S(N10) );
  FA_X1 add_2_root_add_0_root_add_48_3_U1_4 ( .A(din[6]), .B(TMPq3_c3_10_), 
        .CI(add_2_root_add_0_root_add_48_3_carry[4]), .CO(
        add_2_root_add_0_root_add_48_3_carry[5]), .S(N11) );
  FA_X1 add_2_root_add_0_root_add_48_3_U1_5 ( .A(din[7]), .B(TMPq3_c3_11_), 
        .CI(add_2_root_add_0_root_add_48_3_carry[5]), .CO(
        add_2_root_add_0_root_add_48_3_carry[6]), .S(N12) );
  FA_X1 add_2_root_add_0_root_add_48_3_U1_6 ( .A(din[8]), .B(TMPq3_c3_12_), 
        .CI(add_2_root_add_0_root_add_48_3_carry[6]), .S(N13) );
  XOR2_X1 add_0_root_add_0_root_add_48_3_U2 ( .A(N0), .B(N7), .Z(TMPa[0]) );
  AND2_X1 add_0_root_add_0_root_add_48_3_U1 ( .A1(N0), .A2(N7), .ZN(
        add_0_root_add_0_root_add_48_3_n1) );
  FA_X1 add_0_root_add_0_root_add_48_3_U1_1 ( .A(N8), .B(N1), .CI(
        add_0_root_add_0_root_add_48_3_n1), .CO(
        add_0_root_add_0_root_add_48_3_carry[2]), .S(TMPa[1]) );
  FA_X1 add_0_root_add_0_root_add_48_3_U1_2 ( .A(N9), .B(N2), .CI(
        add_0_root_add_0_root_add_48_3_carry[2]), .CO(
        add_0_root_add_0_root_add_48_3_carry[3]), .S(TMPa[2]) );
  FA_X1 add_0_root_add_0_root_add_48_3_U1_3 ( .A(N10), .B(N3), .CI(
        add_0_root_add_0_root_add_48_3_carry[3]), .CO(
        add_0_root_add_0_root_add_48_3_carry[4]), .S(TMPa[3]) );
  FA_X1 add_0_root_add_0_root_add_48_3_U1_4 ( .A(N11), .B(N4), .CI(
        add_0_root_add_0_root_add_48_3_carry[4]), .CO(
        add_0_root_add_0_root_add_48_3_carry[5]), .S(TMPa[4]) );
  FA_X1 add_0_root_add_0_root_add_48_3_U1_5 ( .A(N12), .B(N5), .CI(
        add_0_root_add_0_root_add_48_3_carry[5]), .CO(
        add_0_root_add_0_root_add_48_3_carry[6]), .S(TMPa[5]) );
  FA_X1 add_0_root_add_0_root_add_48_3_U1_6 ( .A(N13), .B(N6), .CI(
        add_0_root_add_0_root_add_48_3_carry[6]), .S(TMPa[6]) );
endmodule

