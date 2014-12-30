ArrayList<Stars> Galaxy = new ArrayList<Stars>();  //declare a new arraylist called Galaxy with particles called Stars
PImage star;                                       // declare a new image to be used called star


void setup() {
  size(800, 600);                        //declare size of canvas
  star = loadImage("star.png");          //connect the declared PImage "star" with an actual loaded image
  colorMode(HSB, 360, 100, 100, 100);    //declare color mode
}

void draw() {
  if (mousePressed) {                //if the mouse is pressed...
    Galaxy.add(new Stars());         //add more stars to the Galaxy (add particles to the arraylist Galaxy)
  }
  background(0);
  for (int i = Galaxy.size () -1; i >= 0; i--) {  //for every time a particle is taken out of the arraylist...
    Stars s  = Galaxy.get(i);                     //get a new particle "s" and add it to the arraylist
    s.display();                                  //
    s.move();                                     //apply the classes to the sketch
    s.fade();                                     //
    s.offScreen();
    if (s.dead()) {                               //if the particle "s" has conditions that apply to the "dead" boolean...
      Galaxy.remove(i);                           //remove the particle "s"
    }
    if (s.fadesAway ()) {                         //if the particle "s" has conditions that apply to the "fadesAway" boolean...
      Galaxy.remove(i);                           //remove the particle "s"
    }
  }
}


class Stars {                            //declare a new class called Stars
  PVector loc, vel;                      //declare a new PVector loc and vel
  float sz;                              // declare a variable sz
  float opacity;                         // declare a variable opacity
  float life = 255;                      // declare a variable life
  float hue, sat, bright;                // declare variables hue, sat, bright

  Stars() {                                              //define the class Stars
    sz = random(5, 20);                                  //make every star's size a random value between 5 and 20
    loc = new PVector(mouseX, mouseY);                   //make the location of the stars at the mouse  
    vel = new PVector(random(-3, 3), random(-3, 3));     //make the x and y portions of the velocity any random value between -3 and 3 (this will make the stars travel in every direction out of the mouse)
    hue = random(360);                                   //(for colors) let the hue be a random value between 0 and 360
    sat = 100;                                           //
    bright = 100;                                        // set values for sat bright and opacity (for colors)
    opacity = 255;                                       //
  }

  void display() {                                      //new portion of the Stars class called display (how it will be displayed in the program)
    tint(hue, sat, bright, opacity);                    //set the tint of the image (which was originally orange)
    image(star, loc.x, loc.y, sz, sz);                  //let every particle be displayed by the loaded PImage; have its location be loc.x and loc.y (mouseX and mouseY); and let its size be determined by the variable sz
  }

  void move() {                    //new portion of class called move
    loc.add(vel);                  //let the particles move
  }

  void fade() {                    //new portion of class called fade
    opacity = opacity-2;           //for every frame, the opacity of the particle will decrease by 2 until it is completely faded away
  }
  
  void offScreen() {                              //new portion of class called offScreen
    if(loc.x + sz < 0 || loc.x - sz > width){     //if the star is completely off of the right or left side of the screen, the value of life = 0
      life = 0;
    }
    if(loc.y + sz < 0 || loc.y - sz > height){    //if the star is completely off of the top or bottom of the screen, the value of life = 0
      life = 0;
    }
  }


  boolean dead() {                  //declare a way for the particle to be erased

    if (life <= 0) {                 //if the value of life is less than or equal to zero...
      return true;                   //the particle will die
    } else {
      return false;                  //if the value of life is not less than or equal to zero, the particle will not die (see void draw)
    }
  }

  boolean fadesAway () {            //declare a way for the particle to be erased
    if (opacity <= 0) {             //if the opacity of the star is less than or equal to zero...
      return true;                  //the particle will die
    } else {
      return false;                 //if the opacity is not less than or equal to zero, it will not die
    }
  }
}

