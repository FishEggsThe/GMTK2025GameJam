canCollide = false;
startEnemy = false;
explodeOnDeath = false;
xStartingPos = room_width/2; yStartingPos = room_height/2 + 55;
xLandingPos = 0; yLandingPos = 0;
GetSpawnPosition();

sprite = Spr_FruitLoopEnemy;
spriteImageIndex = 0;
spriteImageBlend = c_white;
markerSprite = Spr_EnemyLandMarker;
markerImageIncrement = 12/60;

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

trailDelay = 0;