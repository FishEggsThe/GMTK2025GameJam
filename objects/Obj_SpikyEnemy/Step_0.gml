event_inherited();

percent = percent + increment;
if percent >= 1 || percent <= 0 { increment = -increment; }
var position = animcurve_channel_evaluate(curve, percent);

x = startPos[0] + (distances[0] * position);
y = startPos[1] + (distances[1] * position);