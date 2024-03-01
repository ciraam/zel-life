class Personnage {
  String nom;
  int life = 30;
  int atk = 10;
  PImage img;
  int speed = 10;
  float posX, posY;
  boolean stop = true;
  
  Personnage(String nom, float posX, float posY, PImage img){
    this.nom = nom;
    this.posX = posX;
    this.posY = posY;
    this.img = img;
  }
  void afficherVie() {
      fill(#FFFFFF);
      textSize(30);
      text("Vie :  " + lifePersonnage + "/" + myPersonnage.life, 10, 30);
  }
}
