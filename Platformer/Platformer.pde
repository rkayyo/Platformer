import fisica.*;


color black = #000000;
color orange = #FA6900;
color red = #FF0000;
color grey = #7f7f7f;

PImage map;
int x = 0;
int y = 0;
int gridSize = 40;
int zoom;
FBomb bomb = null;

float vx, vy;

boolean akey, wkey, skey, dkey, spacekey, ekey;

ArrayList<FBox> boxes = new ArrayList<FBox>();

Player player;


FWorld world;

void setup() {

  size(1000, 1000);
  Fisica.init(this);
  world = new FWorld(-5000,-5000,5000,5000);
  world.setGravity(0, 900);
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
      FBox lava = new FBox(gridSize, gridSize);
      lava.setStatic(true);
      lava.setFillColor(red);
      lava.setPosition(x*gridSize, y*gridSize);
      world.add(lava);
      boxes.add(lava);
    }else if (c == grey){
      FBox border = new FBox(gridSize, gridSize);
      border.setStatic(true);
      border.setFillColor(grey);
      border.setPosition(x*gridSize, y*gridSize);
      world.add(border);
    }

    x++;


    if ( x == map.width ) {
      x = 0;
      y++;
    }
  }
}

void draw() {
  background(255);
  player.playerMovement();
  player.show();
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();
}

void keyPressed() {
  if (key == 'W' || key == 'w' ) wkey = true;
  if (key == 'S' || key == 's' ) skey = true;
  if (key == 'A' || key == 'a' ) akey = true;
  if (key == 'D' || key == 'd' ) dkey = true; 
  if (key == 'E' || key == 'e' ) ekey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (key == 'W' || key == 'w' ) wkey = false;
  if (key == 'S' || key == 's' ) skey = false;
  if (key == 'A' || key == 'a' ) akey = false;
  if (key == 'D' || key == 'd' ) dkey = false; 
  if (key == 'E' || key == 'e' ) ekey = false;
  if (key == ' ') spacekey = false;
}
