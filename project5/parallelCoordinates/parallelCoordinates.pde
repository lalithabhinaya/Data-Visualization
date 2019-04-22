
Frame myFrame = null;
Table table;
int input1,input2,input3,input4;
 ArrayList<Integer> useColumns = new ArrayList<Integer>();
 
void setup(){
  size(800,400);  
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
     
  }
}
void keyPressed()
{
  textSize(15);
  fill(255, 0, 0);
  text("Click on canvas & Select",605,70);
  text(" a key", 605,85);
  
  fill(255, 0, 0);
  text("=> Press A for ",605,85+30);
  fill(0, 102, 153);
  text("" + table.getColumnTitle(0) + "",608,85+50);
  text("" + table.getColumnTitle(2) + "",708,85+50);
  text("" + table.getColumnTitle(1) + "",608,85+75);
  text("" + table.getColumnTitle(3) + "",708,85+75);
  fill(255, 0, 0);
  text("=> Press B for ",605,85+90);
  fill(0, 102, 153);
  text("" + table.getColumnTitle(1) + "",608,85+110);
  text("" + table.getColumnTitle(0) + "",708,85+110);
  text("" + table.getColumnTitle(3) + "",608,85+135);
  text("" + table.getColumnTitle(2) + "",708,85+135);
  fill(255, 0, 0);
  text("=> Press C for ",605,85+150);
  fill(0, 102, 153);
  text("" + table.getColumnTitle(2) + "",608,85+170);
  text("" + table.getColumnTitle(1) + "",708,85+170);
  text("" + table.getColumnTitle(0) + "",608,85+195);
  text("" + table.getColumnTitle(3) + "",708,85+195);
  fill(255, 0, 0);
  text("=> Press D for ",605,85+210);
  fill(0, 102, 153);
  text("" + table.getColumnTitle(3) + "",608,85+230);
  text("" + table.getColumnTitle(0) + "",708,85+230);
  text("" + table.getColumnTitle(2) + "",608,85+255);
  text("" + table.getColumnTitle(1) + "",708,85+255);
  
  fill(255, 0, 0);
  text("** To RESET Graph: Press caps lock button ",05,385);
  
  
  
    if (key == 'a' || key == 'A') {
     input1=0;
     input2=2;
     input3=1;
     input4=3;
    }
    else if (key == 'b' || key == 'B') {
     input1=1;
     input2=0;
     input3=3;
     input4=2;
    }
    else if (key == 'c' || key == 'C') {
     input1=2;
     input2=1;
     input3=0;
     input4=3;
    }
    else if (key == 'd' || key == 'D') {
     input1=3;
     input2=0;
     input3=2;
     input4=1;
    }
 else{
    myFrame = new Splom( table, useColumns,0,1,2,3);
  }
}



void draw(){
  background( 255 );
  
  if( table == null ) 
    return;
  
  if( myFrame != null ){
       myFrame.setPosition( 0, 0, width, height );
       myFrame.draw();
  }
  
  keyPressed();
  if (keyPressed) {
     myFrame = new Splom( table, useColumns, input1,input2,input3,input4);
  }
  
}

void mousePressed(){
  myFrame.mousePressed();
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
  
   boolean mouseInside(){
      return (u0-clickBuffer < mouseX) && (u0+w+clickBuffer)>mouseX && (v0-clickBuffer)< mouseY && (v0+h+clickBuffer)>mouseY; 
   }
  
  
}