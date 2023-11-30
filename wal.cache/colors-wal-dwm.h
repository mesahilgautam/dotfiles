static const char norm_fg[] = "#447388";
static const char norm_bg[] = "#090F17";
static const char norm_border[] = "#090F17";

static const char sel_fg[] = "#090F17";
static const char sel_bg[] = "#447388";
static const char sel_border[] = "#979893";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
