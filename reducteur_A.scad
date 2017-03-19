include <common.scad>;
include <variables.scad>;

epRed = 4;

tube(25, ret32 + epRed, ret32 + delta*2);

translate([0,0,20])
  tube(5, rit40, rit40 - epRed);

translate([0,0,25])
  tube(5, rit40- epRed/2-delta, rit40 - epRed);

translate([0,0,21]) {
  for ( i= [0:2] )
    rotate([0,0,i*(360/2)]) {
      translate([ret32 + epRed,0,0])
        languette();
    }
}
