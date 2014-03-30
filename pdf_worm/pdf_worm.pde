
//IMPORT PDF
import processing.pdf.*;
float circleX;
float circleY;
float randX;
float randY;

void setup() {
  //MODIFY SIZE 
  size(700, 700);
  smooth();
  //initialise at the centre of the screen
  circleX = 250;
  circleY = 250;
  beginRecord(PDF, "tega.pdf");
}

void draw() {
  //variation ranging from 
  randX = random(-5, 5);
  randY = random(-5, 5);
  //new value of X = old value of X + variation
  circleX = circleX + randX;
  //new value of Y = old value of Y + variation
  circleY = circleY + randY; 
  //draw circle(xpos, ypos, width, height);
  ellipse(circleX, circleY, 40, 40);
  if (circleX>width) {
    circleX=width;
  }
  if (circleY>height) {
    circleY=height;
  }
  if (circleX<0) {
    circleX=0;
  }  
  if (circleY<0) {
    circleY=0;
  }
}
//THIS IS A NEW FUNCTION
void mousePressed(){
  endRecord();
  //we can tell processing to open the pdf
  open(sketchPath("tega.pdf"));
  noLoop();
}
