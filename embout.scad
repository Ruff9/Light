include <common.scad>;

//general
hauteur = 35;
rayon_exterieur = 15;
rayon_interieur = 12;
rayon_recepteur = 17;
resolution_cylindre_ext = 60;

//donut
nombre_spheres = 100;
resolution_spheres = 50;
rayon_spheres = 3;

//embout
largeur_usb = 12;
hauteur_usb = 7;
rayon_led = 2;

tube(hauteur, rayon_exterieur, rayon_interieur, resolution_cylindre_ext);

translate([0,0,hauteur - 2]) {
	difference() {
		difference() {
			cylinder(2, rayon_exterieur, rayon_exterieur);
			translate([0, -(largeur_usb/2), -1])
				cube(size = [hauteur_usb, largeur_usb, 4]);
		}
		translate([-(rayon_led*3), 0, -2])
			cylinder(5, rayon_led, rayon_led, $fn=20);
	}
}

translate([0,0,hauteur - rayon_spheres]) {
	difference(){
		donut(nombre_spheres, rayon_spheres, rayon_recepteur);
		translate([0,0,-(hauteur/2)])	
 			cylinder(hauteur + 2, rayon_recepteur, rayon_recepteur);
	}
}

translate([0,0,hauteur - (rayon_spheres*2)]) {
	tube((rayon_spheres*2), rayon_recepteur, rayon_exterieur);
}
