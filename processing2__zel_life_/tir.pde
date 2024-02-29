class Tir {
  float x, y, vx, vy, dy, dx;
  float size;

  Tir(float sourceX, float sourceY, float targetX, float targetY) {
    this.x = sourceX;
    this.y = sourceY;
    this.dx = targetX - sourceX;
    this.dy = targetY - sourceY;
    this.vy = (dy/(Math.abs(dy) + Math.abs(dx)))*13;
    this.vx = (dx/(Math.abs(dy) + Math.abs(dx)))*13;
    this.size = 10;
  }

  void drawTir() {    
    fill(#867F7F);
    ellipse(x, y, 8, 8);
    y+=vy;
    x+=vx;
  }
}

// A VOIR POUR FAIRE TIRER LE BOSS
// Pas sur de mettre la classe, pas une priorité /!\
