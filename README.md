# Simple-9-bits-Processor
A Simple 9 bits Processor that use a ROM memory for programs, the processor contains a number of nine-bit registers, a multiplexer, an adder/subtractor unit and a control unit (finite state machine).
The input of 9-bit data to the system is via the DIN input. This data can be loaded via a large multiplexer of different registers. The size of the inputs and the size of the output of the multiplexer is 9 bits. The multiplexer also allows data to be transferred from one register to register to the other. The output of the multiplexer can be called bus because it allows to transfer data from one location to another.
This processor is implemented on a DE1 SOC.
The "processor" entity is a component of the (component of the "top"). Use switches SW8-0 for the DIN input of the processor and use switch SW9 for the
switch SW9 for the Run input. Also use the KEY0 push-button for aResetn and KEY1 for
Clock. Connect the processor bus wires to LEDR8-0 and connect the Done signal to LEDR9.
