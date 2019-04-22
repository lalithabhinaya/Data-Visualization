// most modification should occur in this file


class ForceDirectedLayout extends Frame {
  
  
  float RESTING_LENGTH = 5.0f;   // update this value
  float SPRING_SCALE   = 0.01f; // update this value 0.0075f
  float REPULSE_SCALE  = 25.0f;  // update this value 400.0f
  
  float REPULSE_SCALE1  = 150.0f;

  float TIME_STEP      = 1.0f;    // probably don't need to update this

  // Storage for the graph
  ArrayList<GraphVertex> verts;
  ArrayList<GraphEdge> edges;

  // Storage for the node selected using the mouse (you 
  // will need to set this variable and use it) 
  GraphVertex selected = null;
  

  ForceDirectedLayout( ArrayList<GraphVertex> _verts, ArrayList<GraphEdge> _edges ) {
    verts = _verts;
    edges = _edges;
  }

  void applyRepulsiveForce( GraphVertex v0, GraphVertex v1 ) {
    // TODO: PUT CODE IN HERE TO CALCULATE (AND APPLY) A REPULSIVE FORCE
    
    float xPos,yPos,distance,xScale,yScale,temp1,tempX,rfX,rfY;
    
    xPos = v0.pos.x - v1.pos.x;
    yPos = v0.pos.y - v1.pos.y;
    distance = sqrt(xPos * xPos + yPos * yPos);
    temp1 = pow(distance, 2.0f);
    
    tempX = ((v0.getMass() * v1.getMass() * REPULSE_SCALE)) / temp1;
    
    xScale = xPos / distance;
    yScale = yPos / distance;

    rfX = tempX * xScale;
    rfY = tempX * yScale;
    
    
    v0.addForce(rfX,rfY);
   v1.addForce(-rfX,-rfY);
  }
  
  
  void applyCentralForce( GraphVertex v0, GraphVertex v1 ) {
    // TODO: PUT CODE IN HERE TO CALCULATE (AND APPLY) A REPULSIVE FORCE
    float xPos,yPos,distance,xScale,yScale,temp1,tempX,rfX,rfY;
    
    xPos = v0.pos.x - v1.pos.x;
    yPos = v0.pos.y - v1.pos.y;
    distance = sqrt(xPos * xPos + yPos * yPos);
    temp1 = pow(distance, 2.0f);
    
    tempX = ((v0.getMass() * v1.getMass() * REPULSE_SCALE)) / temp1;
    
    xScale = xPos / distance;
    yScale = yPos / distance;

    rfX = tempX * xScale;
    rfY = tempX * yScale;
    
    
    v0.addForce(-rfX,-rfY);
    v1.addForce(rfX,rfY);
  }
  
  

  void applySpringForce( GraphEdge edge ) {
    // TODO: PUT CODE IN HERE TO CALCULATE (AND APPLY) A SPRING FORCE
   float xPos,yPos,distance,xScale,yScale,temp1,sfX,sfY;
   int tempX =-1;
    
        xPos = edge.v0.pos.x - edge.v1.pos.x;
        yPos = edge.v0.pos.y - edge.v1.pos.y;
        distance = sqrt(xPos * xPos + yPos * yPos);
        temp1 = distance - RESTING_LENGTH;
        
        xScale = xPos / distance;
        yScale = yPos / distance;

        

        sfX = tempX * SPRING_SCALE * temp1 * xScale;
        sfY = tempX * SPRING_SCALE * temp1 * yScale;
    
    edge.v0.addForce(sfX,sfY);
    edge.v1.addForce(-sfX,-sfY);
  }

  void draw() {
    update(); // don't modify this line
    
    // TODO: ADD CODE TO DRAW THE GRAPH
    
    //Draw edges and vertices
    textSize(15);
    fill(0);
    text("**Hover on node(Node_ID,Group)",400,60);
    fill(255,99,71);
    textSize(30);
    text("Force Directed Layout",250,25);
    
    for(int i=0; i<edges.size();i++)
    {
     
     if(edges.get(i).weight > 0 && edges.get(i).weight <=5) 
     strokeWeight(1);
     
     else if(edges.get(i).weight > 5 && edges.get(i).weight <=10) 
     strokeWeight(1.5);
     
     else if(edges.get(i).weight > 10 && edges.get(i).weight <=20) 
     strokeWeight(2);
     
     else if(edges.get(i).weight > 20 && edges.get(i).weight <=30) 
     strokeWeight(2.5);
     
     else if(edges.get(i).weight > 30) 
     strokeWeight(3);
     int a=15,b=785;
     float x1,y1,x2,y2;
     
     x1 = constrain(edges.get(i).v0.getPosition().x,a,b);
     y1 = constrain(edges.get(i).v0.getPosition().y,a,b);
     x2 = constrain(edges.get(i).v1.getPosition().x,a,b);
     y2 = constrain(edges.get(i).v1.getPosition().y,a,b);
    
    line(x1,y1,x2,y2);
     
    }
    
    for(int i=0; i<verts.size();i++)
    {
      if(verts.get(i).group == 1) 
      {
         fill (135,206,250);
         
      }
      
      else if(verts.get(i).group == 2) 
      {
         fill (0,0,255);
         
      }
      
      else if(verts.get(i).group == 3) 
      {
         fill (152,251,152);
         
      }
      
       else if(verts.get(i).group == 4) 
      {
         fill (0,100,0);
         
      }
      
      else if(verts.get(i).group == 5) 
      {
         fill (221,160,221);
         
      }
      
      else if(verts.get(i).group == 6) 
      {
         fill (148,0,211);
         
      }
      
       else if(verts.get(i).group == 7) 
      {
         fill (255,215,0);
         
      }
      
       else if(verts.get(i).group == 8) 
      {
         fill (255,69,0);
         
      }
      
       else if(verts.get(i).group == 9) 
      {
         fill (255,182,193);
         
      }
      
       else if(verts.get(i).group == 10) 
      {
         fill (199,21,133);
         
      }
     
      float x = constrain(verts.get(i).getPosition().x,15,785);
      float y = constrain(verts.get(i).getPosition().y,15,785);
       
      ellipse(x,y,15,15);
      
      if(dist(x, y, mouseX, mouseY) < (15/2+1)) 
      {
         fill(255,99,71);
         ellipse(x,y,25,25);
         fill(0);
         textSize(20);
         text( verts.get(i).id+"::"+verts.get(i).group, x, y - 10);
   
       }
      
      
        
    }
    
  }


  void mousePressed() { 
    // TODO: ADD SOME INTERACTION CODE

  }

  void mouseReleased() {    
    // TODO: ADD SOME INTERACTION CODE

  }



  // The following function applies forces to all of the nodes. 
  // This code does not need to be edited to complete this 
  // project (and I recommend against modifying it).
  void update() {
    for ( GraphVertex v : verts ) {
      v.clearForce();
    }

    for ( GraphVertex v0 : verts ) {
      for ( GraphVertex v1 : verts ) {
        if ( v0 != v1 ) applyRepulsiveForce( v0, v1 ); //////////make sure nodes are diff
      }
    }
    
   

    for ( GraphEdge e : edges ) {
      applySpringForce( e );
    }
    
    
    
    

    for ( GraphVertex v : verts ) {
      v.updatePosition( TIME_STEP );
    }
    
    
  
  
  }
  

}