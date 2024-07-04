switch(state){
	default:
		reset_variables();
		get_input();
		calc_movement();
		if bow = 1 {
		bow = instance_create_layer(o_player.x, o_player.y, "Instances", o_bow);
		}
		anim();
	break;
	case states.KNOCKBACK:
		reset_variables();
		//aim_bow();
		calc_movement();
		anim();
		if knockback_time-- <= 0 state = states.IDLE;
	break;
	case states.DEAD:
		reset_variables();
		calc_movement();
		anim();
		if ready_to_restart and mouse_check_button_pressed(mb_left) game_restart();
	break;
}