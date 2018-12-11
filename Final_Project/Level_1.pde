// SNOW CLASS VARIABLE CALLS
PVector snowVelocity;
PVector snowAcceleration;
PVector snowLocation;
Snow[] snowball;

// IMAGE CALLS
PImage christmasTree;
PImage ice;
PImage snowBg;
PImage snowman;
PImage snowDark;
PImage cabin;

// TONS OF IMAGE FUNCTIONS FOR EASY PLACEMENT

void snowBg(float sbgx, float sbgy) {
  imageMode(CENTER);
  image(snowBg, sbgx, sbgy);
}

void christmasTree(float ctX, float ctY) {
  imageMode(CENTER);
  image(christmasTree, ctX, ctY - 10);
  christmasTree.resize(140, 360);

}

void ice(float ix, float iy) {
  imageMode(CENTER);
  image(ice, ix, iy);
}

void snowman(float smx, float smy) {
  imageMode(CENTER);
  image(snowman, smx, smy - 40);
  snowman.resize(160, 160);
}

void snowDark(float sdx, float sdy) {
  imageMode(CENTER);
  image(snowDark, sdx, sdy);
  snowDark.resize(80, 80);
}

void cabin(float cx, float cy) {
  imageMode(CENTER);
  image(cabin, cx, cy - 200);
  cabin.resize(400, 320);
}



class Snow { // FROM MY SKETCH 4
  float x;
  float y;
  PVector snowLocation;
  PVector snowVelocity;
  PVector snowAcceleration;
  
  // LOCATION, VELOCITY, ACCELERATION
  Snow(float snowxPos, float snowyPos, float snowxVelocity, float snowyVelocity, float snowxAcceleration, float snowyAcceleration) {
    snowLocation = new PVector(snowxPos, snowyPos);
    snowVelocity = new PVector(snowxVelocity, snowyVelocity);
    snowAcceleration = new PVector(snowxAcceleration, snowyAcceleration);
    
  }
  
  // DISPLAY SNOWBALL AT LOCATION
  void display() {
    snow(snowLocation.x, snowLocation.y);
    
  }
  
  // ADJUSTMENT OF LOCATION USING VELOCITY, and VELOCITY USING ACCELERATION
  void math() {
    snowLocation.add(snowVelocity);
    snowVelocity.add(snowAcceleration);
    
  }
  
  // WHEN SNOWBALL GOES OUT OF SCREEN, RELOCATES LOCATION TO 0
  void border() {
    if (snowLocation.x > width) {
      snowLocation.x = 0;
    }
    
    if (snowLocation.y > 880) {
      snowLocation.y = 0;
    }
  }
  
  // SNOWBALL VISUALS
  void snow(float snowxPos, float snowyPos) {
    noStroke();
    fill(255);
    ellipse(snowxPos, snowyPos, 6, 6);
    fill(255, 200);
    ellipse(snowxPos, snowyPos, 7, 7);
    fill(255, 100);
    ellipse(snowxPos, snowyPos, 8, 8);
    fill(255, 50);
    ellipse(snowxPos, snowyPos, 9, 9);
    
  }
  
}
