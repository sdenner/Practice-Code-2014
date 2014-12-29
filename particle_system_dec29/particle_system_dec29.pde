ArrayList<Stars> Galaxy = new ArrayList<Stars>();
PImage star;


void setup() {
  size(800, 600);
  star = loadImage("star.png");
}

void draw() {
  if (mousePressed) {
    Galaxy.add(new Stars());
  }
  background(0);
  for (int i = Galaxy.size () -1; i >= 0; i--) {
    Stars s  = Galaxy.get(i);
    s.display();
    s.move();
    s.gone();
//    s.fade();
    if (s.dead()) {
      Galaxy.remove(i);
    }
    if (s.fadesAway ()) {
      Galaxy.remove(i);
    }
  }
//  image(star, loc[i].x,loc[i].y,star.sz[i],sz[i]);
}


class Stars {
  PVector loc, vel;
  float sz;
  float opacity;
  float life = 255;

  Stars() {
    sz = random(5, 20);
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(random(-3, 3), random(-3, 3));
    opacity = 255;
  }

  void display() {
    fill(86, opacity);
    image(star, loc.x,loc.y,sz,sz);
  }

  void move() {
    loc.add(vel);
  }
  
  void gone() {
    opacity = opacity-2;
  }
  
//  void fade() {
//    if(vel.x>0 || vel.y>0){
//      sz--;
//    }
//  }
  
  boolean dead() {
    //stars fade out
    //life --;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean fadesAway () {
    if (opacity <= 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

