include <common.scad>;
include <variables.scad>;

support_contact(rit40*2-5);

intersection(){
  translate([-(rit40*2/2)+1,-5.5,0])
    cube([rit40*2-2,11,1.5]);
  tube(10, rit40-2-delta, rit40 - 4);
}

module support_contact(largeur) {
  largeur_contact = 7.5;
  // largeur_support = largeur_contact * 1.5 - delta*2;
  largeur_support = 11;

  epaisseur_support = 1.5;

  difference(){
    translate([-(largeur/2)+1,-(largeur_support/2),0])
      cube([largeur-2,largeur_support,epaisseur_support]);

    translate([2,-(largeur_contact/2),-1])
      trou_contact(3.5);

    translate([0,-(largeur_contact/2),0])
      rotate([0,55,0]) {
        trou_contact(2);
      }
    translate([-4,-(largeur_contact/2),-1])
      trou_contact(2);
  }

  module trou_contact(longueur) {
    cube([longueur,largeur_contact,epaisseur_support+2]);
  }
}