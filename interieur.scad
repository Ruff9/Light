include <common.scad>;
include <variables.scad>;

epaisseur = 1.5;
h_gaine = 70;
r_gaine = rit40;
r_rigole = 5;

r_piles = 11 + delta*2;
h_support = 32;

largeur_ouverture = 18;

difference(){
  union() {
    gaine();
    rigole();
    support_piles();
    renforts_a();
    renforts_b();
  }
  translate([0,0,-1])
    tube(h_gaine+2, r_gaine+10, r_gaine);
  translate([-r_gaine,-(5+delta),-1])
    cube([r_gaine*2,10+delta*2,epaisseur+1]);
}

module gaine() {
  difference(){
    tube(h_gaine, r_gaine, r_gaine-epaisseur, resolution);
    translate([-(largeur_ouverture/2),-(r_gaine+1),-1])
      cube([largeur_ouverture,largeur_ouverture,h_gaine+2]);

    translate([-r_rigole,r_gaine-3,-1])
      cube([r_rigole*2,r_rigole*2,h_gaine+2]);
  }
}

module rigole() {
  l_rigole = 12;
  h_rigole = r_gaine-r_piles;

  intersection(){
    tube(h_gaine, r_piles+epaisseur, r_piles);
    translate([-l_rigole/2,h_rigole+epaisseur,-1])
      cube([l_rigole,h_rigole,h_gaine+2]);
  }
  translate([(l_rigole/2)-epaisseur,r_piles,0])
    cube([epaisseur,h_rigole,h_gaine]);
  translate([-(l_rigole/2),r_piles,0])
    cube([epaisseur,h_rigole,h_gaine]);
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

module renforts_b() {
  hsp = h_gaine + h_support;
  largeur = largeur_ouverture;
  hauteur = 9;

  translate([-largeur/2,-(r_piles+6),0])
    difference() {
      cube([largeur,hauteur,h_gaine]);
      translate([epaisseur,-1,-1])
        cube([largeur-epaisseur*2,hauteur+2,h_gaine+2]);
    }
}

module renforts_a() {
  base_renfort = r_gaine - (r_piles+epaisseur);

  for ( i= [0:2] )
    rotate([0,0,i*180]) {
      translate([r_piles+epaisseur-1,-epaisseur/2,0])
        cube([base_renfort,epaisseur,50]);
  }
}