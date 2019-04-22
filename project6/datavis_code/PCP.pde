import java.util.HashSet;


class PCP extends Frame {
  
    ArrayList<PCPAxis> axes = new ArrayList<PCPAxis>( );
    Table data;
    int border = 20;
    
   PCP( Table data, ArrayList<Integer> useColumns ){
     this.data = data;
     for( int i = 0; i < useColumns.size(); i++ ){
       axes.add( new PCPAxis( data, useColumns.get(i) ) );
     }
   }

   void updatePositions(){
     for( int i = 0; i < axes.size(); i++ ){
       PCPAxis a =  axes.get(i);
       float u = map( i, 0, axes.size()-1, u0+border, u0+w-border );
       a.firstAxis = (i==0);
       a.lastAxis = (i==(axes.size()-1));
       
       if( a.selected ){
         u = constrain( mouseX, u0, u0+w);
         a.u0 = constrain( mouseX, u0, u0+w );
       }
       a.setPosition((int)u,v0+border,5,h-2*border); 
     }
     
     for( int i = 0; i < axes.size()-1; i++ ){
        if( axes.get(i).u0 > axes.get(i+1).u0 ){
          PCPAxis tmp = axes.get(i);
          axes.set(i,axes.get(i+1));
          axes.set(i+1,tmp);
        }
     }
   }
   
   
   void draw() {
     updatePositions();
     
    //int selected= -1;
   //selected.
   //clear();
     float selectedDist = 2;
     
     for(int j=1;j<axes.size();j++)
     {
       if(axes.get(j-1).u0 < mouseX && mouseX < axes.get(j).u0)
       {
           for( int i=0;i<data.getRowCount();i++)
           {
             float x0 = axes.get(j-1).u0;
             float y0 = axes.get(j-1).getValue(i);
             float x1 = axes.get(j).u0;
             float y1 = axes.get(j).getValue(i);
             
             float yp= map (mouseX,x0,x1,y0,y1);
             float dist = abs(yp-mouseY);
             
             if(dist < selectedDist)
             {
               //selected.contains(i);
               
                //selected.add(i);
                selected=i;
               selectedDist =dist;
             }
             
           }
           
       }
     }
             
     
     for( PCPAxis a : axes ){
       a.draw(); 
     }
     
     stroke(0);
     strokeWeight(1);
     for( int i = 0; i < data.getRowCount(); i++ ){
       TableRow r = table.getRow(i);
       float px = axes.get(0).u0;
       float py = axes.get(0).getValue( i );
       for( int j = 1; j < axes.size(); j++ ){
         float cx = axes.get(j).u0;
         float cy = axes.get(j).getValue( i );
         
         strokeWeight(1);
         //if(i==selected) strokeWeight(5);
           if( selected==i) 
           {
           strokeWeight(5);
           fill(255,0,0);
           //text(r.getFloat(0),px,cx);
         // text(r.getFloat(1),py,cy);
          // text(r.getFloat(2),width/2-100,100);
          // text(r.getFloat(3),width/2-100,115);
           }
           //selected.contains(i)
           stroke(0);
         line( px,py,cx,cy);
         
         px = cx;
         py = cy;
       }
     }
     
   }
   
   

  void mousePressed(){ 
    for( PCPAxis a : axes ){
       if( a.mouseInside() ){
         a.selected = true;
       }
    }
    // implement brushing
  }
  
  void mouseReleased(){ 
    for( PCPAxis a : axes ){
      a.selected = false;
    }
  }
  
}


class PCPAxis extends Frame {
  Table data;
  int attr;
  float minV, maxV;
  
  float futU=-1;

  boolean firstAxis = false;
  boolean lastAxis = false;
  boolean selected = false;
  boolean firstSet = true;
  
  PCPAxis( Table data, int attr ){
    this.data = data;
    this.attr = attr;
    
     minV = min(data.getFloatColumn(attr));
     maxV = max(data.getFloatColumn(attr));
  }
  
  void setPosition( int u0, int v0, int w, int h ){
    if( firstSet ) this.u0 = u0;
    this.futU = u0;
    this.v0 = v0;
    this.w = w;
    this.h = h;
    firstSet = false;
  }
  
  float getValue( int idx ){
     return map( data.getFloat( idx, attr ), minV, maxV, v0+h, v0+10 ); 
  }

   void draw() {
     u0 = (int)lerp( u0, futU, 0.1f );
     
     stroke(0);
     if( selected ) 
          stroke (255,0,0);
     strokeWeight(w);
     line( u0,v0+10,u0,v0+h);
     
     textSize(12);
     fill(0);
     textAlign( CENTER );
     if( firstAxis ) textAlign( LEFT);
     if( lastAxis ) textAlign(RIGHT);
     fill(0, 102, 153);
     text( data.getColumnTitle( attr ), u0, v0 );
    
     
   }  
}