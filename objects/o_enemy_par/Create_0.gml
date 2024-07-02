event_inherited(); //Ako hoces da  zadrzi i svoje osobine pored nasledjenih

//HP
hp_max = 15;
hp = hp_max;


//Da li juri igraca
alert = false;
//Sa koje distance juri igraca
alert_dis = 160;

attack_angle = irandom(360);
//Distanca za napad
attack_distance = 12;
//frejm u kome se napad racuna
attack_frame = 6;
//da li moze da napadne?
can_attack = true;
//delay
attack_cooldown = 75;
//koliki je dmg?
damage = 2;
//knockback
knockback_time = 10;


//Napravi put
path = path_add();
//brzina
move_spd = 1;
//Odlaganje racunanja putanje
calc_path_delay = 30;
//Tajmer
calc_path_timer = irandom(60);


