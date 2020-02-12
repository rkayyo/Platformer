
class Player extends FBox{
int hp = 3;

  
public Player(){
super(gridSize,gridSize);
setPosition(50,50);

  
  
}

void show(){
  
setPosition(this.getX(),this.getY());
setStatic(false);


  
  
}

void playerMovement(){
vx = 0;
if(dkey) vx += 500;
if(akey) vx -= 500;
this.setVelocity(vx,this.getVelocityY());
this.setRotatable(false);
this.setFillColor(#FF0000);

 boolean canJump = false;
 ArrayList<FContact> contacts = this.getContacts();
 
  
if (wkey && contacts.size() > 0) this.setVelocity(this.getVelocityX(),vy -500);

 if (spacekey && bomb == null){
  bomb = new FBomb(); 
 }
 if(bomb != null) bomb.act();
 
 }
}
