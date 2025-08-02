var offset = 70;
var left = offset; var right = room_width/2 - offset;
var top = offset; var bottom = room_height - offset;

draw_set_color(c_maroon);
draw_rectangle(left, top, right, bottom, false);
for(var i = 0; i < menuLength; i++) {
	var item = currentMenu.menuItems[i]; var rowHeight = 30;
	
	var color = currentMenu.menuIndex == i ? c_white : c_black;
	DrawText(left + offset, top + (i + 1)*rowHeight, item.title, fa_center, fa_middle, color);
	DrawText(left + lerp(left, right, 0.5), top + (i + 1)*rowHeight, item.title2, fa_center, fa_middle, color);
	
	//var selected = currentMenu.menuIndex == i;
	//DrawSpriteText
}