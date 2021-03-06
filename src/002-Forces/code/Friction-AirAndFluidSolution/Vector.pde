
// Five moving bodies
Mover[] movers = new Mover[15];

// Liquid
Liquid liquid;

void setup() {
  size(1000, 500);
  reset();
  // Create liquid object
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);

  // Draw water
  liquid.display();

  for (int i = 0; i < movers.length; i++) {

    // Is the Mover in the liquid?
    if (liquid.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = liquid.drag(movers[i]);
      line(movers[i].position.y * .25, movers[i].position.x * sin(liquid.x), movers[i].position.x, movers[i].position.y);
      
      line(width / 2.0f, height / 2., movers[i].position.y, movers[i].position.x);
      
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);
    
    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

  fill(0);

}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 2.5), 40+i*70, 0);
  }
}
