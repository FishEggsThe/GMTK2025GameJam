function DrawSprite(_sprite, _subimg, _x, _y, _xscale=1, _yscale=1, _rot=0, _col=c_white, _alpha=1){
	draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _col, _alpha);
}

function DrawText(_x, _y, _string, _halign, _valign, _color=c_black, _xscale=1, _yscale=1, _angle=0, _alpha=1) {
	draw_set_halign(_halign); draw_set_valign(_valign); // draw_set_font(Ft_ComicSans);
	draw_text_transformed_color(_x, _y, _string, _xscale, _yscale, _angle, 
								_color, _color, _color, _color, _alpha);
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
	with Obj_AudioPlayer {
		if currentMusic != music {
			audio_stop_sound(currentMusic);
			currentMusic = music;
			audio_play_sound(music, 1, true, 1, 0, pitch);
		}
	}
}