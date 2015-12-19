include <common.scad>;
// include <variables_jonction.scad>;

// 1 : accueille la jonction male
// 2 : accueille le corps du tonfa

// ! mesures à prendre 

hauteur_1 = 25; //identique à hauteur_2 de la piece male?
hauteur_2 = 30;
hauteur_rondelle = 2;
hauteur_totale = hauteur_1 + hauteur_2 + hauteur_rondelle;

rayon_exterieur = 22;
rayon_interieur = 20;

epaisseur = rayon_exterieur - rayon_interieur;
empreinte_douille_droite = 15;
nb_attache_douille = 3;

tube_cylindrique(hauteur_1, rayon_exterieur, rayon_interieur, 60);

translate([0,0,hauteur_1])
	rondelle(hauteur_rondelle, rayon_exterieur, 18);

difference() {
	translate([0,0,hauteur_1 + 2])
		tube_cylindrique(hauteur_2, rayon_exterieur, rayon_interieur, 60);
	for ( i= [0:nb_attache_douille] )
		rotate([0,0,i*(360/nb_attache_douille)]) {
			translate([rayon_interieur-1,0,(hauteur_totale - empreinte_douille_droite +1) ])
				cube([epaisseur+2, 2, empreinte_douille_droite]);
			}
}