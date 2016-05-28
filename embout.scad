include <common.scad>;

//general
hauteur = 35;
rayon_exterieur = 15;
rayon_interieur = 12;
rayon_recepteur = 17;
resolution_cylindre_ext = 60;

//donut
rayon_spheres_donut = 3;

//embout
largeur_usb = 7.3;
hauteur_usb = 2.17;
rayon_led = 1;

tube(hauteur, rayon_exterieur, rayon_interieur, resolution_cylindre_ext);

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
