module tube(hauteur, rayon_exterieur, rayon_interieur, resolution=80) {
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
