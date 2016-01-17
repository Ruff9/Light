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

epaisseur_tube = rayon_exterieur - rayon_interieur;
epaisseur_empreinte = epaisseur_tube + 6;
empreinte_douille_droite = 15;
nb_baionette = 3;

tube(hauteur_1, rayon_exterieur, rayon_interieur, 60);

translate([0,0,hauteur_1])
	tube(hauteur_rondelle, rayon_exterieur, 18);

difference() {
	translate([0,0,hauteur_1 + 2])
		tube(hauteur_2, rayon_exterieur, rayon_interieur, 60);
	empreintes();
}
	// empreintes();

module empreintes() {
	for ( i= [0:nb_baionette] )
		rotate([0,0,i*(360/nb_baionette)]) {
			translate([0,0,(hauteur_totale - empreinte_douille_droite +1) ]) {
				translate([14,0,0])
					cube([epaisseur_empreinte +2 , 2, empreinte_douille_droite]);
				rotate([0,0,30]){
					translate([14,0,0])
						cube([epaisseur_empreinte+2, 2, 4]);
				}
				// PROBLEME
				difference(){
					tube(hauteur_rondelle, rayon_exterieur+2, 14);
					translate([-25,-25,-2])
						cube([200,25,10]);
					rotate([0,0,30]){
						translate([-30,2,-2])
							cube([60, 30, 10]);
					}
				}
				// FIN DU PROBLEME
			}
		}
}