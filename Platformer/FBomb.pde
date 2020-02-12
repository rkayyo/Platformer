class FBomb extends FBox {

  int timer;
  int worldRemoveTimer;

  public FBomb() {
    super(gridSize, gridSize);
    timer = 60;
    worldRemoveTimer = 10;
    this.setFillColor(orange);
    this.setPosition(player.getX() + gridSize, player.getY());
    world.add(this);
  }


  void act() {
    timer--;
    if (timer == 0) {
      explode();
      world.remove(this);
      bomb = null;
      timer = 60;
    }
  }


  void explode() {
    for (int i = 0; i < boxes.size(); i++) {
      FBox b = boxes.get(i);
      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 200) {
        b.setStatic(false);
        vx = b.getX() - this.getX();
        vy = b.getY() - this.getY();
        b.setVelocity(vx, vy);
        worldRemoveTimer--;
      }
      if (worldRemoveTimer == 0) {
        world.remove(b);
        worldRemoveTimer = 10;
      }
    }
  }
}
