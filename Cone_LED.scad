$fn=100;
include <common.scad>;
include <variables.scad>;

diamled = 2.75;

translate([0,0,10])
	tube(1, rayon_int_embout-delta, rayon_int_embout-1);

difference(){	
	cylinder(r1=rayon_int_embout/2, r2=rayon_int_embout-delta, h=11);
		cylinder(r1=(rayon_int_embout-1)/2, r2=rayon_int_embout-delta, h=15);
}

difference(){
	cylinder(r=rayon_int_embout/2, h=1);

	translate([rayon_int_embout/4,0,-1]){
		cylinder(r=diamled, h=4);
	}

	translate([-rayon_int_embout/4,0,-1]){
		cylinder(r=diamled, h=4);
	}
}