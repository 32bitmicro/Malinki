Malinki
=======

Malinki - Hardware Cluster with Switch Fabric for Raspberry Pi


## Rationale

Design cluster solution for for Raspberry Pi Compute Module that removes limitiation of existing solutions.


### Existing Bramble style clusters

Uses Raspberry Pi and Ethernet as switch fabric to implement Beowulf cluster.
Suffers from limitations due to Ethernet interconnect.


#### Discusion of Limitations

http://elinux.org/Bramble



### New Malinki style cluster

Uses Raspberry Pi Compute Module and Hardware Switch Fabric



#### Goals

Reduce cost
Compute Module is self contained and only needs SODIMM socket plus the Switch Fabric thus reducing
cost individual node.

Icrease functionality
+ Bypass USB/Ethernet bottleneck by using one or all of the on-chip communication interfaces
+ Provide flexible switch fabric using FPGA
+ Design mechanicaly robust form factor

Expand user base
Recent opening of the Videocore spec will lead to unlocking 24GFLOPS of the available
computer power and to devloping new applications accelerated with the GPU.
Robust mechanical form factor will open aplications in robotics.



## Malinki Cluster Concept

1. Dual Cluster with 2 nodes
stackble PCB with 2 horizontally oriented modules, fixed GPIO, max power 2x3.5W = 7W can be battery powered, 
limited inerconnect using CPLD for switch fabric

2. Small Cluster with 8 nodes 
stackable form factor with 8 vertical modules, virtualized (routable) GPIO, max power 8x3.5W = 28W, full interconnect with FPGA 

3. Medium Cluster with 16 nodes 
standard desktop form factor (miniITX), combines 2 (back to back) 8 node Small Clusters, standard fixed pinout, add adds power suply connectors, max power 56W
full interconnect with FPGA

4. Big Cluster with 32 nodes
standard server motherboard form factor, combines 2 (side by side) 16 node  Medium Clusters, adds power distributon and standard server power connections
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

