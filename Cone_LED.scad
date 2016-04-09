$fn=100;
include <common.scad>;
include <variables_jonction.scad>;

diamled = 2.75;


difference(){
	cylinder(r=rayon_int_embout/2, h=1, center=true);

	translate([rayon_int_embout/4,0,0]){
		cylinder(r=diamled, h=4, center=true);
	}
	translate([-rayon_int_embout/4,0,0]){
		cylinder(r=diamled, h=4, center=true);
	}
}
translate([0,0,-1]){
	difference(){	
		cylinder(r1=rayon_int_embout/2, r2=rayon_int_embout-0.5, h=11);
			cylinder(r1=(rayon_int_embout-1)/2, r2=rayon_int_embout-0.5, h=15);
	}
}