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
				empreinte();
			}
}

// empreinte();

module empreinte() {

	rayon_int_empreinte = rayon_int_embout - 2;
	rayon_ext_empreinte = rayon_ext_embout + 2;
	epaisseur_empreinte = rayon_ext_empreinte - rayon_int_empreinte;

	rotate([0,0,-0.5]){
		translate([rayon_int_empreinte,0,0])
			cube([epaisseur_empreinte, largeur_empreinte, profondeur_douille]);
	}

	difference(){
		rotate([0,90,26]){
			translate([0,1,0])
				cylinder(30, largeur_empreinte/2, largeur_empreinte/2, $fn=60);
		}
		translate([0,0,-10])
			tube(30, rayon_int_empreinte, 0);
		translate([0,0,-10])
			tube(40, rayon_ext_empreinte +45, rayon_ext_empreinte);
	}

	translate([0,0,-3])	{
		rotate([0,0,14]){
			difference(){
				translate([40,1,5])	
					rotate([0,-90,0]){
						difference(){
						  cylinder(40, 12, 1, $fn=60);
						  translate([0,0,-1])	
							  cylinder(40, 5.5, 1, $fn=60);
						}
					}
				translate([0,0,-10])
					tube(30, rayon_int_empreinte, 0);
				translate([0,0,-10])
					tube(40, rayon_ext_empreinte +45, rayon_ext_empreinte);
				translate([-30, -30, 3])
					cube([60, 60, 30]);
			}
		}
	}
}
