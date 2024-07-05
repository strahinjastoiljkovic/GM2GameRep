event_inherited(); //Ako hoces da  zadrzi i svoje osobine pored nasledjenih
#region brzina hoda
walk_spd = 1.5; //Bryina hodanja
aim_dir = 0;
facing = 1;
#endregion

#region luk
bow_dist = 8; //Koliko daleko je luk od lika
fire_rate = 30;
arrow_speed = 8;
bow = 0
can_attack = true; 
//bow = instance_create_layer(x, y, "Instances", o_bow); //Luk
#endregion

#region kursor
cursor_sprite = s_cursor; //Kursor
window_set_cursor(cr_none);
#endregion

#region hp
hp_max = 10;
hp = hp_max;
#endregion

ready_to_restart = false; //da li restartujemo nakon smrti
