#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height)

var xPos = x + random_range(-screenShake, screenShake)
var yPos = y + random_range(-screenShake, screenShake)
camera_set_view_pos(view, xPos, yPos)

if (screenShake > 0 && current_time % 2 == 1) {
	screenShake -= screenShakeReduce;
	screenShake = clamp(screenShake, 0, 999999);
}