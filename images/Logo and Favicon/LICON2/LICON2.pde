float theta;  
int[] t= new int[0];
int counter;
int done;

PFont f;
void setup() {
  size(100, 100);
  counter=-1;
  done=0;
  f = loadFont("AmericanTypewriter-Light-28.vlw");
  
}

void draw() {
  if(done==0){
  background(255);
  loadPixels();
    for (int i = 0; i < (width*height); i++) {
    if(i%3==0)
    pixels[i] = #ffffff;
    else
    pixels[i] = #cccccc;}
updatePixels();
/*
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
  translate(28,height-30);
  textFont(f);  
  textAlign(LEFT,BOTTOM);
  translate(-11,12);
  fill(#3B99FC);
  text("ICON", 0, 0);
  fill(0);
  translate(5,-25);
  text("EGO", 0, 0);
  
  //save
    save("LIcon2.jpeg");
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