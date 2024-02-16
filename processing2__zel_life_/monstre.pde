class Monstre {
  String nom;
  int life = 20;
  int mana = 10;
  int atk = 3;
  int def = 3;
  PImage img;
  int speed = 5;
  float posX, posY;
  
  Monstre(String nom, float posX, float posY, PImage img){
    this.nom = nom;
    this.posX = posX;
    this.posY = posY;
    this.img = img;
  }
}
