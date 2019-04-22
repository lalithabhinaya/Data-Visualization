
class Scatterplot1 extends Frame {
   
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5;
  int d=3;
  float sumX=0,sumY=0,meanX=0,meanY=0;
  float stdevX=0,stdevY=0,tempSumX=0,tempSumY=0,tempX=0,tempY=0;
  float covXY=0, proSum=0,r,c;
  
   Scatterplot1( Table data, int idx0, int idx1 ){
    // println("pressed"+idx0,idx1);
     this.idx0 = idx0;
     this.idx1 = idx1;
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
     
     minY = min(data.getFloatColumn(idx1));
     maxY = max(data.getFloatColumn(idx1));
     c = calcPearson();
   }
   
   
   
float calcPearson()
   {
       for( int i = 0; i < table.getRowCount(); i++ )
     {
        TableRow r = table.getRow(i);
        sumX = sumX + r.getFloat(idx0);
        sumY = sumY + r.getFloat(idx1);
        
     }
     
     meanX = sumX/(table.getRowCount());
     
     meanY = sumY/(table.getRowCount());
    
    // Calculate Standard deviation
    
    
    
    for( int i = 0; i < table.getRowCount(); i++ )
     {
        TableRow r = table.getRow(i);
        tempX = r.getFloat(idx0) - meanX;
        tempY = r.getFloat(idx1) - meanY;
        
        tempSumX = tempSumX + pow(tempX,2);
        tempSumY = tempSumY + pow(tempY,2);
        
        stdevX = sqrt(tempSumX/table.getRowCount());
        stdevY = sqrt(tempSumY/table.getRowCount());
        
        proSum = proSum +(tempX*tempY);
        
        covXY = proSum/ table.getRowCount();
        
      }
      
      r = covXY/(stdevX * stdevY);
      //println("Pearson Correlation Coefficient"+r);
      
      //println("Mean of X:: Mean of Y"+meanX + meanY);
      //println("Pearson Correlation Coefficient"+r);
    
    
   return r;
    
    
 }   
   
   void draw(){
     
     stroke(0);
     fill(211,211,211);
     
       if(r >= -1 && r < -0.85)
       fill(255,0,0);//255,0,0)
      else if (r >= -0.85 && r < -0.5)
      fill(255,73,73);
      else if (r >= -0.5 && r < -0.4)////
      fill(255,73,73);//205,92,92
    else if (r >= -0.4 && r < -0.3)////
      fill (255,171,171);//205,92,92
    else if (r >= -0.3 && r < 0)////
      fill(255,230,230);//205,92,92
   
      else if (r >= 0 && r < 0.47)///////
      fill(255,230,230);//143,188,143
      else if (r >= 0.47 && r < 0.53)/////
      fill(255,210,210);//144,238,144
      else if (r >= 0.53 && r < 0.6)////
      fill(255,171,171);//152,251,152
      else if (r >= 0.6 && r < 0.7)///
      fill(255,132,132);//0,250,154
      else if (r >= 0.7 && r < 0.75)///
      fill(255,73,73);//0,255,127
      else if (r >= 0.75 && r < 0.8)
      fill(154,205,50);  //154,205,50
       else if (r >= 0.8 && r < 0.85)/////
      fill(255,73,73);
       else if (r >= 0.85 && r < 0.9)//0.872  0.963  0.818
      fill(255,53,53);
       else if (r >= 0.9 && r < 1)
      fill(255,53,53);
     
     
     textSize(14);
     
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