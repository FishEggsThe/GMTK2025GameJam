function DrawSprite(_sprite, _subimg, _x, _y, _xscale=1, _yscale=1, _rot=0, _col=c_white, _alpha=1){
	draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _col, _alpha);
}

function DrawText(_x, _y, _string, _halign, _valign, _color=c_black, _xscale=1, _yscale=1, _angle=0, _alpha=1) {
	draw_set_halign(_halign); draw_set_valign(_valign); // draw_set_font(Ft_ComicSans);
	draw_text_transformed_color(_x, _y, _string, _xscale, _yscale, _angle, 
								_color, _color, _color, _color, _alpha);
}

function DrawSpriteText(_string, _x, _y, _size = 3, _halign = fa_left, _valign = fa_top, _outline = true) {
	var characters = "abcdefghijklmnopqrstuvwxyz1234567890";
	
	var trueString = ""
	trueString = string(_string)
	trueString = string_upper(trueString)
	
	var characterIndex = -1
	var stringLength = string_length(trueString)
	var setXOffset = 0
	switch(_halign) {
		//case fa_left:
		//setXOffset = 0
		//break
		case fa_center:
		setXOffset = -stringLength*global.fontWidth*_size/2
		break
		case fa_right:
		setXOffset = -stringLength*global.fontWidth*_size
		break
	}
	var xOffset = setXOffset
	var yOffset = 0
	switch(_valign) {
		//case fa_top:
		//yOffset = 0
		//break
		case fa_middle:
		yOffset = -(global.fontHeight+3)*_size/2
		break
		case fa_bottom:
		yOffset = -(global.fontHeight+3)*_size
		break
	}
	
	for(var i = 0; i < stringLength; i++) {
		var character = string_copy(trueString, i+1, 1)
		
		if character == "\n" {
			yOffset += (global.fontHeight+3)*_size
			xOffset = setXOffset
			continue
		}
			
		characterIndex = -1
		for(var j = 0; j < global.containsLength; j++) {
			var contain = string_copy(global.fontContains, j+1, 1)
			if character == contain {
				characterIndex = j
				break
			}
		}
		if characterIndex > -1 {
			if _outline
				draw_sprite_ext(global.fontSprite, characterIndex, _x+xOffset+5, _y+yOffset+5, 
								_size, _size, 0, c_black, 1)
			
			draw_sprite_ext(global.fontSprite, characterIndex, _x+xOffset, _y+yOffset, 
							_size, _size, 0, c_white, 1)
		}
		xOffset += global.fontWidth*_size
	}
	
}

function CheckDebug() {
	return instance_exists(Obj_Debug) && Obj_Debug.debug;
}

function CheckIfDuplicate(inst = id) {
	if instance_number(inst.object_index) > 1 { instance_destroy(); exit; }
}

function ShakeScreen(amount) {
	with Obj_Camera { screenShake += amount; }
}
