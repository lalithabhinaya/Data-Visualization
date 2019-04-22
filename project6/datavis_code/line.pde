class lplom extends Frame {
  
    ArrayList<lineplot> plots = new ArrayList<lineplot>( );
    int colCount;
    Table data;
    float border = 20;
    
   lplom( Table data, ArrayList<Integer> useColumns,int input ){
     this.data = data;
     colCount = useColumns.size();
      if(input==0)
         {
           lineplot sp = new lineplot( table, useColumns.get(0));
           plots.add(sp);
         }
         else if(input==1)
         {
           lineplot sp = new lineplot( table, useColumns.get(2));
           plots.add(sp);
         }
          else if(input==2)
         {
           lineplot sp = new lineplot( table, useColumns.get(3));
           plots.add(sp);
         }
         else if(input==3)
         {
           lineplot sp = new lineplot( table, useColumns.get(1));
           plots.add(sp);
         }
        
     }
       
     
    
     
   



   
   void draw() {
     for( lineplot s : plots ){
        s.draw(); 
     }
   }
   

  void mousePressed(){ 
    for( lineplot sp : plots ){
       if( sp.mouseInside() ){
          // do something!!!
          println(sp.idx0 + " " + sp.idx1);
       }
    }
  }
}