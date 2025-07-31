canCollide = true;
ghostPath = function() {
	if startEnemy && !Obj_PlayerShip.dead {
		ds_queue_enqueue(playerPath, [Obj_PlayerShip.x, Obj_PlayerShip.y]);
		
		var playerPos = ds_queue_dequeue(playerPath);
		var dir = point_direction(x, y, playerPos[0], playerPos[1]);
		image_xscale = sign(cos(degtorad(dir)));
		x = playerPos[0]; y = playerPos[1];
	}
}