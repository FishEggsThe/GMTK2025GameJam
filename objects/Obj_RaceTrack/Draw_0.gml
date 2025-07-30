draw_self()

for(var i = 0; i < array_length(checkpoints); i++) {
	var checkpoint = checkpoints[i];
	draw_text(checkpoint.x, checkpoint.y, i);
}