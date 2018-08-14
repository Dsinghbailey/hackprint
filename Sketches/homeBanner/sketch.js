var homebanner= function(p){
  var mypink;
  var myblue; 
  var myblack;
  var mygrey;
  var rowNum;
  var colNum;

  var nSize;
  var cSize;
  var field;
  var pfield;
  var centX;
  var centY;
  var centS;
  p.setup = function() {
    p.frameRate(24);
    p.createCanvas(900,100);
    mypink = '#ED225d';
    myblue = '#4070b0';
    myblack='#333333';
    mygrey ='#f6f6f6';
    rowNum=p.height/10;
    colNum=p.width/10;
    nSize=p.width/75;
    cSize=p.width/50;
    field=[];
    pfield=[];
    centX =p.width/2;
    centY =p.height/2;
    centS =50;
    
  }
  
  p.draw = function() {
    
    p.background(mygrey);
    p.push();
    for(var j= 0; j<rowNum; j++){
      field[j]=[];
      var limit=p.floor(p.random(3))+2;
      var counter=0;
      for(var i= 0; i<colNum; i++){
        if(p.dist(p.mouseX,p.mouseY,i*p.width/colNum, j*p.height/rowNum)<cSize)
        {
          field[j][i]= mypink;
        }
        else if(p.dist(i*p.width/colNum, j*p.height/rowNum, centX,centY)%50>centS)
        {
          field[j][i]= myblue;
        }
        else{
          field[j][i]= myblack;
        }
      }
    }
   if(centS>0)
      centS--;
   else
      centS=50;
    p.translate((p.width/colNum)/2,(p.height/rowNum)/2);
    for(var j= 0; j <rowNum; j++){
      for(var i= 0; i<colNum; i++){
        p.fill(field[j][i]);
        
        if(field[j][i]==mypink)
           nSize=p.width/90;
        else
            nSize=p.width/115;

        p.ellipse(i*p.width/colNum, j*p.height/rowNum, nSize, nSize);
      }
    }
    p.pop();
      
  }
}

new p5(homebanner)//div without hash 2nd