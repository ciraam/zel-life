class Boss {
  String nom;
  int life = 50;
  int mana = 20;
  int atk = 6;
  int def = 6;
  PImage img;
  int speed = 5;
  float posX, posY;
  
  Boss(String nom, float posX, float posY, PImage img){
    this.nom = nom;
    this.posX = posX;
    this.posY= posY;
    this.img = img;
  }
}
