module tube(hauteur, rayon_exterieur, rayon_interieur, resolution=resolution) {
	difference(){
	  cylinder(hauteur, rayon_exterieur, rayon_exterieur, $fn=resolution);
	  translate([0,0,-1])
	 	  cylinder(hauteur + 2 , rayon_interieur, rayon_interieur, $fn=resolution);
	}
}

module donut(rayon_spheres, rayon_exterieur){
	rotate_extrude(convexity = 10, $fn = resolution)
		translate([rayon_exterieur,0,0])
		circle(r = rayon_spheres, $fn = resolution);
}

module languette() {
  translate([5,0,0])
    cylinder(4,4,4, $fn=resolution);
  translate([-2,-4,0])
    cube([6,8,4]);
}
