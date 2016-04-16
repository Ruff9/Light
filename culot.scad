include <common.scad>;
include <variables_jonction.scad>;

tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);

translate([0,0,hauteur_embout])
  tube(hauteur_butee, rayon_ext_embout, rayon_int_culot, resolution);

translate([0,0,hauteur_embout + hauteur_butee])
  tube(hauteur_jonction-2, rayon_ext_culot, rayon_int_culot, resolution);

for ( i= [0:nb_baionette] )
  rotate([0,0,i*(360/nb_baionette)]) {
    translate([0, rayon_ext_culot + 5, baionette_z+2])
    rotate([90,0,0]) {
      cylinder((rayon_ext_culot - rayon_int_culot +5), 0.95*rayon_baionette, 0.95*rayon_baionette, $fn=resolution);
    }
  }
