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