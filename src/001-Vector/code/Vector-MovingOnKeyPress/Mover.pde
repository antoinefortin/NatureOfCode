class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
        
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
     
    acceleration = new PVector(0.0f,0.00f);
    topspeed = 10;
  }
  void update() {

    
    if (keyPressed)
    {
       if (key == 'b' || key == 'B') 
       {
          acceleration = new PVector(0.01f,0.00f);
       }
       if (key == 'v' || key == 'V') 
       {
          acceleration = new PVector(-0.02f,0.00f);
       }
       
       // Kill moving
       if (key == 'c' || key == 'C')
       {
        
          acceleration = new PVector(0.0f, 0.0f);
          velocity = new PVector(0.0f, 0.0f);
       }
    }
    
        // The Mover moves.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);
    // The Mover is displayed.
    ellipse(location.x,location.y,16,16);
  }

  
    void checkEdges() {


      if (location.x > width) {
        location.x = 0;
      } else if (location.x < 0) {
        location.x = width;
      }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  

  }
  
}
