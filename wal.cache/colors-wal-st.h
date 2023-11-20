const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000103", /* black   */
  [1] = "#06496F", /* red     */
  [2] = "#075988", /* green   */
  [3] = "#086497", /* yellow  */
  [4] = "#0972AC", /* blue    */
  [5] = "#077FC4", /* magenta */
  [6] = "#0C83BB", /* cyan    */
  [7] = "#bfbfc0", /* white   */

  /* 8 bright colors */
  [8]  = "#3f4042",  /* black   */
  [9]  = "#06496F",  /* red     */
  [10] = "#075988", /* green   */
  [11] = "#086497", /* yellow  */
  [12] = "#0972AC", /* blue    */
  [13] = "#077FC4", /* magenta */
  [14] = "#0C83BB", /* cyan    */
  [15] = "#bfbfc0", /* white   */

  /* special colors */
  [256] = "#000103", /* background */
  [257] = "#bfbfc0", /* foreground */
  [258] = "#bfbfc0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
