PVector velocity;
PVector location;
Explorer player; // PLAYER VARIABLE
PImage dude; // IMAGE USED FOR PLAYER VARIABLE OF "EXPLORER CLASS"

// class representing the player
class Explorer {
  float x;
  float y;
  float dist = 80;
  PVector location;
  PVector newLocation; // FOR GRID-LIKE, LIMITED-DISTANCE MOVEMENT
  
  Explorer(float xPos, float yPos) {
    location = new PVector(xPos, yPos);
  }
  
  void display() {
    explorer(location.x, location.y);
  }
  
  void moveUp() {
    if (location.y > 80) { // BOUNDARY SET
      newLocation = new PVector(0, -dist); // BASICALLY A LOCATION/VECTOR VERSION OF A MATRIX
      location.add(newLocation); // ADD TO SET NEW LOCATION
    }
  }
  
  void moveDown() {
    if (location.y < 800) { // BOUNDARY SET
      newLocation = new PVector(0, dist);
      location.add(newLocation);
    }
  }
  
  void moveLeft() {
    if (location.x > 80) { // BOUNDARY SET
      newLocation = new PVector(-dist, 0);
      location.add(newLocation);
    }
  }
  
  void moveRight() {
    if (location.x < 800) { // BOUNDARY SET
      newLocation = new PVector(dist, 0);
      location.add(newLocation);
    }
  }
  
  void explorer(float xPos, float yPos) {
    // IMAGE FOR PLAYER
    imageMode(CENTER);
    image(dude, location.x, location.y - 6);
    dude.resize(80, 80);
  }
      
}
