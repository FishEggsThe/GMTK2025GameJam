function LoopAroundScreen() {
	var offset = 16;

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

function CheckDebug() {
	return instance_exists(Obj_Debug) && Obj_Debug.debug;
}

function CheckIfDuplicate(inst = id) {
	if instance_number(inst) > 1 { instance_destroy(); exit; }
}

function ShakeScreen(amount) {
	with Obj_Camera { screenShake += amount; }
}

function PlaySound(sound, pitch = 1) {
	audio_play_sound(sound, 1, false, 1, 0, pitch);
}
function PlayMusic(music, pitch = 1) {
	audio_play_sound(music, 1, true, 1, 0, pitch);
}