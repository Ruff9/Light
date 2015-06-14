include <common.scad>;

//general
hauteur = 35;
rayon_exterieur = 15;
rayon_interieur = 12;
rayon_recepteur = 17;
resolution_cylindre_ext = 60;
rayon_trou = 8;

//ring
nombre_spheres = 100;
resolution_spheres = 50;
rayon_anneau = 5;

difference(){
 cylinder(hauteur, rayon_exterieur, rayon_exterieur, $fn=resolution_cylindre_ext);
 translate([0,0,-1])	
 	cylinder(hauteur + 2 , rayon_interieur, rayon_interieur);
}

translate([0,0,hauteur - 2]) {
	rondelle(2, rayon_recepteur, rayon_trou);
}

translate([0,0,hauteur - rayon_anneau]) {
	difference(){
		ring(nombre_spheres, rayon_anneau, rayon_recepteur);
		translate([0,0,-(hauteur/2)])	
 			cylinder(hauteur + 2, rayon_recepteur, rayon_recepteur);
	}
}

translate([0,0,hauteur - (rayon_anneau*2)]) {
	rondelle((rayon_anneau*2), rayon_recepteur, rayon_exterieur);
}