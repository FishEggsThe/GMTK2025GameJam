var alpha = canCollide ? 1 : 0.5;

if !startEnemy {
	DrawSprite(Spr_EnemyLandMarker, markerImageIndex, xLandingPos, yLandingPos, 2, 2);
	markerImageIndex = (markerImageIndex + 12/60) % markerFrames;
}

DrawSprite(sprite, spriteImageIndex, x+xShake, y+yShake, 
				image_xscale, image_yscale, 0, spriteImageBlend, alpha);