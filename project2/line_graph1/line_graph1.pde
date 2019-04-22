//line graph  1.Split data in .Csv file   2.setup marigins And positions   3.make it GUI using text and line positions

String filename;
String rawData[];
int years[]=new int[7];;
int Grades[]=new int[7];
int space,vizHeight;
float vizWidth;
PVector[] positions=new PVector[7]; 
int vizMin,vizMax;



void setup() // start of program execution
{
   size(600,600); // canvas size
  selectInput("Select a file to process:", "fileSelected");
   
  }
  
  
  void fileSelected(File selection) { //pop-up window to select .csv file
  
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    printArray(selection);
    println("User selected " + selection.getAbsolutePath());
    println(selection.getName());
    filename = selection.getName(); //provides name of selected .csv file
    calculateVizData(filename);
  }
}

void draw()
{
  background(20);
  
  drawGUI();
  
 if(positions[0]!=null){
 fill(200);

  for (int i=0; i< positions.length; i++)//place points according to vizPositions
  {
    
    ellipse(positions[i].x,positions[i].y,15,15);
    
  }
  
 }
  
}


void drawGUI()
{
  
  if(positions[0]!=null){
  for(int i=0; i< positions.length;i++)
  
  {
     stroke(200,100);
     text( years[i],positions[i].x -15,height -space +20); //X-axis values
     if (i >0)
    {
      stroke(200);
      line(positions[i].x,positions[i].y,positions[i-1].x,positions[i-1].y); //draw a line which connects points in graph
      
    }
    
    
  }
  
  line(positions[0].x,positions[0].y,width,height -space); //draw X-axis
  stroke(255);
  line(positions[0].x,positions[0].y,50,height-vizMax);//draw Y-axis
  stroke(255);
   for (int i=vizMin,j=0;i<=vizMax;i=i+2,j=j+70)//print Y-axis values
   {
     text(i, 15, height-space-j);
   }
  
     fill(255,0,0);
     text("Year",width/2,height-10);
     fill(255,0,0);
     textSize(15);
     text("Grades",5,height/2);
     
     
}

}








void calculateVizData(String filename)
{
  rawData=loadStrings(filename);
  
  
  for (int i=1;i<rawData.length;i++)
  {
  String splitData[]= split(rawData[i], ",");
  years[i-1]=int(splitData[1]); // extracts years from excel sheet
  Grades[i-1]=int(splitData[2]); // extracts Mean scores from excel sheet 
 }
 
  vizMin =min(Grades);
 vizMax =max(Grades);
 space =50;
 vizHeight = (height-space) -space;
 vizWidth = (width -space -space) /(years.length -1);
 for(int i=0;i<Grades.length;i++)
 {
   float adjScore =map(Grades[i],vizMin, vizMax,0, vizHeight);
   float yPos = height -space-adjScore;
   float xPos = space + (vizWidth *i);
   positions[i]= new PVector(xPos,yPos); //set positions according to meanScore and stores into PVector element
   
 }
   
}