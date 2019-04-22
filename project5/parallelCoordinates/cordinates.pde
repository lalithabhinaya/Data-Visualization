import java.util.*;
class Scatterplot extends Frame {
   Float minX,maxX;
Float a=50.00,b=300.00;
ArrayList<Integer> useColumns = new ArrayList<Integer>();
 ArrayList<Integer> pointsX = new ArrayList<Integer>();
 ArrayList<Integer> pointsY = new ArrayList<Integer>();
  
  ArrayList<Integer> pointsX1 = new ArrayList<Integer>();
  ArrayList<Integer> pointsY1 = new ArrayList<Integer>();
  
  ArrayList<Integer> pointsX2 = new ArrayList<Integer>();
  ArrayList<Integer> pointsY2 = new ArrayList<Integer>();
  
  ArrayList<Integer> pointsX3 = new ArrayList<Integer>();
  ArrayList<Integer> pointsY3 = new ArrayList<Integer>();
  
  ArrayList<Integer> pointsX4 = new ArrayList<Integer>();
  ArrayList<Integer> pointsY4 = new ArrayList<Integer>();
  float x1,x2,x3,x4;
  //float minX, maxX;
  //float minY, maxY;
  int idx0, idx1,idx2,idx3;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5;
  int d=8;
 // ArrayList<Integer> pointsX = new ArrayList<Integer>();
 // ArrayList<Integer> pointsY = new ArrayList<Integer>();
  
   Scatterplot( Table data, int idx0, int idx1 , int idx2,int idx3 ){
     
     this.idx0 = idx0;
     this.idx1 = idx1;
     this.idx2  = idx2;
     this.idx3  = idx3;
  
   }
   
   void draw(){
  background( 255 );
  
  if( table != null ) 
    {
      //Print Title
      fill(255,0,0);
       text("PARALLEL COORDINATES PLOT",250,15);
       
       //Draw Rectangle
       //fill(178, 190, 181);
       fill(255);
       rect(600,50,195,300);
      
        //Draw Axis
        fill(178, 190, 181);
        stroke(0);
        rect(30, 50, 5, 300);
        rect(30+(2*90), 50, 5, 300);
        rect(30+(4*90), 50, 5, 300);
        rect(30+(6*90), 50, 5, 300);
        
        //label all Axis and assign min and Max values
          //line 0
          minX = min(table.getFloatColumn(idx0));
          maxX = max(table.getFloatColumn(idx0));
          fill(0);
          text(table.getColumnTitle(idx0),30,35);
          text(maxX,30,50);
          text(minX,30,365);
          
          //line 1
          
          minX = min(table.getFloatColumn(idx1));
          maxX = max(table.getFloatColumn(idx1));
          fill(0);
          text(table.getColumnTitle(idx1),30+(2*90),35);
          text(maxX,30+(2*90),50);
          text(minX,30+(2*90),365);
        
         //line 2
          
          minX = min(table.getFloatColumn(idx2));
          maxX = max(table.getFloatColumn(idx2));
          fill(0);
          text(table.getColumnTitle(idx2),30+(4*90),35);
          text(maxX,30+(4*90),50);
          text(minX,30+(4*90),365);
          
          //line 3
          
          minX = min(table.getFloatColumn(idx3));
          maxX = max(table.getFloatColumn(idx3));
          fill(0);
          text(table.getColumnTitle(idx3),30+(6*90),35);
          text(maxX,30+(6*90),50);
          text(minX,30+(6*90),365);
        
         // Draw datalines
         
          minX = min(table.getFloatColumn(idx0));
          maxX = max(table.getFloatColumn(idx0));
             for( int i = 0; i < table.getRowCount(); i=i+1 )
             {
                 TableRow r = table.getRow(i);
               x1=30; 
               float y1 = map( r.getFloat(idx0), minX, maxX, 50, 350);
        
               //pointsX.add(int(x1));
               pointsY1.add(int(y1));
               stroke( 0 );
               fill(0);
               ellipse( x1+2,pointsY1.get(i),2,2);
       
      
            }
            
                       
             //point 1
             
             minX = min(table.getFloatColumn(idx1));
          maxX = max(table.getFloatColumn(idx1));
             for( int i = 0; i < table.getRowCount(); i=i+1 )
             {
                 TableRow r = table.getRow(i);
               x2=30+(2*90);
               float y1 = map( r.getFloat(idx1), minX, maxX, 50, 350);
        
               //pointsX.add(int(x1));
               pointsY2.add(int(y1));
               stroke( 0 );
               fill(0);
               ellipse( x2+2,pointsY2.get(i),2,2);
       
      
            }
            
                 
            //point 2
            
            minX = min(table.getFloatColumn(idx2));
          maxX = max(table.getFloatColumn(idx2));
             for( int i = 0; i < table.getRowCount(); i=i+1 )
             {
                 TableRow r = table.getRow(i);
              x3=30 +(4*90);
               float y1 = map( r.getFloat(idx2), minX, maxX, 50, 350);
        
               //pointsX.add(int(x1));
               pointsY3.add(int(y1));
               stroke( 0 );
               fill(0);
               ellipse( x3+2,pointsY3.get(i),2,2);
       
      
            }
            
            
                       
            //point 3
            
            minX = min(table.getFloatColumn(idx3));
          maxX = max(table.getFloatColumn(idx3));
             for( int i = 0; i < table.getRowCount(); i=i+1 )
             {
                 TableRow r = table.getRow(i);
               x4=30 +(6*90);
               float y1 = map( r.getFloat(idx3), minX, maxX, 50, 350);
        
               //pointsX.add(int(x1));
               pointsY4.add(int(y1));
               stroke( 0 );
               fill(0);
               ellipse( x4+2,pointsY4.get(i),2,2);
           }
            
              for (int index = 0; index < pointsY4.size(); index++)
               {
                 
                  //strokeWeight(1);
                   stroke(65,105,225);
                 line(x4,pointsY4.get(index),x3,pointsY3.get(index));
                 line(x3,pointsY3.get(index),x2,pointsY2.get(index));
                 line(x2,pointsY2.get(index),x1,pointsY1.get(index));
                 
               }
                       
    }
}

  
}