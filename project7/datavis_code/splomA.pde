

class SplomA extends Frame {
  
    ArrayList<ScatterplotA> plots = new ArrayList<ScatterplotA>( );
    //ArrayList<Scatterplot1> plots1 = new ArrayList<Scatterplot1>( );
    int colCount;
    Table data;
    float border = 20;
    boolean flag=true;
   SplomA( Table data, ArrayList<Integer> useColumns ){
     this.data = data;
     colCount = useColumns.size();
     for( int j = 0; j < colCount; j++ ){
       for( int i = 0; i < colCount; i++ ){
           ScatterplotA sp = new ScatterplotA( table, useColumns.get(j), useColumns.get(i) );
           plots.add(sp);
      }
     }
       
     
   }
   
   void setPosition( int u0, int v0, int w, int h ){
     super.setPosition(u0,v0,w,h);

    int curPlot = 0;
    for( int j = 0; j < colCount; j++ ){
       for( int i = 0; i < colCount; i++ ){
       
        ScatterplotA sp = plots.get(curPlot++);
           int su0 = (int)map( i, 0, colCount, u0+border, u0+w-border );
           int sv0 = (int)map( j, 0, colCount, v0+border, v0+h-border );
           sp.setPosition( su0, sv0, (int)((3*w/4)-2*border)/(colCount-1), (int)((3*h/4)-2*border)/(colCount-1) );
          sp.drawLabels = false;
           sp.border = 3;
           
         
     }
    }
     
  }

   
   void draw() {
     for( ScatterplotA s : plots ){
        s.draw();
       
     }
      mousePressed();
   }
 
  void mousePressed(){ 
    flag=true;
    for( ScatterplotA sp : plots ){
       if( sp.mouseInside() ){
          //Scatterplot1 sp1 = new Scatterplot1( table, sp.idx0, sp.idx1);
         // sp1.draw();
        
       }
    }
  }
}