if timeToLap <= 0 {
	with Obj_PlayerShip { ShipDies(); }
} else if !CheckDebug() {
	timeToLap--;
}