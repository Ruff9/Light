include <common.scad>;
include <variables.scad>;

epaisseur_reducteur = 4;
decalage = (rayon_ext_tube_32+epaisseur_reducteur) - rayon_int_tube_40;

tube(20, rayon_ext_tube_32+epaisseur_reducteur, rayon_ext_tube_32);

translate([0,0,20])
	difference() {
		cylinder(10, (rayon_ext_tube_32+epaisseur_reducteur), (rayon_ext_tube_32+epaisseur_reducteur), $fn=60);
		translate([0,decalage,-1])
			cylinder(12, (rayon_int_tube_40-epaisseur_reducteur), (rayon_int_tube_40-epaisseur_reducteur), $fn=60);
	}

translate([0,decalage,30])
	tube(20, rayon_int_tube_40, rayon_int_tube_40-epaisseur_reducteur);