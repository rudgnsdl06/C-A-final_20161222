float[] position_x;
float[] position_y;
float[] position_r;

void star(){
  noStroke();
  position_x = new float[300];
  position_y = new float[300];
  position_r = new float[300];
  for(int i=0; i<300; i++){
    position_x[i] = random(-width,width);
    position_y[i] = random(-height,height);
    position_r[i] = random(5,15);
  }
}
