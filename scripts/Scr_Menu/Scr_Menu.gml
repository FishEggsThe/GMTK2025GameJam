function MenuItem(title, description, onClick, title2 = "", onUpdate = function(){}) constructor {
	self.title = title;
	self.description = description;
	self.onClick = onClick;
	self.title2 = title2;
	self.onUpdate = onUpdate;
}

function Menu(items, creator) constructor {
	self.menuItems = items;
	self.creator = creator;

	menuIndex = 0;
	menuLength = array_length(menuItems)
	
	function HandleInputs() {
		var menuInput = InputPressed(INPUT_VERB.DOWN) - InputPressed(INPUT_VERB.UP);
		var confirmInput = InputPressed(INPUT_VERB.DASH);

		menuIndex = clamp(menuIndex+menuInput, 0, menuLength-1);
		var selected = menuItems[menuIndex];
		
		if confirmInput {
			selected.onClick(creator);
			selected.onUpdate(selected);
		}
	}
	
	function WorkMenu() {
		HandleInputs();
	}
	
	function DrawMenu() {
		var offset = 70; var borderOffset = 30;
		var left = offset; var right = room_width/2 - offset;
		var top = offset; var bottom = room_height - offset;

		draw_set_color(c_maroon);
		draw_rectangle(left, top, right, bottom, false);
		for(var i = 0; i < menuLength; i++) {
			var rowHeight = sprite_get_height(Spr_Font) +10;
			var index = menuIndex;
			var selected = index == i;
			var item = menuItems[i];
	
			var color = selected ? c_white : c_black;
			//DrawText(left + borderOffset, top + (i + 1)*rowHeight, item.title, fa_left, fa_top, color);
			//DrawText(right - borderOffset, top + (i + 1)*rowHeight, item.title2, fa_right, fa_top, color);
			DrawSpriteText(item.title, left + borderOffset, top + (i + 1)*rowHeight, 1, fa_left, fa_top, selected);
			DrawSpriteText(item.title2, right - borderOffset, top + (i + 1)*rowHeight, 1, fa_right, fa_top, selected);
			if selected { DrawText(left+borderOffset, bottom-borderOffset, item.description, fa_left, fa_bottom); }
	
			//
			//DrawSpriteText
		}
	}
}