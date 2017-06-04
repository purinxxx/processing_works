/*
import gifAnimation.*;  //gif
GifMaker gifExport;  //gif
*/

float radius = 100;
int centx = 400;
int centy = 400;
int max = 200;
float x, y;
float ang = 0;
float rad = 0;
float[][] data = new float[max][max];

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(1);
  smooth();
  for (int i=0; i<max; i++) {
    ang=random(360);
    radius=random(400);
    data[i][0]=ang;
    data[i][1]=radius;
    rad = radians(ang);
    x = centx + (radius*cos(rad));
    y = centy + (radius*sin(rad));
    point(x, y);
  }
  
  /*
  frameRate(50);  //gif
  gifExport = new GifMaker(this, "export.gif");  //gif
  gifExport.setRepeat(0);  //gif
  gifExport.setQuality(10);  //gif
  gifExport.setDelay(20);  //gif
  */
}

void draw() {
  for (int i=0; i<max; i++) {
    data[i][0]-=0.05;
    rad = radians(data[i][0]);
    x = centx + (data[i][1]*cos(rad));
    y = centy + (data[i][1]*sin(rad));
    stroke(255, 255, 255);
    point(x, y);
  }
  fill(0, 0, 0, 3);
  noStroke();
  rect(0, 0, 800, 800);

  /*
  if (frameCount <= 50*6) {  //gif
    gifExport.addFrame();  //gif
  } else {  //gif
    gifExport.finish();  //gif
    println("exported");
  }  //gif
  */
}