class Particle {
  PVector pos;
  color col;
  PVector vel;
  int size;
  Particle(float x, float y, color col, PVector vel) {
    pos=new PVector(x, y);
    this.col=col;
    this.vel=vel;
    size=int(random(10, 50));
  }

  void display() {
    stroke(color(red(col)/2, green(col)/2, blue(col)/2));
    strokeWeight(5);
    fill(col);
    circle(pos.x, pos.y, size);
  }

  void tick() {
    pos.add(vel);
    vel.add(0, 0.6);
  }

  boolean finished() {
    if (pos.y>height+size*2) {
      return true;
    }
    if (pos.x<0-size*2||pos.x>width+size*2) {
      return true;
    }
    return false;
  }
}
