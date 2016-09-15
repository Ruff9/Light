include <common.scad>;
include <variables.scad>;

// variables qui influent sur la raideur: 
// nb_atome, pas_rotation

mega_factor = 6;

nombre_bras = 5;
angle_bras = 360/nombre_bras;

hauteur = 8 * mega_factor;

hauteur_atome = 1;

largeur_rondelle = rayon_int_embout - rayon_int_butee;
rayon_int = rayon_int_embout - largeur_rondelle - 3*delta;

tube(2, rayon_int+largeur_rondelle, rayon_int);

// difference(){
	for ( i= [0:nombre_bras])
		rotate([0,0,i*angle_bras]) {
			bras(angle_bras);
		}
	// tube(hauteur+2, rayon_int+largeur_rondelle+2, rayon_int+largeur_rondelle);	
// }

// translate([0,0,hauteur-1])
// 	tube(2, rayon_int+largeur_rondelle, rayon_int);

module bras(angle_bras) {
	nb_atome = 30 * mega_factor;
	pas_rotation = (angle_bras/nb_atome) * mega_factor;

	for ( i= [0:nb_atome]) {		
		rotate([0,0,i*pas_rotation]) {
			translate([-largeur_rondelle, rayon_int, i*(hauteur/nb_atome)]) {		
				cube([largeur_rondelle*0.7,largeur_rondelle,hauteur_atome]);
			}
		}
	}
}