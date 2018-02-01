# Analogic and Digital Filtering with Matlab and Multisim

Authors:
Huarita, Leonel Iván
Schymansky, Leonardo
Vinokur, Gastón

This is a filter design made in matlab for the "Electronica IV" Subject in the Bioengineering Career in the "Universidad de Entre Rios" in Argentina.

We use the Matlab software to design the filters, both the analog and digital versions, and the Multisim tool to simulate an electronic circuit (that is also then implemented physically in a protoboard).

We also make use of an automated filter generator included with Matlab, called FDATools, to design the digital filter specifically.

The filters are designed to meet the requirements specified in the .pdf file.
Said file documents in detail the entire process and the conclusions. Bear in mind that it's in Spanish.

How to run this program
-----------------------

1. Include all the files in the same project folder.
2. Compile TP3digital.m and TP3analogico.m to see the results of the Digital and Analog filters, respectively. The code is heavily commented in Spanish so it should be easy to understand. If you know Spanish, that is :P
3. The former 2 files output the filters' configuration, that is then implemented in Multisim. The "TP3digital.mdl" file can be opened with Maltab and shows the implementation of the filters, along with 3 scopes to measure the outputs and 3 different sin() signals as inputs.
4. You can adjust the zoom of the output from the scopes to see how the filter works. You might have to uncheck the limiting of the data points first. In each of the scopes, go to View -> Configuration properties... -> Logging to do this.
5. The .pdf file explains the results and shows the same plots obtained with Multisim.
