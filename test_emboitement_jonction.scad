include <common.scad>;
include <variables.scad>;

// douille

tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);

translate([0,0,hauteur_embout])
  tube(hauteur_butee, rayon_ext_embout, rayon_int_butee, resolution);

difference() {
  translate([0,0,hauteur_embout + hauteur_butee])
    tube(hauteur_jonction-0.5, rayon_ext_embout, rayon_int_embout, resolution);
  
  translate([0,0,position_z_empreinte])
    for ( i= [0:nb_baionette] )
      rotate([0,0,i*(360/nb_baionette)]) {
        empreinte();
      }
}

module empreinte() {

  angle_z = 35;

  rayon_int_empreinte = rayon_int_embout - 2;
  rayon_ext_empreinte = rayon_ext_embout + 2;
  epaisseur_empreinte = rayon_ext_empreinte - rayon_int_empreinte;
  
  translate([rayon_int_empreinte,0,0])
    rotate([0,0,5]) {
      cube([epaisseur_empreinte, largeur_empreinte, profondeur_douille]);
    }

  difference(){
    rotate([0,90,angle_z-2]){
      cylinder(30, largeur_empreinte/2, largeur_empreinte/2, $fn=60);
    }
  }

  translate([0,0,-largeur_empreinte]) {
    difference(){
      tube(largeur_empreinte, rayon_ext_empreinte, rayon_int_empreinte);

      translate([-25,-25,-2])
        cube([200,25,10]);

      rotate([0,0,angle_z]){
        translate([-30,2,-2])
          cube([60, 30, 10]);
      }
    }
  }
}

// culot

// le translate et le rotate des deux premières lignes 
// sont prévus pour vérifier l'emboitement des deux pieces

translate([0,0,75]) {
	rotate([0,180,38]) {	
		tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);

		translate([0,0,hauteur_embout])
		  tube(hauteur_butee, rayon_ext_embout, rayon_int_culot, resolution);

		translate([0,0,hauteur_embout + hauteur_butee])
		  tube(hauteur_jonction-2, rayon_ext_culot, rayon_int_culot, resolution);

		for ( i= [0:nb_baionette] )
		  rotate([0,0,i*(360/nb_baionette)]) {
		    translate([0, rayon_ext_culot + 5, baionette_z+2])
		    rotate([90,0,0]) {
		      cylinder((rayon_ext_culot - rayon_int_culot +5), 0.95*rayon_baionette, 0.95*rayon_baionette, $fn=resolution);
		    }
		  }
	}
}
