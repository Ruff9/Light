include <common.scad>;
include <variables.scad>;

//general
hauteur = 36;
rayon_exterieur = 13;
rayon_interieur = 11;
rayon_recepteur = 16;
resolution_cylindre_ext = resolution;

//donut
rayon_spheres_donut = 3;

//embout
largeur_usb = 8;
hauteur_usb = 3;
rayon_led = 1;

//composant chargeur
longueur_chargeur = 23;
epaisseur_plaque = 1.2;
profondeur_encoche = 25;

difference() {
	tube(hauteur, rayon_exterieur, rayon_interieur, resolution_cylindre_ext);
	translate([-rayon_interieur*1.5, -(rayon_interieur*1.5)/2, -1]) {
		cube([rayon_interieur, rayon_interieur*1.5,profondeur_encoche]);
	}
}

translate([epaisseur_plaque,-(rayon_interieur+0.5),(hauteur-longueur_chargeur-2.5)]) {
	difference() {
		cube([1,(rayon_interieur+1)*2,longueur_chargeur]);
		translate([-0.5, rayon_interieur-3.5, longueur_chargeur/2-4]) {
			cube([2,8,8]);
		}
	}
}

translate([0,0,hauteur - 2]) {
	difference() {
		difference() {
			cylinder(2, rayon_exterieur, rayon_exterieur);
			translate([-hauteur_usb, -(largeur_usb/2), -1])
				cube([hauteur_usb, largeur_usb, 4]);
		}
		translate([-(rayon_led*6), 0, -2])
			cylinder(5, rayon_led, rayon_led, $fn=20);
	}
}

translate([0,0,hauteur - rayon_spheres_donut]) {
	donut(rayon_spheres_donut, rayon_recepteur);
}

translate([0,0,hauteur - (rayon_spheres_donut*2)]) {
	tube((rayon_spheres_donut*2), rayon_recepteur, rayon_exterieur);
}
