event_inherited();

var mainItems = [
	new MenuItem("Play", "Start the game", function(c){ StartIntro(); menuMode = false; }),
	new MenuItem("Options", "Adjust a few\nsettings to\nyour liking", function(c){ c.currentMenu = c.optionsMenu; c.currentMenu.menuItems[0].onUpdate(c.currentMenu.menuItems[0]); c.currentMenu.menuItems[1].onUpdate(c.currentMenu.menuItems[1]); }),
	new MenuItem("Leaderboards", "View scores\nfrom players\nonline", function(c){ menuMode = false; Obj_HighScoreManager.showScoresFirebase() }),
	new MenuItem("Quit", "Leave", function(c){ game_end(); })
]
mainMenu = new Menu(mainItems, id);

var optionItems = [
	new MenuItem("Single-Button Controls", "Toggle Dash and Acceleration to\nuse one button\nIntended for Controller Users", function(c){ Obj_Control.singleButton = !Obj_Control.singleButton; }, "", function(m){ m.title2 = Obj_Control.singleButton ? "Enabled" : "Disabled" }),
	new MenuItem("Volume", "Change the volume of the game", function(c){ with Obj_AudioPlayer { gameVolume += 10; if gameVolume > 100 { gameVolume = 0;} audio_sound_gain(currentMusic, GetVolume(), 0) } }, "", function(m){ m.title2 = $"%{Obj_AudioPlayer.gameVolume}" }),
	new MenuItem("Toggle Fullscreen", "If you want it", function(c){ window_set_fullscreen(!window_get_fullscreen()); }),
	new MenuItem("Back", "Go Back", function(c){ c.currentMenu.menuIndex = 0; c.currentMenu = c.mainMenu; })
]
optionsMenu = new Menu(optionItems, id);
optionsMenu.extendMenu = true;

currentMenu = mainMenu;

PlayMusic(Sleep_Machine);