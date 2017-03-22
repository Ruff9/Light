include <common.scad>;
include <variables.scad>;

h_cale = 18;

intersection() {
  tube(h_cale, rit40-delta, rit40-2, resolution);
  union() {
    translate([6,-rit40,0])
      cube([rit40, rit40*2, h_cale]);
    translate([-(6+rit40),-rit40,0])
      cube([rit40, rit40*2, h_cale]);
  }
}

translate([6,-rit40+3,0])
  cube([2, rit40*2-6, h_cale]);

translate([-8,-rit40+3,0])
  cube([2, rit40*2-6, h_cale]);

translate([-6,4,0])
  cube([12, 2, h_cale]);

translate([-6,-6,0])
  cube([12, 2, h_cale]);
