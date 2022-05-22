Mover mover;

void setup() {
  size(640, 360);
  // Create Mover object.
  mover = new Mover();
}

void draw() {
  background(255);

  //[full] Call functions on Mover object.
  PVector wind = new PVector(0.05, 0);
  PVector gravity = new PVector(0, .1);
  mover.applyForce(wind);
  mover.applyForce(gravity);
  mover.update();
  mover.checkEdges();
  mover.display();
  //[end]
}
