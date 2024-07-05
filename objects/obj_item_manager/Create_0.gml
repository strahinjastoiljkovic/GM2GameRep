depth = -99999;

global.font = PixelFont;

//konstruktor
function create_item(_name, _description, _sprite, _ammo, _dist, _attackrate, _attackspeed, _candrop, _effect) constructor
	{
		name = _name;
		description = _description;
		sprite = _sprite;
		ammo = _ammo;
		effect = _effect;
		distance = _dist;
		attackrate = _attackrate;
		attackspeed = _attackspeed;
		can_drop = _candrop; //da li moze da se izbaci iz inv
	}
function create_consumable(_name, _description, _sprite, _candrop, _effect) constructor {
	name = _name;
	description = _description;
	sprite = _sprite;
	can_drop = _candrop //da li moze da se izbaci iz inv
	effect = _effect;
}

global.item_list = 
	{
	bow : new create_item(
			"Bow", 
			"Use it to kill the enemies", 
			s_bow,
			10,
			8,
			30,
			8,
			false,
			function(){
				o_player.bow = 1;
				array_delete(inv, selected_item, 1);
				
			}
			),
			
	bluekey : new create_consumable(
		"Blue key",
		"Opens the blue door",
		s_bluekey,
		true,
		function(){ //door mehanika, moze da se modifikuje razlicito
			
			 var _used = false;
			 
			
			if instance_exists(o_bluedoor) {
				with(o_bluedoor) {
					if distance_to_object(o_player) < 20 {
						instance_destroy();
						_used = true;
					}
				}
			}
			if _used == true array_delete(inv, selected_item, 1);
		}
		)
	}
//inv
inv = array_create(0);

inv_max = 5;

//nista nije selektovano
selected_item = -1;
	
screen_border = 15;
separation = 40;
