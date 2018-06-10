//http://yoppa.org/sfc_design16/7231.html

//パーティクルクラス
class ParticleVec2 {
  PVector position;       //位置
  PVector velocity;       //速度
  PVector acceleration;   //加速度
  PVector gravity;        //重力
  float radius;           //パーティクルの半径
  float mass;             //質量

  //コンストラクター
  ParticleVec2() {
    //初期パラメーターを設定
    radius = 4.0;
    position = new PVector(width/2.0, height/2.0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    gravity = new PVector(0, 0);
    mass = 1.0;
  }

  //座標の更新
  void update() {
    velocity.add(acceleration);     //速度に加速度を加算
    velocity.add(gravity);          //重力を加える
    position.add(velocity);         //速度から位置を算出
    acceleration.set(0, 0);         //加速度をリセット
  }

  //力を加える関数
  void addForce(PVector force) {
    //質量から加速度を計算 (a = f/m);
    force.div(mass);
    acceleration.add(force);
  }

  //パーティクルを描画
  void draw() {
    fill(hue, 50, 50, 100);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
