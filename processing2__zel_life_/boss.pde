class Boss {
  String nom;
  int life = 50;
  int atk = 6;
  PImage img;
  int speed = 10;
  float posX, posY;
  int timerMil = millis();  // ne pas toucher pour le bon fonctionnement du jeu
  
  Boss(String nom, float posX, float posY, PImage img){
    this.nom = nom;
    this.posX = posX;
    this.posY= posY;
    this.img = img;
  }
  
  // fonction déplacement boss
  void deplacementBoss(){ 
    if (this.life > 0) { 
      if (millis() - this.timerMil > 1300) {  // en milliseconde 1000 = 1s
           //println(int(random(1,5));
           switch(int(random(1,5))) {
              case 1:
                if (testColision2(int(this.posX - this.speed), int(this.posY)) == 0){ 
                   this.posX -= this.speed;  // gauche
                   //myBoss.img = loadImage("../image/monstreGauche.png");
                   if (testColision5(int(myBoss.posX - myBoss.speed), int(this.posY)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
              case 2: 
                if (testColision2(int(this.posX + this.speed), int(this.posY)) == 0){ 
                   this.posX +=  this.speed; // droite
                   //myBoss.img = loadImage("../image/monstreDroite.png");
                   if (testColision5(int(this.posX + this.speed), int(this.posY)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
              case 3:
                if (testColision2(int(this.posX), int(this.posY - this.speed)) == 0){ 
                   this.posY -=  this.speed;  // haut
                   //myBoss.img = loadImage("../image/monstreDos.png");
                   if (testColision5(int(this.posX), int(this.posY - this.speed)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
              case 4: 
                if (testColision2(int(this.posX), int(this.posY + this.speed)) == 0){ 
                    this.posY +=  this.speed;  // bas
                    //myBoss.img = loadImage("../image/monstreFace.png");
                    if (testColision5(int(this.posX), int(this.posY + this.speed)) == 2){ 
                     //println("dégât");
                     lifePersonnage = lifePersonnage - this.atk;
                     myPersonnage.img = loadImage("../image/persoDegat.png");
                  }
                }
                
                break;
               case 5:  // la même que case 4, car après test le 4 tombait trop peu souvent
                if (testColision2(int(this.posX), int(this.posY + this.speed)) == 0){ 
                    this.posY +=  this.speed;  // bas
                    //myBoss.img = loadImage("../image/monstreFace.png");
                    if (testColision5(int(this.posX), int(this.posY + this.speed)) == 2){ 
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
      text(this.life + "/50", this.posX + 50, this.posY);
      
      fill(#FFFFFF);
      textSize(13);
      text(this.nom, this.posX + 35, this.posY - 10);
  }
}
