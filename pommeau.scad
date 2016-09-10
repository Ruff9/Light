include <common.scad>;
include <variables.scad>;

//general
hauteur = 35;
rayon_exterieur = 13;
rayon_interieur = 11;
rayon_recepteur = 16;
resolution_cylindre_ext = resolution;
rayon_trou = 10.5;

//donut
rayon_spheres_donut = 5;

tube(hauteur- (rayon_spheres_donut), rayon_exterieur, rayon_interieur, resolution_cylindre_ext);

translate([0,0,hauteur - 3]) {
	difference(){
		tube(3, rayon_recepteur, rayon_trou);
		translate([-2.5,rayon_trou-1.5,-1])
			cube([5,3,5]);
		translate([-2.5,-(rayon_trou+1.5),-1])
			cube([5,3,5]);
	}
}

translate([0,0,hauteur - rayon_spheres_donut]) {
	difference(){
		donut(rayon_spheres_donut, rayon_recepteur);
		translate([0,0,-(hauteur/2)])	
 			cylinder(hauteur + 2, rayon_recepteur, rayon_recepteur);
	}
}

translate([0,0,hauteur - (rayon_spheres_donut*2)]) {
	tube((rayon_spheres_donut*2), rayon_recepteur, rayon_exterieur);
}