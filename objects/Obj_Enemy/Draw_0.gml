var alpha = canCollide ? 1 : 0.5;
if !startEnemy draw_circle(xLandingPos, yLandingPos, 30, true);
draw_sprite_ext(sprite, image_index, x, y, image_xscale, image_yscale, 0, image_blend, alpha);