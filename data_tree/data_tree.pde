
// Introduce FloatTable class
FloatTable data; 

// variable for data minimum and maximum
float dataMin, dataMax; 

// plot variables
float plotX1, plotY1; 
float plotX2, plotY2; 

int yearMin, yearMax; 

//array for years
int[] years; 

float d;

//background image
PImage img;

//variable for data column selected
int currentColumn = 1;


void setup() { 
  size(1132, 1200); 

//load our data into FloatTable object call 'data'
  data = new FloatTable("NYpopulation.tsv"); 

// fill the years array with rowRames using the function (getRowNames()) 
// from the data object
  years = int(data.getRowNames()); 
  yearMin = years[0]; 
  yearMax = years[years.length - 1]; 
  
  
  dataMin = 0; 
  //dataMax is filled with max value from the function (getColumnMax)
  dataMax = data.getColumnMax(currentColumn); 

  // Corners of the plotted time series 
  plotX1 = 995; 
  plotX2 = mouseX; 
  plotY1 = height/2; 
  plotY2 = height - plotY1; 

  smooth(); 
  
  img = loadImage("tree1.jpg");

}


void draw() { 
 //draw image
  image(img,0,0,width,height);
 
  
  // some functions to control appearance
  fill(255); 
  rectMode(CORNERS); 
  noStroke(); 
 

  strokeWeight(5);
  stroke(#5679C1); 
  // Draw the data for the currentColumn using the function (drawDataPoints)
  drawDataPoints(currentColumn);
  fill(0); 
  //draw an ellipse in the center to check where it is - does it match the image
  ellipse(width/2,height/2,10,10);
} 


// FUNCTION TO DRAW DAT POINTS
void drawDataPoints(int col) { 
  //fill rowCount with what is returned by getRowCount() function.
  int rowCount = data.getRowCount(); 
  
  //run through all the rows. 
  for (int row = 0; row < rowCount; row++) { 
    //check there is data using the function isValid for each location in the table. 
    if (data.isValid(row, col)) { 
      
      //put the data point into the value. 
      float value = data.getFloat(row, col); 
      //generate the x value using the map function which will map the 
      //range of values to the dimenions of the x axis
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2); 
      
      // our y value is constant as is set by the variable plotY1
      float y = plotY1; 
      //d is a size variable that is mapped from the range of our data value to 
      // a range, in this case 0 and 500
      d = map(value, dataMin, dataMax, 0, 500);
      
      //make it look pretty
      strokeWeight(1);
      fill(255,0,0);
      noStroke();
      //stroke(#5679C1); 
      rectMode(CORNERS);
      //draw rectangles that are located at x and y and sized using our d variable
      rect(x,y,x+3,d); 
      stroke(255,0,0);
      //ellipse(x,y,5,5);
    } 
  } 
} 

void mousePressed(){
   plotX2 = mouseX; 
  
}
