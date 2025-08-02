DrawSprite(sprite, 0, x, y, 1, 1, shipAngle);

if CheckDebug() {
	draw_text(x, y, point_distance(x, y, x+xSpeed, y-ySpeed));
	draw_text(x, y+20, maxShipSpeed);
	var noseDist = 25; var noseRadius = 10;
	var xNose = x + noseDist * cos(degtorad(shipAngle));
	var yNose = y - noseDist * sin(degtorad(shipAngle));
	draw_circle_color(xNose, yNose, noseRadius, c_blue, c_blue, false);
}