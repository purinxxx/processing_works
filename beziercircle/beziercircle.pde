float s=0;
float t=360;
float a=random(360);
float b=random(360);
float c=random(360);
float d=random(360);
float e=random(360);
float f=random(360);
float g=random(360);
float h=random(360);
float i=random(360);
float j=random(360);
float sr=i;
float tr=j;
void setup()
{
  background(255);
  size(600, 600);
  frameRate(60);
}
void draw() 
{
  //background(255);
  strokeWeight(0.1);
  noFill();
  float sx=sr*cos(s*PI/180)+300;
  float sy=sr*sin(s*PI/180)+300;
  //println(floor(x), floor(y), a);
  float s1_x = sx+cos((s+a)*PI/180)*600;
  float s1_y = sy+sin((s+b)*PI/180)*600;
  float s2_x = sx+cos((s+c)*PI/180)*600;
  float s2_y = sy+sin((s+d)*PI/180)*600;
  //line(s1_x, s1_y, s2_x, s2_y);
  float tx=tr*cos(t*PI/180)+300;
  float ty=tr*sin(t*PI/180)+300;
  //println(floor(x), floor(y), a);
  float t1_x = tx+cos((t+e)*PI/180)*600;
  float t1_y = ty+sin((t+f)*PI/180)*600;
  float t2_x = tx+cos((t+g)*PI/180)*600;
  float t2_y = ty+sin((t+h)*PI/180)*600;
  //line(t1_x, t1_y, t2_x, t2_y);
  bezier(s1_x, s1_y, s2_x, s2_y, t1_x, t1_y, t2_x, t2_y);
  s++;
  t--;
  if (s==360) {
    //exit();
    //ellipse(300, 300, 200, 200);
    saveFrame("beziercircle8.png");
  }
}

