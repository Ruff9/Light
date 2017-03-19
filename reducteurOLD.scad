include <common.scad>;
include <variables.scad>;

epRed = 4;

tube(35, ret32 + epRed, ret32 + delta*2);

translate([0,0,20])
	tube(35, rit40, rit40 - epRed);
