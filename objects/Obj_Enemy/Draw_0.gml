var alpha = canCollide ? 1 : 0.5;

if !startEnemy {
	DrawSprite(markerSprite, markerImageIndex, xLandingPos, yLandingPos, 2, 2);
	markerImageIndex = (markerImageIndex + markerImageIncrement) % markerFrames;
}

DrawSprite(sprite, spriteImageIndex, x+xShake, y+yShake, 
				image_xscale, image_yscale, 0, spriteImageBlend, alpha);

if CheckDebug() {
	DrawText(x, y, depth, fa_right, fa_bottom, c_white);
}