include <common.scad>;
include <variables.scad>;

epRed = 4;
nb_languettes = 2;

difference() {
  union() {
    tube(5, ret32 + epRed, ret32 + delta*2);
    tube(30, rit40, rit40 - epRed);
  }
  translate([0,0,-1])
    tube(6, rit40-epRed/2+delta, rit40-epRed-1);
}

for ( i= [0:nb_languettes] )
  rotate([0,0,i*(360/nb_languettes)]) {
    translate([ret32 + epRed,0,0])
      languette();
  }

