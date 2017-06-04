background(255);
//size(5182,3624);
size(2560,600);
smooth();
int max = 1400;
int[][] grids = new int[max][max];


for(int i=0; i < max; i++){
  grids[i][0] = int(random(width*3)-width);
  grids[i][1] = int(random(height*3)-height);
}

for(int i=0; i < max; i++){
  print("(" + grids[i][0] + "," + grids[i][1] + ")");
  strokeWeight(1);
  //point(grids[i][0], grids[i][1]);
}

float d = sqrt(sq(width/12)+sq(height/12));

for(int i=0; i < max; i++){
  strokeWeight(0.1);
  for(int j=0; j < max; j++){
    if(i+j > max-2){
      int x = grids[i][0]-grids[i+j+1-max][0];
      int y = grids[i][1]-grids[i+j+1-max][1];
      float r = sqrt(sq(x)+sq(y));
      if(r < d){
        line(grids[i][0], grids[i][1], grids[i+j+1-max][0], grids[i+j+1-max][1]);
      }
    }
  }
}

saveFrame("twitter.png");
