var offset = 70; var borderOffset = 30;
var left = offset; var right = room_width/2 - offset;
var top = offset; var bottom = room_height - offset;

draw_set_color(c_maroon);
draw_rectangle(left, top, right, bottom, false);
for(var i = 0; i < menuLength; i++) {
	var rowHeight = 30;
	var index = currentMenu.menuIndex;
	var selected = index == i;
	var item = currentMenu.menuItems[i];
	
	var color = selected ? c_white : c_black;
	DrawText(left + borderOffset, top + (i + 1)*rowHeight, item.title, fa_left, fa_top, color);
	DrawText(right - borderOffset, top + (i + 1)*rowHeight, item.title2, fa_right, fa_top, color);
	if selected { DrawText(left+borderOffset, bottom-borderOffset, item.description, fa_left, fa_bottom); }
	
	//
	//DrawSpriteText
}