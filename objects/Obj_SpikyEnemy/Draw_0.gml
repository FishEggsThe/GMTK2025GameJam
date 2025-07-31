event_inherited();

var xEyePos = x + lengthdir_x(2,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
var yEyePos = y + lengthdir_y(2,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
DrawSprite(spr_spikeEyes_temp, 0, xEyePos, yEyePos);