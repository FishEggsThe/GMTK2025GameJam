canCollide = false;
startEnemy = false;
xLandingPos = 0; yLandingPos = 0;
GetSpawnPosition();

sprite = Spr_FruitLoopEnemy;

percent = 0;
curve = animcurve_get_channel(AnCv_EnemySpawnJump, "curve1");