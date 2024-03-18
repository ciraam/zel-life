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
      image(loadImage("../image/hudViePerso.png"), 15, 15);
      if (lifePersonnage == 30){
         image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieVerte.png"), 121, 31);
         image(loadImage("../image/vieVerte.png"), 129, 31);
         image(loadImage("../image/vieVerte.png"), 137, 31);
         image(loadImage("../image/vieVerte.png"), 145, 31);
         image(loadImage("../image/vieVerte.png"), 153, 31);
         image(loadImage("../image/vieVerte.png"), 161, 31);
      } 
      else if (lifePersonnage >= 28 && lifePersonnage < 30){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieVerte.png"), 121, 31);
         image(loadImage("../image/vieVerte.png"), 129, 31);
         image(loadImage("../image/vieVerte.png"), 137, 31);
         image(loadImage("../image/vieVerte.png"), 145, 31);
         image(loadImage("../image/vieVerte.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 26 && lifePersonnage < 28){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieVerte.png"), 121, 31);
         image(loadImage("../image/vieVerte.png"), 129, 31);
         image(loadImage("../image/vieVerte.png"), 137, 31);
         image(loadImage("../image/vieVerte.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 24 && lifePersonnage < 26){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieVerte.png"), 121, 31);
         image(loadImage("../image/vieVerte.png"), 129, 31);
         image(loadImage("../image/vieVerte.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 22 && lifePersonnage < 24){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieVerte.png"), 121, 31);
         image(loadImage("../image/vieVerte.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 20 && lifePersonnage < 22){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieVerte.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 18 && lifePersonnage < 20){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieVerte.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 16 && lifePersonnage < 18){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieVerte.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 14 && lifePersonnage < 16){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieVerte.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 12 && lifePersonnage < 14){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieVerte.png"), 88, 31);
         image(loadImage("../image/vieRouge.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 10 && lifePersonnage < 12){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieVerte.png"), 73, 31);
         image(loadImage("../image/vieVerte.png"), 81, 31);
         image(loadImage("../image/vieRouge.png"), 88, 31);
         image(loadImage("../image/vieRouge.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 8 && lifePersonnage < 10){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieVerte.png"), 65, 31);
         image(loadImage("../image/vieRouge.png"), 73, 31);
         image(loadImage("../image/vieRouge.png"), 81, 31);
         image(loadImage("../image/vieRouge.png"), 88, 31);
         image(loadImage("../image/vieRouge.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 6 && lifePersonnage < 8){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieVerte.png"), 49, 31);
         image(loadImage("../image/vieVerte.png"), 57, 31);
         image(loadImage("../image/vieRouge.png"), 65, 31);
         image(loadImage("../image/vieRouge.png"), 73, 31);
         image(loadImage("../image/vieRouge.png"), 81, 31);
         image(loadImage("../image/vieRouge.png"), 88, 31);
         image(loadImage("../image/vieRouge.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 4 && lifePersonnage < 6){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieVerte.png"), 41, 31);
         image(loadImage("../image/vieRouge.png"), 49, 31);
         image(loadImage("../image/vieRouge.png"), 57, 31);
         image(loadImage("../image/vieRouge.png"), 65, 31);
         image(loadImage("../image/vieRouge.png"), 73, 31);
         image(loadImage("../image/vieRouge.png"), 81, 31);
         image(loadImage("../image/vieRouge.png"), 88, 31);
         image(loadImage("../image/vieRouge.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      else if (lifePersonnage >= 2 && lifePersonnage < 4){
        image(loadImage("../image/vieVerte.png"), 33, 31);
         image(loadImage("../image/vieRouge.png"), 41, 31);
         image(loadImage("../image/vieRouge.png"), 49, 31);
         image(loadImage("../image/vieRouge.png"), 57, 31);
         image(loadImage("../image/vieRouge.png"), 65, 31);
         image(loadImage("../image/vieRouge.png"), 73, 31);
         image(loadImage("../image/vieRouge.png"), 81, 31);
         image(loadImage("../image/vieRouge.png"), 88, 31);
         image(loadImage("../image/vieRouge.png"), 97, 31);
         image(loadImage("../image/vieRouge.png"), 105, 31);
         image(loadImage("../image/vieRouge.png"), 113, 31);
         image(loadImage("../image/vieRouge.png"), 121, 31);
         image(loadImage("../image/vieRouge.png"), 129, 31);
         image(loadImage("../image/vieRouge.png"), 137, 31);
         image(loadImage("../image/vieRouge.png"), 145, 31);
         image(loadImage("../image/vieRouge.png"), 153, 31);
         image(loadImage("../image/vieRouge.png"), 161, 31);
      }
      fill(#000000);
      textSize(14);
      text(lifePersonnage + "/" + myPersonnage.life, 82, 42);
  }
}
