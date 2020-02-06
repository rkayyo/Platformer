void playerMovement(){
vx = 0;
if(dkey) vx += 500;
if(akey) vx -= 500;
player.setVelocity(vx,player.getVelocityY());
player.setRotatable(false);
player.setFillColor(#FF0000);

 boolean canJump = false;
 ArrayList<FContact> contacts = player.getContacts();
 
 if (wkey && contacts.size() > 0) player.setVelocity(player.getVelocityX(),vy -500);
  


 if (spacekey && bomb == null){
  bomb = new FBomb(); 
 }
 if(bomb != null) bomb.act();
 
}
