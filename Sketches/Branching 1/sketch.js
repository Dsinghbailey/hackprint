var t;
var counter;
var theta;
var h;
var s;
var b;
var selector;
function setup() {
  createCanvas(400,400);
  //t=[];
  frameRate(30);
  colorMode(HSB,255);
  h=random(255);
  s=random(255);
  b=random(255);
  selector=1;
}

function draw() {
  clear();
  counter=-1;
  if (selector==1)
  {
  stroke(color(h, s, b));
  }
  translate(width/2,height/2);
  var a = mouseY*360/width;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  branch(50);
  theta = radians(a)-PI;
  branch(60);
  
}
function branch(l) {
  // Each branch will be 2/3rds the size of the previous one
  counter++;
 if(selector==2){
   var h2=(h+counter)%255;
    stroke(color(h2, s, b));
  }
  strokeWeight(l/6);
  l *= .7+ mouseX * .055/width;
  //t= append(t,int(random(2)));
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (l>3) {
    push();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -l);  // Draw the branch
    translate(0, -l); // Move to the end of the branch
    branch(l);       // Ok, now call myself to draw two new branches!!
    pop();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
  }
    // Repeat the same thing, only branch off to the "left" this time!
  if (l>3) {
    push();
    rotate(theta-PI);
    line(0, 0, 0, -l+radians(2*counter));
    translate(0, -l+radians(2*counter));
    branch(l);
    pop();
  }
}
  
  function mousePressed(){
    h=random(255);
    s=random(255);
    b=random(255);
  }  
  function keyPressed(){
    if(key=="1"){
      selector=1;
    }
    if(key=="2"){
      selector=2;
    }
    
  }
    
  