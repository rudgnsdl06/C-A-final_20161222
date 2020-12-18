// a single tracked ML from ML_partOSC
class ML_part {
  
  //phone
  float accelX;
  float accelY;
  float accelZ;
  float prox;
  
  // num MLs found
  int found;
  
  // pose
  float poseScale;
  PVector posePosition = new PVector();
  PVector poseOrientation = new PVector();
  
  // gesture
  float mouthHeight, mouthWidth;
  float eyeLeft, eyeRight;
  float eyebrowLeft, eyebrowRight;
  float jaw;
  float nostrils;
  
  ML_part() {}

  // parse an OSC message from ML_partOSC
  // returns true if a message was handled
  boolean parseOSC(OscMessage theOscMessage) {
    
    if (theOscMessage.checkAddrPattern("/accelerometer/gravity/x")==true) {
    accelX = theOscMessage.get(0).floatValue();  
    println("x: "+accelX);
  }
  if (theOscMessage.checkAddrPattern("/accelerometer/gravity/y")==true) {
    accelY = theOscMessage.get(0).floatValue();  
    println("y: "+accelY);
  }
  if (theOscMessage.checkAddrPattern("/accelerometer/gravity/z")==true) {
    accelZ = theOscMessage.get(0).floatValue();  
    println("z: "+accelZ);
  }
  if (theOscMessage.checkAddrPattern("/proximity")==true) {
    prox = theOscMessage.get(0).floatValue();  
    println("proximity: "+prox);
  }
    
    
    if(theOscMessage.checkAddrPattern("/found")) {
        found = theOscMessage.get(0).intValue();
        return true;
    }      
          
    // pose
    else if(theOscMessage.checkAddrPattern("/pose/scale")) {
        poseScale = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/pose/position")) {
        posePosition.x = theOscMessage.get(0).floatValue();
        posePosition.y = theOscMessage.get(1).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/pose/orientation")) {
        poseOrientation.x = theOscMessage.get(0).floatValue();
        poseOrientation.y = theOscMessage.get(1).floatValue();
        poseOrientation.z = theOscMessage.get(2).floatValue();
        return true;
    }
    
    // gesture
    else if(theOscMessage.checkAddrPattern("/gesture/mouth/width")) {
        mouthWidth = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/mouth/height")) {
        mouthHeight = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/eye/left")) {
        eyeLeft = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/eye/right")) {
        eyeRight = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/eyebrow/left")) {
        eyebrowLeft = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/eyebrow/right")) {
        eyebrowRight = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/jaw")) {
        jaw = theOscMessage.get(0).floatValue();
        return true;
    }
    else if(theOscMessage.checkAddrPattern("/gesture/nostrils")) {
        nostrils = theOscMessage.get(0).floatValue();
        return true;
    }
    else if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {

    /* check if the typetag is the right one. */
    if (theOscMessage.checkTypetag("fff")) {
      a = (int)theOscMessage.get(0).floatValue();
      b = (int)theOscMessage.get(1).floatValue();
      println("a="+a);
      println("b="+b);
      state = (int)theOscMessage.get(2).floatValue();
      println(state);
      
    }
  }
    
    return false;
  }
  
  // get the current ML values as a string (includes end lines)
  String toString() {
    return "found: " + found + "\n"
           + "pose" + "\n"
           + " scale: " + poseScale + "\n"
           + " position: " + posePosition.toString() + "\n"
           + " orientation: " + poseOrientation.toString() + "\n"
           + "gesture" + "\n"
           + " mouth: " + mouthWidth + " " + mouthHeight + "\n"
           + " eye: " + eyeLeft + " " + eyeRight + "\n"
           + " eyebrow: " + eyebrowLeft + " " + eyebrowRight + "\n"
           + " jaw: " + jaw + "\n"
           + " nostrils: " + nostrils + "\n";
  }
  
};
