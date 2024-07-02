/// @description 
switch (state){
	case states.DEAD: //da se animacija zaustavi kad umru
		image_index = image_number - 1;
		image_speed = 0;
	break;
	case states.ATTACK:
		image_index = 0;
		state = states.IDLE;
	break;
}
