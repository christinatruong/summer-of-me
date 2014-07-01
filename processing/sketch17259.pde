/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17259*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//fireworks - born of insomnia
PFont f;

//* how many you can launch at a time on click
Firework[] fs = new Firework[10];

//* declaring boolean variable
boolean once;
int numFs;

void setup(){
  size(600,400);
  smooth();
  f = createFont("Arial",30,true);
  //* creating number of fireworks based on above
  for (int i = 0; i < fs.length; i++){
    fs[i] = new Firework();
  }
}

// drawing fireworks throught the loop
void draw(){
  noStroke();
  //fill(50,0,40,20);
  fill(0,0,0,10);
  rect(0,0,width,height);
  for (int i = 0; i < fs.length; i++){
    fs[i].draw();
  }
}

void mouseReleased(){
  once = false;
  for (int i = 0; i < fs.length; i++){
    if((fs[i].hidden)&&(!once)){
    //if(fs[i].hidden){
      fs[i].launch();
        once = true;
    }
  }
}
class Firework{
  float x, y, oldX,oldY, ySpeed, targetX, targetY, explodeTimer, flareWeight, flareAngle;
  int flareAmount, duration;
  boolean launched,exploded,hidden;
  color flare;
  Firework(){
    launched = false;
    exploded = false;
    hidden = true;
  }
  void draw(){
    if((launched)&&(!exploded)&&(!hidden)){
      //draws fireworks
      launchMaths();
      //draws launch line
      strokeWeight(1);
      stroke(255);
      line(x,y,oldX,oldY);
    }
    if((!launched)&&(exploded)&&(!hidden)){
      explodeMaths();
      noStroke();
      strokeWeight(flareWeight);
      stroke(flare);
      for(int i = 0; i < flareAmount + 1; i++){
          pushMatrix();
          translate(x,y);
          point(sin(radians(i*flareAngle))*explodeTimer,cos(radians(i*flareAngle))*explodeTimer);
          popMatrix();
       }
    }
    if((!launched)&&(!exploded)&&(hidden)){
      //do nothing
    }
  }
  void launch(){
    x = oldX = mouseX + ((random(5)*10) - 25);
    y = oldY = height;
    targetX = mouseX;
    targetY = mouseY;
    ySpeed = random(3) + 2;
    flare = color(random(3)*50 + 105,random(3)*50 + 105,random(3)*50 + 105);
    //flareAmount = ceil(random(30)) + 20;
    flareAmount = ceil(random(30));
    //flareWeight = ceil(random(3));
    flareWeight = ceil(random(2));
    //duration = ceil(random(4))*20 + 30;
    duration = ceil(random(2,4)*50);
    
    //* makes circular flare
    flareAngle = 360/flareAmount;
    launched = true;
    exploded = false;
    hidden = false;
  }
  void launchMaths(){
    oldX = x;
    oldY = y;
    if(dist(x,y,targetX,targetY) > 6){
      x += (targetX - x)/2;
      y += -ySpeed;
    }else{
      explode();
    }
  }
  void explode(){
    explodeTimer = 0;
    launched = false;
    exploded = true;
    hidden = false;
  }
  void explodeMaths(){
    if(explodeTimer < duration){
      //explodeTimer+= 0.4;
      explodeTimer+= .8;
    } else {
      hide();
    }
  }
  void hide(){
    launched = false;
    exploded = false;
    hidden = true;
  }
}
                                                                

