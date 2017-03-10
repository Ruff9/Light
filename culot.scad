include <common.scad>;
include <variables.scad>;

baionette_z = hauteur_totale - hauteur_ressort - profondeur_douille - 4;
rayon_ext_spot = 25;
rayon_rebord_spot = 23;
rayon_ext_spot = 25;
hauteur_recepteur = hauteur_embout-2;

tube(hauteur_recepteur, rayon_ext_spot+4, rayon_ext_spot, resolution);

translate([0,0,hauteur_recepteur])
  tube(6, rayon_ext_spot+4, rayon_rebord_spot, resolution);

translate([0,0,hauteur_recepteur+6])
  tube(hauteur_butee, rayon_ext_embout, rayon_int_culot, resolution);

translate([0,0,hauteur_recepteur+hauteur_butee+6])
  tube(hauteur_jonction-2, rayon_ext_culot, rayon_int_culot, resolution);

for ( i= [0:nb_baionette] )
  rotate([0,0,i*(360/nb_baionette)]) {
    translate([0, rayon_ext_culot+5, baionette_z])
    rotate([90,0,0]) {
      cylinder((rayon_ext_culot - rayon_int_culot+5), rayon_baionette, rayon_baionette, $fn=resolution);
    }
  }