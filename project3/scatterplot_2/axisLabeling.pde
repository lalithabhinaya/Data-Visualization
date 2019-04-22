
void drawGUI()
{
  
  if(table !=null){                                                                           //X-Axis scaling
  float temp=((minvalX+maxvalX)/20);
  //int p;
  for(float i=minvalX,p=0;i<=maxvalX;i=i+temp,p++)
  {  
     stroke(200,100);
     if(i==minvalX)
     text(i,40,height-30);//X-axis values
     else 
     {
       text(i,space+(p*90),height-30);  
     }
   
  }
  
  text(maxvalX,width-50,height-30); 
  stroke(255);
  line(space,height -space,width,height -space);                                                  //draw X-axis
  stroke(255);
 line(space,height-space,space,0);                                                                //draw Y-axis
  stroke(255);
   float temp1=((minvalY+maxvalY)/20);
  
  for(float i=minvalY,p=0;i<=maxvalY;i=i+temp1,p++)                                                //Y-Axis scaling
  {  
     stroke(200,100);
     if(i==minvalY)
     text(i,02,height-space);
     else 
     {
       text(i,02,height-space-(p*55));  
     }
   
  }
  text(maxvalY,02,20);
  
     fill(255,0,0);
     text(table.getString(0,2),width/2,height-10);                                                //X-axis label
     textSize(15);
     fill(255,0,0);
     text(table.getString(0,3),5,height/2);                                                       // Y-axis label
     
}

}