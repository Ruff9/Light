include <common.scad>;
include <variables.scad>;

n = 80;
hauteur = hauteur_grower;
largeur = rayon_int_embout - rayon_int_butee;
rayon_int = rayon_int_embout - largeur;

for ( i= [0:n-6])
	translate([0,0,i*(hauteur/n)])
	rotate([0,0,i*(360/n)]) {
		translate([-largeur, rayon_int-delta, 0])
			cube(largeur);
	}
