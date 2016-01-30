include <common.scad>;

//general
hauteur = 35;
rayon_exterieur = 13;
rayon_interieur = 11;
rayon_recepteur = 16;
resolution_cylindre_ext = 60;
rayon_trou = 10;

//donut
nombre_spheres = 100;
resolution_spheres = 50;
rayon_anneau = 5;

tube(hauteur, rayon_exterieur, rayon_interieur, resolution_cylindre_ext);

translate([0,0,hauteur - 3]) {
	tube(3, rayon_recepteur, rayon_trou);
}

translate([0,0,hauteur - rayon_anneau]) {
	difference(){
		donut(nombre_spheres, rayon_anneau, rayon_recepteur);
		translate([0,0,-(hauteur/2)])	
 			cylinder(hauteur + 2, rayon_recepteur, rayon_recepteur);
	}
}

translate([0,0,hauteur - (rayon_anneau*2)]) {
	tube((rayon_anneau*2), rayon_recepteur, rayon_exterieur);
}