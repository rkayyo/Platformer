class Door extends FBox {

  public Door(float x, float y) {

    super(gridSize, gridSize);
    setPosition(x*gridSize, y*gridSize);
    setStatic(true);
    setFillColor(brown);
    world.add(this);
  }

  void act() {
    ArrayList<FContact> contacts = this.getContacts();
    for (int i = 0; i < inventory.size(); i++) {
      FBody doorOpener = inventory.get(i);
      if (doorOpener instanceof Key) {
        for (int j = 0; j < contacts.size(); j++) {
          FContact ifKey = contacts.get(j);
          if (ifKey.contains(player)) {
            iBoxes.remove(this);
            world.remove(this);
          }
        }
      }
    }
  }
}
