// IMAGE CALLS
PImage castle_in;
PImage fish_queen;



// IMAGE FUNCTIONS
void castle_in(float cinx, float ciny) {
  imageMode(CENTER);
  image(castle_in, cinx, ciny - 340);
  castle_in.resize(1160, 1600);
}

void fish_queen(float fqx, float fqy) {
  imageMode(CENTER);
  image(fish_queen, fqx, fqy);
  fish_queen.resize(160, 160);
}
