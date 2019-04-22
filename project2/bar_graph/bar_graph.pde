//Bar graph  1.Split data in .Csv file   2.setup marigins And positions   3.make it GUI using text and line positions

String filename;
String rawData[];
int years[]=new int[7];
int meanScore[]=new int[7];
int space,vizHeight;
float vizWidth;
PVector[] positions=new PVector[7]; 
int vizMin,vizMax;



void setup() // start of program execution
{
   size(600,600); // canvas size
  selectInput("Select a file to process:", "fileSelected");
   
  }
  
  
  void fileSelected(File selection) {  //pop-up window to select .csv file
 
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    printArray(selection);
    println("User selected " + selection.getAbsolutePath());
    println(selection.getName());
    filename = selection.getName(); //provides name of selected .csv file
    processData(filename);
  }
}
  

void draw()
{
  background(20);
  drawGUI();
  fill(173,216,230);

}


void drawGUI()
{
  
  if(positions[0]!=null){
  float rectWidth= (width-space-space)/meanScore.length;
  for(int i=0; i< positions.length;i++)
  
  {
     stroke(200,100);
     text( years[i],(((rectWidth *i)+space+space)/2+(space*i)),height -space+20);//X-axis values
    
  }
  
  for (int i=0;i<meanScore.length;i++)
  {
   rect(positions[i].x,(height-(meanScore[i]+space)),rectWidth,meanScore[i]);
   stroke(255);
  }
  
  line(space,(height-space),width-space,height -space); //draw X-axis
  stroke(255);
  line(space,(height-space),space,space);//draw Y-axis
  stroke(255);
   for (int i=0,j=0;i<=vizMax;i=i+100,j=j+98)//print Y-axis values
   {
     text(i, 20, height-space-j);
   }
     fill(255,0,0);
     text("Year",width/2,height-10);
     textSize(15);
     text("meanScore",5,height/2);    
}

}


void processData(String filename)
{
  rawData=loadStrings(filename);
  for (int i=1;i<rawData.length;i++)
  {
  String splitData[]= split(rawData[i], ",");
  years[i-1]=int(splitData[1]); // extracts years from excel sheet
  meanScore[i-1]=int(splitData[2]); //extracts Mean scores from excel sheet
 }
  printArray(meanScore);
  vizMin =min(meanScore);
 vizMax =max(meanScore);
 space =50;
 vizHeight = (height-space) -space;
 vizWidth = (width -space -space) /(years.length -1);
 for(int i=0;i<meanScore.length;i++)
 {
   float adjScore =map(meanScore[i],vizMin, vizMax,0, vizHeight);
   float yPos = height -space-adjScore;
   float xPos = space + (vizWidth *i);
   positions[i]= new PVector(xPos,yPos); //set positions according to meanScore and stores into PVector element
   
 }
}