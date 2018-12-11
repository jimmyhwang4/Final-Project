// IMAGE CALLS
PImage sand;
PImage clam;
PImage seaweed;
PImage castle;

// FISH1 IMAGE CALL AND MOTION VARIABLES
PImage fish1;
float f1x = 760;
float f1y = 200;

// FISH2 IMAGE CALL AND MOTION VARIABLES
PImage fish2;
float f2x = 40;
float f2y = 440;




// IMAGE FUNCTIONS
void sand(float sandx, float sandy) {
  imageMode(CENTER);
  image(sand, sandx, sandy - 360);
  sand.resize(1600, 1600);
}

void clam(float clamx, float clamy) {
  imageMode(CENTER);
  image(clam, clamx, clamy);
  clam.resize(40, 40);
}

void seaweed(float seaweedx, float seaweedy) {
  imageMode(CENTER);
  image(seaweed, seaweedx, seaweedy);
  seaweed.resize(80, 80);
}

void castle(float castlex, float castley) {
  imageMode(CENTER);
  image(castle, castlex, castley);
  castle.resize(560, 560);
}
