draw_sprite_ext(sprite, 0, x, y, 1, 1, shipAngle, c_white, 1);

draw_text(x, y, point_distance(x, y, x+xSpeed, y-ySpeed));
draw_text(x, y+20, maxShipSpeed);