var cols;
var sw;
var sh;
var index;
var sCol;
var bToggle = true;
var tToggle = false
var paused=false;

/***** pallete 
  purple:#8a56aa
  blue:#4070b0;
  Green:#66afb5
  orange: #f78700
  pink:#ED225d
****/
setup = function() {
  var canvas = createCanvas(400, 600);
  cols = [
    ['#4070b0', '#f78700'],
    ['#66afb5', '#ED225d'],
    ['#ED225d', '#66afb5']
  ];
  index = floor(random(cols.length));
  smooth();
  noStroke();
  textAlign(CENTER);
  sCol = color(random(255), random(255), random(255), 100);
  frameRate(12);
}

draw = function() {
  if (bToggle) {
    background(cols[index][0]);
  } else {
    clear();
  }
  rectMode(CORNER);
  noStroke();
  fill(cols[index][1]);
  var rSize = width / 2
  translate((width) / 2, (height) *1/3);
  fill(cols[index][1]);
  beginShape();
  vertex(rSize * 4 / 8, 0);
  vertex(rSize * 7 / 8, rSize * 3 / 8);
  vertex(rSize * 5 / 8, rSize * 5 / 8);
  vertex(rSize * 4 / 8, rSize * 4 / 8);
  vertex(rSize * 4 / 8, rSize * 12 / 8);
  vertex(-rSize * 4 / 8, rSize * 12 / 8);
  vertex(-rSize * 4 / 8, rSize * 4 / 8);
  vertex(-rSize * 5 / 8, rSize * 5 / 8);
  vertex(-rSize * 7 / 8, rSize * 3 / 8);
  vertex(-rSize * 4 / 8, 0);
  endShape(CLOSE);
  fill(cols[index][0]);
  arc(0, -rSize / 20, rSize / 2, rSize / 3, PI*8.25/4,PI*(1-.25/4),CHORD);
  fill(sCol);
  rect(-rSize * 3 / 8, rSize * 2 / 8, rSize * 6 / 8, rSize * 6 / 8, 10, 5, 10, 5);
  fill(cols[index][0]);
  var tSize = rSize * .2;
  textSize(tSize);
  textStyle(NORMAL);
  textAlign(CENTER, CENTER);
  textFont("Lato");
  text("</>", 0, rSize * 5 / 8);
  if (tToggle)
  {
  textAlign(RIGHT, BOTTOM);
  textSize(tSize*2);
  fill(cols[index][1]);
  text("Hack",0,-rSize*1/16);
  if(bToggle)
    fill(255,255,255)
  else
    fill(0,0,0);
  textAlign(LEFT, BOTTOM);
  text("Print",0,-rSize*1/16);
  }
  
    //for recolor on mouseOver
  var mX = mouseX - width / 2;
  var mY = mouseY;
  if ((mX > -rSize * 3 / 8 && mX < rSize * 3 / 8) && (mY > rSize * 2 / 8 && mY < rSize * 8 / 8))
    sCol = color(random(255), random(255), random(255), 100);

}
mouseClicked = function() {
  index = (index + 1) % cols.length;
}
function keyPressed() {
  if (key == "B") {
    if (bToggle) {
      bToggle = false;
    } else
      bToggle = true;
  }
  if (key == "T") {
    if (tToggle) {
      tToggle = false;
    } else
      tToggle = true;
  }
  if (key == "P") {
    if (paused) {
      paused = false;
      loop();
    } else
      {
      paused = true;
      noLoop();
        
      }
  }
}