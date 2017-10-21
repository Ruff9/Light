include <common.scad>;
include <variables.scad>;

angle_z = 35;

position_z_empreinte = hauteur_totale - profondeur_douille-3;

difference() {
  union() {

    tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);

    for ( i= [0:nb_baionette] )
      rotate([0,0,i*(360/nb_baionette)]) {

        rotate([0,0,-45.36]) {
          translate([0,rayon_ext_embout,0])
            renfort();
        }
        rotate([0,0,-90]) {
          translate([0,rayon_ext_embout,0])
            renfort();
        }
    }
  }

  translate([0,0,4])
    rotate([180,0,0]) {
      rotate_extrude(convexity = 10, $fn = resolution)
        translate([rayon_ext_culot,0,0])
          polygon( points=[[5,5],[5,0],[3,5]] );
    }

}

translate([0,0,hauteur_embout])
  tube(hauteur_butee, rayon_ext_embout, rayon_int_butee, $fn = resolution);

difference() {
  translate([0,0,hauteur_embout + hauteur_butee])
    tube(hauteur_jonction+hauteur_ressort-3, rayon_ext_embout, rayon_int_embout, $fn = resolution);

  translate([0,0,position_z_empreinte])
    for ( i= [0:nb_baionette] )
      rotate([0,0,i*(360/nb_baionette)]) {
        empreinte();
      }

  translate([0,0,hauteur_totale-3])
    rotate([180,0,0]) {
      rotate_extrude(convexity = 10, $fn = resolution)
        translate([rayon_ext_culot,0,0])
          polygon( points=[[0,0],[3,0],[0,3]] );
    }

}

module renfort() {
  epaisseur = 2;
  facteur_plat = 25;

  // théorème de pythagore :D
  hauteur = sqrt(pow(facteur_plat, 2) - pow(facteur_plat-epaisseur, 2));

  difference(){
    cube([epaisseur,epaisseur,hauteur_totale-3]);

    arrondi();

    translate([epaisseur,0,hauteur_totale-3]) {
      rotate([0,180,0]) {
        arrondi();
      }
    }
  }

  module arrondi() {
    translate([-(epaisseur/2),facteur_plat,0]) {
      rotate([0,90,0]) {
        cylinder(epaisseur*2, facteur_plat, facteur_plat, $fn=resolution);
      }
    }

    translate([-(epaisseur/2),epaisseur-0.4,hauteur-(epaisseur/2)]) {
      rotate([-12,0,0]) {
        cube([epaisseur*2,epaisseur,epaisseur]);
      }
    }
  }
}

module empreinte() {

  rayon_int_empreinte = rayon_int_embout - 2;
  rayon_ext_empreinte = rayon_ext_embout + 2;
  epaisseur_empreinte = rayon_ext_empreinte - rayon_int_empreinte;

  translate([rayon_int_empreinte,0,-1]) {
    cube([epaisseur_empreinte, largeur_empreinte/2+1, profondeur_douille+2]);
    translate([-0.5,2,0])
      rotate([0,0,12]) {
        cube([epaisseur_empreinte+2, largeur_empreinte/2, profondeur_douille+2]);
      }
  }

  translate([rayon_int_empreinte-4.5,8.5,0])
    rotate([0,90,angle_z]){
      cylinder(10, largeur_empreinte/2, largeur_empreinte/2, $fn=resolution);
    }

  translate([0,0,-largeur_empreinte]) {

    difference(){
      tube(largeur_empreinte, rayon_ext_empreinte, rayon_int_empreinte);

      translate([-25,-30,-2])
        cube([60,30,10]);

      translate([0,20.9,2])
        rotate([0,0,angle_z]){
          cube([80, 30, 10], center=true);
        }

      translate([rayon_int_empreinte-5,9,2.4])
        rotate([0,90,angle_z]){
          intersection(){
            tube(largeur_empreinte*2, largeur_empreinte, largeur_empreinte/2.5);
            cube([11,11,11]);
          }
        }

      translate([rayon_int_empreinte-1,largeur_empreinte/2-0.1,3])
        rotate([0,90,0]){
          intersection(){
            tube(largeur_empreinte*2, largeur_empreinte, largeur_empreinte/2);
            translate([0,-11,0]) {
              cube([11,11,12]);
            }
          }
        }
    }
  }
}
