event_inherited();

sprite = Spr_TankMine
markerSprite = Spr_EnemyLandMarker61;
markerImageIncrement = 6/60;
index = 0;
image_xscale = 2;
image_yscale = 2;

primeState = function() {
	if !startEnemy { xShake = 999999999; yShake = 999999999; }
	else {
		xShake = 0; yShake = 0; primeState = false;
		instance_create_layer(x, y, "Enemies", Obj_MineLand);
	}
}