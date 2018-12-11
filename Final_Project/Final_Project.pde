// Jimmy Hwang
// Exploration
// Final Project

float level = 1; // indicates room/level
int startX = 440; // x starting location of player
int startY = 760; // y starting location of player

import ddf.minim.*; // ability to import sound

// AUDIOPLAYER CALLS FOR SOUND
AudioPlayer bgm1;
AudioPlayer bgm2;
AudioPlayer bgm3;
AudioPlayer bgm4;
AudioPlayer bgm5;
AudioPlayer bgm6;
AudioPlayer footstep;
AudioPlayer birds_flying;
AudioPlayer door_open;
AudioPlayer door_close;
AudioPlayer splash;
Minim minim;



void setup() {
  size(880, 880); // size of room
  
  player = new Explorer(startX, startY); // class Explorer placed under variable "player"
  
  // INPUT SNOW FALLING SPEED (PULLED FROM MY SKETCH 4, SEE "LEVEL 1" PROCESSING FILE)
  snowball = new Snow[40];
  for (int i = 0; i < snowball.length; i = i + 1) {
    snowball[i] = new Snow(random(400), 0, random(0.5, 1), random(0.5,1.5), random(0.001, 0.003), random(0.001, 0.003));
  }
  
  // IMAGE LOADS
  christmasTree = loadImage("christmasTree.png"); // ORIGINAL CREDITS: https://www.pixilart.com/art/tree-949a7a66d306f65, EDITED BY ME
  ice = loadImage("ice.png"); // MADE BY ME
  snowBg = loadImage("snowBg.png"); // MADE BY ME
  snowman = loadImage("snowman.png"); // MADE BY ME
  snowDark = loadImage("snowDark.png"); // MADE BY ME
  cabin = loadImage("cabin.png"); // CREDITS: http://pixelartmaker.com/art/d272c78a9e5abc4
  inCabin = loadImage("inCabin.png"); // MADE BY ME
  forestBg = loadImage("forestBg.png"); // MADE BY ME
  dirt = loadImage("dirt.png"); // MADE BY ME
  tree = loadImage("tree.png"); // ORIGINAL CREDITS: https://www.pixilart.com/art/tree-949a7a66d306f65, EDITED BY ME
  squirrel = loadImage("squirrel.png"); // CREDITS: https://www.google.com/search?q=squirrel+pixel+art&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjqh8_JoZjfAhXIuVkKHSUjCvcQ_AUIDigB&biw=1536&bih=674#imgrc=ppuEKXrpSQcQXM:
  birds = loadImage("birds.png"); // MADE BY ME
  dock = loadImage("dock.png"); // MADE BY ME
  ocean = loadImage("ocean.jpg"); // CREDITS: https://www.google.com/search?biw=1536&bih=674&tbm=isch&sa=1&ei=Oe4PXPTEMK3H5gK7-DI&q=ocean+pixel+art&oq=ocean+pixel+art&gs_l=img.3..35i39j0i5i30j0i8i30.39737.40118..40182...0.0..0.63.208.4......1....1..gws-wiz-img.......0j0i30j0i24.CCsZpuFYZwI#imgrc=1266eARbdpoe1M:
  sand = loadImage("sand.jpg"); // MADE BY ME
  clam = loadImage("clam.png"); // MADE BY ME
  castle = loadImage("castle.png"); // MADE BY ME
  fish1 = loadImage("fish1.png"); // MADE BY ME
  fish2 = loadImage("fish2.png"); // MADE BY ME
  seaweed = loadImage("seaweed.png"); // MADE BY ME
  castle_in = loadImage("castle_in.png"); // MADE BY ME
  fish_queen = loadImage("fish_queen.png"); // MADE BY ME
  dude = loadImage("player.png"); // CREDITS: https://appvn.com/android/dungeon-explorer-pixel-rpg/detail?id=com.ninjagames.platformer
  
  // SOUND LOADS
  minim = new Minim(this);
  bgm1 = minim.loadFile("white_christmas.mp3"); // CREDITS: https://www.youtube.com/watch?v=PiD3vmhVh0I
  bgm2 = minim.loadFile("fireplace.mp3"); // CREDITS: https://www.youtube.com/watch?v=H2u5wb95amg&t=40s
  bgm3 = minim.loadFile("ellinia.mp3"); // ORIGINAL CREDITS: https://www.youtube.com/watch?v=foiD5iCkq08&t=18s, EDITED BY ME
  bgm4 = minim.loadFile("ocean_waves.mp3"); // CREDITS: https://www.youtube.com/watch?v=cB_CwY9dhrA&t=122s
  bgm5 = minim.loadFile("aquarium.mp3"); // CREDITS: https://www.youtube.com/watch?v=qtw0sIBLjrw&t=37s
  bgm6 = minim.loadFile("mystery_dungeon.mp3"); // ORIGINAL CREDITS: https://www.youtube.com/watch?v=6fbhS4e-dEE, EDITED BY ME
  footstep = minim.loadFile("footstep.mp3"); // ORIGINAL CREDITS: https://www.soundjay.com/footsteps-1.html ("Footsteps Sound Effect 5"), EDITED BY ME
  birds_flying = minim.loadFile("birds_flying.mp3"); // ORIGINAL CREDITS: https://www.youtube.com/watch?v=k8_UYuIT5kY, EDITED BY ME
  door_open = minim.loadFile("door_open.mp3"); // ORIGINAL CREDITS: https://www.youtube.com/watch?v=0Em3FVQMfcE, EDITED BY ME
  door_close = minim.loadFile("door_close.mp3"); // ^ SAME AS door_open.mp3 ^
  splash = minim.loadFile("splash.mp3"); // CREDITS: https://www.youtube.com/watch?v=Ab3xFUuYYm0
    
}



