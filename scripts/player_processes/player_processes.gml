function reset_variables(){ //Vrati varijablu na 0
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	hmove = 0;
	vmove = 0;
	
}

function get_input() { //Kretanje
	if keyboard_check(ord("A")) left	= 1;
	if keyboard_check(ord("D")) right	= 1;
	if keyboard_check(ord("W")) up		= 1;
	if keyboard_check(ord("S")) down	= 1;
	
}
	
function calc_movement() { //Racuna pokret
	hmove = right - left;
	vmove = down - up;
	
	var _facing = (aim_dir < 90 or aim_dir > 270);
	if _facing == 0 _facing = -1;
	facing = _facing;
	
	if hmove != 0 or vmove != 0 {
		//Pravac kretanja
		var _dir = point_direction(0, 0, hmove, vmove);
		
		//Razdaljina kretanja
		hmove = lengthdir_x(walk_spd, _dir);
		vmove = lengthdir_y(walk_spd, _dir);
		
		//Pokret + pozicija
		x += hmove;
		y += vmove;
	}
	
	aim_dir = point_direction(x,y, mouse_x, mouse_y);
	my_bow.image_angle = aim_dir;
	
}
	
function collision() {
	
	var _tx = x;
	var _ty = y;
	
	//Vracanje na prvobitni polozaj
	x = xprevious;
	y = yprevious;
	
	//Distanca
	var _disx = abs(_tx - x);
	var _disy = abs(_ty - y);
	
	//Maksimalno priblizavanje do kolizije - Da li da se priblizi za jos jedan piksel ili ne
	repeat (_disx) {
		if !place_meeting(x + sign(_tx -x), y, o_solid) x += sign(_tx - x)
	}
	repeat (_disy) {
		if !place_meeting(x, y + sign(_ty -y), o_solid) y += sign(_ty - y)
	}
}
	
function anim() {
	if hmove != 0 or vmove != 0 {
		sprite_index = s_player_run;
	} else {
		sprite_index = s_player_idle;
	}
}
	
function check_fire () {
	if mouse_check_button(mb_left) {
		if can_fire {
			can_fire = false
			alarm[0] = fire_rate;
			
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			bow_dist = 5;
			
			var _inst = instance_create_layer(x, y, "Arrow", o_arrow, )
			with(_inst) { //Kada se uzima varijabla izvan objekta u kome radimo
				speed = other.arrow_speed;
				direction = _dir;
				image_angle = _dir; //Da strela bude okrenuta u pravcu ispaljivanja
				owner_id = other; //Da bi strela udarala samo neprijatelje
			}
		}
	}
}