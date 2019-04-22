//scatter plot matrix of size 4*4

Table table;
String filePath; 
int realWidth,realHeight,graphWidth,graphHeight,cols;
int space=50;
int matrixSize=4;

void setup(){                                                           //execution starts from here
 size(800, 600);                                                        //size of canvas
  selectInput("Select a file to represent:","SelectFile");              //loads input data set
}

void SelectFile(File selectedFile ){                                                 
  if(selectedFile == null)                                                         //check if data set is empty
    println("No file selected! Please re-run and make a selection");
  else{
    filePath = selectedFile.getAbsolutePath();
    println("The selected file is: "+filePath);                                      //print absolute path of the file
    table = loadTable(filePath);                                                     //table object stores data values
      }
 
  
}

void draw(){
  
  if(table != null){                                                                   //Avoid null pointer exception
 
  background(255);
  noFill();
  stroke(0);
  strokeWeight(4);
  line(space,space,space,height-space);                                                //Draw outlines for matrix
  line(space,space,height-space,space);
  line(space,height-space,height-space,height-space);
  line(height-space,height-space,height-space,space);
  
  graphWidth= realWidth / matrixSize;
  graphHeight=realHeight/matrixSize;
  realWidth= width-300;
  realHeight= height-100;
  cols=40;
   
   for(int i=0;i<matrixSize;i++)                                                                 //(divides window into 4*4 matrix)
  {
     line(space+(i*realWidth/matrixSize),space,space+(i*realWidth/matrixSize),height-space);
     line(space,space+(i*realHeight)/matrixSize,height-space,space+(i*realHeight)/matrixSize);
   }
   
                                                                                                      //labelling for X and Y-axis
   fill(0, 0, 255);
   text(table.getString(0,0),100,570); 
   text(table.getString(0,1),225,570);
   text(table.getString(0,2),350,570);
   text(table.getString(0,3),475,570);
   text(table.getString(0,0),10,470);   
   text(table.getString(0,1),10,345); 
   text(table.getString(0,2),10,220);
   text(table.getString(0,3),10,95);
   
   for(int i=1;i<cols;i++)                                                                            //Draw background frame
  {
     strokeWeight(0);
     line(space+(i*realWidth/cols),space,space+(i*realWidth/cols),height-space);
     line(space,space+(i*realHeight/cols),height-space,space+(i*realHeight/cols));
  }
   
   
   for(int i=0;i<table.getRowCount();i++)
    {
      
      fill(255,0,0);  
      //Map SATV with SATM,ACT and GPA values
       ellipse(space+(table.getInt(i,1))*(graphWidth/9)/100,space+2*graphHeight+table.getInt(i,0)*(graphHeight/9)/100,3,3);
      ellipse(space+(table.getInt(i,1))*(graphWidth/9)/100,space+1*graphHeight+table.getInt(i,2)*(graphHeight/9)/5,3,3);
       ellipse(space+(table.getInt(i,1))*(graphWidth/9)/100,space+table.getFloat(i,3)*(graphHeight/9)/0.5,3,3);
       
       //Map SATM with SATV,ACT and GPA values                                                                                               
      ellipse(space+graphWidth+(table.getInt(i,0))*(graphWidth/9)/100,space+3*graphHeight+table.getInt(i,1)*(graphHeight/9)/100,3,3);
      ellipse(space+graphWidth+(table.getInt(i,0))*(graphWidth/9)/100,space+1*graphHeight+table.getFloat(i,2)*(graphHeight/9)/5,3,3);
       ellipse(space+graphWidth+(table.getInt(i,0))*(graphWidth/9)/100,space+table.getFloat(i,3)*(graphHeight/9)/0.5,3,3);
       
       //map ACT with SATM,SATV and GPA values                                                                                                
      ellipse(space+2*graphWidth+(table.getFloat(i,2))*(graphWidth/9)/5,space+3*graphHeight+(table.getInt(i,1))*(graphWidth/9)/100,3,3);
      ellipse(space+2*graphWidth+(table.getFloat(i,2))*(graphWidth/9)/5,space+2*graphHeight+(table.getInt(i,0))*(graphWidth/9)/100,3,3);
      ellipse(space+2*graphWidth+(table.getFloat(i,2))*(graphWidth/9)/5,space+(table.getFloat(i,3))*(graphWidth/9)/0.5,3,3);
         
     //map GPA with SATM,SATV and ACT values                                                                                                 
      ellipse(space+3*graphWidth+(table.getFloat(i,3))*(graphWidth/9)/0.5,space+3*graphHeight+(table.getInt(i,1))*(graphWidth/9)/100,3,3);
      ellipse(space+3*graphWidth+(table.getFloat(i,3))*(graphWidth/9)/0.5,space+2*graphHeight+(table.getInt(i,0))*(graphWidth/9)/100,3,3);
      ellipse(space+3*graphWidth+(table.getFloat(i,3))*(graphWidth/9)/0.5,space+1*graphHeight+(table.getInt(i,2))*(graphWidth/9)/5,3,3);
       
    }
    
}
}