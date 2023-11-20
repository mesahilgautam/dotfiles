static const char norm_fg[] = "#0972AC";
static const char norm_bg[] = "#000103";
static const char norm_border[] = "#000103";

static const char sel_fg[] = "#000103";
static const char sel_bg[] = "#0972AC";
static const char sel_border[] = "#3f4042";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
