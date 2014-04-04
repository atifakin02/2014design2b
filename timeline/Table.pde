//TABLE CLASS
class Table {
  //two dimensional array that holds the data
  String[][] data;
  //variable for counting what row we are in
  int rowCount;
  
  //CONSTRUCTOR
  Table() {
    data = new String[10][10];
  }

  //FUNCTION CALLED TABLE THAT LOADS THE DATA FILE INTO A TABLE
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      
      // split the row on the tabs
      String[] pieces = split(rows[i], TAB);
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
      
      // this could be done in one fell swoop via:
      //data[rowCount++] = split(rows[i], TAB);
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }

//FUNCTION THAT RETURNS THE AMOUNT OF ROWS IN THE FILE
  int getRowCount() {
    return rowCount;
  }
  
  
  // find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  //FUNTION THAT GETS ROW NAME - or whatever is in column 0
  String getRowName(int row) {
    return getString(row, 0);
  }

//FUNCTION THAT RETURNS A TABLE VALUE AS A STRING
//ARGUMENTS ARE ROW INDEX AND COLUMN NUMBER
  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

//FUNCTION THAT RETURNS A TABLE VALUE AS A STRING
//ARGUMENTS ARE ROW NAME AND COLUMN NUMBER
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN INT
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN INT
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN FLOAT
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN FLOAT
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
  
  
  void setRowName(int row, String what) {
    data[row][0] = what;
  }


  void setString(int rowIndex, int column, String what) {
    data[rowIndex][column] = what;
  }

  
  void setString(String rowName, int column, String what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = what;
  }

  
  void setInt(int rowIndex, int column, int what) {
    data[rowIndex][column] = str(what);
  }

  
  void setInt(String rowName, int column, int what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }

  
  void setFloat(int rowIndex, int column, float what) {
    data[rowIndex][column] = str(what);
  }


  void setFloat(String rowName, int column, float what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }
  
  
  // Write this table as a TSV file
  void write(PrintWriter writer) {
    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < data[i].length; j++) {
        if (j != 0) {
          writer.print(TAB);
        }
        if (data[i][j] != null) {
          writer.print(data[i][j]);
        }
      }
      writer.println();
    }
    writer.flush();
  }
}
