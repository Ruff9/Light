include <common.scad>;
include <variables.scad>;

epRed = 4;
nb_languettes = 2;

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
  tube(5, rit40- epRed/2-delta, rit40 - epRed);

translate([0,0,28])
  fond_contact(rit40*2-epRed-1);

module fond_contact(largeur, epaisseur=2) {
  difference(){
    translate([-(largeur/2)+1,-5,0])
      cube([largeur-2,10,epaisseur]);
    translate([3,-2,-1])
      cube([2,4,epaisseur+2]);
    translate([-5,-2,-1])
      cube([2,4,epaisseur+2]);
  }
}