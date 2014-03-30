//COMMENTS ARE IMPORTANT NOTES TO YOUR FUTURE SELF

//IMPORT LIBRARIES 

//DECLARE VARIABLES
//type name;
float x;
float y; 
float speed;

void setup() {
  //RUNS THROUGH HERE ONCE!
  size(500, 500);

  // INITIALISE VARIABLE
  x=250;
  y=250;
  //no stroke
  noStroke();
  smooth();
  speed =1;
}

void draw() {
  background(0);

  fill(255);
  //change the value of x
  x=x+speed;
  //println(x);
  ellipse(x, y, 100, 100);

  //CONDITIONAL STATEMENTS

  //    <  >  ==  !=
  // IF STATEMENTS
  //if(TEST ){
  //DO THIS!
  //}

  //COMBINED IF STATEMENTS  || = OR
  //  && = AND
  
  //IF X IS LARGER THAN THE SCREEN OR SMALLER THAN 0
  if ((x>500)||(x<0)) {
    //CHANGE THE DIRECTION OF SPEED
    speed = speed*-1;

    println("IM IN THE IF STATEMENT");
  }
}
