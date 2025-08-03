function StartIntro() {
	StopMusic();
	PlaySound(Beep_beep_beep_GO);
	Obj_Control.playGameIntro = false;
	with Obj_RaceTrack {
		alarm[0] = audio_sound_length(Beep_beep_beep_GO)*60;
		startTimer = false;
	}
}
function StartRace() {
	with Obj_PlayerShip { moveState = moving; canRestart = true; }
	with Obj_EnemySpawner { SpawnFirstWave(); }
	startTimer = true;
	PlayMusic(SWIM_FISH_SWIM);
}

function RestartRoom() {
	Obj_MainMenu.menuMode = true;
	Obj_Control.playGameIntro = true;
	StopMusic();
	room_goto(Rm_Game);
	PlayMusic(Sleep_Machine);
}

function ResetCheckpoints() {
	for(var i = 0; i < array_length(checkpoints); i++) {
		var checkpoint = checkpoints[i];
		checkpoint.passed = false;
		//checkpoint.mask_index = Msk_Checkpoint;
		checkpoint.image_blend = c_white;
	}
}

function CountLap() {
	lapsCompleted++;
	playerScore += ceil((frames-1)*timeToLap/timeToLapSet);
	timeToLap = timeToLapSet;
	ResetCheckpoints();
	PlaySound(Lap_2);
	
	with Obj_EnemySpawner { IncrementWaveCounter(); }
	with Obj_ShooterEnemy { canShoot = true; }
	
	part_particles_create(global.partSystem,room_width/2,room_height,global.partConfettiL,15);
	part_particles_create(global.partSystem,room_width/2,room_height,global.partConfettiR,15);
	//part_particles_create(global.partSystem,room_width/4,room_height,global.partCatL,1);
	part_particles_create(global.partSystem,room_width/2,room_height+75,global.partCatR,1);
	instance_create_layer(Obj_PlayerShip.x, Obj_PlayerShip.y, "Particles", Obj_Flash);
}

function PassedCheckpoint(index) {
	var checkpoint = checkpoints[index];
	checkpoint.passed = true;
	//checkpoint.mask_index = Msk_Empty;
	checkpoint.image_blend = c_green;
	show_debug_message($"Passed checkpoint {index}");
}

function CheckIfNextCheckpoint(checkpoint) {
	with Obj_RaceTrack {
		var length = array_length(checkpoints);
		for(var i = 0; i < length; i++) {
			if checkpoints[i] == checkpoint {
				PassedCheckpoint(i);
				if i >= length-1 { CountLap(); }
			} else if checkpoints[i].passed != true { return; }
		}
	}
}

function SetupCheckpoints() {
	for(var i = 0; i < instance_number(Obj_Checkpoint); i++) {
		array_push(checkpoints, instance_find(Obj_Checkpoint, i));
		show_debug_message(checkpoints);
	}
	
}