if !Obj_PlayerShip.dead && timeToLap > 0 {
	timeToLap -= !CheckDebug();
	if timeToLap <= 0 {
		with Obj_PlayerShip { ShipDies(); }
	}
}