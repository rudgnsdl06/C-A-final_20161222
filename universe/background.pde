float increment = 0.01;
float zoff = 0.0;
float zincrement = 0.02;

void back_universe(){
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff,zoff)*100;

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright,bright,bright);
    }
  }
  updatePixels();
  
  zoff += zincrement; // Increment zoff
}
