state = states.IDLE;

//Pokreni prethodnu poziciju
xp = x;
yp = y;

facing = 1; //Da li je okrenut levo ili desno

hsp = 0;
vsp = 0;

//koliko smo knockbackovani
knockback_time = 0;

can_attack = true; // mozda u step even igraca ide!

//kada primi udarac
hurt_time = 30;
flash_initial = 16;
flash = flash_initial/2;
