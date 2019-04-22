class barGraph extends Frame {
   
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 5;
   float y,yPos,xPos,vizWidth;
   int d=20;
   int bins;//=10;
   float interval;
   int binValue,h=10;
   int bin[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
   int minBin,maxBin;
   int barSpace=5,newBorder;
  
   barGraph( Table data, int idx0, int bin){
     
     this.idx0 = idx0;
   
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
     bins = bin;
     interval = (maxX-minX)/bins;
   
   }
   
   void draw(){
     
     
     for( int i = 0; i < table.getRowCount(); i++ ){
        TableRow r = table.getRow(i);
        //float x = map( r.getFloat(idx0), minX, maxX, border,width/2-border);
       Float currentValue= r.getFloat(idx0);
       binValue= floor ( bins *(currentValue-minX)/(maxX-minX));
      // println("bin value"+binValue);
      // println("=====================");
       
       for ( int j=0;j<bins;j++)
       {
         
         if(binValue==j)
         {
           bin[j]=bin[j]+1;
         }
         
         else
           continue;
       }
           
           
     } 
     
     stroke(0);
     noFill();
      minBin = h* bin[0];
      maxBin= h* bin[0];
      for ( int i=0;i<bins;i++)
       {
          if(h*bin[i] < minBin) minBin = h*bin[i];
          
          if(h*bin[i] > maxBin) maxBin = h*bin[i];
              
        }
     
     float recWidth = ((width/2)-(3*border))/bins;
    for ( int i=0;i<bins;i++)
       {
         float barHeight=map(h*bin[i],minBin,maxBin,border,height/2-2*border-10);
         
       
       
       if(i==0)
       {
         stroke( 0 );
        
        fill(229,229,255);
         rect(border+(i*recWidth),height/2-barHeight-border,recWidth,barHeight);
         
         
       }
       else
       {
         
         border=barSpace+border;
         stroke( 0 );
        fill(229,229,255);
         rect(border+(i*recWidth),height/2-barHeight-40,recWidth,barHeight);
         
       
       }
       
       float y=height/2-barHeight-border;
       float x= border+(i*recWidth);
       if(dist(x, y, mouseX, mouseY) < (recWidth))
       {
          fill(255,0,0);
          text(bin[i], x+45, y+30);
          selected=i;
        }
       
        
        
        
            
        
       
       }
     stroke(0);
     noFill();
     border=40;
     rect(border-5,border,width/2-border-20,height/2-2*border);
     
     if( drawLabels ){
       fill(0);
       //text( table.getColumnTitle(idx0), width/4, v0+height/2-20 );
       text(0.000,border+spacer+10,height/2-20);
       text(maxX,width/2,height/2-20);
       text(table.getColumnTitle(idx0), width/4,height/2-20);
      fill(0, 102, 153);
       text("Hover on the tip of bars",300,75);
       //text("Hover on Point",1100,height-55);
       
       text(table.getColumnTitle(0),width/2+100,height/2+70);
       text(table.getColumnTitle(1),width/2+240,height/2+160);
       text(table.getColumnTitle(2),width/2+380,height/2+250);
       text(table.getColumnTitle(3),width/2+520,height/2+340);
       fill(0);
       pushMatrix();
       translate( u0+25, v0+height/4+70 );
       rotate( PI/2 );
       text("Number of Students", 0, 0 );
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