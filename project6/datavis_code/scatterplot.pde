
class Scatterplot extends Frame {
   
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5;
  int d=3;
  
   Scatterplot( Table data, int idx0, int idx1 ){
     
     this.idx0 = idx0;
     this.idx1 = idx1;
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
     
     minY = min(data.getFloatColumn(idx1));
     maxY = max(data.getFloatColumn(idx1));

     //table.getColumnTitle();  
     //table.getRowCount()
     //table.getRow()
     // row.getFloat();
   }
   
   void draw(){
     
     strokeWeight(1);
     for( int i = 0; i < table.getRowCount(); i++ ){
        TableRow r = table.getRow(i);
        
        float x = map( r.getFloat(idx0), minX, maxX, u0+border+spacer, u0+w-border-spacer );
        float y = map( r.getFloat(idx1), minY, maxY, v0+h-border-spacer, v0+border+spacer );
        
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
     
     stroke(0);
     noFill();
     rect( u0+border,v0+border, w-2*border, h-2*border);
     
     if( drawLabels ){
       fill(0);
       text( table.getColumnTitle(idx0), u0+width/2, v0+height-10 );
       pushMatrix();
       translate( u0+10, v0+height/2 );
       rotate( PI/2 );
       text( table.getColumnTitle(idx1), 0, 0 );
       popMatrix();
     }
   }
  
}