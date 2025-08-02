event_inherited();

var mainItems = [
	new MenuItem("Play", "GO!!!!!!!!!!!!!!", function(c){ room_goto(Rm_Game) }),
	new MenuItem("Options", "Do nerd things", function(c){ c.currentMenu = c.optionsMenu; c.currentMenu.menuItems[0].onUpdate(c.currentMenu.menuItems[0]); }),
	new MenuItem("Quit", "Leave", function(c){ show_debug_message("Add quit game function here"); })
]
mainMenu = new Menu(mainItems, id);

var optionItems = [
	//new MenuItem("Single-Button Controls", "Toggle Dash and Acceleration to use one button\n(Intended for Controller Users)", function(c){  Obj_Control.singleButton != Obj_Control.singleButton; }),
	new MenuItem("Single-Button Controls", "Toggle Dash and Acceleration to use one button\n(Intended for Controller Users)", function(c){ Obj_Control.singleButton = !Obj_Control.singleButton; }, "", function(m){ m.title2 = Obj_Control.singleButton ? "Enabled" : "Disabled" }),
	new MenuItem("uhh", "i forgor", function(c){ show_debug_message("2"); }),
	new MenuItem("Back", "Go Back", function(c){ c.currentMenu.menuIndex = 0; c.currentMenu = c.mainMenu; })
]
optionsMenu = new Menu(optionItems, id);

currentMenu = mainMenu;