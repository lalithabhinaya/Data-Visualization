class bar extends Frame {
  
    ArrayList<barGraph> plots = new ArrayList<barGraph>( );
    int colCount;
    Table data;
    float border = 20;
    
   bar( Table data, ArrayList<Integer> useColumns,int input,int bin ){
     this.data = data;
     colCount = useColumns.size();
     if(input==0)
         {
           barGraph sp = new barGraph( table, useColumns.get(0),bin);
           plots.add(sp);
         }
         else if(input==1)
         {
           barGraph sp = new barGraph( table, useColumns.get(2),bin);
           plots.add(sp);
         }
          else if(input==2)
         {
           barGraph sp = new barGraph( table, useColumns.get(3),bin);
           plots.add(sp);
         }
        
         else if(input==3)
         {
           barGraph sp = new barGraph( table, useColumns.get(1),bin);
           plots.add(sp);
         }
      
       
     
     
     
   }
   
   
   void draw() {
     for( barGraph s : plots ){
      
       s.draw(); 
    }
   }
  

}