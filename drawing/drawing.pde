
float speed;

void setup(){
  size(500,500);
  
}

void draw(){
  
  speed = dist(pmouseX,pmouseY,mouseX,mouseY)/frameRate;
  println(frameRate);
  
  //pmouseX, pmouseY- previous mouse positions
  
  strokeWeight(speed*5);
  
  line(pmouseX,pmouseY,mouseX,mouseY);
  
}
