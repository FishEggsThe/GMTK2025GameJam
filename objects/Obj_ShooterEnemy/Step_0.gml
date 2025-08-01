event_inherited();

if canShoot && collision_line(x, y, room_width/2, room_height/2, Obj_PlayerShip, false, false) {
	canShoot = false;
	var xTarget = Obj_PlayerShip.x;
	var yTarget = Obj_PlayerShip.y;
	var newMine = SpawnMine(xTarget, yTarget);
	array_insert(mineBank, 0, newMine);
	if array_length(mineBank) > 1 {
		var oldMine = array_pop(mineBank);
		oldMine.alarm[0] = 30;
	}
}