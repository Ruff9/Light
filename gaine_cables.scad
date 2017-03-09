include <common.scad>;
include <variables.scad>;

h_gaine = 70;
r_rigole = 3;

difference(){
  tube(h_gaine, rit40, rit40-2, resolution);
  translate([-4,-(rit40+1),-1])
    cube([8,8,h_gaine+2]);

  translate([-3,rit40-3,-1])
    cube([6,6,h_gaine+2]);
}

translate([0,rit40-1,0])
  difference(){
    tube(h_gaine, r_rigole+2, r_rigole, resolution);
    translate([-(r_rigole+2),0,-1])
      cube([(r_rigole+2)*2,r_rigole+2,h_gaine+2]);
  }