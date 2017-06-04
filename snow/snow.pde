int nn = 7; //枝別れのレベル 12以上は厳しい
int v= 6; //何角形にするか
float angle = 60; //枝の広がり
float scale = 0.5;  //　枝の短くなる比率
float len = 100;  //最初の枝の長さ
float[][][] point = new float[nn+1][v*floor(pow(3, nn))][2]; //枝の段階,点のナンバー,枝分かれする点のX座標(0)Y座標(1)
int num[] = new int [nn+1]; //枝の段階ごとの点の数　appendが使えないので
float hue = 210;
//float hue = random(360);

void setup() {
  size(1000, 1000);
  background(0);
  strokeWeight(1);
  smooth();
  ellipseMode(CENTER);
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  haikei(); //背景の円形グラデーション
  yuki(250); //奥の雪
  filter(BLUR, 1.5); //ブラーで雪の結晶にピントを合わせる
  stroke(hue, 60, 90);
  for (int i=0; i<360; i+=360/v) {
    drawTree(width/2, height/2, len, 0, nn, i);
  }
  frozen(); //多角形を描画
  yuki(80); //手前の雪
  save("nn=" + nn + "_v=" + v + "_angle=" + angle + ".png"); //パラメーターをメモして保存
}

void drawTree(float x1, float y1, float len, float stand, int n, int i) {
  float x2= x1 + len*sin(radians(stand)+radians(i));  //枝先のx座標
  float y2= y1 - len*cos(radians(stand)+radians(i));  //枝先のy座標
  strokeWeight(1);
  point[nn-n][num[nn-n]][0] = x2;
  point[nn-n][num[nn-n]][1] = y2;
  num[nn-n]++;
  line(x1, y1, x2, y2);  //線を描く
  if (n >= 1) {
    drawTree(x2, y2, len*scale, stand-angle, n-1, i); //次の左の枝の再帰呼出し
    drawTree(x2, y2, len*scale*1.5, stand, n-1, i); //次の真ん中の枝の再帰呼出し
    drawTree(x2, y2, len*scale, stand+angle, n-1, i); //次の右の枝の再帰呼出し
  }
}

void frozen() {
  if (nn==0) fill(hue, 60, 90, 100);
  if (nn==1) fill(hue, 60, 90, 100);
  if (nn==2) fill(hue, 60, 90, 100);
  if (nn==3) fill(hue, 60, 90, 85-(v-6));
  if (nn==4) fill(hue, 60, 90, 65-(v-6));
  if (nn==5) fill(hue, 60, 90, 50-(v-6));
  if (nn==6) fill(hue, 60, 90, 42-(v-6));
  if (nn==7) fill(hue, 60, 90, 36-(v-6));
  if (nn==8) fill(hue, 60, 90, 32-(v-6));
  if (nn==9) fill(hue, 60, 90, 28-(v-6));
  if (nn==10) fill(hue, 60, 90, 25-(v-6));
  if (nn==11) fill(hue, 60, 90, 23-(v-6));
  if (nn>=12) fill(hue, 60, 90, 22-(v-6));
  //明るさ調整
  noStroke();
  strokeWeight(6);
  for (int j=0; j<num.length; j++) {
    beginShape();
    for (int i=0; i<num[j]; i++) {
      // println(point[j][i][0], point[j][i][1]);
      vertex(point[j][i][0], point[j][i][1]); //それぞれの再帰レベルの枝の分岐点を結ぶ多角形を描画
    }
    endShape(CLOSE);
  }
}

void haikei() {
  noStroke();
  fill(hue, 60, 20, 7.5);
  for (int r=0; r<1500; r+=50) {
    ellipse(width/2, height/2, r, r);
  }
  filter(BLUR, 6); //ブラーでグラデーションを作る
}

void yuki(int max) {
  for (int i=0; i<max; i++) {
    fill(hue, random(25), 200);
    float r=random(2, 6);
    ellipse(random(width), random(height), r, r);
  }
}

// 再帰の木の参考 http://www-im.dwc.doshisha.ac.jp/~ariga/ProcessingWeb/Trail8Fractal.html