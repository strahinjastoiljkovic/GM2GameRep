#region pokreti luka
if instance_exists(bow) {

aim_dir = point_direction(x, y, mouse_x, mouse_y);
bow.image_angle = aim_dir;

var _depth = (aim_dir > 0 and aim_dir < 180); // Da luk bude iza lika kada je iznad glave
bow.depth = depth + _depth; // Isto

bow.x = x + lengthdir_x(bow_dist, aim_dir);
bow.y = y + lengthdir_y(bow_dist, aim_dir);

bow_dist = lerp(bow_dist, 8, 0.1); //Da se luk vrati na mesto nakon ispaljivanja

check_fire();

	var _facing = (aim_dir < 90 or aim_dir > 270);
	if _facing == 0 _facing = -1;
	facing = _facing;

}
#endregion

