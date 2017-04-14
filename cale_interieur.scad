include <common.scad>;
include <variables.scad>;

h_cale = 5;

difference() {
  tube(h_cale, rit40-delta, rit40-2, resolution);
  translate([0,-rit40/4,-1])
    cube([rit40, rit40/2, h_cale+2]);
}
