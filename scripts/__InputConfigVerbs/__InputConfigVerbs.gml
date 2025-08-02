function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        UP,
        LEFT,
        RIGHT,
		DOWN,
        DASH,
        RESTART
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
    
    if (not INPUT_ON_SWITCH)
    {
        InputDefineVerb(INPUT_VERB.UP,    "up",       [vk_up,  "W", "I"],    [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",       [vk_left,  "A", "J"],    [-gp_axislh, gp_padl, gp_shoulderlb]);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",      [vk_right,  "D", "L"],    [ gp_axislh, gp_padr, gp_shoulderrb]);
		InputDefineVerb(INPUT_VERB.DOWN,    "down",       [vk_down,  "S", "K"],    [gp_axislv, gp_padd]);
        InputDefineVerb(INPUT_VERB.DASH,  "dash",      vk_space,            [gp_face1, gp_face2, gp_face3, gp_face4]);
        InputDefineVerb(INPUT_VERB.RESTART,  "restart",      ["R", "Y"],        [gp_start, gp_select]);
    }
    else //Flip A/B over on Switch
    {
		InputDefineVerb(INPUT_VERB.DOWN,    "down",       undefined,    [-gp_axislh, gp_padu]);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",       undefined,    [-gp_axislh, gp_padl]);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",      undefined,    [ gp_axislh, gp_padr]);
		InputDefineVerb(INPUT_VERB.DOWN,    "down",       undefined,    [-gp_axislh, gp_padd]);
        InputDefineVerb(INPUT_VERB.DASH,  "dash",      undefined,            [gp_face1, gp_shoulderrb]);
        InputDefineVerb(INPUT_VERB.RESTART,  "restart",      undefined,        gp_select);
        //InputDefineVerb(INPUT_VERB.UP,      "up",      undefined, [-gp_axislv, gp_padu]);
        //InputDefineVerb(INPUT_VERB.DOWN,    "down",    undefined, [ gp_axislv, gp_padd]);
        //InputDefineVerb(INPUT_VERB.LEFT,    "left",    undefined, [-gp_axislh, gp_padl]);
        //InputDefineVerb(INPUT_VERB.RIGHT,   "right",   undefined, [ gp_axislh, gp_padr]);
        //InputDefineVerb(INPUT_VERB.ACCEPT,  "accept",  undefined,   gp_face2); // !!
        //InputDefineVerb(INPUT_VERB.CANCEL,  "cancel",  undefined,   gp_face1); // !!
        //InputDefineVerb(INPUT_VERB.ACTION,  "action",  undefined,   gp_face3);
        //InputDefineVerb(INPUT_VERB.SPECIAL, "special", undefined,   gp_face4);
        //InputDefineVerb(INPUT_VERB.PAUSE,   "pause",   undefined,   gp_start);
    }
    
    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}