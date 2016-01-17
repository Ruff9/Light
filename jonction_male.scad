include <common.scad>;
include <variables_jonction.scad>;

rayon_ext_male = 20;
rayon_int_male = 18;

hauteur_totale = hauteur_embout + hauteur_jonction + hauteur_rondelle;

tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, 60);

translate([0,0,hauteur_embout])
	tube(hauteur_rondelle, rayon_ext_embout, rayon_int_male);

translate([0,0,hauteur_embout+2])
	tube(hauteur_jonction, rayon_ext_male, rayon_int_male, 60);

for ( i= [0:nb_baionette] )
	rotate([0,0,i*(360/nb_baionette)]) {
		translate([0, rayon_ext_male + 5, (hauteur_embout + hauteur_jonction/2)])
			rotate([90,0,0]) {
				cylinder((rayon_ext_male - rayon_int_male +5), 1, $fn=60);
			}
	}