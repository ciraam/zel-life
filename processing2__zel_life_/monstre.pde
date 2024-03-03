class Monstre {
  String nom;
  int life = 50;
  int atk = 3;
  PImage img;
  int speed = 10;
  float posX, posY;
  int timerMil = millis();  // ne pas toucher pour le bon fonctionnement du jeu
  
  Monstre(String nom, PImage img){
    this.nom = nom;
    this.img = img;
  }
  
  // fonction déplacement monstre
  void deplacementMonstre(){ 
    if (this.life > 0) { 
      if (millis() - this.timerMil > 1150) {  // en milliseconde 1000 = 1s
           int chiffre = int(random(1,5));
          // println(chiffre);
           switch(chiffre) {
              case 1:
                if (testColision2(int(this.posX - this.speed), int(this.posY)) == 0){ 
                   this.posX -= this.speed;  // gauche
                   this.img = loadImage("../image/monstreGauche.png");
                   if (testColision2(int(this.posX - this.speed), int(this.posY)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
              case 2: 
                if (testColision2(int(this.posX + this.speed), int(this.posY)) == 0){ 
                   this.posX +=  this.speed; // droite
                   this.img = loadImage("../image/monstreDroite.png");
                   if (testColision2(int(this.posX + this.speed), int(this.posY)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
              case 3:
                if (testColision2(int(this.posX), int(this.posY - this.speed)) == 0){ 
                   this.posY -=  this.speed;  // haut
                   this.img = loadImage("../image/monstreDos.png");
                   if (testColision2(int(this.posX), int(this.posY - this.speed)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
              case 4: 
                if (testColision2(int(this.posX), int(this.posY + this.speed)) == 0){ 
                    this.posY +=  this.speed;  // bas
                    this.img = loadImage("../image/monstreFace.png");
                    if (testColision2(int(this.posX), int(this.posY + this.speed)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
               case 5:  // la même que case 4, car après test le 4 tombait trop peu souvent
                if (testColision2(int(this.posX), int(this.posY + this.speed)) == 0){ 
                    this.posY +=  this.speed;  // bas
                    this.img = loadImage("../image/monstreFace.png");
                    if (testColision2(int(this.posX), int(this.posY + this.speed)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
            }
        
        this.timerMil = millis(); // commenter cette ligne pour le "rage mode" ahaha
      }
      } else {
         this.img = loadImage("../image/mort.png");
         this.posX = 1000000000;
         this.posY = 1000000000;
         //println("Monstre tué");
   }
  }
  void afficherNomVie() {
      fill(#FFFFFF);
      textSize(13);
      text(this.life + "/50", this.posX, this.posY - 10);
      
      fill(#FFFFFF);
      textSize(13);
      text(this.nom, this.posX - 12, this.posY - 20);
  }
}
