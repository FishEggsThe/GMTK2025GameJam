canCollide = false;
startEnemy = false;
xLandingPos = 0; yLandingPos = 0;
GetSpawnPosition();

sprite = Spr_FruitLoopEnemy;
image_alpha = c_white;

percent = 0;
curve = animcurve_get_channel(AnCv_EnemySpawnJump, "curve1");

enemyShake = 3;
xShake = 0;
yShake = 0;
setShake = function(amount = enemyShake) {
	xShake = random_range(-amount, amount);
	yShake = random_range(-amount, amount);
}

markerFrames = sprite_get_number(Spr_EnemyLandMarker);
markerImageIndex = irandom(markerFrames);