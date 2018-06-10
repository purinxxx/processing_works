/*
  3-D-18 宮田健吾
 左クリックでシミュレーション開始
 右クリックで引力追加
 引力 1つだけマウスについてくる
 スペースキーでリセット
 Rキーでスクリーンショット
 
 質量
 速度
 加速度
 複数個の引力
 全てのパーティクルを繋ぐ曲線を描画
 */

float weight = 1;
int PN = 1000;
int FN = 0;
boolean start = false;
ParticleVec2[] particles = new ParticleVec2[PN];
ArrayList<AttractFood> foods = new ArrayList<AttractFood>();
float hue = 210;  //色相



void setup() {
  //初期設定
  size(1280, 800, P3D);
  smooth();
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(30);
  noStroke();
  init();
}

void draw() {
  foods.get(0).position.set(mouseX, mouseY);
  background(0);
  for (int i = 0; i < PN; i++) {
    float x1 = particles[i].position.x;
    float y1 = particles[i].position.y;
    float x2 = width/2;
    float y2 = height/2;
    PVector[] attractVec = new PVector[FN];
    for (int j = 0; j < FN; j++) {
      x2 = foods.get(j).position.x;
      y2 = foods.get(j).position.y;
      float d = dist(x1, y1, x2, y2);
      attractVec[j] = PVector.fromAngle(atan2(y2-y1, x2-x1)).div(d).mult(100);  //遠い距離ほどベクトルの大きさを小さくする（ほんとに小さくできてるのか不明ｗ）
    }


    if (start) {
      PVector v = new PVector(0, 0);
      for (int k=0; k<foods.size(); k++) {
        v=v.add(attractVec[k]);  //ベクトルの合計計算
      }

      particles[i].addForce(v.normalize());
      //パーティクルの位置を更新
      particles[i].update();
      //パーティクルを描画
      //particles[i].draw();
    }
  }

  noFill();
  stroke(hue, 60, 90, 50);
  strokeWeight(weight);
  for (int i = 0; i < PN-4; i+=1) {
    //1ずつずらしてcurveすると一本になる
    curve(particles[i].position.x, particles[i].position.y, particles[i+1].position.x, particles[i+1].position.y, particles[i+2].position.x, particles[i+2].position.y, particles[i+3].position.x, particles[i+3].position.y);
  }
  noStroke();

  for (int i = 0; i < FN; i++) {
    //foods.get(i).update();  //引力を円運動させる
    //foods.get(i).draw();
  }

  //連番pngで保存
  //saveFrame("Mysterious-####.png");
}


void init() {
  for (int i = 0; i < PN; i++) {
    //パーティクルをインスタンス化
    particles[i] = new ParticleVec2();
    //初期位置を設定
    float x;
    float y;
    while (true) {
      x=random(0, width);
      y=random(0, height);
      if (dist(x, y, width/2, height/2)<height/2) break;
    }
    particles[i].position.set(x, y);
    particles[i].gravity.set(0, 0);
    particles[i].radius = 2;
    particles[i].mass = 1;
  }
  FN++;
  foods.add(new AttractFood());
}


void mouseClicked() {
  if (mouseButton == LEFT) {  //左クリックでシミュレーション開始
    start = true;
  }
  if (mouseButton == RIGHT) {  //右クリックで引力追加
    FN++;
    foods.add(new AttractFood());
    foods.get(FN-1).position.set(mouseX, mouseY);
    foods.get(FN-1).firstPosition.set(mouseX, mouseY);
    for (int i = 0; i < FN; i++) {
      foods.get(i).draw();
    }
  }
}


void keyPressed() {
  if (key == ' ' ) {    // スペースキーでリセット
    FN = 0;
    particles = new ParticleVec2[PN];
    foods = new ArrayList<AttractFood>();
    init();
  }
  if (key == 'r') {
    saveFrame("Mysterious-####.png");
  }
}
