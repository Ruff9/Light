include <common.scad>;
include <variables_jonction.scad>;

hauteur_totale = hauteur_jonction + hauteur_embout + hauteur_rondelle;

epaisseur_tube = rayon_ext_embout - rayon_int_embout;
epaisseur_empreinte = epaisseur_tube + 6;
empreinte_douille_droite = 15;

tube(hauteur_jonction, rayon_ext_embout, rayon_int_embout, 60);

translate([0,0,hauteur_jonction])
	tube(hauteur_rondelle, rayon_ext_embout, 18);

difference() {
	translate([0,0,hauteur_jonction + 2])
		tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, 60);
	#empreintes();
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
				difference(){
					tube(hauteur_rondelle, rayon_ext_embout+2, 14);
					translate([-25,-25,-2])
						cube([200,25,10]);
					rotate([0,0,30]){
						translate([-30,2,-2])
							cube([60, 30, 10]);
					}
				}
			}
		}
}

// intersection() {
	// difference(){
	// 	tube(hauteur_rondelle, rayon_ext_embout+2, 14);

	// 	translate([-25,-25,-2])
	// 		cube([200,25,10]);

	// 	rotate([0,0,30]){
	// 		translate([-30,2,-2])
	// 			cube([60, 30, 10]);
	// 	}
	// }

	// translate([22,7,8])	
	// 	rotate([0,-90,18]){
	// 		difference(){
	// 		  cylinder(30, 10, 10, $fn=60);
	// 		  translate([0,0,-1])	
	// 			  cylinder(30, 8, 8, $fn=60);
	// 		}
	// 	}
// }