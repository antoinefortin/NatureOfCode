/*
  Apply constant gravity 
*/

Mover[] movers = new Mover[100];

void setup() {
  size(700, 700);
  // Create Mover object.
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1.0, 5.5), 0, 0);
  }
}

void draw() {
  background(255);

  //[full] Call functions on Mover object.
  for (int i = 0; i < movers.length; i++) {
    PVector wind = new PVector(0.01, 0);
    float m = movers[i].mass;
    PVector gravity = new PVector(0, .1*m);

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);


    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

  //[end]
}
