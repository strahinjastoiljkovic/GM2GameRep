event_inherited(); //Ako hoces da  zadrzi i svoje osobine pored nasledjenih

walk_spd = 1.5; //Bryina hodanja

aim_dir = 0;

bow_dist = 8; //Koliko daleko je luk od lika
fire_rate = 30;

arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", o_bow); //Luk

//kursor
cursor_sprite = s_cursor; //Kursor
window_set_cursor(cr_none);


//hp
hp_max = 10;
hp = hp_max;

ready_to_restart = false; //da li restartujemo nakon smrti