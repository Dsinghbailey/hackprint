float theta;  
int[] t= new int[0];
int counter;
int done;
PGraphics p;
PFont f;
void setup() {
  size(192, 80);
  counter=-1;
  done=0;
  f = loadFont("Lato-Regular-36.vlw");
  p = createGraphics(width, height, JAVA2D);
}

void draw() {
  if(done==0){
    p.smooth(64);
    p.beginDraw();
    p.fill(0);
   p.noStroke();
  //p.rect(0,0,p.width,p.height,0,0,25,25);
  /*loadPixels();
    for (int i = 0; i < (width*height); i++) {
    if(i%3==0)
    pixels[i] = #ffffff;
    else
    pixels[i] = #dddddd;}
updatePixels();
pushMatrix();
*//*
  frameRate(30);
  stroke(#999999);
  strokeWeight(2);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = 13;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(30,height-10);
  // Draw a line 120 pixels
  line(0,0,0,-20);
  // Move to the end of that line
  translate(0,-20);
  // Start the recursive branching!
  branch(47);
  //bottom, to the right of tree
  
  */
  p.textFont(f);  
  p.textAlign(LEFT,BOTTOM);
  p.stroke(#aaaaaa);
  p.fill(#58595b);
  p.text("Print", 112, p.height-20);
  p.fill(#ED225d);
  p.text("//hack", 5, p.height-20);

  f = loadFont("Lato-Light-12.vlw");
  p.textFont(f);
  p.fill(#000000);
  p.text("code your clothing", 12, p.height-6);
  p.save("LIcon2.png");
  p.endDraw();
  //line(-4,-7,80,-7);
  image(p,0,0);
  
  //popMatrix();
  //noFill();
  //strokeWeight(10);
  //rect(0-6, 0-6, width+10, height+10, 15);

  
  
  //save

  }
  done=1;

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.60;
  counter++;
  t= append(t,int(random(2)));
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!

    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h+radians(2*counter));
    translate(0, -h+radians(2*counter));
    branch(h);
    popMatrix();
  }
}