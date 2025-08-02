function Menu(items, creator) constructor {
	self.menuItems = items;
	self.creator = creator;

	menuIndex = 0;
	menuLength = array_length(menuItems)
	
	function HandleInputs() {
		var menuInput = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
		var confirmInput = keyboard_check_pressed(vk_space);

		menuIndex = clamp(menuIndex+menuInput, 0, menuLength-1);
		var selected = menuItems[menuIndex];
		
		if confirmInput {
			selected.onClick(creator);
		}
	}
	
	function WorkMenu() {
		HandleInputs();
	}
}

function MenuItem(title, description, onClick, title2 = "") constructor {
	self.title = title;
	self.description = description;
	self.onClick = onClick;
	self.title2 = title2;
}