void draw() {
  
  // ADVANCEMENTS TO NEXT LEVEL
  if (player.location.x == 440 && player.location.y == 40) { // SETTING UP SPECIFIC LOCATION FOR LEVEL ADVANCEMENT
    if (level == 1) {
      level = 3; // USE NUMBERS TO INDICATE LEVELS (LEVEL 2 ADVANCEMENT IS LOCATED IN "KEYBOARD CHECK" SECTION DUE TO INTRICACIES WITH LOCATION)
      bgm1.close(); // CLOSE SOUNDS FROM PERVIOUS LEVELS (THIS WILL BE REPEATED FOR ALL ADVANCEMENTS)
      bgm3 = minim.loadFile("ellinia.mp3"); // LOAD UP SOUNDS FOR LEVEL YOU ARE ADVANCING TO REPEAT
      player.location.x = startX; // SET PLAYER ON STARTING X SPOT
      player.location.y = startY; // SET PLAYER ON STARTING Y SPOT
    } else if (level == 3) {
      bgm3.close();
      bgm4 = minim.loadFile("ocean_waves.mp3");
      level = 4;
      player.location.x = startX;
      player.location.y = startY;
    } 
  } else if ( (level == 4 && player.location.y < 560) || ( level == 4 && ( player.location.x < 340 || player.location.x > 560 ) ) ) {
    level = 5;
    splash = minim.loadFile("splash.mp3");
    bgm5 = minim.loadFile("aquarium.mp3");
    bgm4.close();
    player.location.x = player.location.x;
    player.location.y = player.location.y;
  }
  
  // GO BACK TO PREVIOUS LEVEL
  if (player.location.x == 440 && player.location.y == 840) { // SETTING UP SPECIFIC LOCATION FOR LEVEL RETURN
    if (level == 3) {
      level = 1;
      bgm3.close(); // CLOSE THE SONG OF LEVEL THAT YOU JUST LEFT
      bgm1 = minim.loadFile("white_christmas.mp3"); // LOAD UP CURRENT LEVELS SONG TO REPEAT
      player.location.x = 440; // LEVEL RETURN X POSITION
      player.location.y = 120; // LEVEL RETURN Y POSITION
    } else if (level == 4) {
      level = 3;
      bgm3 = minim.loadFile("ellinia.mp3");
      bgm4.close();
      player.location.x = 440;
      player.location.y = 120;
    }
  } else if (level == 5 && player.location.y > 560 && player.location.x > 340 && player.location.x < 560) {
    level = 4;
    splash.close();
    bgm5.close();
    bgm4 = minim.loadFile("ocean_waves.mp3");
    player.location.x = player.location.x;
    player.location.y = player.location.y;
  } else if (level == 6 && player.location.x == 40 && player.location.y == 840) {
    level = 5;
    bgm5 = minim.loadFile("aquarium.mp3");
    bgm6.close();
    player.location.x = 520;
    player.location.y = 440;
  }
  
  // ROOMS BASED ON "LEVEL NUMBER" (BIGGEST PART OF THE CODE)
  
  // LEVEL 1 ( SNOW LAND )
  // LEVEL 1 ( SNOW LAND )
  // LEVEL 1 ( SNOW LAND )
  
  if (level == 1) { // INDICATE WHAT LEVEL YOU ARE IN
    
    bgm1.play(); // PLAY CURRENT LEVEL SONG THAT HAS BEEN LOADED
    
    snowBg(440, 440); // BACKGROUND PICTURE OF LEVEL
    
    obst = new Obstacle(520, 200); // OBSTACLE CLASS TO PREVENT MOVEMENT ON THIS SPECIFIC AREA (SEE "OBSTACLE CLASS" AND "KEYBOARD CHECK FUNCTION" FOR MORE DETAIL)
    
    for ( int a = 0; a < 800; a = a + 80 ) { // FOR-LOOPING THE ROADS FOR EFFICIENCY (WILL SEE THIS OFTEN IN OTHER LEVELS)
      snowDark(440, 40 + a);
    }
    
    // LOTS OF MANUAL ICE PLACEMENT FOR AESTHETICS
    ice(760, 680);
    ice(760, 760);
    ice(840, 840);
    ice(840, 760);
    ice(840, 680);
    ice(840, 600);
    ice(760, 600);
    ice(680, 840);
    ice(680, 760);
    ice(600, 840);
    ice(40, 840);
    ice(40, 760);
    ice(120, 840);
    ice(40, 600);
    ice(40, 680);
    ice(120, 680);
    ice(200, 840);
    ice(200, 760);
    ice(360, 840);
    ice(440, 840);
    ice(200, 200);
    ice(200, 280);
    ice(120, 120);
    ice(40, 280);
    ice(120, 40);
    ice(520, 840);
    ice(840, 280);
    ice(760, 360);
    ice(760, 440);
    ice(760, 520);
    ice(680, 360);
    
    cabin(680, 280); // CABIN IMAGE 
    
    snowman(760, 280); // SNOWMAN IMAGE
    
    player.display(); // DISPLAY PLAYER AFTER IMAGES THAT YOU WANT TO BE OVER, BUT BEFORE IMAGES YOU WANT TO BE UNDER
    
    // MANUAL CHRISTMAS TREE PLACEMENTS
    christmasTree(120, 680);
    christmasTree(200, 520);
    christmasTree(120, 280);
    christmasTree(680, 520);
    christmasTree(520, 680);
    christmasTree(360, 600);
    christmasTree(760, 760);
    christmasTree(280, 760);
    christmasTree(40, 440);
    christmasTree(840, 440);
    christmasTree(40, 120);
    christmasTree(280, 200);
    christmasTree(600, 360);
    christmasTree(200, 40);
    
    // SNOW VECTOR EFFECT (FROM MY SKETCH 4)
    for (int i = 0; i < 30; i = i + 1) {
      snowball[i].math();
      snowball[i].border();
      snowball[i].display();
    }
    
  // LEVEL 2 ( IN CABIN )
  // LEVEL 2 ( IN CABIN )
  // LEVEL 2 ( IN CABIN )
  
  } else if (level == 2) {
    
    // SOUND FILES
    bgm2.play();
    door_open.play();
    
    fill(135, 206, 250); // COVER TOP BACKGROUND (WINDOW)
    rect(0, 0, 880, 440); // WITH RECTANGLE
    
    // SNOW VECTOR EFFECT IN WINDOW
    for (int i = 0; i < 30; i = i + 1) {
      snowball[i].math();
      snowball[i].border();
      snowball[i].display();
    }
    
    fill(192, 192, 192); // COVER BOTTOM BACKGROUND (FIREPLACE)
    rect(0, 440, 880, 440); // WITH RECTANGLE
      
    inCabin(440, 440); // IN CABIN IMAGE
    
    fire(440, 760); // FIRE FUNCTION (SEE LEVEL_2 PROCESSING FILE)
  
  // LEVEL 3 ( FOREST )
  // LEVEL 3 ( FOREST )
  // LEVEL 3 ( FOREST )
  
  } else if (level == 3) {
    
    // SOUND FILES
    bgm3.play();
    birds_flying.play();
    
    obst.location.x = 0; // MOVE OBSTACLE X POSITION OUT OF MAP
    obst.location.y = 0; // MOVE OBSTACLE Y POSITION OUT OF MAP
    
    forestBg(440, 440);
    
    // MANUAL PLACEMENTS OF "ICE" AND "SNOWDARK"
    ice(40, 840);
    ice(120, 840);
    ice(200, 840);
    ice(40, 760);
    ice(840, 840);
    ice(840, 760);
    ice(760, 840);
    ice(600, 760);
    ice(40, 680);
    
    snowDark(360, 840);
    snowDark(280, 840);
    snowDark(360, 760);
    snowDark(520, 840);
    snowDark(600, 840);
    snowDark(520, 760);
    snowDark(120, 760);
    snowDark(680, 840);
    snowDark(440, 840);
    
    // FOR-LOOP PLACEMENT OF "DIRT" ROAD
    for ( int b = 0; b < 800; b = b + 80 ) {
      dirt(440, 40 + b);
    }
    
    // 3 SQUIRREL IMAGES WITH MOTION (SEE LEVEL 3 PROCESSING FILE FOR MORE DETAIL REGARDING VARIABLES)
    image(squirrel, sx1, sy1);
    image(squirrel, sx2, sy2);
    image(squirrel, sx3, sy3);
    
    // SQUIRREL 1 MOTION LIMIT
    if ( sx1 == 680 ) { // LIMITING 1ST X POSITION
      s1 = 0; // SETTING PRIMARY TRIGGER ONCE CERTAIN X POSITION IS REACHED
    } else if ( sx1 == 200 ) { // LIMITING 2nd X POSITION
      s1 = 1; // SETTING SECONDARY TRIGGER ONCE CERTAIN X POSITION IS REACHED
    }
    
    // SQUIRREL 2 MOTION LIMIT
    if ( sx2 == 760) {
      s2 = 0;
    } else if ( sx2 == 120 ) {
      s2 = 1;
    }
    
    // SQUIRREL 3 MOTION LIMIT
    if ( sx3 == 120) {
      s3 = 0;
    } else if ( sx3 == 760 ) {
      s3 = 1;
    }
    
    // SQUIRREL 1 MOTION
    if ( s1 == 0 ) {
      sx1 = sx1 - 12; // MOVE LEFT
    } else if ( s1 == 1) {
      sx1 = sx1 + 12; // MOVE RIGHT
    }
    
    // SQUIRREL 2 MOTION
    if ( s2 == 0 ) {
      sx2 = sx2 - 16;
    } else if ( s2 == 1 ) {
      sx2 = sx2 + 16;
    }
    
    // SQUIRREL 3 MOTION
    if ( s3 == 0 ) {
      sx3 = sx3 + 8;
    } else if ( s3 == 1) {
      sx3 = sx3 - 8;
    }

    player.display(); // DISPLAY PLAYER ON SCREEN
    
    cabin(680, 1160); // SMALL TOP PORTION OF CABIN FROM LEVEL 1 FOR TRANSITIONAL FLUIDITY
    
    // FOR-LOOP THE TREES
    for ( int c = 0; c < 640; c = c + 160 ) {
      tree(40, 40 + c);
      tree(200, 40 + c);
      tree(680, 40 + c);
      tree(840, 40 + c);
    }
    
    // FOR-LOOP MORE TREES
    for ( int d = 0; d < 600; d = d + 160) {
      tree(120, 120 + d);
      tree(280, 120 + d);
      tree(600, 120 + d);
      tree(760, 120 + d);
    }
    
    // CREATE BIRD IMAGES AND MOTION
    imageMode(CENTER);
    image(birds, bx1, by1);
    image(birds, bx2, by2);
    image(birds, bx3, by3);
    image(birds, bx4, by4);
    image(birds, bx5, by5);
    
    // BIRD 1 MOTION TO TOP RIGHT CORNER
    if ( bx1 < 1000) {
      bx1 = bx1 + 6; // MOVE RIGHT
      by1 = by1 - 6; // MOVE UP
    }
    
    // BIRD 2 MOTION TO TOP RIGHT CORNER
    if ( bx2 < 1000) {
      bx2 = bx2 + 8;
      by2 = by2 - 8;
    }
    
    // BIRD 3 MOTION TO TOP RIGHT CORNER
    if ( bx3 < 1000) {
      bx3 = bx3 + 10;
      by3 = by3 - 10;
    }
    
    // BIRD 4 MOTION TO TOP RIGHT CORNER
    if ( bx4 < 1000) {
      bx4 = bx4 + 12;
      by4 = by4 - 12;
    }
    
    // BIRD 5 MOTION TO TOP RIGHT CORNER
    if ( bx5 < 1000) {
      bx5 = bx5 + 16;
      by5 = by5 - 16;
    }
    
  // LEVEL 4 (BEACH)
  // LEVEL 4 (BEACH)
  // LEVEL 4 (BEACH)
    
  } else if (level == 4) {
    
    bgm4.play(); // SOUND FILE
    
    ocean(440, 440); // OCEAN IMAGE
      
    dock(440, 760); // DOCK IMAGE
    
    player.display(); // DISPLAY PLAYER ON LEVEL MAP
    
    // MANUAL POSITIONING OF TOP OF TREES FROM LEVEL 3 FOR TRANSITIONAL FLUIDITY
    tree(40, 920);
    tree(120, 1000);
    tree(200, 920);
    tree(280, 1000);
    tree(840, 920);
    tree(760, 1000);
    tree(680, 920);
    tree(600, 1000);
    
  // LEVEL 5 (UNDERWATER)
  // LEVEL 5 (UNDERWATER)
  // LEVEL 5 (UNDERWATER)
      
  } else if (level == 5) {
    
    // SOUND FILES
    bgm5.play();
    splash.play();
    
    // OBSTACLE FOR CASTLE TO PREVENT MOVING BEHIND/ABOVE IT
    obst.location.x = 600;
    obst.location.y = 440;
    
    sand(440, 440); // SAND BACKGROUND
    
    // MANUAL PLACEMENT OF SEAWEED
    seaweed(40, 40);
    seaweed(40, 120);
    seaweed(40, 200);
    seaweed(40, 280);
    seaweed(40, 360);
    seaweed(120, 40);
    seaweed(200, 40);
    seaweed(280, 40);
    seaweed(360, 40);
    seaweed(440, 40);
    seaweed(520, 40);
    seaweed(120, 120);
    seaweed(120, 200);
    seaweed(200, 120);
    seaweed(520, 120);
    
    // MANUAL PLACEMENT OF CLAMS
    clam(120, 280);
    clam(40, 680);
    clam(200, 520);
    clam(600, 600);
    clam(760, 520);
    clam(440, 200);
    
    castle(760, 200); // CASTLE IMAGE
    
    player.display(); // DISPLAY PLAYER ON LEVEL MAP
    
    // FISH1 IMAGE
    imageMode(CENTER);
    image(fish1, f1x, f1y);
    fish1.resize(60, 60);
    
    // WHEN FISH1 GOES OUT OF BOUNDARY, REPOSITION ON OTHER SIDE
    if ( f1x > 880 ) {
      f1x = 0;
    }
    
    // FISH2 IMAGE
    image(fish2, f2x, f2y);
    fish2.resize(60, 60);
    
    // WHEN FISH2 GOES OUT OF BOUNDARY, REPOSITION ON OTHER SIDE
    if ( f2x < 0 ) {
      f2x = 880;
    }
    
    // FISH MOTION
    f1x = f1x + 4; // GO RIGIHT
    f2x = f2x - 6; // GO LEFT
    
    // BLUE SLIGHTLY-TRANSPARENT OVERLAY FOR UNDERWATER EFFECT
    fill(0, 0, 255, 100);
    rect(0, 0, 880, 880);
    
    dock(440, 760); // DOCK IMAGE FROM LEVEL 4
    
    // MANUALLY POSITIONED TREE IMAGES FROM LEVEL 4
    tree(40, 920);
    tree(120, 1000);
    tree(200, 920);
    tree(280, 1000);
    tree(840, 920);
    tree(760, 1000);
    tree(680, 920);
    tree(600, 1000);
    
  // LEVEL 6 (CASTLE)
  // LEVEL 6 (CASTLE)
  // LEVEL 6 (CASTLE)
    
  } else if (level == 6) {
    
    bgm6.play(); // SOUND FILE
    
    castle_in(440, 440); // CASTLE IMAGE BACKGROUND
    
    fish_queen(680, 520); // FISH QUEEN IMAGE
    
    player.display(); // DISPLAY PLAYER ON LEVEL MAP
    
  }
  
  // GRID FOR PRECISELY MEASURING LOCATION AND POSITION
  // for (int i = 0; i < height; i = i + 80) {
  //   stroke(0, 255, 0);
  //   line(i, 0, i, height);
  //   line(0, i, width, i);
  // }
  
}

