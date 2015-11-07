include <common.scad>;
// include <variables_jonction.scad>;

// 1 : accueille la jonction male
// 2 : accueille le corps du tonfa

// ! mesures à prendre 

hauteur_1 = 25; //identique à hauteur_2 de la piece male?
hauteur_2 = 30;

rayon_exterieur = 22;
rayon_interieur = 20;

tube_cylindrique(hauteur_1, rayon_exterieur, rayon_interieur, 60);

translate([0,0,hauteur_1])
	rondelle(2, rayon_exterieur, 18);

translate([0,0,hauteur_1 + 2])
	tube_cylindrique(hauteur_2, rayon_exterieur, rayon_interieur, 60);
