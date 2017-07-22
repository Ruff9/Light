include <common.scad>;
include <variables.scad>;

epaisseur_support = 4;

difference() {

  union() {
    support_contact(rit40*2-5);

    intersection(){
      translate([-(rit40*2/2)+1,-5.5,0])
        cube([rit40*2-2,11,epaisseur_support]);
      tube(10, rit40-2-delta, rit40 - 4);
    }
  }

  translate([0,0,-1])
    tube(3.5, rit40-2, rit40 - 5);
}

module support_contact(largeur) {
  largeur_contact = 7.5;
  largeur_support = 11;

  difference(){
    translate([-(largeur/2)+1,-(largeur_support/2),0])
      cube([largeur-2,largeur_support,epaisseur_support]);

    translate([-4,-(largeur_contact/2),-1])
      cube([0.5,largeur_contact,epaisseur_support+2]);
  }
}