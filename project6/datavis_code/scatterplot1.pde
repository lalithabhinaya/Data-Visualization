
class Scatterplot1 extends Frame {
   
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5;
  int d=3;
   Scatterplot1( Table data, int idx0, int idx1 ){
    // println("pressed"+idx0,idx1);
     this.idx0 = idx0;
     this.idx1 = idx1;
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
     
     minY = min(data.getFloatColumn(idx1));
     maxY = max(data.getFloatColumn(idx1));
   }
   
   void draw(){
     
     stroke(0);
     fill(211,211,211);
     rect(width/2+20,160,335,200);
     fill(255,0,0);
     text("Scatterplot",width/2+200,155);
     // rect( 25,300,450, 250);
     for( int i = 0; i < table.getRowCount(); i++ ){
        TableRow r = table.getRow(i);
        
        float x = map( r.getFloat(idx0), minX, maxX, width/2+20+spacer, width/2+355-spacer );
        float y = map( r.getFloat(idx1), minY, maxY,360-spacer, 160+spacer );
         Float yValue= r.getFloat(idx0);
        
      if(dist(x, y, mouseX, mouseY) < (d/2+1)) {
      fill(255,20,147);
      text(yValue, x, y - 10);
      selected=i;
    }
        
        stroke( 0 );
        fill(255,0,0);
        if(selected==i)
        {
          fill(65,105,225);
          ellipse(x,y,10,10);
          
        }
        
        else
        {
          ellipse(x,y,3,3);
        }
        ellipse( x,y,3,3 );
     }
     
     
     
     if( drawLabels ){
       fill(0);
       text( table.getColumnTitle(idx0), width/2+200,380 );
       text(minX,width/2+75,380);
       text(maxX,width/2+385,380);
       text(minY,1,550);
       text(maxY,1,320);
       pushMatrix();
       translate(width/2+10 , 265 );
       rotate( PI/2 );
       text( table.getColumnTitle(idx1), 0, 0 );
       popMatrix();
   
     }
   }
  
}