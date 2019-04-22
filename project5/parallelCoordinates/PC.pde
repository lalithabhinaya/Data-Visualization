

class Splom extends Frame {
  
    ArrayList<Scatterplot> plots = new ArrayList<Scatterplot>( );
    int colCount;
    Table data;
    float border = 20;
    
   Splom( Table data, ArrayList<Integer> useColumns,int input1,int input2,int input3,int input4 ){
     this.data = data;
     colCount = useColumns.size();
      if(input1==0 && input2==1 && input3==2 && input4==3)
         {
           Scatterplot sp = new Scatterplot( table, useColumns.get(0), useColumns.get(1),useColumns.get(2),useColumns.get(3) );
           plots.add(sp);
         }
         else if(input1==0 && input2==2 && input3==1 && input4==3)
         {
           Scatterplot sp = new Scatterplot( table, useColumns.get(0), useColumns.get(2),useColumns.get(1),useColumns.get(3) );
           plots.add(sp);
         }
          else if(input1==1 && input2==0 && input3==3 && input4==2)
         {
           Scatterplot sp = new Scatterplot( table, useColumns.get(1), useColumns.get(0),useColumns.get(3),useColumns.get(2) );
           plots.add(sp);
         }
         else if(input1==2 && input2==1 && input3==0 && input4==3)
         {
           Scatterplot sp = new Scatterplot( table, useColumns.get(2), useColumns.get(1),useColumns.get(0),useColumns.get(3) );
           plots.add(sp);
         }
         else if(input1==3 && input2==0 && input3==2 && input4==1)
         {
           Scatterplot sp = new Scatterplot( table, useColumns.get(3), useColumns.get(0),useColumns.get(2),useColumns.get(1) );
           plots.add(sp);
         }
     }
       
   void draw() {
     for( Scatterplot s : plots ){
        s.draw(); 
     }
   }
   

  void mousePressed(){ 
    for( Scatterplot sp : plots ){
       if( sp.mouseInside() ){
          
          println(sp.idx0 + " " + sp.idx1);
       }
    }
  }
}