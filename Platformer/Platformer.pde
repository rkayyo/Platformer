import fisica.*;


color black = #000000;
color orange = #FA6900;

PImage map;
int x = 0;
int y = 0;
int gridSize = 40;
int zoom;
FBomb bomb = null;

float vx,vy;

boolean akey,wkey,skey,dkey,spacekey,ekey;

ArrayList<FBox> boxes = new ArrayList<FBox>();

FBox player;

FWorld world;

void setup(){
 size(1000,1000);
 Fisica.init(this);
 world = new FWorld();
 world.setGravity(0,900);
 
 map = loadImage("map.png");
 
 
 player = new FBox(45,45);
 player.setPosition(50,height - 500);
 player.setStatic(false);
 world.add(player);
 

 
 while ( y < map.height ) {
   
   color c = map.get(x,y);
   
   if (c == #000000){
    FBox b = new FBox(gridSize,gridSize);
    b.setStatic(true);
    b.setFillColor(black);
    b.setPosition(x*gridSize,y*gridSize);
    world.add(b);
    boxes.add(b);
   }
   
   x++;
   
   
   if ( x == map.width ) {
    x = 0;
    y++;
  }
 }
 
 

}

 void draw(){
   background(255);
   
   pushMatrix();
   translate(-player.getX() + width/2 ,-player.getY() + height/2);
   world.step();
   world.draw();
   popMatrix();
   playerMovement();
 }

void keyPressed(){
  if (key == 'W' || key == 'w' ) wkey = true;
  if (key == 'S' || key == 's' ) skey = true;
  if (key == 'A' || key == 'a' ) akey = true;
  if (key == 'D' || key == 'd' ) dkey = true; 
  if (key == 'E' || key == 'e' ) ekey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased(){
  if (key == 'W' || key == 'w' ) wkey = false;
  if (key == 'S' || key == 's' ) skey = false;
  if (key == 'A' || key == 'a' ) akey = false;
  if (key == 'D' || key == 'd' ) dkey = false; 
  if (key == 'E' || key == 'e' ) ekey = false;
  if (key == ' ') spacekey = false;
}
