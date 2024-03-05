//ArrayList<Tir> tir = new ArrayList<Tir>();  voir commentaire class Tir

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
Pnj myPnjGuide;
Boss myBoss;
PImage aide;
PImage persoFaceImg;
PImage pnjGuideImg;
PImage mapImg;
PImage donjonImg;
PImage donjonBossImg;
PImage donjonPorteOuverteImg;
PImage effetEauMagique;
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
PImage zoneDepartImg;
PImage maisonInterieurImg;
PImage mannequinImg;
boolean gameStatus = true;  // ne pas toucher pour le bon fonctionnement du jeu
int etat = 4;  // ne pas toucher pour le bon fonctionnement du jeu
int jeu;
int timerMilli;
int timerMilliMannequin;
long timerSeconde;
long timerMin;
int lifePersonnage;

void setup(){
  hint(ENABLE_KEY_REPEAT);
  size(1000, 600, P2D);
  timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
  timerMilliMannequin = millis();

  menuPrincipal = loadImage("../image/menuPrincipal1.png");
  menuTitre = loadImage("../image/titre.gif", "gif");
  menuPrincipalJouer = loadImage("../image/jouer.png");
  menuPrincipalQuitter = loadImage("../image/quitter.png");
  //fondBlancOpaq = loadImage("../image/fondBlanc1.png"); // bug² affichage ou si ne bug pas, ne s'affiche pas comme il faut 

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
  myPersonnage = new Personnage("Zel", persoFaceImg);
 
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
  effetEauMagique = loadImage("../image/effetEauMagique.png");
  
  monstreDonjonImg = loadImage("../image/monstreFace.png");
  myMonstre = new Monstre("Squelette", 10000000, 10000000, monstreDonjonImg);
  myMonstre2 = new Monstre("Squelette", 10000000, 10000000, monstreDonjonImg);
  myMonstre3 = new Monstre("Squelette", 10000000, 10000000, monstreDonjonImg); 
  
  bossDonjonImg = loadImage("../image/boss.png");
  myBoss = new Boss("Roi squelete", 10000000, 10000000, bossDonjonImg);
  
  pnjGuideImg = loadImage("../image/pnjGuideFace.png");
  myPnjGuide = new Pnj("Guide", pnjGuideImg);
  
  zoneDepartImg = loadImage("../image/MAP.png");
  mannequinImg = loadImage("../image/mannequin.png");
  maisonInterieurImg = loadImage("../image/maison.png");
  
  aide = loadImage("../image/effetEauMagique.png");
}

