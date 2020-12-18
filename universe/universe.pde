import processing.video.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

Capture video;
ML_part ML = new ML_part();

float accelX;
float accelY;
float accelZ;
float prox;

float x,y,z;
float a=1;
float b=1;

int state =3;
int frame =0;

void setup() {
  size(800,450,P3D);
  background(20);
  frameRate(60);
  
  video = new Capture(this, 640, 480);
  video.start();
  
  oscP5 = new OscP5(this, 7400);
  oscP5 = new OscP5(this, 8338);
  dest = new NetAddress("127.0.0.1", 6448);
  
  
  
  x = width/2;
  y = height/2;
  z = 0;
  smooth();
  
  star();
}

void draw() {
  frame++;
  if(b==1){
    background(20);
    back_universe();
    translate(x,y,z);
    textSize(30);
    textAlign(CENTER);
    fill(245,245,10,255-3*frame);
    text("Using your phone,\nExplore your night.",0,0);
    ellipseMode(CENTER);
    fill(245,245,10);
    ellipse(-x+width/2,-y+height/2,sqrt((z/2/PI)+100),sqrt((z/2/PI)+100));
    //draw stars
    for(int i=0; i<300; i++){
      fill(240);
      ellipse(position_x[i],position_y[i],position_r[i],position_r[i]);
      fill(240,120);
      ellipse(position_x[i],position_y[i],1.5*position_r[i],1.5*position_r[i]);
    }
    //move with phone
    if (a == 1){
    z++;
    z++;
    y++;
    }
    else if (a == 2){
    z++;
    x--;
    y++;
    }
    else if (a == 3){
    x--;
    x--;
    }
    else if (a == 4){
    x--;
    y--;
    z--;
    }
    else if (a == 5){
    z--;
    z--;
    y--;
    textSize(30);
    textAlign(CENTER);
    fill(245,245,10,255-4*frame);
    text("If you put down the phone,\nyou can watch a cartoon.",0,0);
    }
    else if (a == 6){
    z--;
    x++;
    y--;
    }
    else if (a == 7){
    x++;
    x++;
    }
    else if (a == 8){
    z++;
    x++;
    y++;
    }
  }
  else{
  cartoon();
  }
  sendOsc();
  video.read();
}

void oscEvent(OscMessage theOscMessage) {
  ML.parseOSC(theOscMessage);
}

void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add(ML.accelX); 
  msg.add(ML.accelY);
  msg.add(ML.accelZ);
  msg.add(ML.prox);
  
  msg.add((float)ML.found);
  msg.add((float)ML.poseScale);
  msg.add((float)ML.posePosition.x);
  msg.add((float)ML.posePosition.y);
  msg.add((float)ML.poseOrientation.x);
  msg.add((float)ML.poseOrientation.y);
  msg.add((float)ML.poseOrientation.z);
  msg.add((float)ML.mouthWidth);
  msg.add((float)ML.mouthHeight);
  msg.add((float)ML.eyeLeft);
  msg.add((float)ML.eyeRight);
  msg.add((float)ML.eyebrowLeft);
  msg.add((float)ML.eyebrowRight);
  msg.add((float)ML.jaw);
  msg.add((float)ML.nostrils);
  
  oscP5.send(msg, dest);
}
