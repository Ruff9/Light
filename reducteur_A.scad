include <common.scad>;
include <variables.scad>;

epRed = 4;
nb_languettes = 3;

tube(25, ret32 + epRed, ret32 + delta*2);

translate([0,0,20])
  tube(5, rit40, rit40 - epRed);

translate([0,0,21]) {
  for ( i= [0:nb_languettes] )
    rotate([0,0,i*(360/nb_languettes)]) {
      translate([ret32 + epRed,0,0])
        languette();
    }
}

translate([0,0,25])
  difference(){
    tube(10, rit40- epRed/2-delta, rit40 - epRed);
    translate([-rit40,-5.5,3])
      cube([rit40*2,11,10]);
  }
