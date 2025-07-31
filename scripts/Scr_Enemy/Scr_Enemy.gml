function GetSpawnAngle() {
	return irandom_range(0, 315) - 45*3/2;
}

function GetSpawnPosition() {
	var angle = GetSpawnAngle();
	var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
	var inner = 180 + 30, outer = inner + 300 - 50;
	var radiusPos = random_range(inner, outer);
	
	xLandingPos = room_width/2+units[0]*radiusPos;
	yLandingPos = room_height/2+units[1]*radiusPos;
}

function SpawnEnemy(enemyPool = enemyPoolEasy, index = 0) {
	instance_create_layer(x, y, "Enemies", enemyPool[index]);
}

function SpawnWave() {
	SpawnEnemy();
}

function IncrementWaveCounter() {
	lapsTilWave--;
	if lapsTilWave <= 0 {
		lapsTilWave = lapsTilWaveSet;
		SpawnWave();
	}
}