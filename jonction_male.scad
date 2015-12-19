include <common.scad>;
// include <variables_jonction.scad>;

// 1 = embout extérieur : accueille le diffuseur
// 2 = embout intérieur : s'enclenche dans la jonction femelle (+ étroit)

// ! mesures à prendre 

hauteur_1 = 30;
rayon_exterieur_1 = 22;
rayon_interieur_1 = 20;

hauteur_2 = 25;
rayon_exterieur_2 = 20;
rayon_interieur_2 = 18;

tube_cylindrique(hauteur_1, rayon_exterieur_1, rayon_interieur_1, 60);

translate([0,0,hauteur_1])
	rondelle(2, rayon_exterieur_1, rayon_interieur_2);

translate([0,0,hauteur_1+2])
	tube_cylindrique(hauteur_2, rayon_exterieur_2, rayon_interieur_2, 60);

for ( i= [0:3])
	rotate([0,0,i*(360/3)]) {
		translate([0, rayon_exterieur_2, (hauteur_1 + hauteur_2/2)])
		cube([2,2,5]);
	}