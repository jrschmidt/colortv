# colortv

<h5>A pixel manipulation experiment</h5>

If you grew up with old CRT screen color televisions, you may have looked at the TV screen with a magnifying glass when you were a kid. If you did, you'd have noticed that, instead of pixels as we think of them today, the screen contained an interlaced pattern of red, green and blue dots.

This application takes a 50x50 image, and enlarges it to 600x600, transforming the image into separate red, blue and green dots. The dots are 7 pixels in diameter, while each of the pixels in the original 50x50 image is now represented by a square area 12x12 of pixels.

For each red, blue or green dot, the application computes the relative contribution from each of the 12x12 enlarged pixel squares that intersect the dot's area of influence. Then, for each of those pixel squares, the app takes that square's color value for the color of that dot (red, green or blue), multiplies it by the ratio for that square, and adds it to the color value for the dot. So if a pixel square covered 40% of a dot, and the pixel's color value for that color was 50%, then the app would add 0.20 x 255 = 51 (0x33) to the dot's color value. Then each pixel of the 7x7 pixel dot would be rendered with the resulting value.
