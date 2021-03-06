class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);

    acceleration = new PVector(0.0f, 0.00f);
    topspeed = 10;
  }

  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175);
    // The Mover is displayed.
    ellipse(location.x, location.y, mass * 16, mass *  16);
  }


  void drag(Liquid l)
  {
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed;
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
  }

  boolean isInside(Liquid l) {
    //[offset-down] This conditional statement determines if the PVector location is inside the rectangle defined by the Liquid class.
    if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
    {
      return true;
    } else {
      return false;
    }
  }

  void checkEdges() {


    if (location.x > width)
    {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0)
    {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height)
    {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
