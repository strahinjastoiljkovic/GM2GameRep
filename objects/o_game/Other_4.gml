//koliki su ti tilovi
#macro TS  16

//Koliko tilova ima
var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);

//Motion Planing Grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS);

//Dodaj zidove mrezi
mp_grid_add_instances(global.mp_grid, o_solid, true);

