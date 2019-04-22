
Frame myFrame = null;
Frame myFrame2 = null;
Frame myFrame3 = null;
Frame myFrame4 = null;
int input,bin;
//HashSet<Integer> selected = new HashSet<Integer>();
int selected=0;
ArrayList<Integer> useColumns = new ArrayList<Integer>();
Table table;


void setup(){
  size(1200,800);  
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    selectInput("Select a file to process:", "fileSelected");
  } else {
    println("User selected " + selection.getAbsolutePath());
    table = loadTable( selection.getAbsolutePath(), "header" );
    
   
    for(int i = 0; i < table.getColumnCount(); i++){
      if( !Float.isNaN( table.getRow( 0 ).getFloat(i) ) ){
        println( i + " - type float" );
        useColumns.add(i);
      }
      else{
        println( i + " - type string" );
      }
    }
    myFrame = new PCP( table, useColumns );
    myFrame2 = new Splom( table, useColumns );
    myFrame4 = new SplomA( table, useColumns );
    
    
    
  }
}

void keyPressed()
{
  textSize(15);
  fill(255, 0, 0);
  text("Corrgram(Spearman's rank correlation coefficient)",1000,height/2);
  text("Parallel Coordinates plot",350,height/2);
  text("Click canvas & Press below key (Changes in Histogram):",450,12);
  text("Corrgram(Spearman's rank correlation coefficient)",1000,12);
   fill(0, 102, 153);
  text("Hover on matrix to get Scatterplot",1100,32);
  fill(0, 102, 153);
  text("**Press A for "+ table.getColumnTitle(0),170,27);
  text("**Press B for "+ table.getColumnTitle(2),350,27);
  text("**Press C for "+ table.getColumnTitle(3),550,27);
  fill(0);
  text("*Press P for Bin Size: 5 ",210,55);
  text("*Press Q for Bin Size: 15 ",400,55);
  text("*Press R Bin Size=20 ",570,55);
  //text("**Press Q for "+ table.getColumnTitle(2),350,27);
  //text("**Press R for "+ table.getColumnTitle(3),550,27);
    
    if(key == 'p'|| key == 'P')
    {
     bin = 5; 
    }
    else if(key == 'q' || key == 'Q')
    {
      bin = 15; 
    }
    else if(key == 'r' || key == 'R')
    {
      bin = 20; 
    }
  
  
   else if (key == 'a' || key == 'A') {
     input=0;
     bin=10;
    }
    else if (key == 'b' || key == 'B') {
      input=1;
      bin=10;
    }
    else if (key == 'c' || key == 'C') {
     input=2;
     bin=10;
    }
   
 else{
    myFrame3 = new bar( table, useColumns, 3,10);
    // myFrame4 = new SplomA( table, useColumns, 3);
  }
}


void draw(){
  background( 255 );
  
  if( table == null ) 
    return;
  
  if( myFrame != null ){//parallel cordinates
       myFrame.setPosition( 0, height/2, width/2, height/2);
       myFrame.draw();
  }
  
  if( myFrame2 != null ){//scatter plot
       myFrame2.setPosition( width/2,0, width/2, height/2);
       myFrame2.draw();
  }
  
  if( myFrame3 != null ){//bar graph
       myFrame3.setPosition( 0,height/2, width/2, height );
       myFrame3.draw();
  }
  
  if( myFrame4 != null ){//line graph
       myFrame4.setPosition( width/2,height/2, width/2, height/2);
       myFrame4.draw();
  }
  keyPressed();
  if (keyPressed) {
     myFrame3 = new bar( table, useColumns, input,bin);
    // myFrame4 = new lplom( table, useColumns, input);
  }
  
}

void mousePressed(){
  myFrame.mousePressed();
}

void mouseReleased(){
  myFrame.mouseReleased();
}

abstract class Frame {
  
  int u0,v0,w,h;
     int clickBuffer = 2;
  void setPosition( int u0, int v0, int w, int h ){
    this.u0 = u0;
    this.v0 = v0;
    this.w = w;
    this.h = h;
  }
  
  abstract void draw();
  void mousePressed(){ }
  void mouseReleased(){ }
  
   boolean mouseInside(){
      return (u0-clickBuffer < mouseX) && (u0+w+clickBuffer)>mouseX && (v0-clickBuffer)< mouseY && (v0+h+clickBuffer)>mouseY; 
   }
  
  
}