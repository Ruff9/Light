include <common.scad>;
include <variables.scad>;

epaisseur_reducteur = 4;
epRed = epaisseur_reducteur;

tube(35, ret32+epRed, ret32);

translate([0,0,20])
	tube(35, rit40, rit40-epRed);