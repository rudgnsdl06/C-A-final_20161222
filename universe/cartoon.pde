String[] imageNames = {"cartoon0.png","cartoon1.png","cartoon2.png","cartoon3.png","cartoon4.png" };
PImage[] images = new PImage[imageNames.length];
float img_height = 0;
int image_num = 0;
int left_face=0, right_face=0,sleep_face=0;

void cartoon(){
  textSize(30);
  textAlign(CENTER);
  fill(245,245,10,255-3*frame);
  text("Using your head,\nyou can choose and read a cartoon.",x,y);
  for(int i=0; i<imageNames.length; i++){
    String imageName = imageNames[i];
  images[i]=loadImage(imageName);
  }
  if (state==1){
    image(images[image_num],width/4,img_height);
  }
  else if (state==2){
    left_face += 1 ;
    if(left_face%10==0){
      if(image_num==4){
        image_num=0;
      }
      else{
        image_num += 1;
      }
    }
    image(images[image_num],width/4,img_height);
  }
  else if (state==3){
    right_face +=1;
    if(right_face%10==0){
      if(image_num == 0){
        image_num = 4;
      }
      else{
      image_num -= 1;
      }
    }
    image(images[image_num],width/4,img_height);
  }
  else if (state==4){
    if (img_height <-400){
    img_height =0;
    }
    else{
      img_height = img_height-40;
    }
    image(images[image_num],width/4,img_height);
  }
  else if (state==5){
    sleep_face += 1;
    if(sleep_face>120){
      fill(20);
      rect(0,0,width,height);
      textAlign(CENTER);
      textSize(20);
      fill(160);
      text("Good Night",x,y);
    }
    
  }
  
}
