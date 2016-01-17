include <common.scad>;
include <variables_jonction.scad>;

rayon_ext_male = 20;
rayon_int_male = 18;
baionette_z = hauteur_totale - profondeur_douille + 5;

tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);

translate([0,0,hauteur_embout])
	tube(hauteur_butee, rayon_ext_embout, rayon_int_male, resolution);

translate([0,0,hauteur_embout + hauteur_butee])
	tube(hauteur_jonction, rayon_ext_male, rayon_int_male, resolution);

for ( i= [0:nb_baionette] )
	rotate([0,0,i*(360/nb_baionette)]) {
		translate([0, rayon_ext_male + 5, baionette_z])
			rotate([90,0,0]) {
				cylinder((rayon_ext_male - rayon_int_male +5), 1, $fn=resolution);
			}
	}