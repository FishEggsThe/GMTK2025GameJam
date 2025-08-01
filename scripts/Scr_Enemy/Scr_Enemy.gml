function GetSpawnAngle() {
	return irandom_range(0, 315) - 45*3/2;
}

function GetSpawnPosition(constrict = 0) {
	var angle = GetSpawnAngle();
	var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
	var inner = 180 + 45, outer = inner + 300 - 35;
	var radiusPos = random_range(inner, outer);
	
	xLandingPos = room_width/2+units[0]*radiusPos;
	yLandingPos = room_height/2+units[1]*radiusPos;
}

function SpawnEnemy(enemyPool = enemyPoolEasy, index = 0) {
	instance_create_layer(x, y, "Enemies", enemyPool[index]);
}
function SpawnMine(_x, _y) {
	var newMine = instance_create_layer(x, y, "Enemies", Obj_ShooterMine)
	with newMine {
		xStartingPos = x; yStartingPos = y;
		xLandingPos = _x; yLandingPos = _y;
	}
	return newMine;
}

function SpawnWave() {
	SpawnEnemy(enemyPoolEasy, 0);
	SpawnEnemy(enemyPoolEasy, 1);
	SpawnEnemy(enemyPoolEasy, 2);
	SpawnEnemy(enemyPoolHard, 0);
	SpawnEnemy(enemyPoolHard, 1);
	
	// Gauntlet numbers
	//repeat(10) {
		//SpawnEnemy(enemyPoolEasy, 0);
		//SpawnEnemy(enemyPoolEasy, 1);
		//SpawnEnemy(enemyPoolEasy, 2);
		//SpawnEnemy(enemyPoolHard, 0);
		//SpawnEnemy(enemyPoolHard, 1);
	//}
}
function SpawnFirstWave() {
	SpawnEnemy(enemyPoolEasy, 0);
	SpawnEnemy(enemyPoolEasy, 1);
	SpawnEnemy(enemyPoolEasy, 2);
	SpawnEnemy(enemyPoolHard, 0);
	SpawnEnemy(enemyPoolHard, 1);
}

function IncrementWaveCounter() {
	lapsTilWave--;
	if lapsTilWave <= 0 {
		lapsTilWave = lapsTilWaveSet;
		SpawnWave();
		waveNum++;
	}
}