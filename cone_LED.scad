include <common.scad>;
include <variables.scad>;

rayon_led = 2.75;
diam_fixation = 3;

ecart_entre_leds = 10;
ecart_entre_fixations = 11;

translate([0,0,10])
	tube(1, rayon_int_embout-delta, rayon_int_embout-1);

difference(){	
	cylinder(r1=rayon_int_embout/2, r2=rayon_int_embout-delta, h=11);
		cylinder(r1=(rayon_int_embout-1)/2, r2=rayon_int_embout-delta, h=15);
}

difference(){
	cylinder(r=10, h=1);

	// trous pour leds
	translate([0,0,-2]){
		cylinder(r=rayon_led, h=4);
	}

	// translate([-ecart_entre_leds/2,0,-1]){
	// 	cylinder(r=rayon_led, h=4);
	// }

	// // trous pour fixations
	// translate([1,-ecart_entre_fixations/2,-1]){
	// 	cylinder(r=diam_fixation/2, h=4);
	// }

	// translate([1,ecart_entre_fixations/2,-1]){
	// 	cylinder(r=diam_fixation/2, h=4);
	// }

}