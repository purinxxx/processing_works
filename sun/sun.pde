float a=0, step=0.25;  //円の接線を引いていく間隔
int r=width/8;  //半径
//print(width, height);
//なんでsize命令でウインドウサイズ指定する前にwidth height使えるんですか？

size(500, 500);
blendMode(ADD);
background(0);
smooth();
noStroke();

fill(255, 255, 255, 255);
ellipse(width/2,height/2,width/4,height/4);  //直径

stroke(255, 75, 60, 100);
strokeWeight(0.1);

for (int i=0; i<360/step; i++) {
  float x=r*cos(a*PI/180)+width/2;
  float y=r*sin(a*PI/180)+width/2;
  //println(floor(x), floor(y), a);
  float t1_x = x+cos((a+90)*PI/180)*width;
  float t1_y = y+sin((a+90)*PI/180)*width;
  float t2_x = x+cos((a+270)*PI/180)*width;
  float t2_y = y+sin((a+270)*PI/180)*width;
  line(t1_x, t1_y, t2_x, t2_y);
  a=a+step;
}

saveFrame();  //画像出力
//円の接線の参考 http://blog.livedoor.jp/nanoris/archives/51737810.html