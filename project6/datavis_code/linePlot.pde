import java.util.*;
class lineplot extends Frame {
   
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5,pointSpace;
  int d=2;
  
  ArrayList<Integer> pointsX = new ArrayList<Integer>();
  ArrayList<Integer> pointsY = new ArrayList<Integer>();
  
   lineplot( Table data, int idx0 ){
     
     this.idx0 = idx0;
    
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
     
   

   
   }
   
   void draw(){
     
     for( int i = 0; i < table.getRowCount(); i=i+1 ){
        TableRow r = table.getRow(i);
        //TableRow s = table.getRow(i+1);
        
       // float x1 = map( r.getFloat(idx0), minX, maxX, u0+border+2*spacer, width- 2*border);
       // float y1 = map( r.getFloat(idx1), minY, maxY, border+spacer, height-2*border-2*spacer);
       
       float y1 = map( r.getFloat(idx0),minX, maxX, height-80, height/2+10);
       //float y1 = map( r.getFloat(idx1), minY, maxY, height/2+10, height-60);
        //Float yValue= r.getFloat(idx0);
       Float yValue= r.getFloat(idx0);
       
        pointsY.add(int(y1));
      
       pointSpace= (width/2 )/table.getRowCount();
       float x1=width/2+20+ (pointSpace *i);
       
       if(dist(x1, y1, mouseX, mouseY) < (d/2+1)) {
      fill(255,20,147);
      text(yValue, x1, y1 - 10);
      selected=i;
    }
       
       if(selected==i)
        {
         stroke( 0 );
         fill(65,105,225);
         ellipse( width/2+20+ (pointSpace *i),y1,10,10);
         fill(255);
        rect(1020,height-200,150,80);
        fill(0);
        text("StudentID--"+i,1020+100,height-100-75-10);
        text(table.getColumnTitle(0)+ " value:" + r.getFloat(0),1020+100+5,height-100-15-10);
        text(table.getColumnTitle(1)+ " value:" + r.getFloat(1),1020+100+5,height-100-30-10);
        text(table.getColumnTitle(2)+ " value:" + r.getFloat(2),1020+100,height-100-45-10);
        text(table.getColumnTitle(3)+ " value:"+ r.getFloat(3),1020+100,height-100-60-10);
         
         
        }
        
        else
        {
          stroke( 0 );
       fill(255,0,0);
       
       ellipse( width/2+20+ (pointSpace *i),y1,d,d);
        }
       
       
        
       
       
       // if(dist(pointsX.get(i), pointsY.get(i), mouseX, mouseY) < (d/2+1)) {
      //fill(255,20,147);
      //text( xValue+"::"+yValue, pointsX.get(i), pointsY.get(i) - 10);
    //}
        
     }
     
     for (int index = 0; index < pointsY.size()-1; index++)
    {
      fill(0);
     line(width/2+20+(pointSpace *index+1),pointsY.get(index+1),width/2+20+(pointSpace *index),pointsY.get(index));
    }
     
     
     
     stroke(0);
     noFill();
     rect(width/2+10,height/2,width/2-30,height/2-50);
     
     if( drawLabels ){
       fill(0);
       //textSize(20);
       //text( table.getColumnTitle(idx0), width-width/4,height-30);
       text(0.000,width/2+30,height-35);
       text(maxX,width/2+30,height/2);
       //text(minY,1,height-border);
       //text(maxY,1,border+20);
       pushMatrix();
       translate( u0+width/2-5, v0+height/2+200 );
       rotate( PI/2 );
       //textSize(15);
       text( table.getColumnTitle(idx0), 0, 0 );
       popMatrix();
       
       text(min(table.getFloatColumn(0)),60,height-5);
       text(min(table.getFloatColumn(1)),250,height-5);
      text(min(table.getFloatColumn(2)),425,height-5);
      text(min(table.getFloatColumn(3)),600,height-5);
      
       text(max(table.getFloatColumn(0)),75,height/2+30);
       text(max(table.getFloatColumn(1)),260,height/2+30);
       text(max(table.getFloatColumn(2)),410,height/2+30);
       text(max(table.getFloatColumn(3)),580,height/2+30);
     }
   }
  
}