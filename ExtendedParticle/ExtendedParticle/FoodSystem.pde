
//餌クラス
class AttractFood {
  PVector position;       //位置
  PVector firstPosition;       //初期位置
  float attract;             //引力
  float radius;           //パーティクルの半径
  int ang;
  int r;

  //コンストラクター
  AttractFood() {
    //初期パラメーターを設定
    radius = 4.0;
    position = new PVector(width/2.0, height/2.0);
    firstPosition = new PVector(width/2.0, height/2.0);
    ang = 0;
    r = height/3;
  }
  

  //座標の更新
  void update() {
    if(ang>=360) ang=0;
    float rad = radians(ang);
    position.x = firstPosition.x + (r * cos(rad));
    position.y = firstPosition.y+ (r * sin(rad));
    ang+=5;
  }

  //パーティクルを描画
  void draw() {
    fill(0,100,100);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
