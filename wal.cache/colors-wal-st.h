const char *colorname[] = {

    /* 8 normal colors */
    [0] = "#000000", /* black   */
    [1] = "#505567", /* red     */
    [2] = "#37638A", /* green   */
    [3] = "#546B90", /* yellow  */
    [4] = "#6A7596", /* blue    */
    [5] = "#8A778D", /* magenta */
    [6] = "#7187A9", /* cyan    */
    [7] = "#bfbfc0", /* white   */

    /* 8 bright colors */
    [8] = "#414142",  /* black   */
    [9] = "#505567",  /* red     */
    [10] = "#37638A", /* green   */
    [11] = "#546B90", /* yellow  */
    [12] = "#6A7596", /* blue    */
    [13] = "#8A778D", /* magenta */
    [14] = "#7187A9", /* cyan    */
    [15] = "#bfbfc0", /* white   */

    /* special colors */
    [256] = "#020203", /* background */
    [257] = "#bfbfc0", /* foreground */
    [258] = "#bfbfc0", /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
unsigned int defaultbg = 0;
unsigned int defaultfg = 257;
unsigned int defaultcs = 258;
unsigned int defaultrcs = 258;
