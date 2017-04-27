include <common.scad>;
include <variables.scad>;

hauteur = 30;
rit32 = 13;
rayon_interieur = 11;
rayon_recepteur = 16;
resolution_cylindre_ext = resolution;
rayon_spheres_donut = 3;

difference() {
	tube(hauteur, rit32, rayon_interieur, resolution_cylindre_ext);
	translate([-rayon_interieur*1.5, -(rayon_interieur*1.5)/2, -1]) {
		cube([rayon_interieur, rayon_interieur*1.5,20]);
	}
}

translate([0,0,hauteur - 2]) {
	difference() {
		cylinder(2, rit32, rit32);
		// translate([-hauteur_usb, -(largeur_usb/2), -1])
		// 	cube([hauteur_usb, largeur_usb, 4]);
	}
}

translate([0,0,hauteur - rayon_spheres_donut]) {
	donut(rayon_spheres_donut, rayon_recepteur);
}

translate([0,0,hauteur - (rayon_spheres_donut*2)]) {
	tube((rayon_spheres_donut*2), rayon_recepteur, rit32);
}
