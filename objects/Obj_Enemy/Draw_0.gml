var alpha = canCollide ? 1 : 0.5;

if !startEnemy draw_circle(xLandingPos, yLandingPos, 30, true);

DrawSprite(sprite, image_index, x+xShake, y+yShake, 
				image_xscale, image_yscale, 0, image_blend, alpha);