const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000104", /* black   */
  [1] = "#1B4454", /* red     */
  [2] = "#2C4A56", /* green   */
  [3] = "#3A5A62", /* yellow  */
  [4] = "#4D5055", /* blue    */
  [5] = "#666665", /* magenta */
  [6] = "#8B443F", /* cyan    */
  [7] = "#bfbfc0", /* white   */

  /* 8 bright colors */
  [8]  = "#3f4042",  /* black   */
  [9]  = "#1B4454",  /* red     */
  [10] = "#2C4A56", /* green   */
  [11] = "#3A5A62", /* yellow  */
  [12] = "#4D5055", /* blue    */
  [13] = "#666665", /* magenta */
  [14] = "#8B443F", /* cyan    */
  [15] = "#bfbfc0", /* white   */

  /* special colors */
  [256] = "#000104", /* background */
  [257] = "#bfbfc0", /* foreground */
  [258] = "#bfbfc0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
