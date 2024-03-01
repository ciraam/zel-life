 //ArrayList<Tir> tir = new ArrayList<Tir>();

Mouse myMouse;
Menu myMenuJouer;
Menu myMenuQuitter;
Menu myMenuReprendre;
Menu myMenuReprendreMenu;
Menu myMenuReprendreMenu2;
Menu myMenuSurvol;
Menu myMenuSurvol2;
Personnage myPersonnage;
Donjon myDonjon;
Donjon myDonjonBoss;
Donjon myDonjonPorteOuverte;
Monstre myMonstre;
Monstre myMonstre2;
Monstre myMonstre3;
Boss myBoss;
PImage persoFaceImg;
PImage mapImg;
PImage donjonImg;
PImage donjonBossImg;
PImage donjonPorteOuverteImg;
PImage mouseImg;
PImage mouseNoCursorImg;
PImage bossDonjonImg;
PImage monstreDonjonImg;
PImage menuPrincipal;
PImage menuTitre;
PImage menuPrincipalJouer;
PImage menuPrincipalQuitter;
PImage fondBlancOpaq;
PImage reprendreImg;
PImage reprendreMenuImg;
PImage reprendreSurvolImg;
boolean gameStatus = true;  // ne pas toucher pour le bon fonctionnement du jeu
int etat = 4;  // ne pas toucher pour le bon fonctionnement du jeu
int timerMilli;
long timerSeconde;
long timerMin;
int lifeBoss;
int lifePersonnage;

void setup(){
  hint(ENABLE_KEY_REPEAT);
  size(1000, 600, P2D);
  timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*

  menuPrincipal = loadImage("../image/menuPrincipal1.png");
  menuTitre = loadImage("../image/titre.gif", "gif");
  menuPrincipalJouer = loadImage("../image/jouer.png");
  menuPrincipalQuitter = loadImage("../image/quitter.png");
  fondBlancOpaq = loadImage("../image/fondBlanc.png");
  fondBlancOpaq.resize(1000,600);
  reprendreImg = loadImage("../image/reprendre.png");
  reprendreMenuImg = loadImage("../image/reprendreMenu.png");
  reprendreSurvolImg = loadImage("../image/reprendreSurvol.png");
  
  myMenuJouer = new Menu(410, 250, menuPrincipalJouer);
  myMenuQuitter = new Menu(410, 400, menuPrincipalQuitter);
  myMenuReprendre = new Menu(410, 250, reprendreImg);
  myMenuReprendreMenu = new Menu(410, 400, reprendreMenuImg);
  myMenuReprendreMenu2 = new Menu(410, 330, reprendreMenuImg);
  myMenuSurvol = new Menu(410, 400, reprendreSurvolImg);
  myMenuSurvol2 = new Menu(410, 400, reprendreSurvolImg);
  
  mouseImg = loadImage("../image/mouse.png");
  mouseNoCursorImg = loadImage("../image/noCursor.png");
  myMouse = new Mouse(mouseImg);
  
  persoFaceImg = loadImage("../image/persoFace.png");
  myPersonnage = new Personnage("Zel", 624, 20, persoFaceImg);
  // (width-persoFaceImg.width/2), height-persoFaceImg.height-12,
  lifePersonnage = myPersonnage.life;
  
  donjonImg = loadImage("../image/donjon.png");
  myDonjon = new Donjon(donjonImg);
  donjonImg.resize(1000,600);
  donjonBossImg = loadImage("../image/donjonBoss.png");
  donjonPorteOuverteImg = loadImage("../image/porteOuverte1.png");
  myDonjonBoss = new Donjon(donjonBossImg);
  donjonBossImg.resize(1000,600);
  myDonjonPorteOuverte = new Donjon(donjonPorteOuverteImg);
  
  monstreDonjonImg = loadImage("../image/monstreFace.png");
  myMonstre = new Monstre("Squelette", 100, 100, monstreDonjonImg);
  myMonstre2 = new Monstre("Squelette", 250, 250, monstreDonjonImg);
  myMonstre3 = new Monstre("Squelette", 400, 400, monstreDonjonImg);
  
  bossDonjonImg = loadImage("../image/boss.png");
  myBoss = new Boss("Roi squelete", 120, 120, bossDonjonImg);
  lifeBoss = myBoss.life;
}

