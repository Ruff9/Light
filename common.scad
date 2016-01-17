module ring(nombre_spheres, rayon_spheres, rayon_exterieur){
	for ( i= [0:nombre_spheres])
		rotate([0,0,i*(360/nombre_spheres)]) {
			translate([rayon_exterieur,0,0])
			sphere(rayon_spheres, $fn=resolution_spheres);
		}
}

module tube(hauteur, rayon_exterieur, rayon_interieur, resolution=60) {
	difference(){
	  cylinder(hauteur, rayon_exterieur, rayon_exterieur, $fn=resolution);
	  translate([0,0,-1])	
	 	  cylinder(hauteur + 2 , rayon_interieur, rayon_interieur);
	}
}
