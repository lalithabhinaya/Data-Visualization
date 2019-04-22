// Scatter plot visualization

Table table;
String filePath; 
float maxvalX,maxvalY,minvalX,minvalY,vizHeight,vizWidth;
PVector[] positions;
float space =50;

void setup()
{
  size(800,600);                                                                   //size of sketch
   selectInput("Select a file to represent:","SelectFile");                        //loads input data set       
}

void draw()
{
  background(20);
  drawGUI();
 if(table != null && positions[1] != null)                                             //avoiding null pointer exception
 {
   fill(173,216,230);                                                                  // fill color to points
 for (int i=1; i< positions.length; i++)                                               //place points according to vizPositions
  {
    stroke(255, 102, 0);
    ellipse(positions[i].x,positions[i].y,10,10);
    
  }
  
 }
  
}



void SelectFile(File selectedFile ){                                                 //funtion to load file
  if(selectedFile == null)                                                           //if no file is selected
    println("No file selected! Please re-run and make a selection");
  else{
    filePath = selectedFile.getAbsolutePath();
    println("The selected file is: "+filePath);                                      //displaying selected filepath in console
    table = loadTable(filePath);
      }
    maxvalX=findMaxValcol1();                                                         // calculate min and maximum values of both X and Y-axis values
    maxvalY=findMaxValcol2();
    minvalX=findMinValcol1();
    minvalY=findMinValcol2();
    println("Max value of X-axis:" + maxvalX);
    println("min value of X-axis:" + maxvalY);
    println("Max value of Y-axis:" + minvalX);
    println("min value ofY-axis:" + minvalY);
    
  
   positions= new PVector[table.getRowCount()];                                                  //setup visualization window and positions
 vizHeight = (height-space);
 vizWidth = (width -space);
 for(int i=1;i<table.getRowCount();i++)
  {
   float adjcol2 =map(table.getFloat(i,3),minvalY, maxvalY,0, vizHeight-20);                     //map function is used to adjust values
   float yPos = height -space-adjcol2;
   float adjcol1= map(table.getFloat(i,2),minvalX, maxvalX,0, vizWidth-20);
   float xPos = space + adjcol1;
   positions[i]= new PVector(xPos,yPos);                                                  
   
   }
   
}
  
float findMaxValcol1(){                                                   //finding maximum value of X-axis elements
  maxvalX=0.0;
  for(int i=1;i<table.getRowCount();i++)
    if(table.getFloat(i,2)>maxvalX)
      maxvalX=table.getFloat(i,2);
      
  return maxvalX;
  
}

float findMaxValcol2(){                                                   //finding maximum value of Y-axis elements
  maxvalY=0.0;
  for(int i=1;i<table.getRowCount();i++)
    if(table.getFloat(i,3)>maxvalY)
      maxvalY=table.getFloat(i,3);
     // println("max value of col-2:" + maxvalY);
     return maxvalY;
  
}

float findMinValcol1(){                                                   //finding minimum value of X-axis elements
  minvalX=table.getFloat(1,2);
  for(int i=1;i<table.getRowCount();i++)
    if(table.getFloat(i,2)<minvalX)
      minvalX=table.getFloat(i,2);
      //println("min value of col-1:" + minvalX);
      return minvalX;
  
}

float findMinValcol2(){                                                   //finding minimum value of Y-axis elements
  minvalY=table.getFloat(1,3);
  for(int i=1;i<table.getRowCount();i++)
    if(table.getFloat(i,3)< minvalY)
      minvalY=table.getFloat(i,3);
      //println("min value of col-2:" + minvalY);
      return minvalY;
}
 