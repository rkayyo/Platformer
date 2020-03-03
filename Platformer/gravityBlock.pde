class gravityBlock extends FBox {

  public gravityBlock(float x, float y) {
    super(gridSize, gridSize); 
    setPosition(x,y);
    setStatic(true);
    world.add(this);
  }

  void swap() {
    ArrayList<FContact> contacts = this.getContacts();
    for (int j = 0; j < contacts.size(); j++ ) {
      FContact fc = contacts.get(j);
      if (fc.contains(player)) {
        gravitySwitch();
      }
    }
  }

  void show() {
    setFillColor(green);
  }
}
