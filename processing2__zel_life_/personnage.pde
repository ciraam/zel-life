class Personnage {
  String nom;
  int life = 30;
  int atk = 10;
  PImage img;
  int speed = 10;
  float posX, posY;
  boolean stop = true;
  
  Personnage(String nom, PImage img){
    this.nom = nom;
    this.img = img;
  }
  void afficherVie() {
      fill(#FFFFFF);
      textSize(30);
      text("Santé :  " + lifePersonnage + "/" + myPersonnage.life, 10, 30);
  }
}
