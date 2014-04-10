Malinki
=======

Malinki - Hardware Cluster with Switch Fabric for Raspberry Pi


## Rationale

Design cluster solution for Raspberry Pi Compute Module that removes limitations of existing solution.


### Existing Bramble style clusters

Uses Raspberry Pi and Ethernet as switch fabric to implement Beowulf cluster.
Suffers from limitations due to Ethernet interconnect.


#### Discussion of Limitations

http://elinux.org/Bramble



### New Malinki style cluster

Uses Raspberry Pi Compute Module and Hardware Switch Fabric



#### Goals

1. Reduce cost

Compute Module is self contained and only needs SODIMM socket plus the Switch Fabric thus reducing
cost individual node.

2. Increase functionality

+ Bypass USB/Ethernet bottleneck by using one or all of the on-chip communication interfaces
+ Provide flexible switch fabric using FPGA
+ Design mechanically robust form factor

3. Expand user base

Recent opening of the Videocore spec will allow to unlock 24 GFLOPS of the available compute power and will lead to developing new applications accelerated by the GPU.
Robust mechanical form factor will open applications in robotics.



## Malinki Cluster Concept

1. Dual Cluster with 2 nodes

stack-able PCB with 2 horizontally oriented modules, fixed GPIO, max power 2×3.5W = 7W can be battery powered, 
limited interconnect using CPLD for switch fabric

2. Small Cluster with 8 nodes 

stack-able form factor with 8 vertical modules, virtualized (rout-able) GPIO, max power 8×3.5W = 28W, full interconnect with FPGA 

3. Medium Cluster with 16 nodes 

standard desktop form factor (miniITX), combines 2 (back to back) 8 node Small Clusters, standard fixed pin-out, add adds power supply connectors, max power 56W
full interconnect with FPGA

4. Big Cluster with 32 nodes

standard server motherboard form factor, combines 2 (side by side) 16 node  Medium Clusters, adds power distribution and standard server power connections
max power 112W




## Switch Fabric

### Raspi I/O interfaces

- I2C
- SPI
- UART
- JTAG
- GPIO
- USB
- MIPI with CSI and DSI ports


### Switch Fabric Implementation

#### CPLD based using existing chips

Pros:
- Easy to implenent using existing chips for USB and Ethernet
- Inexpensive

Cons:
- Slower
- Not flexible
- Only some IO is routable


#### FPGA based

Pros:
- Flexiblity
- Routable IO
- Interconnect Speed

Cons:
- Cost
- Complexity

