DrawSprite(sprite, 0, x, y, 1, 1, shipAngle);

if CheckDebug() {
	draw_text(x, y, point_distance(x, y, x+xSpeed, y-ySpeed));
	draw_text(x, y+20, maxShipSpeed);
}