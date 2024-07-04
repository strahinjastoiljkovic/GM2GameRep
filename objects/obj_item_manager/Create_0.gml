depth = -99999;

global.font = PixelFont;

//konstruktor
function create_item(_name, _description, _sprite, _ammo, _dist, _attackrate, _attackspeed, _effect) constructor
	{
		name = _name;
		description = _description;
		sprite = _sprite;
		ammo = _ammo;
		effect = _effect;
		distance = _dist;
		attackrate = _attackrate;
		attackspeed = _attackspeed;
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
			function(){
				o_player.bow = 1;
				array_delete(inv, selected_item, 1);
			}
			)
			
	}
	
//inv
inv = array_create(0);

//nista nije selektovano
selected_item = -1;
	
screen_border = 15;
separation = 40;
