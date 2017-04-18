include <common.scad>;
include <variables.scad>;

epRed = 4;
nb_languettes = 2;

difference() {
  union() {
    difference() {
      tube(5, ret32 + epRed, ret32 + delta*2);

      translate([-2,ret32+1.25,-1])
        cube([4,1,3]);
    }
    tube(30, rit40, rit40 - epRed);
  }
  translate([0,0,-1])
    tube(6, rit40-epRed/2+delta, rit40-epRed-1);
  translate([0,0,1])
    intersection() {
      cylinder(32,rit40-2,rit40-2);
      cube([10,40,60], center=true);
    }
}


for ( i= [0:nb_languettes] )
  rotate([0,0,i*(360/nb_languettes)]) {
    translate([ret32 + epRed,0,0])
      languette();
  }

