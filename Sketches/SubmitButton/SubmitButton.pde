color dotColor= #333333;
color lnColor = #ED225d;
Dot[] dots = new Dot[0];
Edge[] edges= new Edge[0];
float Test[] ={};
Dot prevDot;
PFont f;

void setup(){
size(900,150);
f = loadFont("Lato-Regular-20.vlw");
}
void draw(){
  background(255);
  for(Dot dot:dots)
  {
    dot.displayOut();
  } 
  for(Edge edge:edges){
      edge.display();
  }
    for(Dot dot:dots)
  {
      dot.displayIn();
  } 
  textFont(f);
  fill(#4070b0);
  text("Submit an interactive design",615,110);
  text("Make money with your code",615,130);
}




class Dot{
  float iSize, oSize;
  PVector pos;
  Dot( float inS){
    pos=new PVector(mouseX, mouseY);
    iSize=inS;
    oSize=inS*5/2;
  }
  Dot addToArray(Dot thisDot){
    for(int i=0; i<dots.length; i++)
    {
      if(dist(pos.x,pos.y,dots[i].pos.x,dots[i].pos.y)< oSize+dots[i].oSize)
      {
              return dots[i];
      }
    }
      dots=(Dot[])append(dots,thisDot);
      println(Test.length);
      return thisDot;
  }
  
  void displayOut(){
    noStroke();
    fill(dotColor,100);
    ellipse(pos.x,pos.y,oSize, oSize);
  }
  
    void displayIn(){
      noStroke();
    fill(dotColor);
    ellipse(pos.x,pos.y,iSize, iSize);
  }
}

class Edge{
  PVector d1, d2;
  Edge( Dot currDot, Dot prevDot){
    d1= new PVector();
    d2= new PVector();
    d1=prevDot.pos;
    d2=currDot.pos;
  }
  void display(){
    stroke(lnColor);
    println(hex(lnColor));
    line(d1.x,d1.y,d2.x,d2.y); 
  }
}


void mouseReleased()
{
  Dot currDot=new Dot(random(10)+5);
  currDot=currDot.addToArray(currDot);
  if(prevDot==null)
  {
    prevDot=currDot;
  }
  else if(currDot!=prevDot)
  {
    Edge currEdge= new Edge(currDot, prevDot);
    edges=(Edge[])append(edges, currEdge);
    prevDot=currDot;
  }
}
void keyPressed()
{
  save("submit.png");
}