// @pjs preload must be used to preload the image 
/* @pjs preload="nas-lifeisgood.jpg"; */
PImage img;
int smallPoint, largePoint;

void setup() {
  frameRate(150);
  size(540, 540);
  img = loadImage("nas-lifeisgood.jpg");
  smallPoint = 5;
  largePoint = 20;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  rect(x, y, pointillize, pointillize, 5);
}


