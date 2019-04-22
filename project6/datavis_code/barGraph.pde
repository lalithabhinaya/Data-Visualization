class barGraph extends Frame {
   
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5;
   float y,yPos,xPos,vizWidth;
   int d=20;
  
   barGraph( Table data, int idx0){
     
     this.idx0 = idx0;
   
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
   
   }
   
   void draw(){
     
     for( int i = 0; i < table.getRowCount(); i++ ){
        TableRow r = table.getRow(i);
        float recWidth = (width/2)/table.getRowCount();
        //float yPos = (height/2)- r.getFloat(idx0);
        float x = map( r.getFloat(idx0), minX, maxX, height/2-2*border-10,border);
      
        
       Float yValue= r.getFloat(idx0);
       
       float y=border+recWidth *i;
       float z= height/2-border-x;
       if(dist(y, z, mouseX, mouseY) < (recWidth/2+1))
       {
          fill(0);
          text(yValue, y, z - 10);
          selected=i;
        }
       
       // Float yValue= r.getFloat(idx1);
       
       if(selected==i)
        {
          stroke( 0 );
        fill(0);
        rect( border+recWidth *i,height/2-border-x,recWidth,x);
        
        fill(255);
        rect(380,40,150,80);
        fill(0);
        text("StudentID--"+i,width/2-100,55);
        text(table.getColumnTitle(0)+ " value:" + r.getFloat(0),width/2-100,70);
        text(table.getColumnTitle(1)+ " value:" + r.getFloat(1),width/2-100,85);
        text(table.getColumnTitle(2)+ " value:" + r.getFloat(2),width/2-100,100);
        text(table.getColumnTitle(3)+ " value:"+ r.getFloat(3),width/2-100,115);
        
        }
        
        else
        {
          stroke( 0 );
        fill(255,105,180);
        rect( border+recWidth *i,height/2-border-x,recWidth,x);
        }
       
       
       // stroke( 0 );
        //fill(255,105,180);
        //rect( border+recWidth *i,height/2-border-x,recWidth,x);
       
       //rect( x,y,d,height/2-y-border);
      
       
     }
     
     stroke(0);
     noFill();
    
     
     rect(border,border,width/2-border-18,height/2-2*border);
     
     if( drawLabels ){
       fill(0);
       //text( table.getColumnTitle(idx0), width/4, v0+height/2-20 );
       text(0.000,border+spacer+10,height/2-20);
       text(maxX,border+spacer+10,border);
       text(minY,1,height/4-border);
       text(maxY,1,10);
      fill(0, 102, 153);
       text("Hover on the tip of bars",300,55);
       text("Hover on Point",1100,height-55);
       fill(0);
       pushMatrix();
       translate( u0+25, v0+height/4 );
       rotate( PI/2 );
       text( table.getColumnTitle(idx0), 0, 0 );
       popMatrix();
     }
     
     for( int i = 0; i < table.getRowCount(); i++ ){
        TableRow r = table.getRow(i);
          if(mouseX> border+spacer && mouseX<=r.getFloat(idx0)){
           fill(255,40,40);
       
     
          }
        }
  
}

}