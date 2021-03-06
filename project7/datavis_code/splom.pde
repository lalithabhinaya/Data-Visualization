

class Splom extends Frame {
  
    ArrayList<Scatterplot> plots = new ArrayList<Scatterplot>( );
    ArrayList<Scatterplot1> plots1 = new ArrayList<Scatterplot1>( );
    int colCount;
    Table data;
    float border = 20;
    boolean flag=true;
   Splom( Table data, ArrayList<Integer> useColumns ){
     this.data = data;
     colCount = useColumns.size();
     for( int j = 0; j < colCount-1; j++ ){
       for( int i = j+1; i < colCount; i++ ){
           Scatterplot sp = new Scatterplot( table, useColumns.get(j), useColumns.get(i) );
           plots.add(sp);
       }
    }
       
     
   }
   
   void setPosition( int u0, int v0, int w, int h ){
     super.setPosition(u0,v0,w,h);

    int curPlot = 0;//constructor phase== set positions==drawing phase
    for( int j = 0; j < colCount-1; j++ ){
       for( int i = j+1; i < colCount; i++ ){
          Scatterplot sp = plots.get(curPlot++);
           int su0 = (int)map( i, 1, colCount, u0+2*border, u0+w-2*border );//horizontal pposition of plot... 0 colcount
           int sv0 = (int)map( j, 0, colCount-1, v0+2*border, v0+h-2*border );//vertical position of j......0 colcount
           sp.setPosition( su0, sv0, (int)(w-3*border)/(colCount-1), (int)(h-3*border)/(colCount-1) ); //  /colcount
           sp.drawLabels = false;
           sp.border = 8;
           //println("w value"+w);
           //println("h value"+h);
     }
    }
     
  }

   
   void draw() {
     for( Scatterplot s : plots ){
        s.draw();
       
     }
      mousePressed();
   }
 
  void mousePressed(){ 
    flag=true;
    for( Scatterplot sp : plots ){
       if( sp.mouseInside() ){
          Scatterplot1 sp1 = new Scatterplot1( table, sp.idx0, sp.idx1);
          sp1.draw();
        
       }
    }
  }
}