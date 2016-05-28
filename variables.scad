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

// Reducteur

epaisseur_reducteur = 4;

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

hauteur_totale = 30 + 20 + 2;

profondeur_douille = 12;

largeur_empreinte = 4;

position_z_empreinte = hauteur_totale - profondeur_douille +1;

nb_baionette = 3;
rayon_baionette = largeur_empreinte / 2;
baionette_z = hauteur_totale - (hauteur_jonction - profondeur_douille);
