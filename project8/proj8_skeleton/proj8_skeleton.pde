Frame myFrame = null;
JSONObject json,linkData;
JSONArray nodes,links;
String id;
ArrayList<String> idList = new ArrayList<String>();
ArrayList<Integer> groupList = new ArrayList<Integer>();
int group,x1,x2;
float x,y;
GraphVertex v0,v1;
void setup() {
  size(800, 800);  
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    selectInput("Select a file to process:", "fileSelected");
  } 
  else {
    println("User selected " + selection.getAbsolutePath());
    json = loadJSONObject(selection);
    
    nodes = json.getJSONArray("nodes");
    links = json.getJSONArray("links");
    
    ArrayList<GraphVertex> verts = new ArrayList<GraphVertex>();
    ArrayList<GraphEdge>   edges = new ArrayList<GraphEdge>();
    
    for(int i=0; i<nodes.size();i++)
    {
      JSONObject nodeData = nodes.getJSONObject(i);
      id= nodeData.getString("id");
      idList.add(id);
      
      group= nodeData.getInt("group");
      groupList.add(group);
      
      x = random(200,600);
      y = random(200,600);
      
      GraphVertex gv = new GraphVertex(id,group,x,y);
      verts.add(gv);
      
    }
    
    
    String source;
    String target;
    float value;
    
    for(int i=0; i<links.size();i++)
    {
      linkData = links.getJSONObject(i);
      
      source = linkData.getString("source");
      x1 = idList.indexOf(source);
      
      target = linkData.getString("target");
      x2 = idList.indexOf(target);
      
      
      value = linkData.getFloat("value");
      
      
      GraphEdge ge = new GraphEdge(verts.get(x1),verts.get(x2),value);
      edges.add(ge);
     
    }
    
 
    myFrame = new ForceDirectedLayout( verts, edges );
  }
}


void draw() {
  background( 255 );

  if ( myFrame != null ) {
    myFrame.setPosition( 0, 0, width, height );
    myFrame.draw();
  }
}

void mousePressed() {
  myFrame.mousePressed();
}

void mouseReleased() {
  myFrame.mouseReleased();
}

abstract class Frame {

  int u0, v0, w, h;
  int clickBuffer = 2;
  void setPosition( int u0, int v0, int w, int h ) {
    this.u0 = u0;
    this.v0 = v0;
    this.w = w;
    this.h = h;
  }

  abstract void draw();
  
  void mousePressed() { }
  void mouseReleased() { }

  boolean mouseInside() {
    return (u0-clickBuffer < mouseX) && (u0+w+clickBuffer)>mouseX && (v0-clickBuffer)< mouseY && (v0+h+clickBuffer)>mouseY;
  }
  
}