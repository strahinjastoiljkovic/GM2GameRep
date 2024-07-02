if instance_exists(my_bow) {
var _depth = (aim_dir > 0 and aim_dir < 180); // Da luk bude iza lika kada je iznad glave
my_bow.depth = depth + _depth; // Isto

my_bow.x = x + lengthdir_x(bow_dist, aim_dir);
my_bow.y = y + lengthdir_y(bow_dist, aim_dir);

bow_dist = lerp(bow_dist, 8, 0.1); //Da se luk vrati na mesto nakon ispaljivanja
}

