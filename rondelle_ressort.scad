include <common.scad>;
include <variables.scad>;

// variables qui influent sur la raideur: 
// nb_atome, pas_rotation

nombre_bras = 5;
angle_bras = 360/nombre_bras;

hauteur = hauteur_grower;

hauteur_atome = 1;

largeur_rondelle = rayon_int_embout - rayon_int_butee;
rayon_int = rayon_int_embout - largeur_rondelle - 3*delta;

// tube(2, rayon_int+largeur_rondelle, rayon_int);

difference(){
	for ( i= [0:nombre_bras])
		rotate([0,0,i*angle_bras]) {
			bras(angle_bras);
		}
	tube(hauteur+2, rayon_int+largeur_rondelle+2, rayon_int+largeur_rondelle);	
}

translate([0,0,hauteur-1])
	tube(2, rayon_int+largeur_rondelle, rayon_int);

// systeme de support custom
// for ( i= [0:nombre_bras]) {
// 	for ( n = [7, 15, 25]) {
// 		rotate([0,0,i*angle_bras+n]) {
// 			translate([0,rayon_int_embout - (largeur_rondelle/2),0])
// 				support(hauteur); 
// 		}
// 	}
// 	for ( n = [38]) {
// 		rotate([0,0,i*angle_bras+n]) {
// 			translate([0,rayon_int_embout - (largeur_rondelle/2),hauteur/2])
// 				support(hauteur/2); 
// 		}
// 	}
// 	for ( n = [50]) {
// 		rotate([0,0,i*angle_bras+n]) {
// 			translate([0,rayon_int_embout - (largeur_rondelle/2),hauteur*(2/3)])
// 				support(hauteur/3); 
// 		}
// 	}
// }

module bras(angle_bras) {
	nb_atome = 40;
	pas_rotation = (angle_bras/nb_atome);

	for ( i= [0:nb_atome]) {		
		rotate([0,0,i*pas_rotation]) {
			translate([-largeur_rondelle, rayon_int, i*(hauteur/nb_atome)]) {		
				cube([largeur_rondelle*0.7,largeur_rondelle,hauteur_atome]);
			}
		}
	}
}

module support(h) {
	cylinder(h, 0.5, 0.5);
}