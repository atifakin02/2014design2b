
//VARIABLES
PImage img; //iimage variable
Table eventTable; //declare table class

//variables for counting rows and columns
int rowCount;
int columnCount;

//variables for data points
String event;
float x;
float y;
int radius = 2;

int yearMin, yearMax; 

//array for years
int[] years; 

int yearInterval = 10;

//variable for our font
PFont plotFont; 

// plot variables
float plotX1, plotY1; 
float plotX2, plotY2; 


void setup( ) {

  size(1132, 1200); 

  //LOAD BACKGROUND IMAGE
  img = loadImage("tree1.jpg");

  //LOAD FONT
  plotFont = loadFont("ApercuPro-12.vlw");

  // Make a data table from a file that contains
  // the time line you have created.

  eventTable = new Table("myLife.tsv"); 

  // The row count variable is declared globally (ie it can be seen by all the 
  //sections of the sketch), because we use it a lot.
  //This line fills the row count with the amount of rows by calling a function
  //called getRowCount(); from our object 'eventTable'. 
  rowCount = eventTable.getRowCount( );
  println(rowCount);

  // Define corners of the plotted time series 
  plotX1 = width/2+250; 
  plotX2 = 995; 
  plotY1 = height/2; 
  plotY2 = height/2;
}

void draw( ) {
  //draw background and image with each loop of draw
  background(255);
  tint(100);
  image(img, 0, 0);

  // Drawing attributes for the ellipses.
  smooth( );
  fill(192, 0, 0);
  noStroke( );

  // Loop through the rows of the timeline file and draw the points.
  for (int row = 0; row < rowCount; row++) {

    //fiill yearT with the value at (row, 1) - this value is returned by the function
    //getFloat from our object eventTable
    float yearT = eventTable.getFloat(row, 1); // column 1
    y=height/2;
    float age = eventTable.getFloat(row, 2); // column 2

      println(age);//check it is working

    x = map(yearT, 1982, 2014, plotX1, plotX2); //map x

    ellipse(x, y, 5, 5); //draw our data point

    //this icalls the function below that draws our labels to the screen when 
    //the mouse passes over them
    drawevent(x, y, row);
  }
}

void drawevent(float x, float y, int row) {
  //fill the variable event with the string returne by getString (from our obbject 
  // eventTable
  event = eventTable.getString(row, 0);

  //a conditional that defines the interactivity
  //if distance is less than (radius + 2) then execture the code below
  if (dist(x, y, mouseX, mouseY) < radius+2) {
    
    fill(255, 0, 0);
    textAlign(CENTER);
    // Show the string in event at the coordinates, x and y-10
    text(event, x, y-10);
  }
}

