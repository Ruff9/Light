include <common.scad>;
include <variables.scad>;

rayon_ext = rayon_ext_embout - 1;
decalageY = rayon_ext + 10;
epaisseur = rayon_ext - rayon_int_embout;

hauteur_plaque = 45;

largeur_switch = 3.7;
hauteur_switch = 9.2;

nom_tonfa = "Proto1";

difference() {
	plaque();
	empreinte_switch();
	signes_on_off();
	texte();
}

module empreinte_switch() {
	translate([-largeur_switch/2, 0, hauteur_plaque/2 - hauteur_switch/2])
		cube([largeur_switch,rayon_ext+1,hauteur_switch]);
}

module signes_on_off() {

	hauteur_signes = 5;

	translate([2,rayon_ext-1,0]) {
		translate([-largeur_switch/2+3, 0, hauteur_plaque/2+2.5])
			cube([3,hauteur_signes,0.5]);
		translate([-largeur_switch/2+4.5, 0, hauteur_plaque/2-2])
			rotate([-90,0,0])
			  tube(hauteur_signes,1.8,1.2, $fn = resolution);
	}

}

module texte() {
	translate([-9,rayon_ext-2,(hauteur_plaque/2)-12]) {
		rotate([0,-90,-90]) {
			linear_extrude(height = 10)
				text(nom_tonfa, font="Courier 10 Pitch", size = 5);
		}
	}
}

module plaque() {
	difference () {
		tube(hauteur_plaque, rayon_ext, rayon_int_embout, resolution);
		translate([-rayon_ext-2,-decalageY,-10])
			#cube([rayon_ext_embout*2, rayon_ext_embout*2,hauteur_plaque*1.5]);
		translate([-rayon_ext+1,decalageY-20,-10])
			#cube([epaisseur*2, epaisseur*2,hauteur_plaque*1.5]);
		translate([rayon_ext-7,decalageY-20,-10])
			#cube([epaisseur*2, epaisseur*2,hauteur_plaque*1.5]);
	}
}
