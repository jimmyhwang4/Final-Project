// OBSTACLE CLASS
Obstacle obst;

class Obstacle {
  float x;
  float y;
  PVector location;
  
  Obstacle(float xPos, float yPos) {
    location = new PVector(xPos, yPos); // SET LOCATION OF OBSTACLE SO THAT PLAYER OF EXPLORER CLASS CANNOT MOVE TO THAT CERTAIN REFERENCE POINT
    
  // OBSTACLE HAS NO "DISPLAY" OR VISUALS, BUT RATHER IT IS JUST A POINT ON THE GRID-LIKE MAP TO INTERFERE WITH MOVEMENT
  
  }
}
