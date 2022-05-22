Mover[] movers = new Mover[100];

void setup() {
  size(700, 700);
  // Create Mover object.
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.02, 2.5),0,0);
  }
}

void draw() {
  background(255);

  //[full] Call functions on Mover object.

  PVector wind = new PVector(0.01, 0);
  PVector gravity = new PVector(0, 0.1);
  for (int i = 0; i < movers.length; i++) {

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();  
  }
  
  //[end]
}
