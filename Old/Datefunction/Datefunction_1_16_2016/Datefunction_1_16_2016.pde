/*year-yyyy:0 to 9999
month-mm: 1 to 12
week of year- ww:1 to 52
week of month-w: 1 to 4
day of year-ddd:1 to 365
day of month-dd: 1 to 31
day of week-d: 1 to 7

ideas:
linking d of week
focus on d of year
color for month
shape for years

Background (paisley plaid etc based on year (color) mm(shape1) and day of week(shape2))
array above containing day of year (length and width based on  month)
focus function based on day of month with color based on year and month
second focus links day of week*/
int Year =412;
int Month=2;
int Dw=4;
int Dm=23;
int Dy=50;
int Wm=3;
int Wy=48;

void setup(){
  size(300,300);
  drawBackground(Year, Month, Dw);
}
void draw(){}

void drawBackground(int year, int month, int dw)
{
  //month switch (rotate with d of y)
  //grid x=  first 2 digits ofyear +1
  // grid y = second 2 +1
  //middle digits2  and month? shape
  background(0);
  fill(44);
  translate(width/2,height/2);
  //rotate(radians(int(Dy*360/365)));
  translate(-width/2,-height/2);
  
  int year12= ceil(year/100);
  int year34 =(year%100)+1;
  int xsize = int(width/year12);
  int ysize = ceil(width/year34);
  for(int x=0; x<year12; x++)
  {
    print("x="+x);
    for(int y=0; y< year34-8; y++){
    print("y="+(y*ysize));
      rect(x*xsize, (x+1)*xsize, y*ysize, (y+1)*ysize);
    }
  }
}

  
  