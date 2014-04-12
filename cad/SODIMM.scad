// Malinki Cluster Project
// Pawel Wodnicki (c) 2014
// SO-DIMM 200 pin
// JEDEC MO224
// All values in mm
// SYMBOL MIN    NOM    MAX
// A      25.25  25.40  25.55
// C       0.9    1.0    1.1
// D      67.45  67.60  67.75
// A1             6.00 BASIC
// A4            20.00 BASIC
// D2            63.60 BASIC
// D5            18.45 BASIC
// +------------|------------+
//  )           |           (
// |            |            |
// |o           |           o|
// +------------+------------+
//              | (0,0,0) 



// Simple SODIMM model
module SODIMM(position, rot)
{
   A = 25.40;
   C = 1.0;
   D = 67.60;
	A1 = 6.00;
	A4 = 20.00;
	D2 = 63.60;
	D5 = 18.45;
	rotate(a = rot, v = [1, 0, 0]) {
         translate(position) {
			  difference() {
				union() {
				   translate([-D/2, 0, 0]) color([0,1,0]) cube([D,A,C]); // outline
				}
				// subtract
				union() {
					// wholes
					translate([-D2/2, A1, 0]) cylinder(r = 1, h = 2, center = true,$fn=20);
					translate([D2/2, A1, 0]) cylinder(r = 1, h = 2, center = true,$fn=20);
					// round notches
					translate([-D/2, A4, 0]) cylinder(r = 2, h = 2, center = true,$fn=20);
					translate([D/2, A4, 0]) cylinder(r = 2, h = 2, center = true,$fn=20);
					// notch
					translate([-D5, 3, 0]) cylinder(r = 0.5, h = 2, center = true,$fn=20);
					translate([-D5-0.5, 0, 0]) cube([1,3,C]);
				}
  			}
		}
	}
}

