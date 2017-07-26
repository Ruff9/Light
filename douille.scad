include <common.scad>;
include <variables.scad>;

position_z_empreinte = hauteur_totale - profondeur_douille-3;

tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);

translate([0,0,hauteur_embout])
  tube(hauteur_butee, rayon_ext_embout, rayon_int_butee, resolution);

difference() {
  translate([0,0,hauteur_embout + hauteur_butee])
    tube(hauteur_jonction+hauteur_ressort-3, rayon_ext_embout, rayon_int_embout, resolution);

  translate([0,0,position_z_empreinte])
    for ( i= [0:nb_baionette] )
      rotate([0,0,i*(360/nb_baionette)]) {
        empreinte();
      }

  translate([0,0,hauteur_totale-3])
    rotate([180,0,0]) {
      rotate_extrude(convexity = 10, $fn = resolution)
        translate([rayon_ext_culot,0,0])
          polygon( points=[[0,0],[3,0],[0,3]] );
    }

}

module empreinte() {

  angle_z = 35;

  rayon_int_empreinte = rayon_int_embout - 2;
  rayon_ext_empreinte = rayon_ext_embout + 2;
  epaisseur_empreinte = rayon_ext_empreinte - rayon_int_empreinte;

  translate([rayon_int_empreinte,0,0])
    rotate([0,0,5]) {
      cube([epaisseur_empreinte, largeur_empreinte, profondeur_douille]);
    }

  translate([rayon_int_empreinte-4.5,8.5,0])
    rotate([0,90,angle_z-1]){
      cylinder(10, largeur_empreinte/2, largeur_empreinte/2, $fn=60);
    }

  translate([0,0,-largeur_empreinte]) {

    difference(){
      tube(largeur_empreinte, rayon_ext_empreinte, rayon_int_empreinte);

      translate([-25,-30,-2])
        cube([60,30,10]);

      rotate([0,0,angle_z]){
        translate([-30,2,-2])
          cube([60, 30, 10]);
      }

      translate([rayon_int_empreinte-5,9,2.5])
        rotate([0,90,angle_z-1]){
          intersection(){
            tube(largeur_empreinte*2, largeur_empreinte*2, largeur_empreinte/2.5);
            cube([60,30,20]);
          }
        }
    }
  }
}
