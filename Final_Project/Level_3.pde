// TONS OF IMAGE CALLS
PImage tree;
PImage forestBg;
PImage dirt;

// SQUIRREL IMAGE AND SQUIRREL LOCATION VARIABLE FOR MOTION
PImage squirrel;
float sx1 = 200;
float sy1 = 520;
float sx2 = 120;
float sy2 = 120;
float sx3 = 760;
float sy3 = 360;
float s1;
float s2;
float s3;

// BIRD IMAGE AND BIRD LOCATION VARIABLE FOR MOTION
PImage birds;
float bx1 = 680;
float by1 = 200;
float bx2 = 760;
float by2 = 360;
float bx3 = 600;
float by3 = 440;
float bx4 = 120;
float by4 = 280;
float bx5 = 40;
float by5 = 600;



// A FEW IMAGE FUNCTIONS
void tree(float tx, float ty) {
  imageMode(CENTER);
  image(tree, tx, ty - 10);
  tree.resize(140, 360);
}

void forestBg(float fbgx, float fbgy) {
  imageMode(CENTER);
  image(forestBg, fbgx, fbgy);
  forestBg.resize(880, 880);
}

void dirt(float dx, float dy) {
  imageMode(CENTER);
  image(dirt, dx, dy);
  dirt.resize(80, 80);
}
