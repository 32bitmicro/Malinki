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

Uses Raspberry Pi Compute Module and Hardware Switch Fabric.



#### Goals

- Reduce cost
+ Compute Module is self contained and only needs SODIMM socket plus switch fabric thus reducing
  cost of the individual node.

- Increase functionality
+ Bypass USB/Ethernet bottleneck by using one or all of the on-chip communication interfaces
+ Provide flexible switch fabric using FPGA
+ Design mechanically robust form factor

- Expand user base
+ Recent opening of the Videocore spec will unlocking 24 GFLOPS of the available compute power and will lead to developing new applications accelerated by the GPU.
+ Robust mechanical form factor will open applications in robotics.



## Malinki Cluster Concept

- Dual Cluster with 2 nodes
  Stackable PCB with 2 horizontally oriented modules, fixed GPIO, max power 2×3.5W = 7W can be battery powered, 
  limited interconnect using CPLD for switch fabric

- Small Cluster with 8 nodes 
  Stackable form factor with 8 vertical modules, virtualized (routable) GPIO, max power 8×3.5W = 28W, full interconnect with FPGA switch fabric

- Medium Cluster with 16 nodes 
  Standard desktop form factor (miniITX), combines 2 (back to back) 8 node Small Clusters, standard fixed pin-out, adds power supply connectors, max power 56W 
  full interconnect with FPGA switch fabric

- Big Cluster with 32 nodes
  Standard server motherboard form factor, combines 2 (side by side) 16 node Medium Clusters, adds power distribution and standard server power connections
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


[Fabric Link](https://github.com/32bitmicro/Malinki/blob/master/Fabric.md)
