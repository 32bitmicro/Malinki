// Malinki Cluster Project
// MiniCluster
// Pawel Wodnicki (c) 2014

include <SODIMM.scad>

// PCB dimensions
W = 100;
H = 1.0;
L = 120;

module MiniClusterPCB(position, rot)
{
	
	rotate(a = rot, v = [1, 0, 0]) {
         translate(position) {
			  difference() {
				union() {
				   translate([-W/2, -L/2, 0]) color([0,1,0]) cube([W,L,H]); // outline
				}
				// subtract
				union() {
					// wholes
					translate([-W/2+4, -L/2+4, 0]) cylinder(r = 3.2, h = 2, center = true,$fn=20);
					translate([ W/2-4, -L/2+4, 0]) cylinder(r = 3.2, h = 2, center = true,$fn=20);
					translate([ W/2-4,  L/2-4, 0]) cylinder(r = 3.2, h = 2, center = true,$fn=20);
					translate([-W/2+4,  L/2-4, 0]) cylinder(r = 3.2, h = 2, center = true,$fn=20);
				}
  			}
		}
	}
}


// Make the cluster
// PCB is placed centered around [0,0,0]
X = 0;
Y = 0;
Z = 0;
// DIMM conector size is 76.6 by 9.4
S = 10; // SODIMM spacing
// When plugged SODIMM PCB will be raised by 4 (TBV!)
X1 = X;
Y1 = Y + H + 4;
Z1 = Z;
MiniClusterPCB([X,Y,Z],0);
SODIMM([X1,Y1,Z1-S*4+S/2],90);			// 0MOD
SODIMM([X1,Y1,Z1-S*3+S/2],90);			// 1of8
SODIMM([X1,Y1,Z1-S*2+S/2],90);			// 2of8
SODIMM([X1,Y1,Z1-S*1+S/2],90);			// 3of8
SODIMM([X1,Y1,Z1+S*1-S/2],90);			// 4of8
SODIMM([X1,Y1,Z1+S*2-S/2],90);			// 5of8
SODIMM([X1,Y1,Z1+S*3-S/2],90);			// 6of8
SODIMM([X1,Y1,Z1+S*4-S/2],90);			// seven

