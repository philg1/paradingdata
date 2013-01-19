class Troops {
  float x, y;
  float xPlane, speedPlane;
  float speed;
  float w, h;
  float frame = 0;

  PImage[] images;
  int counter = 0;
  int ticker = 0;

  Troops(PImage[] tempImages, float tempX, float tempY, float tempW, float tempH) {
    images = tempImages;
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = -17;
  }

  void display() {
    image(images[counter], x, y + 10, w, h);
    counter = (counter + 1) % images.length;
  }

  void displayFlag(PImage flag) {
    image(flag, x - 47, y - 35, 45, 100);
    //    frame = (frame +1) % flag.length;
  }

  void planeFly() {
    image(plane, x - 175, y - 385, 153, 50);
  }

  void displayName(String countryName, int budget, float nameX) {
    //   if (still = true) {
    nameX = x;
    text(countryName + " : $" + budget +" billion", nameX -75, 85);
    //   }
    //  else {
    //  nameX = 300;
  }

  void bannerFly() {
    image(banner[counter], x + 100, y - 380, 830, 55);
    ticker = (ticker + 1) % banner.length;
  }

  void move() {
    x = x + speed;
  }
}

