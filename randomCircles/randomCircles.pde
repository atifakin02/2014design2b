//RANDOM

//location variables
float circleX;
float circleY;
//size
float diameter;
float r;
float g;
float b;
float alpha;

void setup(){
  size(500,500);
  noStroke();
}

void draw(){
  //random with 1 argument - generate numbers between 0, 100
  // random with 2 arguments
  
  //width and height are inbuilt variables
  circleX = random(0,width);
  circleY= random(0,height);
  diameter = random(5,150);
  //assign random values to colour variables
  r = random(0,256);
  b = random(0,256);
  g = random(0,256);
  alpha = random(50,250);
  
  fill(r,g,b,alpha);
  // ellipse(x variable, y variable, width, height);
  ellipse(circleX, circleY, diameter,diameter);
}
