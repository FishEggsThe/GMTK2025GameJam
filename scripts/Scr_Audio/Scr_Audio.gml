function PlaySound(sound, pitch = 1) {
	audio_play_sound(sound, 1, false, 1, 0, pitch);
}

function PlayMusic(music, pitch = 1) {
	with Obj_AudioPlayer {
		if currentMusic != music {
			audio_stop_sound(currentMusic);
			currentMusic = music;
			audio_play_sound(music, 1, true, 1, 0, pitch);
		}
	}
}

function StopMusic() {
	with Obj_AudioPlayer {
		audio_stop_sound(currentMusic);
		currentMusic = noone;
	}
}