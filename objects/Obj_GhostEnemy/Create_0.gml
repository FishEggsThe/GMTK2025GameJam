event_inherited();

sprite = spr_ghost68;

xLandingPos = Obj_PlayerShip.x;
yLandingPos = Obj_PlayerShip.y;

playerPath = ds_queue_create();
pathDelay = 30 + 45*instance_number(object_index);
alarm[0] = pathDelay;
trailDelay = 4
alarm[1] = trailDelay;

ghostPath = function() {
	ds_queue_enqueue(playerPath, [Obj_PlayerShip.x, Obj_PlayerShip.y]);
	canCollide = false;
	
	//if startEnemy && !Obj_PlayerShip.dead {
	//	var playerPos = ds_queue_dequeue(playerPath);
	//	var dir = point_direction(x, y, playerPos[0], playerPos[1]);
	//	image_xscale = sign(cos(degtorad(dir)));
	//	x = playerPos[0]; y = playerPos[1];
	//}
}