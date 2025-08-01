function GetSpawnAngle() {
	return irandom_range(0, 315) - 45*3/2;
}

function GetSpawnPosition() {
	var angle = GetSpawnAngle();
	var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
	var inner = 180 + 45, outer = inner + 300 - 70;
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
	instance_create_layer(x, y, "Enemies", choose(Obj_DustDuoEnemy, Obj_RockEnemy));
	repeat(1 + (Obj_RaceTrack.lapsCompleted % 3 == 0))
		SpawnEnemy(enemyPoolHard, irandom(2));
	
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
	instance_create_layer(x, y, "Enemies", Obj_DustDuoEnemy);
	instance_create_layer(x, y, "Enemies", Obj_RockDuoEnemy);
	repeat(2)
		SpawnEnemy(enemyPoolHard, irandom(2));
}

function IncrementWaveCounter() {
	lapsTilWave--;
	if lapsTilWave <= 0 {
		lapsTilWave = lapsTilWaveSet;
		SpawnWave();
		waveNum++;
	}
}