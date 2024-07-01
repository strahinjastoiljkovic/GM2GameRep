walk_spd = 1.5; //Bryina hodanja
facing = 1; //Da li je okrenut levo ili desno
aim_dir = 0;

bow_dist = 8; //Koliko daleko je luk od lika
fire_rate = 30;
can_fire = true;
arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", o_bow); //Luk


cursor_sprite = s_cursor; //Kursor
window_set_cursor(cr_none);
