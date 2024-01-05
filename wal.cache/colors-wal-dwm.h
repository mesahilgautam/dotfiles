static const char norm_fg[] = "#6A7596";
static const char norm_bg[] = "#020203";
static const char norm_border[] = "#020203";

static const char sel_fg[] = "#020203";
static const char sel_bg[] = "#6A7596";
static const char sel_border[] = "#414142";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
