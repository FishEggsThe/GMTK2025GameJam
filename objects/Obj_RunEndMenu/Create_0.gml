event_inherited();

var endRunItems = [
	new MenuItem("Retry", "", function(c){ room_goto(Rm_Game); }),
	new MenuItem("Go Back", "", function(c){ RestartRoom() }),
]
endRunMenu = new Menu(endRunItems, id);

//var optionItems = [
//	//new MenuItem("Single-Button Controls", "Toggle Dash and Acceleration to use one button\n(Intended for Controller Users)", function(c){  Obj_Control.singleButton != Obj_Control.singleButton; }),
//	new MenuItem("Single-Button Controls", "Toggle Dash and Acceleration to use one button\n(Intended for Controller Users)", function(c){ Obj_Control.singleButton = !Obj_Control.singleButton; }, "", function(m){ m.title2 = Obj_Control.singleButton ? "Enabled" : "Disabled" }),
//	new MenuItem("Volume", "Change the volume of the game", function(c){ show_debug_message("Put volume button here idk"); }),
//	new MenuItem("Back", "Go Back", function(c){ c.currentMenu.menuIndex = 0; c.currentMenu = c.mainMenu; })
//]
//optionsMenu = new Menu(optionItems, id);

currentMenu = endRunMenu;

menuMode = false;