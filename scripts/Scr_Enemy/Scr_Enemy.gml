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

function FaceSpawnAnimate() {
	with Obj_RaceTrack {
		alarm[1] = spawnFaceTimer;
		faceState = laughing;
	}
	PlaySound(Spawn_2, random_range(0.95, 1.05));
}

function SpawnGauntlet(enemy) {
	repeat(10)
		instance_create_layer(x, y, "Enemies", enemy);
}

function SpawnWave() {
	FaceSpawnAnimate();
	//SpawnEnemy(enemyPoolEasy, irandom(1));
	//SpawnEnemy(enemyPoolHard, irandom(1));
	//if Obj_RaceTrack.lapsCompleted % 2 == 0
	//	SpawnEnemy(enemyPoolGhost, 0);
	
	// Gauntlet numbers
	SpawnGauntlet(chosenGauntletEnemy);
	//repeat(10) {
	//	SpawnEnemy(enemyPoolEasy, 0);
	//	SpawnEnemy(enemyPoolEasy, 1);
	//	SpawnEnemy(enemyPoolEasy, 2);
	//	SpawnEnemy(enemyPoolHard, 0);
	//	SpawnEnemy(enemyPoolHard, 1);
	//}
}
function SpawnFirstWave() {
	chosenGauntletEnemy = Obj_Control.chosenGauntletEnemy;
	FaceSpawnAnimate()
	//SpawnEnemy(enemyPoolEasy, 0);
	//SpawnEnemy(enemyPoolEasy, 2);
	//repeat(2)
	//	SpawnEnemy(enemyPoolHard, irandom(1));
	
	SpawnGauntlet(chosenGauntletEnemy);
}

function IncrementWaveCounter() {
	lapsTilWave--;
	if lapsTilWave <= 0 {
		lapsTilWave = lapsTilWaveSet;
		SpawnWave();
		waveNum++;
	}
}

function LoopAroundScreen() {
	var offset = 116;

	if x > room_width+offset {
		x -= room_width+offset*2;
	}

	if x < -offset {
		x += room_width+offset*2;
	}

	if y > room_height+offset {
		y -= room_height+offset*2;
	}

	if y < -offset {
		y += room_height+offset*2;
	}
}