void draw(){
  myMouse.posX = pmouseX;
  myMouse.posY = pmouseY;
  
  if (gameStatus == true && etat == 4){
    menuPause(etat);
    if (testColisionMenu() == 3){
          image(reprendreSurvolImg, myMenuJouer.posX, myMenuJouer.posY);
          if (testColisionMenu() == 3 && mousePressed == true){
            etat = 2;
          }
     }
     if (testColisionMenu() == 4){
          image(myMenuSurvol.img, myMenuSurvol.posX, myMenuSurvol.posY); 
          if (millis() - timerMilli > 150) {  // en milliseconde 1000 = 1s
           /* if ((testColision4(int(myMenuSurvol.posX),int(myMenuSurvol.posY)) == 2 && mousePressed == true)){  //  différent car bidouillage pour éviter en très majeure partie du temps le bug*
              gameStatus = false;  //  *bug (ou conflit) qui fait que si on fait jouer puis pause puis retour menu principal on quitte directement le jeu sans retourner au menu principal
            } */
            if ((testColisionMenu() == 4 && mousePressed == true)){
              gameStatus = false;
              //println("Quitter");
            } 
            timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
          } 
      } 
  }
  if (gameStatus == true && etat == 2) {
       menuPause(etat);
       timerMin = minute();  
       timerSeconde = second();
  }
  if (gameStatus == true && etat == 3) {
       menuPause(etat);
       timerMin = minute();  
       timerSeconde = second();
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2){
            image(reprendreSurvolImg, myMenuReprendre.posX, myMenuReprendre.posY);
            //println("Reprendre");
            if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true){
                  etat = 2;
             }
        }
        if (testColision4(int(myMenuReprendreMenu.posX), int(myMenuReprendreMenu.posY)) == 2){
             image(reprendreSurvolImg, myMenuReprendreMenu.posX, myMenuReprendreMenu.posY);
             //println("Menu principal");
             if (testColision4(int(myMenuReprendreMenu.posX), int(myMenuReprendreMenu.posY)) == 2 && mousePressed == true){
                  etat = 4;
              }
         }
         
  }
  if (gameStatus == true && etat == 5) {
       menuPause(etat);
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColisionMortMenu() == 1){
             image(myMenuSurvol2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
             //println("Menu principal");
             if (testColisionMortMenu() == 1 && mousePressed == true){
                  etat = 4;
              }
        }
  }
  if (gameStatus == true && etat == 6) {
       menuPause(etat);
       timerMin = minute();  
       timerSeconde = second();
  }
  if (gameStatus == false) {  // à voir pour rajouter une confirmation oui/non
       menuPause(etat = 1);
  }
}
void keyPressed(){
  if (myPersonnage.stop == true){ 
    if (lifePersonnage > 0){
      if (keyCode == LEFT) {
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 0){ 
             myPersonnage.posX -= myPersonnage.speed;
             myPersonnage.img = loadImage("../image/persoGauche.png");
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 2){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 3){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre2.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 4){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre3.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColisionZone() == 1){
             //println("Zone");
             etat = 6;
             myPersonnage.posX = 925;
             myPersonnage.posY = 400;
         }
      }
      if (keyCode == RIGHT){
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 0){ 
           myPersonnage.posX += myPersonnage.speed;
           myPersonnage.img = loadImage("../image/persoDroite.png");
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 2){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 3){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre2.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 4){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre3.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColisionZone() == 2){
             //println("Zone");
             etat = 2;
             myPersonnage.posX = 55;
             myPersonnage.posY = 415;
         }
      }
      if (keyCode == UP){
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 0){ 
           myPersonnage.posY -= myPersonnage.speed;
           myPersonnage.img = loadImage("../image/persoDos.png");
        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 2){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 3){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre2.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 4){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myMonstre3.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
      }
      if (keyCode == DOWN){
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 0){ 
          myPersonnage.posY += myPersonnage.speed;
          myPersonnage.img = loadImage("../image/persoFace.png");
        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 2){ 
          //println("dégât");
          lifePersonnage = lifePersonnage - myMonstre.atk;
          myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 3){ 
          //println("dégât");
          lifePersonnage = lifePersonnage - myMonstre2.atk;
          myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 4){ 
          //println("dégât");
          lifePersonnage = lifePersonnage - myMonstre3.atk;
          myPersonnage.img = loadImage("../image/persoDegat.png");
        }
      }
      if (keyCode == ALT){  // pause
        //println("Pause");
        etat = 3;
      }
      if (key == 'q' || key == 'Q'){  // coup d'épée gauche
           myPersonnage.img = loadImage("../image/swordGauche.png");
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 2){ 
               //println("atck");
               myMonstre.life -= myPersonnage.atk;
               myMonstre.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 3){ 
               //println("atck");
               myMonstre2.life -= myPersonnage.atk;
               myMonstre2.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 4){ 
               //println("atck");
               myMonstre3.life -= myPersonnage.atk;
               myMonstre3.img = loadImage("../image/monstreDegat.png");
           }
      }
      if (key == 'z' || key == 'Z'){ // coup d'épée en haut
           myPersonnage.img = loadImage("../image/swordDos.png");
           if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 2){ 
               //println("atck");
               myMonstre.life -= myPersonnage.atk;
               myMonstre.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 3){ 
               //println("atck");
               myMonstre2.life -= myPersonnage.atk;
               myMonstre2.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 4){ 
               //println("atck");
               myMonstre3.life -= myPersonnage.atk;
               myMonstre3.img = loadImage("../image/monstreDegat.png");
            }
      }
      if (key == 'd' || key == 'D'){ // coup d'épée en droite
           myPersonnage.img = loadImage("../image/swordDroite.png");
           if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 2){ 
               //println("atck");
               myMonstre.life -= myPersonnage.atk;
               myMonstre.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 3){ 
               //println("atck");
               myMonstre2.life -= myPersonnage.atk;
               myMonstre2.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 4){ 
               //println("atck");
               myMonstre3.life -= myPersonnage.atk;
               myMonstre3.img = loadImage("../image/monstreDegat.png");
            }
      }
      if (key == 's' || key == 'S'){ // coup d'épée en bas
           myPersonnage.img = loadImage("../image/swordFace.png");
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 2){ 
              //println("atck");
              myMonstre.life -= myPersonnage.atk;
              myMonstre.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 3){ 
              //println("atck");
              myMonstre2.life -= myPersonnage.atk;
              myMonstre2.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 4){ 
              //println("atck");
              myMonstre3.life -= myPersonnage.atk;
              myMonstre3.img = loadImage("../image/monstreDegat.png");
           }
      }
    } else {  // mort personnage
        etat = 5;
    }
 } else if (myPersonnage.stop == false) {
     //println("Stop");
 }
}

