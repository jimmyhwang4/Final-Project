// Jimmy Hwang
// Final Project Prototype

Explorer player;
float speed = 25; // speed of player
float level = 1; // indicates room
int startX = 400; // x starting location of player
int startY = 700; // y starting location of player

void setup() {
  size(800, 800);
  // class Explorer placed under variable "player"
  player = new Explorer(startX, startY);
  
  
}

void draw() {
  
  // player advances to next room upon touching black box at top middle
  if (player.x > 375 && player.x < 425) {
    if (player.y < 75) {
      if (level == 1) {
        level = 2;
        player.x = startX;
        player.y = startY;
      } else if (level == 2) {
        level = 3;
        player.x = startX;
        player.y = startY;
      }
    }
  }
  
  // rooms based on "level" variable, add more graphics and unique classes here
  if (level == 1) {
    fill(255, 0, 0);
    rect(0, 0, width, height);
    fill(0);
    rect(375, 0, 50, 50);
    
  } else if (level == 2) {
    fill(0, 255, 0);
    rect(0, 0, width, height);
    fill(0);
    rect(375, 0, 50, 50);
    
  } else if (level == 3) {
    fill(0, 0, 255);
    rect(0, 0, width, height);
    fill(0);
    rect(375, 0, 50, 50);
    
  }
    

  // create "Explorer class" player in map
  player.display();
  
}

// class representing the player
class Explorer {
  float x;
  float y;
  
  Explorer(float xPos, float yPos) {
    x = xPos;
    y = yPos;
  }
  
  void display() {
    explorer(x, y);
  }
  
  void explorer(float xPos, float yPos) {
    fill(0);
    ellipse(xPos, yPos - 20, 50, 50);
    rect(xPos - 10, yPos, 20, 40);
  }
}

// moving the player with arrow keys
void keyPressed() {
  
  if (keyCode == UP) {
    player.y -= speed;
  } else if (keyCode == DOWN) {
    player.y += speed;
  } else if (keyCode == LEFT) {
    player.x -= speed;
  } else if (keyCode == RIGHT) {
    player.x += speed;
  }
}
