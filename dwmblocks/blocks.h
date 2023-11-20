//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"", "videostatus",					2,		0},
    {"", "sb-nettraf",					1,		0},
    {"", "sb-battery",					5,		0},
    {"", "sb-audio",					0,		3},
    {"", "sb-backlight",				0,		4},
    {"", "sb-clock",					5,		0},
    {"", "sb-cpu",					    3,		0},
    {"", "sb-internet",					1,		0},
    {"", "sb-cpubars",					3,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
