// General

resolution = 80;
delta = 0.2;

//Jonction

nb_baionette = 3;

// dimensions tubes pvc

rayon_ext_tube_32 = 16;
rayon_int_tube_32 = 13;

rayon_ext_tube_40 = 20;
rayon_int_tube_40 = 17.5;

// L'embout accueille un tube pvc de 40mm de diamètre.
hauteur_embout = 20;
rayon_int_embout = rayon_ext_tube_40 + delta;
rayon_ext_embout = 22 + delta;

hauteur_butee = 2;
rayon_int_butee = 16;

// Jonction: section de contact entre les deux pièces.

rayon_ext_culot = rayon_ext_tube_40 - delta;
rayon_int_culot = 18 - delta;

hauteur_jonction = 30;

profondeur_douille = 12;

hauteur_totale = hauteur_jonction + hauteur_embout + hauteur_butee;

baionette_z = hauteur_totale - (hauteur_jonction - profondeur_douille);

largeur_empreinte 	= 4;
rayon_baionette = largeur_empreinte / 2;