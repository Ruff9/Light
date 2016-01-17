include <common.scad>;
include <variables_jonction.scad>;

tube(hauteur_jonction, rayon_ext_embout, rayon_int_embout, resolution);

translate([0,0,hauteur_jonction])
	tube(hauteur_butee, rayon_ext_embout, 16, resolution);

difference() {
	translate([0,0,hauteur_jonction + hauteur_butee])
		tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);
	translate([0,0,(hauteur_totale - profondeur_douille +1) ])
		for ( i= [0:nb_baionette] )
			rotate([0,0,i*(360/nb_baionette)]) {
				#empreinte();
			}
}

// empreinte();

module empreinte() {

	rayon_int_empreinte = rayon_int_embout - 2;
	rayon_ext_empreinte = rayon_ext_embout + 2;
	epaisseur_empreinte = rayon_ext_empreinte - rayon_int_empreinte;
	largeur_empreinte 	= 2;

	angle_z = 30;

	translate([rayon_int_empreinte,0,0])
		cube([epaisseur_empreinte, largeur_empreinte, profondeur_douille]);

	rotate([0,0,angle_z]){
		translate([rayon_int_empreinte,0,0])
			cube([epaisseur_empreinte, largeur_empreinte, 4]);
	}

	difference(){
		tube(largeur_empreinte, rayon_ext_empreinte, rayon_int_empreinte);
		translate([-25,-25,-2])
			cube([200,25,10]);
		rotate([0,0,angle_z]){
			translate([-30,2,-2])
				cube([60, 30, 10]);
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