interface router_if (input bit clock);

// Declaration of Interface Signals

logic [7:0] data_in;
logic [7:0] data_out;
logic rst;
logic error;
logic busy;
logic valid_out;

bit pkt_valid;
bit read_enb;

// Write Driver Clocking Block

clocking wdr_cb @(posedge clock);

default input #1 output #1;

output rst;
output data_in;
output pkt_valid;

input error;
input busy;

endclocking

// Write Monitor Clocking Block

clocking wrmon_cb @(posedge clock);

default input #1 output #1;

input rst;
input data_in;
input pkt_valid;
input error;
input busy;

endclocking

// Read Driver Clocking Block

clocking rdr_cb @(posedge clock);

default input #1 output #1;

output read_enb;

input valid_out;

endclocking

// Read Monitor Clocking Block

clocking rdmon_cb @(posedge clock);

default input #1 output #1;

input data_out;
input read_enb;

endclocking

// List of Modports

modport WDR_MP (clocking wdr_cb);
modport WMON_MP (clocking wrmon_cb);
modport RDR_MP (clocking rdr_cb);
modport RDMON_MP (clocking rdmon_cb);

endinterface


//to check

// modify 1
