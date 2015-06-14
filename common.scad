module ring(nombre_spheres, rayon_spheres, rayon_exterieur){
	for ( i= [0:nombre_spheres])
		rotate([0,0,i*(360/nombre_spheres)]) {
			translate([rayon_exterieur,0,0])
			sphere(rayon_spheres, $fn=resolution_spheres);
		}
}

module rondelle(epaisseur, rayon_ext, rayon_int) {
	difference(){
		cylinder(epaisseur,rayon_ext,rayon_ext);
		translate([0,0,-epaisseur])
			cylinder(400,rayon_int,rayon_int);
	}
}