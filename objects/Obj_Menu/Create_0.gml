var menuItems = [
	new MenuItem("fart", "shart",  function(){ show_debug_message("shart"); }),
	new MenuItem("on", "inside", function(){ show_debug_message("inside"); }),
	new MenuItem("my balls", "minas bolinhas", function(){ show_debug_message("minas bolinhas"); })
]
currentMenu = new Menu(menuItems);

menuIndex = 0;
menuLength = array_length(menuItems)