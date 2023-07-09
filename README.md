# Duplex-UART-System-Verilog
System Verilog implementation of duplex Universal Asynchronous Receiver Transmitter (UART) for 7 bit data packet


![image](https://github.com/ayush-agarwal-0502/Duplex-UART-System-Verilog/assets/86561124/e5a6fda9-5961-4b14-8453-2f9af477c8c4)

__UART__ stands for Universal Asynchronous Receiver Transmitter . It is widely used as a hardware communication protocol since it does not require the clocks to be in sync with each other (hence asynchronous) . __Duplex__ system means that the device can transmit and receive data at the same time . 

__UART transmitter__ converts multi bit data into single bit data to transmit it , whereas __UART Receiver__ takes the incoming single bit data and reassembles it into packet . In my implementation of UART module , the UART Transmitter starts transmitting when posedge is given to the start pin . The UART receiver starts receiving when the first incoming bit is 1 (high) . 

# Results 

![image](https://github.com/ayush-agarwal-0502/Duplex-UART-System-Verilog/assets/86561124/5e187e12-6f18-41db-af34-285750a0067d)
