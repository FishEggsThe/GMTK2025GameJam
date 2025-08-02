var alpha = canCollide ? 1 : 0.5;

if !startEnemy {
	DrawSprite(Spr_Flash, markerImageIndex, xLandingPos, yLandingPos, 0.75, 0.75);
	DrawSprite(Spr_EnemyLandMarker61, markerImageIndex, xLandingPos, yLandingPos, 2, 2);
	markerImageIndex = (markerImageIndex + 12/60) % markerFrames;
}

DrawSprite(sprite, spriteImageIndex, x+xShake, y+yShake, 
				image_xscale, image_yscale, 0, spriteImageBlend, alpha);

if CheckDebug() {
	DrawText(x, y, depth, fa_right, fa_bottom, c_white);
}