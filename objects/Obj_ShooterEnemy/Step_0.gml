event_inherited();

if canShoot && collision_line(x, y, room_width/2, room_height/2, Obj_PlayerShip, false, false) {
	canShoot = false;
	animateShooting = true;
	var xTarget = Obj_PlayerShip.x;
	var yTarget = Obj_PlayerShip.y;
	var newMine = SpawnMine(xTarget, yTarget);
	array_insert(mineBank, 0, newMine);
	if array_length(mineBank) > 1 {
		var oldMine = array_pop(mineBank);
		oldMine.alarm[0] = 30;
	}
	
	sprite =  spr_tankShoot_temp;
}

if animateShooting {
	spriteImageIndex+=6/60;
	if spriteImageIndex % 5 < spriteImageIndex {
		spriteImageIndex = 0;
		animateShooting = false;
		sprite = spr_tank_temp;
	}
}