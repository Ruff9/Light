include <common.scad>;
include <variables.scad>;

epaisseur = 1.5;
h_gaine = 70;
r_gaine = rit40;
r_rigole = 5;

r_piles = 11 + delta;
h_support = 32;

difference(){
  union() {
    gaine();
    rigole();
    fond_contact(r_gaine*2);
    support_piles();
    renforts();
  }
  translate([0,0,-1])
    tube(h_gaine+2, r_gaine+10, r_gaine);
}

module gaine() {
  difference(){
    tube(h_gaine, r_gaine, r_gaine-epaisseur, resolution);
    translate([-r_rigole,-(r_gaine+1),-1])
      cube([r_rigole*2,r_rigole*2,h_gaine+2]);

    translate([-r_rigole,r_gaine-3,-1])
      cube([r_rigole*2,r_rigole*2,h_gaine+2]);
  }
}

module rigole() {
  translate([0,r_gaine-1,0])
    difference(){
      tube(h_gaine, r_rigole+epaisseur, r_rigole, resolution);
      translate([-(r_rigole+2),0,-1])
        cube([(r_rigole+epaisseur)*2,r_rigole+epaisseur,h_gaine+2]);
    }
}

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

module support_piles() {
  hsp = h_gaine + h_support;
  decoupe1 = 25;
  decoupe2 = 15;

  difference(){
    tube(hsp, r_piles+epaisseur, r_piles);
    translate([-decoupe1/2,5,-1])
      cube([decoupe1,decoupe1,hsp+2]);
    translate([-decoupe2/2,-(r_piles+5),-1])
      cube([decoupe2,decoupe2,hsp+2]);
  }
}

module renforts() {
  base_renfort = r_gaine - (r_piles+epaisseur);

  translate([r_piles+epaisseur,-epaisseur/2,0])
    difference() {
      cube([base_renfort,epaisseur,50]);
      translate([base_renfort,-1,0])
        rotate([0,-5.5,0]) {
          cube([base_renfort,epaisseur+2,52]);
        }
    }

  rotate([0,0,180]) {
    translate([r_piles+epaisseur,-epaisseur/2,0])
      difference() {
        cube([base_renfort,epaisseur,50]);
        translate([base_renfort,-1,0])
          rotate([0,-5.5,0]) {
            cube([base_renfort,epaisseur+2,52]);
          }
      }
  }
}