// fonction colision
int testColision (int xTest, int yTest){ // pour le personnage
    if (xTest < 0 || xTest > width-30){
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
    if (xTest > myMonstre.posX - 25 && xTest < myMonstre.posX + 25 && yTest > myMonstre.posY - 45 && yTest < myMonstre.posY + 20){ // colision monstre
      return 2;
    }
    if (xTest > myMonstre2.posX - 25 && xTest < myMonstre2.posX + 25 && yTest > myMonstre2.posY - 45 && yTest < myMonstre2.posY + 20){ // colision monstre
      return 3;
    }
    if (xTest > myMonstre3.posX - 25 && xTest < myMonstre3.posX + 25 && yTest > myMonstre3.posY - 45 && yTest < myMonstre3.posY + 20){ // colision monstre
      return 4;
    }
    if (myMonstre.life > 0 && myMonstre2.life > 0 && myMonstre3.life > 0) {
      if (xTest > 0 - 40 && xTest < 0 + 40 && yTest > 415 - 40 && yTest < 415 + 40){ // colision porte donjon fermée tant que monstre en vie
        return 3;
      }
    }
    return 0;
} 
int testColision2 (int xTest, int yTest){ // pour le monstre et le boss
    if (xTest < 0 || xTest > width/1.85){ // fait que le monstre est bloqué juqu'à la moitié de map environ (avec 450)
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
    if (xTest > myPersonnage.posX - 25 && xTest < myPersonnage.posX + 25 && yTest > myPersonnage.posY - 45 && yTest < myPersonnage.posY + 20){  // colision personnage
      return 2;
    }
    return 0;
}
int testColision3 (int xTest, int yTest){ // pour les coups d'épée
    if (xTest < 0 || xTest > width-10){
      return 1;
    }
    if (yTest < 0 || yTest > height-30){
      return 1;
    }
    
    if (xTest > myMonstre.posX - 50 && xTest < myMonstre.posX + 50 && yTest > myMonstre.posY - 90 && yTest < myMonstre.posY + 40){ // hitbox coup d'épée 
      return 2;
    }
    if (xTest > myMonstre2.posX - 50 && xTest < myMonstre2.posX + 50 && yTest > myMonstre2.posY - 90 && yTest < myMonstre2.posY + 40){ // hitbox coup d'épée 
      return 3;
    }
    if (xTest > myMonstre3.posX - 50 && xTest < myMonstre3.posX + 50 && yTest > myMonstre3.posY - 90 && yTest < myMonstre3.posY + 40){ // hitbox coup d'épée 
      return 4;
    }
    return 0;
}
int testColision4 (int xTest, int yTest){ // pour menu
    if (xTest > myMouse.posX - 195 && xTest < myMouse.posX + 0 && yTest > myMouse.posY - 75 && yTest < myMouse.posY + 0){ // hitbox choix  (x de droite à gauche)   ?   (y de bas en haut)   (y de haut en bas)
      return 2;
    }
    return 0;
}
int testColisionMenu(){ // pour menu principal
    if (myMenuJouer.posX > myMouse.posX - 195 && myMenuJouer.posX < myMouse.posX + 0 && myMenuJouer.posY > myMouse.posY - 75 && myMenuJouer.posY < myMouse.posY + 0){ // hitbox choix menu principal jouer
      return 3;
    }
    if (myMenuQuitter.posX > myMouse.posX - 195 && myMenuQuitter.posX < myMouse.posX + 0 && myMenuQuitter.posY > myMouse.posY - 75 && myMenuQuitter.posY < myMouse.posY + 0){ // hitbox choix menu principal quitter
      return 4; 
    }
    return 0;
}
int testColisionMortMenu(){ // pour mort
    if (myMenuReprendreMenu2.posX > myMouse.posX - 195 && myMenuReprendreMenu2.posX < myMouse.posX + 0 && myMenuReprendreMenu2.posY > myMouse.posY - 75 && myMenuReprendreMenu2.posY < myMouse.posY + 0){ // hitbox menu principal mort
      return 1;
    }
    return 0;
}
int testColisionZone(){ // pour changer de zone
    if (0 > myPersonnage.posX - 45 && 0 < myPersonnage.posX + 45 && 415 > myPersonnage.posY - 45 && 415 < myPersonnage.posY + 45){  // colision porte donjon aller
      return 1;
    }
    if (990 > myPersonnage.posX - 45 && 990 < myPersonnage.posX + 45 && 400 > myPersonnage.posY - 45 && 400 < myPersonnage.posY + 45){  // colision porte donjon retour
      return 2;
    }
    return 0;
}

boolean menuPrincipal(boolean etat){
  if (etat == false){ // vers quitter le jeu
      etat = false;
      return etat;
  }
  if (etat == true){ // en jeu
      etat = true; 
      return etat;
  }
  return etat;
}
int menuPause(int etat){
  if (etat == 1){ // quitte le jeu
      exit(); 
      etat = 1;
      
      return etat;
  }
  if (etat == 2){ // donjon
      etat = 2; 
      myMonstre.speed = 10; // permet remise en marche du monstre
      myMonstre2.speed = 10; // permet remise en marche du monstre2
      myMonstre3.speed = 10; // permet remise en marche du monstre3
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(myDonjon.img);
      //image(donjonImg, 0, 0); 
      image(myMonstre.img, myMonstre.posX, myMonstre.posY);
      image(myMonstre2.img, myMonstre2.posX, myMonstre2.posY);
      image(myMonstre3.img, myMonstre3.posX, myMonstre3.posY);
      //image(myBoss.img, myBoss.posX, myBoss.posY);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();
              
      // personnage
      //println(lifePersonnage);
      myPersonnage.afficherVie();
              
      // monstre 
      myMonstre.deplacementMonstre();
      myMonstre2.deplacementMonstre(); // ne marche pas 
      myMonstre3.deplacementMonstre(); // ne marche pas
      
      myMonstre.afficherNomVie();
      myMonstre2.afficherNomVie();
      myMonstre3.afficherNomVie();
      
      if (myMonstre.life == 0 && myMonstre2.life == 0 && myMonstre3.life == 0) {
          image(myDonjonPorteOuverte.img, 0, 415);
      } 
      
      return etat;
  }
  if (etat == 3){ // pause 
        etat = 3;
        //noLoop();
        myMonstre.speed = 0; // permet l'arrêt du monstre
        myMonstre2.speed = 0; // permet l'arrêt du monstre
        myMonstre3.speed = 0; // permet l'arrêt du monstre
        myBoss.speed = 0; // permet l'arrêt du boss
        myPersonnage.stop = false; // permet l'arrêt du personnage
        cursor(myMouse.img);
        image(fondBlancOpaq, 0, 0);
        fill(#FFFFFF);
        textSize(60);
        textAlign(CENTER);
        text("Pause", 500, 100);
        textAlign(LEFT);
        textSize(30);
        text("Temps passé en jeu : " + str(int(timerMin)) + "min " + str(int(timerSeconde)) + "s", 600, 50);
        image(myMenuReprendre.img, myMenuReprendre.posX, myMenuReprendre.posY);
        image(myMenuReprendreMenu.img, myMenuReprendreMenu.posX, myMenuReprendreMenu.posY);
        
        return etat;
  }
  if (etat == 4){ // menu principal
        etat = 4;
        myMonstre.speed = 0; // permet l'arrêt du monstre
        myMonstre2.speed = 0; // permet l'arrêt du monstre
        myMonstre3.speed = 0; // permet l'arrêt du monstre
        myBoss.speed = 0; // permet l'arrêt du boss
        myPersonnage.stop = false; // permet l'arrêt du personnage
        cursor(myMouse.img);
        background(menuPrincipal);
        image(menuTitre, 310, 100);
        image(myMenuJouer.img, myMenuJouer.posX, myMenuJouer.posY);
        image(myMenuQuitter.img, myMenuQuitter.posX, myMenuQuitter.posY);
        
        return etat;
  }
  if (etat == 5){ // mort personnage
        //println("Vous êtes mort");
        //noLoop();
        etat = 5;
        cursor(myMouse.img);
        background(0);
        fill(#FFFFFF);
        textSize(50);
        textAlign(CENTER);
        text("Vous êtes mort", 505, 200);
        image(myMenuReprendreMenu2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
        
        // permet de "reload" le jeu
        myMonstre.life = 20;
        myMonstre2.life = 20;
        myMonstre3.life = 20;
        lifeBoss = 50;
        lifePersonnage = 30;
        myPersonnage.posX = 500;
        myPersonnage.posY = 300;
        
        return etat;
  }
  if (etat == 6){ // donjon boss
      etat = 6; 
      myBoss.speed = 10; // permet remise en marche du boss
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(myDonjonBoss.img);
      image(myBoss.img, myBoss.posX, myBoss.posY);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();
              
      // personnage
      //println(lifePersonnage);
      myPersonnage.afficherVie();
              
      // boss
      myBoss.deplacementBoss();
      myBoss.afficherNomVie();
      
      return etat;
  }
  return etat;
}
