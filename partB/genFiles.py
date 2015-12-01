#!/usr/bin/python

import os

def foo():

	N=4;

	fo = open("foo.v","w");
	
	theString = "module foo (\n\tclk,\n\tGlobalReset,";
	fo.write(theString);
	
	i=0;
	while (i < N):
		
		theString = "\n\tin" + str(i) + ",";
		fo.write(theString);
		
		i=i+1;
	
	theString = "\n\tsel,";
	fo.write(theString);
	
	theString = "\n\tout";
	fo.write(theString);
	
	theString = "\n\t);";
	fo.write(theString);
	
	theString = "\n";
	fo.write(theString);
	
	theString = "\ninput clk;";
	fo.write(theString);
	
	theString = "\ninput GlobalReset;\n";
	fo.write(theString);
	
	i=0;
	while (i < N):
		theString = "\ninput [31:0] in" + str(i) + ";";
		fo.write(theString);
		
		i=i+1;
		
	theString = "\ninput sel;\n";
	fo.write(theString);
	
	theString = "\noutput reg [31:0] out;\n";
	fo.write(theString);
	
	#reg & wire declarations	
	theString = "\n\nreg [31:0] out_r;\n";
	fo.write(theString);
	
	#combinational logic
	theString = "\nalways @( * ) begin";
	fo.write(theString);
	theString = "\n\tcase (sel)";
	fo.write(theString);
	
	i=0;
	while (i < N):
		theString = "\n\t\t1'd" + str(i) + ":";
		fo.write(theString);
		
		theString = "\n\t\tbegin";
		fo.write(theString);
		
		theString = "\n\t\t\tout_r = " + "in" + str(i) + ";";
		fo.write(theString);
		
		theString = "\n\t\tend";
		fo.write(theString);
		
		i=i+1;
	
	theString = "\n\t\tdefault:";
	fo.write(theString);
	
	theString = "\n\t\tbegin";
	fo.write(theString);
	
	theString = "\n\t\t\tout_r = " + "in0;";
	fo.write(theString);
	
	theString = "\n\t\tend";
	fo.write(theString);
	
	theString = "\n\tendcase";
	fo.write(theString);
	
	theString = "\nend";
	fo.write(theString);
	
	#registers
	theString = "\n\nalways @(posedge clk) begin";
	fo.write(theString);
	
	theString = "\n\tif (GlobalReset == 1'b1) begin";
	fo.write(theString);
	
	theString = "\n\t\tout <= in0;";
	fo.write(theString);
	
	theString = "\n\tend";
	fo.write(theString);
	
	theString = "\n\telse begin";
	fo.write(theString);
	
	theString = "\n\t\tout <= out_r;";
	fo.write(theString);
	
	theString = "\n\tend";
	fo.write(theString);
	
	theString = "\nend";
	fo.write(theString);
	
	theString = "\n\nendmodule";
	fo.write(theString);
	
	fo.close();