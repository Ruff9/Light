include <common.scad>;
include <variables.scad>;

// variables qui influent sur la raideur: 
// nb_atome, pas_rotation

nombre_bras = 6;

hauteur = hauteur_grower;

hauteur_atome = 1;

largeur_rondelle = rayon_int_embout - rayon_int_butee;
rayon_int = rayon_int_embout - largeur_rondelle - 3*delta;

tube(1, rayon_int+largeur_rondelle, rayon_int);

for ( i= [0:nombre_bras])
	rotate([0,0,i*(360/nombre_bras)]) {
		bras(nombre_bras);
	}

translate([0,0,hauteur])
	tube(1, rayon_int+largeur_rondelle, rayon_int);

module bras(nombre_bras) {
	nb_atome = 20;
	pas_rotation = (360/nombre_bras) + 2.3;

	for ( i= [0:nb_atome])
		rotate([0,0,i*pas_rotation]) {
			translate([-largeur_rondelle, rayon_int, i*(hauteur/nb_atome)])
				cube([largeur_rondelle,largeur_rondelle,hauteur_atome]);
		}
}

