function ResetCheckpoints() {
	for(var i = 0; i < array_length(checkpoints); i++) {
		var checkpoint = checkpoints[i];
		checkpoint.passed = false;
		checkpoint.mask_index = Msk_Checkpoint;
		checkpoint.image_blend = c_white;
	}
}

function CountLap() {
	lapsCompleted++;
	ResetCheckpoints();
}

function PassedCheckpoint(index) {
	var checkpoint = checkpoints[index];
	checkpoint.passed = true;
	checkpoint.mask_index = -1;
	checkpoint.image_blend = c_green;
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