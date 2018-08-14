float theta;  
int[] t= new int[0];
int counter;
int done;
PGraphics p;

PFont f;
void setup() {
  size(16, 16);
  counter=-1;
  done=0;
  f = loadFont("Lato-Bold-16.vlw");
  p= createGraphics(height, width);
  smooth();
  
}

void draw() {
  if(done==0){
        p.smooth(8);
    p.beginDraw();

    p.background(#4070b0);
    //p.rect(0, 0, p.width, p.height,60,0,60,0);
 /* loadPixels();
    for (int i = 0; i < (width*height); i++) {
    if(i%3==0)
    pixels[i] = #ffffff;
    else
    pixels[i] = #dddddd;}
updatePixels();*/
  p.textFont(f);  
  p.textAlign(CENTER,CENTER);
  p.fill(#ED225d);
  p.text("H", width/2, height/2);
  p.endDraw();
  image(p, 0,0);
  //save
    p.save("favicon.png");
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