//line graph on bar graph  1.Split data in .Csv file   2.setup marigins And vizElements   3.make it GUI using text and line vizElements

String filename;
String rawData[];
int years[]=new int[7];
int Grades[]=new int[7];
int space,vizHeight;
float vizWidth;
PVector[] vizElements=new PVector[7]; 
int vizMin,vizMax;



void setup() // start of program execution
{
   size(600,600);
  selectInput("Select a file to process:", "fileSelected");
  }
  
  
  
void fileSelected(File selection) {//pop-up window to select .csv file
 
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    println(selection.getName());
    filename = selection.getName();//provides name of selected .csv file
    processData(filename);
  }
}

void draw()
{
  background(20);
  
  drawGUI();
  
  if(vizElements[0]!=null){
  
  fill(173,216,230);
  for (int i=0; i< vizElements.length; i++)
  {
  
    
    ellipse(vizElements[i].x,height-(Grades[i]+space),15,15);//place points according to vizPositions
    
  }
  
  }
  
}


void drawGUI()
{
  if(vizElements[0]!=null){
  float rectWidth= (width-space-space)/(Grades.length *2);
 for(int i=0; i< vizElements.length;i++)
  
  {
     stroke(200,100);
       text( years[i],(((rectWidth *i)+space+space)/2+((space*i)+(i*15))),height -space+20);//X-axis values
    
  }
  
  for (int i=0;i<Grades.length;i++)
  {
   rect(vizElements[i].x,(height-(Grades[i]+space)),rectWidth,Grades[i]);//draw histograms using rect()
   stroke(255);
   }
 
  line(space,(height-space),width-space,height -space);// draw X-axis
  stroke(255);
  line(space,(height-space),space,space);// draw Y-axis
  stroke(255);
   for (int i=0,j=0;i<=vizMax;i=i+100,j=j+98)//print Y-axis values
   {
     text(i, 20, height-space-j);
   }
     fill(255,0,0);
     text("Year",width/2,height);
     textSize(18);
     text("Grades",5,height/2);
 for(int i=0; i< vizElements.length;i++)
  
  {
     stroke(200,100);
     if (i >0)
    {
      stroke(255,0,0);
      line(vizElements[i].x,height-(Grades[i]+space),vizElements[i-1].x,height-(Grades[i-1]+space));
      strokeWeight(2);
      
    }
    
  }
    
     
  }
}

void processData(String filename)
{
  rawData=loadStrings(filename);
  for (int i=1;i<rawData.length;i++)
  {
  String splitData[]= split(rawData[i], ",");
  years[i-1]=int(splitData[1]);// extracts years from excel sheet
  Grades[i-1]=int(splitData[2]); //extracts Mean scores from excel sheet
 }
  printArray(Grades);
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
   vizElements[i]= new PVector(xPos,yPos); //set positions according to meanScore and stores into PVector element
   
 }
  
}