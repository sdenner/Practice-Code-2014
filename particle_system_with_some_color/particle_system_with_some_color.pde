ArrayList<Stars> Galaxy = new ArrayList<Stars>();
PImage star;


void setup() {
  size(800, 600);
  star = loadImage("star.png");
  colorMode(HSB,360,100,100,100);
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
    s.fade();
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
  float hue,sat,bright,alpha;

  Stars() {
    sz = random(5, 20);
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(random(-3, 3), random(-3, 3));
    hue = random(360);
    sat = 100;
    bright = 100;
    opacity = 255;
  }

  void display() {
    tint(hue,sat,bright,opacity);
    image(star, loc.x,loc.y,sz,sz);
  }

  void move() {
    loc.add(vel);
  }
  
  void fade() {
    opacity = opacity-2;
  }
  
  
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

