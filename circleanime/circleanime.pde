float a=0;
int r=60;
void setup()
{
  background(255);
  size(600, 600);
  frameRate(60);
}
void draw() 
{
  //ellipse(300,300,200,200);
  float x=r*cos(a*PI/180)+300;
  float y=r*sin(a*PI/180)+300;
  println(floor(x), floor(y), a);
  //point(x, y);
  float t1_x = x+cos((a+90)*PI/180)*600;
  float t1_y = y+sin((a+90)*PI/180)*600;
  float t2_x = x+cos((a+270)*PI/180)*600;
  float t2_y = y+sin((a+270)*PI/180)*600;
  strokeWeight(0.1);
  line(t1_x, t1_y, t2_x, t2_y);
  //point(t1_x,t1_y);
  //point(t2_x,t2_y);
  a=a+1;
  if (a==360) {
    //exit();
    //ellipse(300, 300, 200, 200);
    //saveFrame("circle.tiff");
  }
}

