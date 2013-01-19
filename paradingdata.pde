import ddf.minim.*;
import fullscreen.*;
AudioPlayer player;
Minim minim;
FullScreen fs; 

String[] countries;
int[] amounts;
int[] originalAmounts;
PImage[] tanks = new PImage[1];
PImage[] soldiers = new PImage[5];
PImage[] mario = new PImage[8];
PImage[] banner = new PImage[12];
PImage plane;
PFont font;
//boolean frameRateOn = false;
//boolean restart = false;
int frameRateVal = 8;

int totalTanks;
int totalCountries = 0;
//int indexGlobal =0;
//float lastTroopX;
ArrayList countryArray;
//boolean still = false;

PImage background;
PImage background_overlay;

void setup() {
  size(1080, 600);
  smooth();
  //frameRate(frameRateVal);
  font = loadFont("CarnivaleeFreakshow-50.vlw");
  textFont(font);
  background = loadImage("background.jpg");
  background_overlay = loadImage("background_overlay.png");
  minim = new Minim(this);
  player = minim.loadFile("sample.mp3", 2048);
 // player.play();
  imageMode (CENTER);

  tanks[0] = loadImage("tanks.png");
  plane = loadImage("plane.png");

  for (int i = 0; i<soldiers.length; i++) {
    soldiers[i] = loadImage("soldiers"+i+".png");
  }  
  for (int i = 0; i<mario.length; i++) {
    mario[i] = loadImage("l"+i+".png");
  }  
  for (int i = 0; i<banner.length; i++) {
    banner[i] = loadImage("banner"+i+".png");
  }
  countryArray = new ArrayList();
  
  //PARSING CSV
  String[] lines = loadStrings("countries.csv");   
  countries = new String[lines.length];
  originalAmounts = new int[lines.length];
  amounts = new int[lines.length];
  totalCountries = totalCountries + countries.length;

  totalTanks = 0;
  for (int i = 0; i < lines.length; i++) {
    String[] values =  split(lines[i], ",");
    // the array values[0] is my list of countries. values [1] is an array of amounts
    countries[i] = values[0];
    // Numbers of tanks to display for each country
    originalAmounts[i] = int(values[1]);
    amounts[i] = (originalAmounts[i]/10);

    // Offset figure is the rolling total of troops as they hit the for loop with an offset of 500
    countryArray.add(new Country((totalTanks*100+i*500), countries[i], amounts[i], originalAmounts[i]));  

    totalTanks = totalTanks + amounts[i];
  }
  fs = new FullScreen(this); 
//  fs.enter();
}

void draw() {
  image (background, width/2, height/2);
  frameRate(frameRateVal);

  for (int i = countryArray.size()-1; i >= 0; i--) { 

    Country countries = (Country) countryArray.get(i);
    countries.CountryCreate();
    textSize(40);
    fill(0);
 //   Country lastCountry = (Country) countryArray.get(countryArray.size()-1); 
 //   lastCountry.lastTroop.displayName(countryName, budget, 300);

    //   countries.xLocation(countries);
    //  if (i == 0)  setup();
  }

  image (background_overlay, width/2, height/2);

  // if (restart = true)
  // setup();
}

void keyPressed() {
     if (key == 'a') {
     player.close();
     setup();
  }
   
      if (key == CODED){
      if (keyCode == LEFT) {
   frameRateVal = frameRateVal + 1;
      }
        if (keyCode == RIGHT  && frameRateVal > 5) {
   frameRateVal = frameRateVal - 1;
      
    }
      }
}

