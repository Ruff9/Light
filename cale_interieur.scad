include <common.scad>;
include <variables.scad>;

h_cale = 5;
epaisseur = 2;

difference() {

  union() {
    tube(h_cale, rit40-delta, rit40-2, resolution);
    rotate([0,0,90]) {
      translate([0,0,h_cale])
        support_contact(rit40*2 + 2);
    }
    for ( i= [0:2] )
      rotate([0,0,i*180]) {
        equerre();
      }
  }

  translate([10,-rit40/4,-1])
    cube([rit40-10, rit40/2, h_cale+2]);
  translate([0,0,-1])
    tube(h_cale+5, rit40+2, rit40-delta);
}

module support_contact(largeur) {
  largeur_contact = 7.5;
  largeur_support = largeur_contact * 1.5 - delta*2;
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

module equerre() {
  translate([-2,rit40-10,0])
  difference() {
    cube([4,8,h_cale]);
    translate([-2,-3,0])
      rotate([-25,0,0]) {
        cube([8,12,h_cale]);
      }
  }
}