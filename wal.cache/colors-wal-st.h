const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#090F17", /* black   */
  [1] = "#956725", /* red     */
  [2] = "#A06C4D", /* green   */
  [3] = "#D4AA4A", /* yellow  */
  [4] = "#447388", /* blue    */
  [5] = "#7F7B86", /* magenta */
  [6] = "#5F96A4", /* cyan    */
  [7] = "#d9dad3", /* white   */

  /* 8 bright colors */
  [8]  = "#979893",  /* black   */
  [9]  = "#956725",  /* red     */
  [10] = "#A06C4D", /* green   */
  [11] = "#D4AA4A", /* yellow  */
  [12] = "#447388", /* blue    */
  [13] = "#7F7B86", /* magenta */
  [14] = "#5F96A4", /* cyan    */
  [15] = "#d9dad3", /* white   */

  /* special colors */
  [256] = "#090F17", /* background */
  [257] = "#d9dad3", /* foreground */
  [258] = "#d9dad3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
