include <common.scad>;
include <variables.scad>;

epaisseur_reducteur = 4;
epRed = epaisseur_reducteur;

tube(30, ret32+epRed, ret32);

translate([0,0,20])
	rotate_extrude(convexity=10, $fn=resolution) {	
		translate([ret32-ep40,0,0])
			polygon([[0,0],[ep40,0],[ep40,ep40]]);
	}

translate([0,0,30])
	difference() {

		linear_extrude(height=15, convexity=10, scale=rit40/(ret32+epRed), $fn=resolution) {
		 	circle(r = ret32+epRed);
		}
		translate([0,0,-1])
			linear_extrude(height=17, convexity=10, scale=rit40/(ret32+epRed), $fn=resolution) {
			 	circle(r = ret32);
			}
}

translate([0,0,30])
	tube(15, ret32+epRed, ret32);

translate([0,0,45])
	tube(20, rit40, rit40-epRed+0.5);

// translate([0,0,43])
// 	rotate_extrude(convexity=10, $fn=resolution) {	
// 		translate([rit40,0,0])
// 			polygon([[0,0],[ep40,ep40],[0,ep40]]);
// 	}