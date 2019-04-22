
class ScatterplotA extends Frame {
   
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
  
  ArrayList<Double> Xvalues = new ArrayList<Double>();
  ArrayList<Double> X1values = new ArrayList<Double>();
  ArrayList<Integer> X2values = new ArrayList<Integer>();

  ArrayList<Double> Yvalues = new ArrayList<Double>();
  ArrayList<Double> Y1values = new ArrayList<Double>();
  ArrayList<Integer> Y2values = new ArrayList<Integer>();
  
  Table data1=new Table();
  
   ScatterplotA( Table data, int idx0, int idx1 ){
     
     this.idx0 = idx0;
     this.idx1 = idx1;
    // this.data1= data;
     
     
     minX = min(data.getFloatColumn(idx0));
     maxX = max(data.getFloatColumn(idx0));
     
     minY = min(data.getFloatColumn(idx1));
     maxY = max(data.getFloatColumn(idx1));

     //table.getColumnTitle();  
     //table.getRowCount()
     //table.getRow()
     // row.getFloat();
     
    if(idx0!=idx1)
    {
       r = sort();
       println("col:"+idx0+" col: "+idx1+" spearman Coefficent: "+r);
    }
   }
   
 float sort()
 {
   //Sort X-values
   for( int i = 0; i < table.getRowCount(); i++ )
   {
        TableRow r = table.getRow(i);
        Xvalues.add(r.getDouble(idx0));
        X1values.add(r.getDouble(idx0));
        Yvalues.add(r.getDouble(idx1));
        Y1values.add(r.getDouble(idx1));
        
   }
   for( int i = 0; i < table.getRowCount(); i++ )
   {
     X2values.add(0);
     Y2values.add(0);
   }
   
   Collections.sort(Xvalues);
   Collections.sort(Yvalues);
    //println("start");
   //println("Xvalues sort");
    //System.out.println(Xvalues);
    
   // println("Yvalues sort");
    //System.out.println(Yvalues);
    
    
     for(int i=0;i<Xvalues.size();i++)//sorted array
       {
         
        for(int j=0;j<X1values.size();j++) // original array
         {
          
          int retval = Double.compare(X1values.get(j), Xvalues.get(i));
            if (retval ==0) 
            {
                X2values.set(j,i);
                
            }
         }
       }
       
        for(int i=0;i<Yvalues.size();i++)//sorted array
       {
         
        for(int j=0;j<Y1values.size();j++) // original array
         {
          
          int retval = Double.compare(Y1values.get(j), Yvalues.get(i));
            if (retval ==0) 
            {
                Y2values.set(j,i);
                
            }
         }
       }
      // println("Xvalues");
      // println("Xvalues");
      // System.out.println(X2values);
      // println("Yvalues");
       //System.out.println(Y2values);
       
    
  
       for( int i = 0; i < X2values.size(); i++ )
     {
        
        sumX = sumX +X2values.get(i);
        sumY = sumY +Y2values.get(i);
        
     }
     
     meanX = sumX/(X2values.size());
     
     meanY = sumY/(Y2values.size());
    
    // Calculate Standard deviation
    
    
    
    for( int i = 0; i < X2values.size(); i++ )
     {
        
        tempX = X2values.get(i) - meanX;
        tempY = Y2values.get(i) - meanY;
        
        tempSumX = tempSumX + pow(tempX,2);
        tempSumY = tempSumY + pow(tempY,2);
        
        stdevX = sqrt(tempSumX/X2values.size());
        stdevY = sqrt(tempSumY/X2values.size());
        
        proSum = proSum +(tempX*tempY);
        
        covXY = proSum/ X2values.size();
        
      }
      
      r = covXY/(stdevX * stdevY);
      //println("Pearson Correlation Coefficient"+r);
      
      //println("Mean of X:: Mean of Y"+meanX + meanY);
      //println("Pearson Correlation Coefficient"+r);
    
    
   return r;
   
  }
       
void draw()
   {
    if(idx0!=idx1 && idx0 > idx1)
    {
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
     
          if (r >= -0.3 && r < -0.25)
      {
      fill(255,73,73);
      ellipse( u0+70+border,v0+40+border, 120, 80);
      }
      else if (r >= -0.25 && r < -0.2)
      {
      fill(255,171,171);
      ellipse( u0+70+border,v0+40+border, 100, 80);
      }
      else if (r >= -0.2 && r < 0)
      {
      fill(255,230,230);//240,128,128
      ellipse( u0+70+border,v0+40+border, 80, 80);
      }
       else if (r >= -0.5 && r < -0.0001)
       fill(255,73,73);
      else if (r >= -0.0001 && r < 0)
        fill(255,14,14);
      else if (r >= 0 && r < 0.47)
      fill(229,232,252);//143,188,143
      else if (r >= 0.47 && r < 0.52)////
      fill(212,216,249);//144,238,144
       else if (r >= 0.52 && r < 0.53)////
      fill(195,200,247);
      else if (r >= 0.53 && r < 0.56)///
      fill(177,185,245);//152,251,152
      else if (r >= 0.56 && r < 0.6)///
      fill(160,169,242);//152,251,152
      else if (r >= 0.6 && r < 0.7)
      fill(143,153,240);//0,250,154
      else if (r >= 0.7 && r < 0.75)////
      fill(108,122,235);//0,255,127
      else if (r >= 0.75 && r < 0.8)////
      fill(91,106,233);  //154,205,50
       else if (r >= 0.8 && r < 0.85)
      fill(74,90,231);////173,255,47
       else if (r >= 0.85 && r < 0.9)
      fill(56,75,228);//0.255.0
       else if (r >= 0.9 && r < 0.95)
     fill(39,59,226);
       else if (r >= 0.95 && r < 1)
      fill(39,59,226);
     stroke(0);
     //noFill();
     rect( u0+border,v0+border, w-2*border, h-2*border);
     
     
     textSize(18);
     fill(0);
     text(r,u0+border+w-2*border-30,v0+border+ h-2*border-30);
     
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
   
   else if(idx0==idx1)
   {
     strokeWeight(1);
      noFill();
     rect( u0+border,v0+border, w-2*border, h-2*border);
     
     
     
   }
     else if(idx0<idx1)
   {
     strokeWeight(1);
      noFill();
     //ellipse( u0+70+border,v0+40+border, w-2*border, h-2*border);//130,80
     
      if (r >= 0 && r < 0.3)
      {
       fill(229,232,252);
      ellipse( u0+70+border,v0+40+border, 80, 80);
      }
      else if (r >= 0.3 && r < 0.5)/////
      {
      fill(212,216,249);
      ellipse( u0+70+border,v0+40+border, 90, 90);
      }
      else if (r >= 0.5 && r < 0.55)/////
      {
      fill(195,200,247);
      ellipse( u0+70+border,v0+40+border, 100, 80);
      }
      else if (r >= 0.55 && r < 0.59)////
      {
       fill(177,185,245);
      ellipse( u0+70+border,v0+40+border, 110, 80);
      }
      else if (r >= 0.59 && r < 0.6)////
      {
      fill(160,169,242);
      ellipse( u0+70+border,v0+40+border, 120, 80);
      }
      else if (r >= 0.6 && r < 0.7)
      {
       fill(143,153,240);
      ellipse( u0+70+border,v0+40+border, 125, 80);
      }
       else if (r >= 0.7 && r < 0.75)
       {
      fill(108,122,235);
      ellipse( u0+70+border,v0+40+border, 130, 80);
       }
       else if (r >= 0.75 && r < 0.79)
       {
         fill(91,106,233);
         ellipse( u0+70+border,v0+40+border, 135, 80);
       }
       else if (r >= 0.79 && r < 0.84)
       {
         fill(74,90,231);
         ellipse( u0+70+border,v0+40+border, 135, 80);
       }
        else if (r >= 0.84 && r < 0.89)
       {
         fill(39,59,226);
         ellipse( u0+70+border,v0+40+border, 140, 80);
       }
       else if (r >= 0.89 && r < 1)
       {
         fill(39,59,226);
        ellipse( u0+70+border,v0+40+border, 140, 80);
       }
       
       else if(r >= -1 && r < -0.5)
       {
       fill(255,230,230);
       ellipse( u0+70+border,v0+40+border, 140, 80);
       }
      else if (r >= -0.5 && r < -0.3)
      {
      fill(255,73,73);
      ellipse( u0+70+border,v0+40+border, 130, 80);
      }
      else if (r >= -0.3 && r < -0.25)
      {
      fill(255,73,73);
      ellipse( u0+70+border,v0+40+border, 120, 80);
      }
      else if (r >= -0.25 && r < -0.2)
      {
      fill(255,171,171);
      ellipse( u0+70+border,v0+40+border, 100, 80);
      }
      else if (r >= -0.2 && r < 0)
      {
      fill(255,230,230);//240,128,128
      ellipse( u0+70+border,v0+40+border, 80, 80);
      }
      fill(0);
      textSize(18);
     text(r,u0+border+w-2*border-30,v0+border+ h-2*border-30);
     
     
   }
   
   }
  
}