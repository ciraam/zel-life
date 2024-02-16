class Personnage {
  String nom;
  int life = 30;
  int mana = 15;
  int atk = 10;
  int def = 10;
  PImage img;
  int speed = 10;
  float posX, posY;
  
  Personnage(String nom, float posX, float posY, PImage img){
    this.nom = nom;
    this.posX = posX;
    this.posY = posY;
    this.img = img;
  }
}
