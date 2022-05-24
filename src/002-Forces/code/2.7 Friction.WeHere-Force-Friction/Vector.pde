/*
  Apply constant gravity 
*/

Mover[] movers = new Mover[10];
PVector wind = new PVector(0.02, 0);
PVector gravity = new PVector(0, .5);

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
    
    float m = movers[i].mass;
    
    float c = 0.05;
    
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
   
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);


    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

  //[end]
}
