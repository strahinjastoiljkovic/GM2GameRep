// izaberi selektovani item
selected_item = -1;

for (var i = 0; i < array_length(inv); i++)
 {
	 var _xx = screen_border;
	 var _yy = screen_border + separation*i;	
	 
	 if mouse_x > _xx && mouse_x < _xx + 16 && mouse_y > _yy && mouse_y < _yy + 24 { ////treba prebaciti na brojeve ili tako nesto
		 selected_item = i;
		 
	 }
 } 


if selected_item != -1 {
	
	//koristi item
	if mouse_check_button_pressed(mb_right) {
		inv[selected_item].effect(); 
	}
	
	//baci item
	if keyboard_check_pressed(ord("F")) && inv[selected_item].can_drop == true {
		array_delete(inv, selected_item, 1);
		//instance_create_layer(o_player.x - 15, o_player.y -15, "Instances", o_item_ingame); //Ovde treba napraviti nesto da se item ne bi izbrisao kad se baci
	}
	
}
