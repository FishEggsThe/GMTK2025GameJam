event_inherited();

var mainItems = [
	new MenuItem("Play", "GO!!!!!!!!!!!!!!", function(c){ room_goto(Rm_Game) }),
	new MenuItem("Options", "Do nerd things", function(c){ c.currentMenu = c.optionsMenu; }),
	new MenuItem("Quit", "Leave", function(c){ show_debug_message("minas bolinhas"); })
]
mainMenu = new Menu(mainItems, id);

var optionItems = [
	new MenuItem("Controls", "Maybe not", function(c){ show_debug_message("1"); }, "W/A/D/Space/R"),
	new MenuItem("uhh", "i forgor", function(c){ show_debug_message("2"); }),
	new MenuItem("Back", "Go Back", function(c){ c.currentMenu = c.mainMenu; })
]
optionsMenu = new Menu(optionItems, id);

currentMenu = mainMenu