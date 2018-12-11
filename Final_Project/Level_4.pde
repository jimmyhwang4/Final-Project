// IMAGE CALLS
PImage dock;
PImage ocean;



// IMAGE FUNCTIONS
void dock(float dockx, float docky) {
  imageMode(CENTER);
  image(dock, dockx, docky - 40);
  dock.resize(240, 320);
}

void ocean(float ox, float oy) {
  imageMode(CENTER);
  image(ocean, ox, oy);
  ocean.resize(880, 880);
}
