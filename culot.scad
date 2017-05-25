include <common.scad>;
include <variables.scad>;

baionette_z = hauteur_totale - hauteur_ressort - profondeur_douille + 3;

rayon_rebord_spot = 24;
hauteur_recepteur = hauteur_embout - 2;

difference() {
  union() {
    tube(hauteur_recepteur, rayon_ext_spot+4, rayon_ext_spot, resolution);

    translate([0,0,hauteur_recepteur])
      tube(8, rayon_ext_spot+4, rayon_rebord_spot, resolution);

    difference() {
      union() {
        translate([0,0,hauteur_recepteur+3])
          tube(hauteur_butee+5, rayon_ext_spot+4, rayon_int_culot, resolution);

        translate([0,0,hauteur_recepteur+hauteur_butee+8])
          tube(hauteur_jonction-1, rayon_ext_culot, rayon_int_culot, resolution);
      }
      translate([0,0,hauteur_recepteur+2])
        cylinder(hauteur_recepteur+15, rayon_ext_embout, 0);
    }
  }

  for ( i= [0:nb_baionette] )
    rotate([0,0,i*(360/nb_baionette)+180/nb_baionette]) {
      translate([0, rayon_ext_culot+18, -1]) {
        cylinder(hauteur_recepteur*2,15,15);

        translate([9,-12, 0]) {
          rotate([0,0,15]) {
            cube([5,5,hauteur_recepteur*2]);
          }
        }

        translate([-14,-11, 0]) {
          rotate([0,0,-15]) {
            cube([6,5,hauteur_recepteur*2]);
          }
        }
      }
    }
}

for ( i= [0:nb_baionette] )
  rotate([0,0,i*(360/nb_baionette)]) {
    translate([0, rayon_ext_culot+5, baionette_z])
    rotate([90,0,0]) {
      cylinder((rayon_ext_culot - rayon_int_culot+5), rayon_baionette, rayon_baionette, $fn=resolution);
    }
  }