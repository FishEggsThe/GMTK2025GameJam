event_inherited();

var mainItems = [
	new MenuItem("Dust", "Gauntlet", function(c){ StartGauntlet(Obj_DustEnemy) }),
	new MenuItem("Spiky", "Gauntlet", function(c){ StartGauntlet(Obj_SpikyEnemy) }),
	new MenuItem("Rock", "Gauntlet", function(c){ StartGauntlet(Obj_RockEnemy) }),
	new MenuItem("Ghost", "Gauntlet", function(c){ StartGauntlet(Obj_GhostEnemy) }),
	new MenuItem("Tank", "Gauntlet", function(c){ StartGauntlet(Obj_ShooterEnemy) }),
	new MenuItem("Tank", "Gauntlet", function(c){ StartGauntlet(Obj_ShooterEnemy) }),
	new MenuItem("Options", "Oh yeah options", function(c){ c.currentMenu = c.optionsMenu; }),
	new MenuItem("Quit", "Leave", function(c){ game_end(); })
]
gauntletMenu = new Menu(mainItems, id);

var optionItems = [
	new MenuItem("Single-Button Controls", "Toggle Dash and Acceleration to\nuse one button\nIntended for Controller Users", function(c){ Obj_Control.singleButton = !Obj_Control.singleButton; }, Obj_Control.singleButton ? "Enabled" : "Disabled", function(m){ m.title2 = Obj_Control.singleButton ? "Enabled" : "Disabled" }),
	new MenuItem("Volume", "Change the volume of the game", function(c){ with Obj_AudioPlayer { gameVolume += 10; if gameVolume > 100 { gameVolume = 0;} audio_sound_gain(currentMusic, GetVolume(), 0) } }, $"%{Obj_AudioPlayer.gameVolume}", function(m){ m.title2 = $"%{Obj_AudioPlayer.gameVolume}" }),
	new MenuItem("Toggle Fullscreen", "If you want it", function(c){ window_set_fullscreen(!window_get_fullscreen()); }),
	new MenuItem("Back", "Go Back", function(c){ c.currentMenu.menuIndex = 0; c.currentMenu = c.gauntletMenu; })
]
optionsMenu = new Menu(optionItems, id);
optionsMenu.extendMenu = true;

currentMenu = gauntletMenu;

PlayMusic(Sleepiest_Machine__1_);