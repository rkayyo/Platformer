void blockInteractions() {

  for (int i = 0; i < iBoxes.size(); i++) {
    FBox object = iBoxes.get(i);
    if (object instanceof Lava) {
      ((Lava) object).act();
      ((Lava) object).show();
    } else if (object instanceof gravityBlock) {
      ((gravityBlock) object).swap(); 
      ((gravityBlock) object).show();
    } else if ( object instanceof Door) {
      ((Door) object).act();
    } else if (object instanceof Key) {
      ((Key) object).act();
    }
  }
}