// MOVEMENT OF PLAYER
void keyPressed() {
  if ( keyPressed ) {
    
    if ( keyCode == UP && level != 6 ) { // NOT LEVEL 6, SINCE YOU CAN ONLY MOVE LEFT OR RIGHT FOR LEVEL 6
      if (level == 5 && player.location.x == 600 && player.location.y == 520) { // THIS IS TO TRANSITION TO LEVEL 6 SINCE YOU GET OFF THE DOCK RATHER THAN HIT A SPECIFIC POSITION
        player.location.x = 120;
        player.location.y = 920;
        level = 6;
        // SOUND FILE RESET & CLOSE FROM PREVIOUS LEVEL
        bgm6 = minim.loadFile("mystery_dungeon.mp3");
        splash.close();
        bgm5.close();
      }
      if (level == 1 && player.location.x == 680 && player.location.y == 280) { // THIS IS FOR TRANSITIONING TO LEVEL 2 (INSIDE THE CABIN) FROM LEVEL 1 DUE TO SPECIFIC POSITIONING REASONS
        level = 2;
        // SOUND FILES LOAD
        door_open = minim.loadFile("door_open.mp3");
        bgm2 = minim.loadFile("fireplace.mp3");
      }
      if (player.location.x < obst.location.x || player.location.y != obst.location.y + 80) { // AS LONG AS THERE IS NO OBSTACLE, YOU CAN MOVE
        player.moveUp(); // MOVE UP FUNCTION (SEE IN EXPLORER CLASS)
        footstep.play(); // SOUND FILE FOR MOVING
        footstep = minim.loadFile("footstep.mp3"); // SOUND FILE RESET FOR REPEAT
      }
      
    } else if ( keyCode == DOWN && level != 6 ) {
        if (level == 2) { // GOING OUT OF LEVEL 2 (CABIN) TO LEVEL 11
          level = 1;
          // SOUND FILES PLAY & RESET & CLOSE
          door_close.play();
          door_close = minim.loadFile("door_close.mp3");
          bgm2.close();
          // SET POSITION RIGHT OUTSIDE THE CABIN IN LEVEL 1
          player.location.x = 680;
          player.location.y = 200;
        }
        player.moveDown();
        footstep.play();
        footstep = minim.loadFile("footstep.mp3");
        
    } else if ( keyCode == LEFT) {
      player.moveLeft();
      footstep.play();
      footstep = minim.loadFile("footstep.mp3");
      
    } else if ( keyCode == RIGHT) {
        if (level == 5 && player.location.x == 520 && player.location.y == 440) { // THIS IS FOR ENTERING LEVEL 6 (THE CASTLE) FROM LEVEL 5 (UNDERWATER)
          player.location.x = 40; // SET X LOCATION NEAR ENTRANCE/EXIT IN LEVEL 6 (CASTLE)
          player.location.y = 840; // SET Y LOCATION NEAR ENTRANCE/EXIT IN LEVEL 6 (CASTLE)
          level = 6;
          // SOUND FILES RESET & CLOSE
          bgm6 = minim.loadFile("mystery_dungeon.mp3");
          splash.close();
          bgm5.close();
        }
        if ( player.location.x != obst.location.x - 80 || player.location.y > obst.location.y) { // IF THERE ARE NO OBSTACLES IN WAY
          player.moveRight();
          // SOUND FILES PLAY & RESET
          footstep.play();
          footstep = minim.loadFile("footstep.mp3");
        }
    }
  }
}
