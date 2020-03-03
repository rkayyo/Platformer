class Lava extends FBox {


  public Lava(float x, float y) {
    super(gridSize, gridSize);
    
    this.setPosition(x*gridSize, y*gridSize);
    world.add(this);
  }

  void act() {
    if (dist(this.getX(), this.getY(), player.getX(), player.getY()) < 35) {
      if (player.invincible == false) {
        player.dmgtaken();
      }
    }
  }

  void show() {
   this.setStatic(true);
   this.setFillColor(red);
   
   
  }
}
