// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_entity(_tid, _sid, _damage, _time){
	
	///@desc osteti metu i vraca status
	///@arg _tid real id mete
	///@arg _sid real id izvora
	///@arg _damage real koliko dmg da napravi
	///@arg _time real koliko dugo da bude u knockbacku
	
	with(_tid) {
		if alarm[HURT] > 0 or state == states.DEAD exit;
		
		hp -= _damage;
		var _dead = is_dead();
		path_end();
		//Knockback
		if _dead var _dis = 5 else var _dis = 3;
		var _dir = point_direction(_sid.x, _sid.y, x, y);
		hsp += lengthdir_x(_dis, _dir);
		vsp += lengthdir_y(_dis, _dir);
		calc_path_delay = _time;
		alert = true;
		knockback_time = _time;
		alarm[HURT] = hurt_time;
		if !_dead state = states.KNOCKBACK;
		image_index = 0;
		return _dead;		
	}	
}
function is_dead(){
	///@desc proveri da li su mrtvi
	
	if state != states.DEAD {
		if hp <= 0 {
			state = states.DEAD;
			hp = 0;
			image_index = 0;
			//Dodaj zvuk
			switch(object_index) {
				default:
					//zvuk
				break;
				case o_player:
					if instance_exists(my_bow) instance_destroy(my_bow); //unistava luk kad je igrac mrtav
					//zvuk igraca kad umre
				break;
			}
			return true; //ovo vraca na pocetak funkcije
		}
	} else return true;
}

function check_if_stopped(){ //smooth transition za animacije
	if abs(hsp) < 0.1 hsp = 0;
	if abs(vsp) < 0.1 vsp = 0;
}

function show_healthbar(){
	//pokazuje hp iznad enititja ali ne kad je pun hp ili kad je nula
	
	if hp != hp_max and hp > 0 {
		draw_healthbar(x-7, y-16, x+7, y-14, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 0);
	}
	
}