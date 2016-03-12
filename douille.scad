include <common.scad>;
include <variables_jonction.scad>;

translate([0,0,0]) {
     tube(hauteur_embout, rayon_ext_embout, rayon_int_embout, resolution);


     translate([0,0,hauteur_embout])
          tube(hauteur_butee, rayon_ext_embout, rayon_int_butee, resolution);

 

     difference() {
          translate([0,0,hauteur_embout + hauteur_butee])
                tube(hauteur_jonction-0.5, rayon_ext_embout, rayon_int_embout, resolution);
          translate([0,0,(hauteur_totale - profondeur_douille +1) ])

                for ( i= [0:nb_baionette] )
                     rotate([0,0,i*(360/nb_baionette)]) {
                          empreinte();
                     }
     }
     // empreinte();

}

module empreinte() {
     rayon_int_empreinte = rayon_int_embout - 2;
     rayon_ext_empreinte = rayon_ext_embout + 2;
     epaisseur_empreinte = rayon_ext_empreinte - rayon_int_empreinte;
 
     angle_z = 25;

     translate([rayon_int_empreinte,0,0])
          cube([epaisseur_empreinte, largeur_empreinte, profondeur_douille]);

     difference(){
          rotate([0,90,angle_z-2]){
                translate([0,1,0])
                     cylinder(30, largeur_empreinte/2, largeur_empreinte/2, $fn=60);
          }

          translate([0,0,-10])
                tube(30, rayon_int_empreinte, 0);
          translate([0,0,-10])
                tube(40, rayon_ext_empreinte +45, rayon_ext_empreinte);
     }

     translate([0,0,-largeur_empreinte])
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