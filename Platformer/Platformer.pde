import fisica.*;


float gravity = 1200;
color black = #000000;
color orange = #FA6900;
color red = #FF0000;
color grey = #7f7f7f;
color pink = #FF6464;
color purple = #990099;
color lightpurple = #ec00ec;
color green = #64cc74;
color brown = #804000;
color yellow = #fff200;



PImage map;
int x = 0;
int y = 0;
int gridSize = 30;
int zoom;
int dmgTimer = 0;
int gravityTimer = 0;
FBomb bomb = null;

float vx, vy;

boolean akey, wkey, skey, dkey, spacekey, ekey;

ArrayList<FBox> boxes = new ArrayList<FBox>();
ArrayList<FBox> iBoxes = new ArrayList<FBox>();
ArrayList<FBody> inventory = new ArrayList<FBody>();

Player player;


FWorld world;

void setup() {

  size(1000, 1000);
  Fisica.init(this);
  world = new FWorld(-5000, -5000, 5000, 5000);
  world.setGravity(0, 1200);
  player = new Player();
  world.add(player);

  map = loadImage("map.png");








  while ( y < map.height ) {

    color c = map.get(x, y);

    if (c == black) {
      FBox b = new FBox(gridSize, gridSize);
      b.setStatic(true);
      b.setFillColor(black);
      b.setPosition(x*gridSize, y*gridSize);
      world.add(b);
      boxes.add(b);
    } else if (c == red) {
      iBoxes.add(new Lava(x, y));
    } else if (c == grey) {
      FBox border = new FBox(gridSize, gridSize);
      border.setStatic(true);
      border.setFillColor(grey);
      border.setPosition(x*gridSize, y*gridSize);
      world.add(border);
    } else if (c == green) {
      iBoxes.add(new gravityBlock(x*gridSize, y*gridSize));
    }else if(c == brown){
     iBoxes.add(new Door(x,y)); 
    }else if(c == yellow){
     iBoxes.add(new Key(x,y)); 
    }

    x++;


    if ( x == map.width ) {
      x = 0;
      y++;
    }
  }
}

void draw() {
  println(inventory);
  background(255);
  player.playerMovement();
  player.show();
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();
  world.setGravity(0, gravity);
  fill(0);
  text(player.hp, 100, 100);
  blockInteractions();

  if (player.invincible == true) {
    if (dmgTimer < 90) {
      dmgTimer++;
      println(dmgTimer);
    } else if (dmgTimer >= 90) {
      player.invincible = false;
      dmgTimer = 0;
      player.setFillColor(purple);
    }
  }
}

void keyPressed() {
  if (key == 'W' || key == 'w' ) wkey = true;
  if (key == 'S' || key == 's' ) skey = true;
  if (key == 'A' || key == 'a' ) akey = true;
  if (key == 'D' || key == 'd' ) dkey = true; 
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (key == 'W' || key == 'w' ) wkey = false;
  if (key == 'S' || key == 's' ) skey = false;
  if (key == 'A' || key == 'a' ) akey = false;
  if (key == 'D' || key == 'd' ) dkey = false; 
  if (key == 'E' || key == 'e' ) gravity *= -1;
  if (key == ' ') spacekey = false;
}

void gravitySwitch() {
  if (gravityTimer == 0) {
    gravity *= -1;
    gravityTimer++;
  }
  if (gravityTimer < 20 && gravityTimer > 0) {
    gravityTimer++;
  }
  if (gravityTimer >= 20) {
    gravityTimer = 0;
  }
}
