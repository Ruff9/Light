// General

resolution = 80;
delta = 0.2;

// dimensions tubes pvc

rayon_ext_tube_32 = 16;
rayon_int_tube_32 = 13;
epaisseur_tube_32 = rayon_ext_tube_32 - rayon_int_tube_32;

rayon_ext_tube_40 = 20;
rayon_int_tube_40 = 17.5;
epaisseur_tube_40 = rayon_ext_tube_40 - rayon_int_tube_40;

ret32 = rayon_ext_tube_32;
rit32 = rayon_int_tube_32;
ep32  = epaisseur_tube_32;
ret40 = rayon_ext_tube_40;
rit40 = rayon_int_tube_40;
ep40  = epaisseur_tube_40;

// L'embout accueille un tube pvc de 40mm de diamètre.

hauteur_embout = 20;
rayon_int_embout = rayon_ext_tube_40 + delta;
rayon_ext_embout = 24 + delta;

hauteur_butee = 2;
rayon_int_butee = 16;

// Jonction: section de contact entre les deux pièces.

//hauteur du ressort comprimé
hauteur_ressort = 7.5;

rayon_ext_culot = rayon_ext_tube_40 - delta;
rayon_int_culot = 16 - delta;

rayon_ext_spot = 26;

hauteur_jonction = 30;

hauteur_totale = hauteur_jonction + hauteur_embout + hauteur_butee + hauteur_ressort;

profondeur_douille = 12;

largeur_empreinte = 6;

nb_baionette = 3;
rayon_baionette = (largeur_empreinte / 2)*0.95;
