draw_set_font(global.font);

for (var i = 0; i < array_length(inv); i++)
 {
	 var _xx = screen_border;
	 var _yy = screen_border;
	 var _sep = separation;
	 var _col = c_white;
	 
	 
	 
draw_sprite(inv[i].sprite, 0, _xx, _yy + _sep*i); //ikonica
	 
if selected_item == i {     //prikazuje boju ako je selektovano    
		 _col = c_yellow
	 }
	draw_set_color(_col);
	 
	draw_text(_xx + 16, _yy + _sep*i - 10, inv[i].name);//prikazuje ime itema
	
	if selected_item == i {
	draw_text_ext(_xx, _yy + _sep*array_length(inv), inv[i].description, 12, 80) //opis itema
	}
	
	draw_set_color(c_white); // vraca boju u originalnu kad deselektujes
 } 
