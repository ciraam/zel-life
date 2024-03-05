class Pnj {
  String nom;
  PImage img;
  int speed = 10;
  float posX, posY;
  
  Pnj(String nom, PImage img){
    this.nom = nom;
    this.img = img;
  }
  void afficherNom() {
      fill(#FFFFFF);
      textSize(13);
      text(this.nom, this.posX, this.posY - 20);
  }
  void conversationGuideDepart(){
    image(this.img = loadImage("../image/pnjGuideFace.png"), this.posX, this.posY);
    if (testColision6(int(this.posX), int(this.posY)) == 0){
      image(loadImage("../image/pnjParler.png"), this.posX + 10, this.posY - 20);
    }
    if (testColision6(int(this.posX), int(this.posY)) == 2){
      image(loadImage("../image/bouttonF.png"), this.posX + 10, this.posY - 20);
      if (key == 'f' || key == 'F'){
        image(loadImage("../image/pnjDialogue.png"), 160, 470);
        text("Bienvenue Aventurier, vous voilà dans le village caché Magik !", 265, 500);
        text("Vous semblez débuter, allez donc vous entraîner sur le mannequin.", 265, 525);
        text("Une fois échauffé, aidez-nous à vaincre le donjon s'il vous plaît !", 265, 550);
      }
    }
  }
  void conversationGuideDonjon(){
    image(this.img = loadImage("../image/pnjGuideGauche.png"), this.posX, this.posY);
    if (testColision6(int(this.posX), int(this.posY)) == 0){
      image(loadImage("../image/pnjParler.png"), this.posX + 10, this.posY - 20);
      }
    if (testColision6(int(this.posX), int(this.posY)) == 2){
      image(loadImage("../image/bouttonF.png"), this.posX + 10, this.posY - 20);
      if (key == 'f' || key == 'F'){
        image(loadImage("../image/pnjDialogue.png"), 160, 470);
        textSize(15);
        text("Aventurier, vous voilà maintenant dans le donjon du village !", 265, 500);
        text("Derrière moi se trouve la particularité de notre village, l'eau magique.", 265, 525);
        text("Allez-y donc vous requinquer après un combat contre les monstres !", 265, 550);
      }
    }
  } 
}
