//These are basic built in drawing functions and are covered in 
//Shiffman, Learning Processing - Chapter 1 and 2

// change the size of the screen 
//size(width, height);
size(300, 300);

//draw rectangle
//rect(x,y,width, height);
rect(25, 25, 100, 100);

//draw circle
//ellipse(x,y,width,height);
ellipse(25, 25, 200, 200);

//draw line
//line (x1,y1,x2,y2);
line(30, 50, 100, 100);

//change the anchor point of your shapes with 
ellipseMode(CENTER);
rectMode(CENTER);

//COLOUR
//colour is managed in processing using 
//(greyscale);
//(R,G,B);
//(R,G,B,Alpha);

//Change the background of your sketch
//draws background(r,g,b);
background(50, 50, 0);

//fill a shape
fill(30, 50, 80);
ellipse(30, 30, 100, 100);

//change stroke colour
stroke(27, 37, 40);
rect(40, 60, 29, 100);