void draw(){
  myMouse.posX = pmouseX;
  myMouse.posY = pmouseY;
  //noTint(); // bug² affichage ?

  if (lifePersonnage == 0){
    etat = 5;
  }
  if (gameStatus == true && etat == 4){
    menuPause(etat);
    if (testColisionMenu() == 3){
          image(reprendreSurvolImg, myMenuJouer.posX, myMenuJouer.posY);
          if (testColisionMenu() == 3 && mousePressed == true){
            menuJeu(jeu = 4);
            etat = 8;
            myPersonnage.posX = 600;
            myPersonnage.posY = 550;
          }
     }
     if (testColisionMenu() == 4){
          image(myMenuSurvol.img, myMenuSurvol.posX, myMenuSurvol.posY); 
          if (millis() - timerMilli > 133) {  // en milliseconde 1000 = 1s
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
       menuJeu(jeu = 2);
       timerMin = minute();  
       timerSeconde = second();
  }
  if (gameStatus == true && etat == 3) {
       menuPause(etat);
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2){
            image(reprendreSurvolImg, myMenuReprendre.posX, myMenuReprendre.posY);
            //println("Reprendre");
            if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 2){
                  etat = 2;
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 3){
                  etat = 6;
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 4){
                  etat = 8;
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 5){
                  etat = 9;
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 6){
                  etat = 10;
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
       if (testColisionWinMortMenu() == 1){
             image(myMenuSurvol2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
             //println("Menu principal");
             if (testColisionWinMortMenu() == 1 && mousePressed == true){
                  etat = 4;
              }
        }
  }
  if (gameStatus == true && etat == 6) {
       menuPause(etat);
       menuJeu(jeu = 3);
       timerMin = minute();  
       timerSeconde = second();
  }
  if (gameStatus == true && etat == 7) {
       menuPause(etat);
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColisionWinMortMenu() == 1){
             image(myMenuSurvol2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
             //println("Menu principal");
             if (testColisionWinMortMenu() == 1 && mousePressed == true){
                  etat = 4;
              }
        }
  }
  if (gameStatus == true && etat == 8) {
       menuPause(etat);
       menuJeu(jeu = 4);
       timerMin = minute();  
       timerSeconde = second();
  }
  if (gameStatus == true && etat == 9) {
       menuPause(etat);
       menuJeu(jeu = 5);
       timerMin = minute();  
       timerSeconde = second();
  }
  if (gameStatus == true && etat == 10) {
       menuPause(etat);
       menuJeu(jeu = 6);
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
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 5){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
          
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 7){ 
          
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 8){ 
          
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 9){ 
          
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 10){ 
          
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 11){ 
          
        }
        if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 12){ 
          
        }
        if (testColisionZone() == 1 && etat == 2){
             //println("Zone");
             etat = 6;
             jeu = 3;
             myPersonnage.posX = 925;
             myPersonnage.posY = 400;
             if (myBoss.life > 0 ){
               myBoss.posX = 120;
               myBoss.posY = 120;
             }
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
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 5){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
         
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 7){ 
         
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 8){ 
         
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 9){ 
         
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 10){ 
         
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 11){ 
         
        }
        if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 12){ 
         
        }
        if (testColisionZone() == 2  && etat == 6){
             //println("Zone");
             etat = 2;
             jeu = 2;
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
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 5){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 6){ 

        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 7){ 

        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 8){ 

        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 9){ 

        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 10){ 

        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 11){ 

        }
        if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 12){ 

        }
        if (testColisionZone() == 3  && etat == 8){
             //println("Zone");
             etat = 2;
             jeu = 2;
             myPersonnage.posX = 622;
             myPersonnage.posY = 70;
             myPersonnage.img = loadImage("../image/persoFace.png");
             if (myMonstre.life > 0 && myMonstre2.life > 0 && myMonstre3.life > 0){
                myMonstre.posX = 100;
                myMonstre.posY = 100;
                myMonstre2.posX = 250;
                myMonstre2.posY = 250;
                myMonstre3.posX = 400;
                myMonstre3.posY = 400;
            }
         }
         if (testColisionZone() == 4  && etat == 2){
             //println("Zone");
             etat = 8;
             jeu = 4;
             myPersonnage.posX = 482;
             myPersonnage.posY = 80;
             myPersonnage.img = loadImage("../image/persoFace.png");
         }
         if (testColisionZone() == 5  && etat == 8){
             //println("Zone");
             etat = 9;
             jeu = 5;
             myPersonnage.posX = 497;
             myPersonnage.posY = 350;
         }
         if (testColisionZone() == 7  && etat == 8){
             //println("Zone");
             etat = 10;
             jeu = 6;
             myPersonnage.posX = 497;
             myPersonnage.posY = 350;
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
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 5){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 6){ 

        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 7){ 

        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 8){ 

        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 9){ 

        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 10){ 

        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 11){ 

        }
        if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 12){ 

        }
        if (testColisionZone() == 6 && etat == 9){
             //println("Zone");
             etat = 8;
             jeu = 4;
             myPersonnage.posX = 67;
             myPersonnage.posY = 67;
         }
         if (testColisionZone() == 6 && etat == 10){
             //println("Zone");
             etat = 8;
             jeu = 4;
             myPersonnage.posX = 87;
             myPersonnage.posY = 390;
         }
      }
      if (keyCode == ALT && etat != 5 && etat !=7){  // pause
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
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 5){ 
               //println("atck");
               myBoss.life -= myPersonnage.atk;
               myBoss.img = loadImage("../image/bossDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
               //println("atck");
               mannequinImg = loadImage("../image/mannequinDegat.png");
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
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 5){ 
               //println("atck");
               myBoss.life -= myPersonnage.atk;
               myBoss.img = loadImage("../image/bossDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 6){ 
               //println("atck");
               mannequinImg = loadImage("../image/mannequinDegat.png");
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
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 5){ 
               //println("atck");
               myBoss.life -= myPersonnage.atk;
               myBoss.img = loadImage("../image/bossDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
               //println("atck");
               mannequinImg = loadImage("../image/mannequinDegat.png");
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
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 5){ 
              //println("atck");
              myBoss.life -= myPersonnage.atk;
              myBoss.img = loadImage("../image/bossDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 6){ 
              //println("atck");
              mannequinImg = loadImage("../image/mannequinDegat.png");
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
    if (etat == 9 || etat == 10){
        if (xTest < 0 || xTest > width-370){
          return 1;
        }
        if (yTest < 0 || yTest > height-215){
          return 1;
        }
        if (xTest < 0 || xTest > width+200){
          return 1;
        }
        if (yTest < 0 || yTest > height+150){
          return 1;
        }
    }
    if (xTest < 0 || xTest > width-30){
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
    if(myMonstre.life > 0 && etat ==2){
      if (xTest > myMonstre.posX - 25 && xTest < myMonstre.posX + 25 && yTest > myMonstre.posY - 45 && yTest < myMonstre.posY + 20){ // colision monstre
        return 2;
      }
    }
    if(myMonstre2.life > 0 && etat ==2){
      if (xTest > myMonstre2.posX - 25 && xTest < myMonstre2.posX + 25 && yTest > myMonstre2.posY - 45 && yTest < myMonstre2.posY + 20){ // colision monstre2
        return 3;
      }
    }
    if(myMonstre3.life > 0 && etat ==2){
      if (xTest > myMonstre3.posX - 25 && xTest < myMonstre3.posX + 25 && yTest > myMonstre3.posY - 45 && yTest < myMonstre3.posY + 20){ // colision monstre3
        return 4;
      }
    }
    if (myBoss.life > 0 && etat == 6){
      if (xTest > myBoss.posX - 14 && xTest < myBoss.posX + 109 && yTest > myBoss.posY - 33 && yTest < myBoss.posY + 63){ // colision boss
        return 5;
      }
    }
   if (xTest > myPnjGuide.posX - 20 && xTest < myPnjGuide.posX + 20 && yTest > myPnjGuide.posY - 40 && yTest < myPnjGuide.posY + 20){ // colision pnj
      return 6;
    }
    if (etat == 8){
      if (xTest > 810 - 25 && xTest < 810 + 50 && yTest > 240 - 40 && yTest < 240 + 25){ // colision mannequin
        return 7;
      }
      if (xTest > 50 - 60 && xTest < 50 + 80 && yTest > 265 - 45 && yTest < 265 + 96){ // colision maison zone départ en bas à gauche
        return 8;
      }
      if (xTest > 50 - 60 && xTest < 50 + 45 && yTest > 0 - 30 && yTest < 0 + 41){ // colision maison zone départ en haut à gauche
        return 9;
      }
      if (xTest > 495 - 60 && xTest < 495 + 45 && yTest > 0 - 30 && yTest < 0 + 30){ // colision donjon zone départ
        return 10;
      }
      if (xTest > 750 - 90 && xTest < 750 + 45 && yTest > 0 - 80 && yTest < 0 + 60){ // colision maison juste à droite du donjon zone départ
        return 11;
      }
      if (xTest > 950 - 65 && xTest < 950 + 45 && yTest > 60 - 80 && yTest < 60 + 30){ // colision maison en haut à droite zone départ
        return 12;
      }
    }
    if (myMonstre.life > 0 && myMonstre2.life > 0 && myMonstre3.life > 0 && etat == 2) {
      if (xTest > 0 - 40 && xTest < 0 + 40 && yTest > 415 - 40 && yTest < 415 + 40){ // colision porte donjon fermée tant que monstres en vie
        return 1;
      }
    }
    return 0;
} 
int testColision2 (int xTest, int yTest){ // pour les monstres
    if (xTest < 0 || xTest > width/1.85){ // fait que le monstre est bloqué juqu'à la moitié de map environ
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
    if (xTest > myPersonnage.posX - 30 && xTest < myPersonnage.posX + 30 && yTest > myPersonnage.posY - 45 && yTest < myPersonnage.posY + 45){  // colision personnage 
      return 2;
    }
    return 0;
}
int testColision3 (int xTest, int yTest){ // pour les coups d'épée, range = 15
    if (xTest > myMonstre.posX - 40 && xTest < myMonstre.posX + 40 && yTest > myMonstre.posY - 60 && yTest < myMonstre.posY + 35){ // hitbox coup d'épée monstre
      return 2;
    }
    if (xTest > myMonstre2.posX - 40 && xTest < myMonstre2.posX + 40 && yTest > myMonstre2.posY - 60 && yTest < myMonstre2.posY + 35){ // hitbox coup d'épée monstre2
      return 3;
    }
    if (xTest > myMonstre3.posX - 40 && xTest < myMonstre3.posX + 40 && yTest > myMonstre3.posY - 60 && yTest < myMonstre3.posY + 35){ // hitbox coup d'épée monstre3
      return 4;
    }
    if (xTest > myBoss.posX - 29 && xTest < myBoss.posX + 121 && yTest > myBoss.posY - 48 && yTest < myBoss.posY + 78){ // hitbox coup d'épée  boss
      return 5;
    }
    if (xTest > 810 - 40 && xTest < 810 + 60 && yTest > 240 - 50 && yTest < 240 + 40){ // hitbox coup d'épée  mannequin
      return 6;
    }
    return 0;
}
int testColision4 (int xTest, int yTest){ // pour menu pause
    if (xTest > myMouse.posX - 195 && xTest < myMouse.posX + 0 && yTest > myMouse.posY - 75 && yTest < myMouse.posY + 0){ // hitbox choix  (x de droite à gauche)   ?   (y de bas en haut)   (y de haut en bas)
      return 2;
    }
    return 0;
}
int testColision5 (int xTest, int yTest){ // pour le boss
    if (xTest < 0 || xTest > width/1.85){ // fait que le boss est bloqué juqu'à la moitié de map environ
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
  /*  if (xTest > myPersonnage.posX - 50 && xTest < myPersonnage.posX + 50 && yTest > myPersonnage.posY - 90 && yTest < myPersonnage.posY + 40){   pas utile (et non fonctionnel ?), à garder sous le coude
      return 2;  
    }                                                                                                             
    if (xTest > myPersonnage.posX - 14 && xTest < myPersonnage.posX + 103 && yTest > myPersonnage.posY - 28 && yTest < myPersonnage.posY + 58){ 
      return 2; 
    } */
    return 0;
}
int testColision6 (int xTest, int yTest){ // pour les pnj
    if (xTest < 0 || xTest > width-50){
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
    if (xTest > myPersonnage.posX - 35 && xTest < myPersonnage.posX + 40 && yTest > myPersonnage.posY - 30 && yTest < myPersonnage.posY + 50){  // colision pnj 
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
int testColisionWinMortMenu(){ // pour mort et win
    if (myMenuReprendreMenu2.posX > myMouse.posX - 195 && myMenuReprendreMenu2.posX < myMouse.posX + 0 && myMenuReprendreMenu2.posY > myMouse.posY - 75 && myMenuReprendreMenu2.posY < myMouse.posY + 0){ // hitbox choix retour menu principal
      return 1;
    }
    return 0;
}
int testColisionZone(){ // pour changer de zone
    if (0 > myPersonnage.posX - 45 && 0 < myPersonnage.posX + 45 && 415 > myPersonnage.posY - 45 && 415 < myPersonnage.posY + 45){  // colision porte donjon boss aller
      return 1;
    }
    if (990 > myPersonnage.posX - 45 && 990 < myPersonnage.posX + 45 && 400 > myPersonnage.posY - 45 && 400 < myPersonnage.posY + 45){  // colision porte donjon boss retour
      return 2;
    }
    if (495 > myPersonnage.posX - 30 && 495 < myPersonnage.posX + 30 && 0 +10 > myPersonnage.posY - 25 && 0 < myPersonnage.posY + 30){  // colision entrée donjon aller
      return 3;
    }
    if (622 > myPersonnage.posX - 30 && 622 < myPersonnage.posX + 30 && 0+10 > myPersonnage.posY - 25 && 0 < myPersonnage.posY + 30){  // colision entrée donjon retour
      return 4;
    }
    if (60 > myPersonnage.posX - 20 && 60 < myPersonnage.posX + 20 && 0 -15 > myPersonnage.posY - 25 && 0 < myPersonnage.posY + 30){  // colision entrée maison en haut à gauche aller
      return 5;
    }
    if (495 > myPersonnage.posX - 20 && 495 < myPersonnage.posX + 20 && 400 +5 > myPersonnage.posY - 25 && 400 < myPersonnage.posY + 30){  // colision entrée maison en haut à gauche retour
      return 6;
    }
    if (80 > myPersonnage.posX - 20 && 80 < myPersonnage.posX + 20 && 360 -10 > myPersonnage.posY - 25 && 360 < myPersonnage.posY + 30){  // colision entrée maison en bas à gauche aller
      return 7;
    }
    if (490 > myPersonnage.posX - 20 && 490 < myPersonnage.posX + 20 && 400 +5 > myPersonnage.posY - 25 && 400 < myPersonnage.posY + 30){  // colision entrée maison en bas à gauche retour
      return 8;
    }
    return 0;
}
int testColisionEauMagique(){ // pour eau magique
    if (837.5 > myPersonnage.posX - 55 && 837.5 < myPersonnage.posX + 30 && 85.5 > myPersonnage.posY - 15 && 85.5 < myPersonnage.posY + 50){  // colision eau magique
      return 1;
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
int menuJeu(int jeu){
  if (jeu == 1){ // zone départ
     jeu = 1;
     return jeu;
  }
  if (jeu == 2){ // donjon
      jeu = 2;
      return jeu;
  } 
  if (jeu == 3){ // donjon boss
      jeu = 3; 
      return jeu;
  }
  if (jeu == 4){ // zone départ
      jeu = 4; 
      return jeu;
  }
  if (jeu == 5){ // zone départ maison en haut à gauche
      jeu = 5; 
      return jeu;
  }
  if (jeu == 6){ // zone départ maison en bas à droite
      jeu = 6; 
      return jeu;
  }
  return jeu;
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
      image(myMonstre.img, myMonstre.posX, myMonstre.posY);
      image(myMonstre2.img, myMonstre2.posX, myMonstre2.posY);
      image(myMonstre3.img, myMonstre3.posX, myMonstre3.posY);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      image(myPnjGuide.img, myPnjGuide.posX = 680, myPnjGuide.posY = 80);
      cursor(mouseNoCursorImg);
      noCursor();
      
      myDonjon.eauMagique();
              
      // personnage
      myPersonnage.afficherVie();
      
      // pnj
      myPnjGuide.afficherNom();
      myPnjGuide.conversationGuideDonjon();
              
      // monstre
      myMonstre.deplacementMonstre();
      myMonstre2.deplacementMonstre();
      myMonstre3.deplacementMonstre();
      
      myMonstre.afficherNomVie();
      myMonstre2.afficherNomVie();
      myMonstre3.afficherNomVie();
      
      if (myMonstre.life <= 0 && myMonstre2.life <= 0 && myMonstre3.life <= 0) {
          image(myDonjonPorteOuverte.img, 0, 415);
      } 

      return etat;
  } 
  if (etat == 3){ // pause 
        etat = 3;
        
        //noLoop();
        myMonstre.speed = 0; // permet l'arrêt du monstre
        myMonstre2.speed = 0; // permet l'arrêt du monstre2
        myMonstre3.speed = 0; // permet l'arrêt du monstre3
        myBoss.speed = 0; // permet l'arrêt du boss
        myPersonnage.stop = false; // permet l'arrêt du personnage
        cursor(myMouse.img);
     //   tint(200, 70); bug² ?
    //    image(fondBlancOpaq, 0, 0); bug² ?
        fill(#FFFFFF);
        textSize(60);
        textAlign(CENTER);
        text("Pause", 500, 100);  // bug² affichage ?
        textAlign(LEFT);
        textSize(30);
        text("Temps passé en jeu : " + str(int(timerMin)) + "min " + str(int(timerSeconde)) + "s", 600, 50);  // bug² affichage ?
        image(myMenuReprendre.img, myMenuReprendre.posX, myMenuReprendre.posY);
        image(myMenuReprendreMenu.img, myMenuReprendreMenu.posX, myMenuReprendreMenu.posY);
        
        return etat;
  }
  if (etat == 4){ // menu principal
        etat = 4;
        
        myMonstre.speed = 0; // permet l'arrêt du monstre
        myMonstre2.speed = 0; // permet l'arrêt du monstre2
        myMonstre3.speed = 0; // permet l'arrêt du monstre3
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
        etat = 5;
        
        //println("Vous êtes mort");
        cursor(myMouse.img);
        background(0);
        fill(#FFFFFF);
        textSize(50);
        textAlign(CENTER);
        text("Vous êtes mort", 505, 200);
        image(myMenuReprendreMenu2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
        
        // permet de "reload" le jeu
        myMonstre.life = 50;
        myMonstre2.life = 50;
        myMonstre3.life = 50;
        myBoss.life = 150;
        lifePersonnage = 30;
        myPersonnage.posX = 500;
        myPersonnage.posY = 300;
        myPersonnage.img = loadImage("../image/persoFace.png");
        
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
      
      myDonjonBoss.eauMagique();
              
      // personnage
      myPersonnage.afficherVie();
              
      // boss
      myBoss.deplacementBoss();
      myBoss.afficherNomVie();
      
      if (myBoss.life <= 0){
        etat = 7;
      }
      
      return etat;
  }
  if (etat == 7){ // win
      etat = 7;
      
      cursor(myMouse.img);
      background(0);
      fill(#FFFFFF);
      textSize(47);
      textAlign(CENTER);
      text("Félicitation,", 505, 200);
      textSize(41);
      textAlign(CENTER);
      text("vous avez gagné !", 505, 260);
      textAlign(LEFT);
      textSize(30);
      text("Temps passé en jeu : " + str(int(timerMin)) + "min " + str(int(timerSeconde)) + "s", 600, 50);
      image(myMenuReprendreMenu2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
      
      // permet de "reload" le jeu
      myMonstre.life = 50;
      myMonstre2.life = 50;
      myMonstre3.life = 50;
      myBoss.life = 150;
      lifePersonnage = 30;
      myPersonnage.posX = 500;
      myPersonnage.posY = 300;
      myPersonnage.img = loadImage("../image/persoFace.png"); 
     
      return etat; 
  }
  if (etat == 8){ // zone du départ
      etat = 8;
       
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(zoneDepartImg);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      image(mannequinImg, 810, 240);
      image(myPnjGuide.img, myPnjGuide.posX = 690, myPnjGuide.posY = 450);
      image(aide, 70, 360);
      cursor(mouseNoCursorImg);
      noCursor();
              
      // personnage
      
      // mannequin
      if (millis() - timerMilliMannequin > 200) {  // en milliseconde 1000 = 1s
                  mannequinImg = loadImage("../image/mannequin.png");
                  timerMilliMannequin = millis();
      }
      
      // png
      myPnjGuide.afficherNom();
      myPnjGuide.conversationGuideDepart();
      
      if (myBoss.life == 0){ // à finir

      }
      
      return etat;
  }
  if (etat == 9){ // zone du départ maison en haut à gauche
      etat = 9; // à finir 
       
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(maisonInterieurImg);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      image(aide, 490, 400);
      cursor(mouseNoCursorImg);
      noCursor();
              
      // personnage
      
      // png
      
      return etat;
  }
  if (etat == 10){ // zone du départ maison en bas à gauche
      etat = 10; // à finir
       
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(maisonInterieurImg);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();
              
      // personnage
      
      // png
      
      return etat;
  }
  return etat;
}
