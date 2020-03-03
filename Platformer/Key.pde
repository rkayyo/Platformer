class Key extends FBox {

  public Key(float x, float y) {
    super(gridSize, gridSize);
    setPosition(x*gridSize,y*gridSize);
    setFillColor(yellow);
    setStatic(true);
    world.add(this);
  }
  
  
  
  void act(){
   ArrayList<FContact> contacts = this.getContacts(); 
   for(int i = 0; i < contacts.size(); i++){
    FContact fc = contacts.get(i);
    if(fc.contains(player)){
     inventory.add(this);
     iBoxes.remove(this);
     world.remove(this);
    }
   }
  }
}
