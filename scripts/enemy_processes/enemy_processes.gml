function calc_knockback_movement(){
	//pomera neprijatelje i daje drag kad je knockbackovan
	//dodaj pokret
	x += hsp;
	y += vsp;
	
	//Usporavanje
	hsp *= 0.91;
	vsp *= 0.91;
	
	check_if_stopped();
	
	//izadji iz knockbacka
	if knockback_time <= 0 state = states.IDLE;
	
}

function calc_entity_movement(){
	//dodaje pokret i dodaje drag
	//dodaj pokret
	x += hsp;
	y += vsp;
	
	//Usporavanje
	hsp *= global.drag;
	vsp *= global.drag;
	
	check_if_stopped();
	//
}
	

function check_facing(){
	///droveri u kom smeru se igrac krece i stavi facing da bude jednak tome
	if knockback_time <= 0 {
		var _facing = sign(x - xp);
		if _facing != 0 facing = _facing;
	}
}

function check_for_player(){
///@desc Da li je igrac dovoljno blizu da bi ga jurio

if o_player.state == states.DEAD exit; //neprijatelji ne napadaju kad si mrtav

var _dis = distance_to_object(o_player);

	//Da li da krene da juri ili je vec alertovan i van dometa za udarac?
	if ((_dis <= alert_dis) or alert) and _dis > attack_distance {
		//Neprijatelj je alertovan
		alert = true;
		
	

		if calc_path_timer-- <= 0 {
		//Reset
		calc_path_timer = calc_path_delay

		move_towards_point(o_player.x, o_player.y, 1);

		//Da li moze da napravi put do igraca
		if x == xp and y == yp var _type = 0 else var _type = 1;
		var  _found_player = mp_grid_path(global.mp_grid, path, x, y, o_player.x, o_player.y, _type);

			//Kreni na put ako nadjes igraca
			if _found_player = true {
				path_start(path, move_spd, path_action_stop, false);
			}
		}
	} else {
		//Da li je dovoljno blizu da napadne?
		if _dis <= attack_distance {
			path_end();
			state = states.ATTACK;
		}
	}
}


function enemy_anim(){
	switch(state) {
		case states.IDLE:
			sprite_index = s_idle;
			show_hurt();
		break;
		case states.MOVE:
			sprite_index = s_walk;
			show_hurt();
		break;
		case states.ATTACK:
			sprite_index = s_attack;
		break;
		case states.KNOCKBACK:
			show_hurt();
		break;
		case states.DEAD:
			sprite_index = s_dead;
		break;
	
	}
	depth = -bbox_bottom; //da se ne bi preklapali 
	//Updatuj prethodnu pozociju
	xp = x;
	yp = y;
}

function perform_attack(){
	
	//napada igraca u odredjenim uslovima
	if image_index >= attack_frame and can_attack {
		//reset za sledeci napad
		can_attack = false;
		alarm[0] = attack_cooldown;
		
		//pravac napada
		var _dir = point_direction(x, y, o_player.x, o_player.y);
		
		//pozicija napada
		var _xx = x + lengthdir_x(attack_distance, _dir);
		var _yy = y + lengthdir_y(attack_distance, _dir);
		
		//hitbox
		var _inst = instance_create_layer(_xx, _yy, "Instances", o_enemy_hitbox);
		_inst.owner_id = id;
		_inst.damage = damage;
		_inst.knockback_time = knockback_time;
	}	
}

function show_hurt(){ //pokazuje hurt sprite kad je knockbackovan
	if knockback_time-- > 0 sprite_index = s_hurt;
}

