PImage inCabin; // MORE IMAGE CALLS (WILL SEE THIS IN ALMOST EVERY LEVEL PROCESSING FILE)

void inCabin(float icx, float icy) { // CABIN IMAGE FUNCTION
  imageMode(CENTER);
  image(inCabin, icx, icy);
  inCabin.resize(880, 880);
}



// FIREPLACE FUNCTION
void fire(int fireX, int fireY) {
  
  fill(255, 0, 0); // RED
  ellipse( random( fireX - 100, fireX + 100), random( fireY - 20, fireY + 40), random(20), random(160) ); // RANDOMLY SET ELLIPSE VALUES TO MAKE FIRE EFFECT
  ellipse( random( fireX - 100, fireX + 100), random( fireY - 20, fireY + 40), random(30), random(160) );
  ellipse( random( fireX - 100, fireX + 100), random( fireY - 20, fireY + 40), random(40), random(160) );
  
  fill(255, 165, 0); // ORANGE
  ellipse( random( fireX - 100, fireX + 100), random( fireY - 20, fireY + 40), random(20), random(140) );
  ellipse( random( fireX - 100, fireX + 100), random( fireY - 20, fireY + 40), random(20), random(140) );
  
  fill(255, 255, 102); // YELLOW
  ellipse( random( fireX - 100, fireX + 100), random( fireY - 20, fireY + 40), random(20), random(120) );
  
}
