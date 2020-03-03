
class Player extends FBox{
int hp = 3;
int i = 0;
boolean invincible;

  
public Player(){
super(gridSize,gridSize);
setPosition(50,50);
setFillColor(purple);

  
  
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


 boolean canJump = false;
 ArrayList<FContact> contacts = this.getContacts();
 
  
if (wkey && contacts.size() > 0){
  if(gravity > 0){
    this.setVelocity(this.getVelocityX(),vy -500);
  }else{
    this.setVelocity(this.getVelocityX(),vy +500);
  }
}

 if (spacekey && bomb == null){
  bomb = new FBomb(); 
 }
 if(bomb != null) bomb.act();
 

 
 
 }
 
void dmgtaken(){

  hp -=1;
  invincible = true;
  setFillColor(lightpurple);
  
  
  
  
  //println(i);
  //if(i < 90){
  //  hp -= 1;
  //  invincible = true;
  //}else {
  // invincible = false;
  // i = 0;
  //}
  //i++;
   
   
   
 }
}
