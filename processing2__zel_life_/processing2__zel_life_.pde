import processing.sound.*;
SoundFile menuSon, clicSon, swordSon, gameOverSon, winSon, son, healSon, degatPersoSon;

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
Monstre myMonstre4;
Monstre myMonstre5;
Monstre myMonstre6;
Monstre myMonstre7;
Monstre myMonstre8;
Monstre myMonstre9;
Pnj myPnjGuide;
Pnj myPnjHommeApeure;
Boss myBoss;
Boss myBoss2;
//PImage aide;
PImage persoFaceImg;
PImage pnjGuideImg;
PImage pnjHommeApeureImg;
PImage mapImg;
PImage donjonImg;
PImage donjonBossImg;
PImage donjon2Img;
PImage donjonPorteOuverteImg;
PImage effetEauMagique;
PImage mouseImg;
PImage mouseNoCursorImg;
PImage bossDonjonImg;
PImage boss2Img;
PImage monstreDonjonImg;
PImage monstreDonjon2Img;
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
  frameRate(60);
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
  monstreDonjon2Img = loadImage("../image/squeletteFortFace.png");
  myMonstre = new Monstre("Squelette", 50, 3, 10000000, 10000000, monstreDonjonImg);
  myMonstre2 = new Monstre("Squelette",  50, 3,10000000, 10000000, monstreDonjonImg);
  myMonstre3 = new Monstre("Squelette",  50, 3,10000000, 10000000, monstreDonjonImg);
  myMonstre4 = new Monstre("Chef squelette", 100, 6, 10000000, 10000000, monstreDonjon2Img);
  myMonstre5 = new Monstre("Chef squelette",  100, 6, 10000000, 10000000, monstreDonjon2Img);
  myMonstre6 = new Monstre("Chef squelette",  100, 6, 10000000, 10000000, monstreDonjon2Img); 
  myMonstre7 = new Monstre("Chef squelette",  100, 6, 10000000, 10000000, monstreDonjon2Img);
  myMonstre8 = new Monstre("Chef squelette",  100, 6, 10000000, 10000000, monstreDonjon2Img);
  myMonstre9 = new Monstre("Chef squelette",  100, 6, 10000000, 10000000, monstreDonjon2Img); 
  
  bossDonjonImg = loadImage("../image/boss.png");
  boss2Img = loadImage("../image/boss.png");
  myBoss = new Boss("Roi squelete", 150, 6, 10000000, 10000000, bossDonjonImg);
  myBoss2 = new Boss("Roi des monstres", 300, 12, 10000000, 10000000, boss2Img);
  
  pnjGuideImg = loadImage("../image/pnjGuideFace.png");
  pnjHommeApeureImg = loadImage("../image/hommeApeure.png");
  myPnjGuide = new Pnj("Guide", pnjGuideImg);
  myPnjHommeApeure = new Pnj("Homme apeuré", pnjHommeApeureImg);
  
  zoneDepartImg = loadImage("../image/MAP.png");
  mannequinImg = loadImage("../image/mannequin.png");
  maisonInterieurImg = loadImage("../image/maison.png");
  donjon2Img = loadImage("../image/donjon2.png");
  
  //aide = loadImage("../image/effetEauMagique.png");
  
  menuSon = new SoundFile(this, "../son/menuSon.mp3", false);
  menuSon.amp(0.3);
  menuSon.loop();
  son = new SoundFile(this, "", false);
  clicSon = new SoundFile(this, "../son/clicSon.mp3", false);
  clicSon.amp(0.3);
  swordSon = new SoundFile(this, "../son/swordSon.mp3", false);
  swordSon.amp(0.2);
  gameOverSon = new SoundFile(this, "../son/gameOverSon.mp3", false);
  gameOverSon.amp(0.3);
  winSon = new SoundFile(this, "../son/winSon.mp3", false);
  winSon.amp(0.3);
  healSon = new SoundFile(this, "../son/healSon.mp3", false);
  healSon.amp(0.3);
  degatPersoSon = new SoundFile(this, "../son/degatPersoSon.mp3", false);
  degatPersoSon.amp(0.1);
}

void draw(){
  son.removeFromCache();
  myMouse.posX = pmouseX;
  myMouse.posY = pmouseY;
  //noTint(); // bug² affichage ?
 
  if (lifePersonnage == 0){
    etat = 5;
  }
  if (gameStatus == true && etat == 4){
    menuPause(etat);
    if(menuSon.isPlaying() == true){
       
    }
    if(menuSon.isPlaying() == false){
       menuSon.play();
    }
    if (testColisionMenu() == 3){
          image(reprendreSurvolImg, myMenuJouer.posX, myMenuJouer.posY);
          if (testColisionMenu() == 3 && mousePressed == true){
            clicSon.play();
            ecranChargement();
            menuSon.pause();
            menuJeu(jeu = 1);
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
              clicSon.play();
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
       if(son.isPlaying() == true){
          
       }
       if(son.isPlaying() == false){
          son = new SoundFile(this, "../son/donjonSon.mp3", false);
          son.amp(0.3);
          son.play();
       }
  }
  if (gameStatus == true && etat == 3) {
       menuPause(etat);
       son.pause();
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2){
            image(reprendreSurvolImg, myMenuReprendre.posX, myMenuReprendre.posY);
            //println("Reprendre");
            if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 1){
                  etat = 8;
                  clicSon.play();
                  son.play();
             }
            if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 2){
                  etat = 2;
                  clicSon.play();
                  son.play();
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 3){
                  etat = 6;
                  clicSon.play();
                  son.play();
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 4){
                  etat = 11;
                  clicSon.play();
                  son.play();
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 5){
                  etat = 9;
                  clicSon.play();
                  son.play();
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 6){
                  etat = 10;
                  clicSon.play();
                  son.play();
             }
             if (testColision4(int(myMenuReprendre.posX), int(myMenuReprendre.posY)) == 2 && mousePressed == true && jeu == 7){
                  etat = 12;
                  clicSon.play();
                  son.play();
             }
        }
        if (testColision4(int(myMenuReprendreMenu.posX), int(myMenuReprendreMenu.posY)) == 2){
             image(reprendreSurvolImg, myMenuReprendreMenu.posX, myMenuReprendreMenu.posY);
             //println("Menu principal");
             if (testColision4(int(myMenuReprendreMenu.posX), int(myMenuReprendreMenu.posY)) == 2 && mousePressed == true){
                  etat = 4;
                  clicSon.play();
                  
              }
         }
         
  }
  if (gameStatus == true && etat == 5) {
       if(gameOverSon.isPlaying() == true){
          
       }
       if(gameOverSon.isPlaying() == false){
         son.pause();
         gameOverSon.play();
       }
       menuPause(etat);
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColisionWinMortMenu() == 1){
             image(myMenuSurvol2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
             //println("Menu principal");
             if (testColisionWinMortMenu() == 1 && mousePressed == true){
                  etat = 4;
                  clicSon.play();
                  gameOverSon.pause();
              }
        }
  }
  if (gameStatus == true && etat == 6) {
       menuPause(etat);
       menuJeu(jeu = 3);
       timerMin = minute();  
       timerSeconde = second();
       if(son.isPlaying() == true){
           
       }
       if(son.isPlaying() == false){
          son = new SoundFile(this, "../son/boss2Son.mp3", false);
          son.amp(0.3);
          son.play();
       }
  }
  if (gameStatus == true && etat == 7) {
       if(winSon.isPlaying() == true){
          
       }
       if(winSon.isPlaying() == false){
         son.pause();
         winSon.play();
       }
       menuPause(etat);
       timerMilli = millis();  // ne pas toucher pour le bon fonctionnement du jeu, permet d'éviter le bug*
       if (testColisionWinMortMenu() == 1){
             image(myMenuSurvol2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
             //println("Menu principal");
             if (testColisionWinMortMenu() == 1 && mousePressed == true){
                  etat = 4;
                  clicSon.play();
                  winSon.pause();
              }
        }
  }
  if (gameStatus == true && etat == 8) {
       if(son.isPlaying() == true){
          
       }
       if(son.isPlaying() == false){
          son = new SoundFile(this, "../son/villageDepartSon.mp3", false);
          son.amp(0.3);
          son.play();
       }
       menuPause(etat);
       menuJeu(jeu = 1);
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
  if (gameStatus == true && etat == 11) {
       menuPause(etat);
       menuJeu(jeu = 4);
       timerMin = minute();  
       timerSeconde = second();
       if(son.isPlaying() == true){
       
       }
       if(son.isPlaying() == false){
          son = new SoundFile(this, "../son/donjon2Son.mp3", false);
          son.amp(0.3);
          son.play();
       }
  }
  if (gameStatus == true && etat == 12) {
       menuPause(etat);
       menuJeu(jeu = 7);
       timerMin = minute();  
       timerSeconde = second();
       if(son.isPlaying() == true){
       
       }
       if(son.isPlaying() == false){
          son = new SoundFile(this, "../son/bossSon.mp3", false);
          son.amp(0.3);
          son.play();
       }
       if (myBoss2.life <= 0){
          etat = 7; 
       }
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
        if (etat == 11){
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 7){ 
            lifePersonnage = lifePersonnage - myMonstre4.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 8){ 
            lifePersonnage = lifePersonnage - myMonstre5.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 9){ 
            lifePersonnage = lifePersonnage - myMonstre6.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 10){ 
            lifePersonnage = lifePersonnage - myMonstre7.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 11){ 
            lifePersonnage = lifePersonnage - myMonstre8.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 12){ 
            lifePersonnage = lifePersonnage - myMonstre9.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (etat == 12){
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
            lifePersonnage = lifePersonnage - myBoss2.atk;
            myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (etat == 8){
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
          if (testColision(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 13){ 
            
          }
        }
        if (testColisionZone() == 1 && etat == 2){
             //println("Zone");
             etat = 6;
             jeu = 3;
             son.pause();
             myPersonnage.posX = 925;
             myPersonnage.posY = 400;
             if (myBoss.life > 0 ){
               myBoss.posX = 100;
               myBoss.posY = 150;
             }
         }
         if (testColisionZone() == 10 && etat == 11){
             //println("Zone");
             etat = 9;
             jeu = 5;
             son.pause();
             myPersonnage.posX = 595;
             myPersonnage.posY = 115;
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
        if (etat == 8){
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
        }
        if (etat == 11){
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 7){ 
             lifePersonnage = lifePersonnage - myMonstre4.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 8){ 
             lifePersonnage = lifePersonnage - myMonstre5.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 9){ 
             lifePersonnage = lifePersonnage - myMonstre6.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 10){ 
             lifePersonnage = lifePersonnage - myMonstre7.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 11){ 
             lifePersonnage = lifePersonnage - myMonstre8.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 12){ 
             lifePersonnage = lifePersonnage - myMonstre9.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (etat == 12){
          if (testColision(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss2.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (testColisionZone() == 2  && etat == 6){
             //println("Zone");
             etat = 2;
             jeu = 2;
             son.pause();
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
        if (etat == 8){
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
        }
        if (etat == 11){
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 7){ 
              lifePersonnage = lifePersonnage - myMonstre4.atk;
               myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 8){ 
              lifePersonnage = lifePersonnage - myMonstre5.atk;
               myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 9){ 
              lifePersonnage = lifePersonnage - myMonstre6.atk;
               myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 10){ 
              lifePersonnage = lifePersonnage - myMonstre7.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 11){ 
              lifePersonnage = lifePersonnage - myMonstre8.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 12){ 
              lifePersonnage = lifePersonnage - myMonstre9.atk;
             myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (etat == 12){
          if (testColision(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 6){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss2.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (testColisionZone() == 3  && etat == 8){
             //println("Zone");
             etat = 2;
             jeu = 2;
             son.pause();
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
         if (testColisionZone() == 4 && etat == 2){
             //println("Zone");
             etat = 8;
             jeu = 1;
             son.pause();
             myPersonnage.posX = 482;
             myPersonnage.posY = 80;
             myPersonnage.img = loadImage("../image/persoFace.png");
         }
         if (testColisionZone() == 5 && etat == 8){
             //println("Zone");
             etat = 9;
             jeu = 5;
             myPersonnage.posX = 497;
             myPersonnage.posY = 350;
         }
         if (testColisionZone() == 7 && etat == 8){
             //println("Zone");
             etat = 10;
             jeu = 6;
             myPersonnage.posX = 497;
             myPersonnage.posY = 350;
         }
         if (testColisionZone() == 9 && etat == 9){
             //println("Zone");
             etat = 11;
             jeu = 4;
             son.pause();
             myPersonnage.posX = 100;
             myPersonnage.posY = 100;
             myMonstre4.posX = 100;
             myMonstre4.posY = 200;
             myMonstre5.posX = 100;
             myMonstre5.posY = 300;
             myMonstre6.posX = 100;
             myMonstre6.posY = 400;
             myMonstre7.posX = 300;
             myMonstre7.posY = 250;
             myMonstre8.posX = 300;
             myMonstre8.posY = 330;
             myMonstre9.posX = 300;
             myMonstre9.posY = 450;
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
        if (etat == 11){
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 7){ 
              lifePersonnage = lifePersonnage - myMonstre4.atk;
              myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 8){ 
              lifePersonnage = lifePersonnage - myMonstre5.atk;
              myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 9){ 
              lifePersonnage = lifePersonnage - myMonstre6.atk;
              myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 10){ 
              lifePersonnage = lifePersonnage - myMonstre7.atk;
              myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 11){ 
              lifePersonnage = lifePersonnage - myMonstre8.atk;
              myPersonnage.img = loadImage("../image/persoDegat.png");
          }
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 12){ 
              lifePersonnage = lifePersonnage - myMonstre9.atk;
              myPersonnage.img = loadImage("../image/persoDegat.png");
          }    
        }
        if (etat == 8){
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
        }
        if (etat == 12){
          if (testColision(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 6){ 
           //println("dégât");
           lifePersonnage = lifePersonnage - myBoss2.atk;
           myPersonnage.img = loadImage("../image/persoDegat.png");
          }
        }
        if (testColisionZone() == 6 && etat == 9){
             //println("Zone");
             etat = 8;
             jeu = 1;
             son.pause();
             myPersonnage.posX = 67;
             myPersonnage.posY = 67;
             if (myMonstre4.life <= 0 && myMonstre4.life <= 0 && myMonstre4.life <= 0 && myMonstre4.life <= 0 && myMonstre4.life <= 0 && myMonstre4.life <= 0){
                 myBoss2.posX = 400;
                 myBoss2.posY = 250;
                 etat = 12;
                 jeu = 7;
             }
         }
         if (testColisionZone() == 6 && etat == 10){
             //println("Zone");
             etat = 8;
             jeu = 1;
             son.pause();
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
           swordSon.play();
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
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 7){ 
               //println("atck");
               myMonstre4.life -= myPersonnage.atk;
               myMonstre4.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 8){ 
               //println("atck");
               myMonstre5.life -= myPersonnage.atk;
               myMonstre5.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 9){ 
               //println("atck");
               myMonstre6.life -= myPersonnage.atk;
               myMonstre6.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 10){ 
               //println("atck");
               myMonstre7.life -= myPersonnage.atk;
               myMonstre7.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 11){ 
               //println("atck");
               myMonstre8.life -= myPersonnage.atk;
               myMonstre8.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 12){ 
               //println("atck");
               myMonstre9.life -= myPersonnage.atk;
               myMonstre9.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
               //println("atck");
               myBoss2.life -= myPersonnage.atk;
               myBoss2.img = loadImage("../image/boss2Degat.png");
           }
           if (testColision3(int(myPersonnage.posX) - myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
               //println("atck");
               mannequinImg = loadImage("../image/mannequinDegat.png");
           }
      }
      if (key == 'z' || key == 'Z'){ // coup d'épée en haut
           myPersonnage.img = loadImage("../image/swordDos.png");
           swordSon.play();
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
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 7){ 
               //println("atck");
               myMonstre4.life -= myPersonnage.atk;
               myMonstre4.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 8){ 
               //println("atck");
               myMonstre5.life -= myPersonnage.atk;
               myMonstre5.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 9){ 
               //println("atck");
               myMonstre6.life -= myPersonnage.atk;
               myMonstre6.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 10){ 
               //println("atck");
               myMonstre7.life -= myPersonnage.atk;
               myMonstre7.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 11){ 
               //println("atck");
               myMonstre8.life -= myPersonnage.atk;
               myMonstre8.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 12){ 
               //println("atck");
               myMonstre9.life -= myPersonnage.atk;
               myMonstre9.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 6){ 
               //println("atck");
               myBoss2.life -= myPersonnage.atk;
               myBoss2.img = loadImage("../image/boss2Degat.png");
            }
            if (testColision3(int(myPersonnage.posX), int(myPersonnage.posY) - myPersonnage.speed) == 6){ 
               //println("atck");
               mannequinImg = loadImage("../image/mannequinDegat.png");
            }
      }
      if (key == 'd' || key == 'D'){ // coup d'épée en droite
           myPersonnage.img = loadImage("../image/swordDroite.png");
           swordSon.play();
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
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 7){ 
               //println("atck");
               myMonstre4.life -= myPersonnage.atk;
               myMonstre4.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 8){ 
               //println("atck");
               myMonstre5.life -= myPersonnage.atk;
               myMonstre5.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 9){ 
               //println("atck");
               myMonstre6.life -= myPersonnage.atk;
               myMonstre6.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 10){ 
               //println("atck");
               myMonstre7.life -= myPersonnage.atk;
               myMonstre7.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 11){ 
               //println("atck");
               myMonstre8.life -= myPersonnage.atk;
               myMonstre8.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 12){ 
               //println("atck");
               myMonstre9.life -= myPersonnage.atk;
               myMonstre9.img = loadImage("../image/monstreDegat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
               //println("atck");
               myBoss2.life -= myPersonnage.atk;
               myBoss2.img = loadImage("../image/boss2Degat.png");
            }
            if (testColision3(int(myPersonnage.posX) + myPersonnage.speed, int(myPersonnage.posY)) == 6){ 
               //println("atck");
               mannequinImg = loadImage("../image/mannequinDegat.png");
            }
      }
      if (key == 's' || key == 'S'){ // coup d'épée en bas
           myPersonnage.img = loadImage("../image/swordFace.png");
           swordSon.play();
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
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 7){ 
              //println("atck");
              myMonstre4.life -= myPersonnage.atk;
              myMonstre4.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 8){ 
              //println("atck");
              myMonstre5.life -= myPersonnage.atk;
              myMonstre5.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 9){ 
              //println("atck");
              myMonstre6.life -= myPersonnage.atk;
              myMonstre6.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 10){ 
              //println("atck");
              myMonstre7.life -= myPersonnage.atk;
              myMonstre7.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 11){ 
              //println("atck");
              myMonstre8.life -= myPersonnage.atk;
              myMonstre8.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 12){ 
              //println("atck");
              myMonstre9.life -= myPersonnage.atk;
              myMonstre9.img = loadImage("../image/monstreDegat.png");
           }
           if (testColision3(int(myPersonnage.posX),int(myPersonnage.posY) + myPersonnage.speed) == 6){ 
              //println("atck");
              myBoss2.life -= myPersonnage.atk;
              myBoss2.img = loadImage("../image/boss2Degat.png");
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
    
    if (xTest < 0 || xTest > width-30){
      return 1;
    }
    if (yTest < 0 || yTest > height-50){
      return 1;
    }
    if (etat == 9 || etat == 10){
        if (xTest < 0 || xTest > width-370){
          return 1;
        }
        if (yTest < 0 || yTest > height-215){
          return 1;
        }
        if (xTest > 50 - 60 && xTest < 50 + 330 && yTest > 0 - 30 && yTest < 0 + 600){
          return 1;
        }
        if (xTest > 495 - 300 && xTest < 495 + 300 && yTest > 0 - 30 && yTest < 0 + 80){
          return 1;
        }
    }
    if(myMonstre.life > 0 && etat == 2){
      if (xTest > myMonstre.posX - 25 && xTest < myMonstre.posX + 25 && yTest > myMonstre.posY - 45 && yTest < myMonstre.posY + 20){ // colision monstre
        degatPersoSon.play();
        return 2;
      }
    }
    if(myMonstre2.life > 0 && etat == 2){
      if (xTest > myMonstre2.posX - 25 && xTest < myMonstre2.posX + 25 && yTest > myMonstre2.posY - 45 && yTest < myMonstre2.posY + 20){ // colision monstre2
        degatPersoSon.play();
        return 3;
      }
    }
    if(myMonstre3.life > 0 && etat == 2){
      if (xTest > myMonstre3.posX - 25 && xTest < myMonstre3.posX + 25 && yTest > myMonstre3.posY - 45 && yTest < myMonstre3.posY + 20){ // colision monstre3
        degatPersoSon.play();
        return 4;
      }
    }
    if (myBoss.life > 0 && etat == 6){
      if (xTest > myBoss.posX - 14 && xTest < myBoss.posX + 109 && yTest > myBoss.posY - 33 && yTest < myBoss.posY + 63){ // colision boss
        degatPersoSon.play();
        return 5;
      }
    }
    if (myBoss2.life > 0 && etat == 12){
      if (xTest > myBoss2.posX - 14 && xTest < myBoss2.posX + 109 && yTest > myBoss2.posY - 33 && yTest < myBoss2.posY + 63){ // colision boss2
        degatPersoSon.play();
        return 6;
      }
    }
    if(myMonstre4.life > 0 && etat == 11){
      if (xTest > myMonstre4.posX - 25 && xTest < myMonstre4.posX + 25 && yTest > myMonstre4.posY - 45 && yTest < myMonstre4.posY + 20){ // colision myMonstre4
        degatPersoSon.play();
        return 7;
      }
    }
    if(myMonstre5.life > 0 && etat == 11){
      if (xTest > myMonstre5.posX - 25 && xTest < myMonstre5.posX + 25 && yTest > myMonstre5.posY - 45 && yTest < myMonstre5.posY + 20){ // colision myMonstre5
        degatPersoSon.play();
        return 8;
      }
    }
    if(myMonstre6.life > 0 && etat == 11){
      if (xTest > myMonstre6.posX - 25 && xTest < myMonstre6.posX + 25 && yTest > myMonstre6.posY - 45 && yTest < myMonstre6.posY + 20){ // colision myMonstre6
        degatPersoSon.play();
        return 9;
      }
    }
    if(myMonstre7.life > 0 && etat == 11){
      if (xTest > myMonstre7.posX - 25 && xTest < myMonstre7.posX + 25 && yTest > myMonstre7.posY - 45 && yTest < myMonstre7.posY + 20){ // colision myMonstre7
        degatPersoSon.play();
        return 10;
      }
    }
    if(myMonstre8.life > 0 && etat == 11){
      if (xTest > myMonstre8.posX - 25 && xTest < myMonstre8.posX + 25 && yTest > myMonstre8.posY - 45 && yTest < myMonstre8.posY + 20){ // colision myMonstre8
        degatPersoSon.play();
        return 11;
      }
    }
    if(myMonstre9.life > 0 && etat == 11){
      if (xTest > myMonstre9.posX - 25 && xTest < myMonstre9.posX + 25 && yTest > myMonstre9.posY - 45 && yTest < myMonstre9.posY + 20){ // colision myMonstre9
        degatPersoSon.play();
        return 12;
      }
    }
   if (etat == 2 || etat == 8){
     if (xTest > myPnjGuide.posX - 20 && xTest < myPnjGuide.posX + 20 && yTest > myPnjGuide.posY - 40 && yTest < myPnjGuide.posY + 20){ // colision pnj guide
        return 6;
     }
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
      if (xTest > myPnjHommeApeure.posX - 20 && xTest < myPnjHommeApeure.posX + 20 && yTest > myPnjHommeApeure.posY - 40 && yTest < myPnjHommeApeure.posY + 20){ // colision pnj homme apeuré
        return 13;
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
    if (xTest > myBoss2.posX - 29 && xTest < myBoss2.posX + 121 && yTest > myBoss2.posY - 48 && yTest < myBoss2.posY + 78){ // hitbox coup d'épée  boss2
      return 6;
    }
    if (xTest > myMonstre4.posX - 40 && xTest < myMonstre4.posX + 40 && yTest > myMonstre4.posY - 60 && yTest < myMonstre4.posY + 35){ // hitbox coup d'épée myMonstre4
      return 7;
    }
    if (xTest > myMonstre5.posX - 40 && xTest < myMonstre5.posX + 40 && yTest > myMonstre5.posY - 60 && yTest < myMonstre5.posY + 35){ // hitbox coup d'épée myMonstre5
      return 8;
    }
    if (xTest > myMonstre6.posX - 40 && xTest < myMonstre6.posX + 40 && yTest > myMonstre6.posY - 60 && yTest < myMonstre6.posY + 35){ // hitbox coup d'épée myMonstre6
      return 9;
    }
    if (xTest > myMonstre7.posX - 40 && xTest < myMonstre7.posX + 40 && yTest > myMonstre7.posY - 60 && yTest < myMonstre7.posY + 35){ // hitbox coup d'épée monstre7
      return 10;
    }
    if (xTest > myMonstre8.posX - 40 && xTest < myMonstre8.posX + 40 && yTest > myMonstre8.posY - 60 && yTest < myMonstre8.posY + 35){ // hitbox coup d'épée myMonstre8
      return 11;
    }
    if (xTest > myMonstre9.posX - 40 && xTest < myMonstre9.posX + 40 && yTest > myMonstre9.posY - 60 && yTest < myMonstre9.posY + 35){ // hitbox coup d'épée myMonstre9
      return 12;
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
    if (0 > myPersonnage.posX - 45 && 0 < myPersonnage.posX + 45 && 415 > myPersonnage.posY - 45 && 415 < myPersonnage.posY + 45){  // colision entrée porte donjon boss
      ecranChargement();
      return 1;
    }
    if (990 > myPersonnage.posX - 45 && 990 < myPersonnage.posX + 45 && 400 > myPersonnage.posY - 45 && 400 < myPersonnage.posY + 45){  // colision sortie porte donjon boss 
      ecranChargement();
      return 2;
    }
    if (495 > myPersonnage.posX - 30 && 495 < myPersonnage.posX + 30 && 0 +10 > myPersonnage.posY - 25 && 0 < myPersonnage.posY + 30){  // colision entrée donjon 
      ecranChargement();
      return 3;
    }
    if (622 > myPersonnage.posX - 30 && 622 < myPersonnage.posX + 30 && 0+10 > myPersonnage.posY - 25 && 0 < myPersonnage.posY + 30){  // colision sortie donjon 
      ecranChargement();
      return 4;
    }
    if (60 > myPersonnage.posX - 20 && 60 < myPersonnage.posX + 20 && 0 + 27 > myPersonnage.posY - 25 && 0 < myPersonnage.posY + 30){  // colision entrée maison en haut à gauche 
      ecranChargement();
      return 5;
    }
    if (497 > myPersonnage.posX - 30 && 497 < myPersonnage.posX + 30 && 400 +5 > myPersonnage.posY - 25 && 400 < myPersonnage.posY + 40){  // colision sortie maison en haut à gauche 
      ecranChargement();
      return 6;
    }
    if (80 > myPersonnage.posX - 20 && 80 < myPersonnage.posX + 20 && 360 -8 > myPersonnage.posY - 25 && 360 < myPersonnage.posY + 30){  // colision entrée maison en bas à gauche 
      ecranChargement();
      return 7;
    }
    if (490 > myPersonnage.posX - 20 && 490 < myPersonnage.posX + 20 && 400 +5 > myPersonnage.posY - 25 && 400 < myPersonnage.posY + 30){  // colision sortie maison en bas à gauche 
      ecranChargement();
      return 8;
    }
    if (595 > myPersonnage.posX - 30 && 595 < myPersonnage.posX + 20 && 100 > myPersonnage.posY - 25 && 100 < myPersonnage.posY + 30){  // colision entrée donjon2
      ecranChargement();
      return 9;
    }
    if (0 > myPersonnage.posX - 45 && 0 < myPersonnage.posX + 45 && 200 > myPersonnage.posY - 45 && 200 < myPersonnage.posY + 45){  // colision sortie donjon2
      ecranChargement();
      return 10;
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
  if (jeu == 3){ // boss
      jeu = 3; 
      return jeu;
  }
  if (jeu == 4){ // donjon2
      jeu = 4; 
      return jeu;
  }
  if (jeu == 5){ // zone départ maison en haut à gauche
      jeu = 5; 
      return jeu;
  }
  if (jeu == 6){ // zone départ maison en bas à gauche
      jeu = 6; 
      return jeu;
  }
  if (jeu == 7){ // boss2
      jeu = 7; 
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
        myMonstre4.speed = 0; 
        myMonstre5.speed = 0; 
        myMonstre6.speed = 0;
        myMonstre7.speed = 0; 
        myMonstre8.speed = 0; 
        myMonstre9.speed = 0;
        myBoss.speed = 0; // permet l'arrêt du boss
        myBoss2.speed = 0;
        myPersonnage.stop = false; // permet l'arrêt du personnage
        cursor(myMouse.img);
     //   tint(200, 70); bug² ?
    //    image(fondBlancOpaq, 0, 0); bug² ?
        fill(#FFFFFF);
        textSize(60);
        text("Pause", 425, 100);  // bug² affichage ?
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
        myMonstre4.speed = 0; 
        myMonstre5.speed = 0; 
        myMonstre6.speed = 0;
        myMonstre7.speed = 0; 
        myMonstre8.speed = 0; 
        myMonstre9.speed = 0;
        myBoss.speed = 0; // permet l'arrêt du boss
        myBoss2.speed = 0;
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
        text("Vous êtes mort", 350, 200);
        image(myMenuReprendreMenu2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);
  
        // permet de "reload" le jeu
        myMonstre.life = 50;
        myMonstre2.life = 50;
        myMonstre3.life = 50;
        myMonstre4.life = 100; 
        myMonstre5.life = 100; 
        myMonstre6.life = 100;
        myMonstre7.life = 100; 
        myMonstre8.life = 100; 
        myMonstre9.life = 100;
        myBoss.life = 150;
        myBoss2.life = 300;
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
      
      return etat;
  }
  if (etat == 7){ // win
      etat = 7;
      
      cursor(myMouse.img);
      background(0);
      fill(#FFFFFF);
      textSize(47);
      text("Félicitation,", 405, 200);
      textSize(41);
      text("vous avez gagné !", 400, 260);
      textSize(30);
      text("Temps passé en jeu : " + str(int(timerMin)) + "min " + str(int(timerSeconde)) + "s", 600, 50);
      image(myMenuReprendreMenu2.img, myMenuReprendreMenu2.posX, myMenuReprendreMenu2.posY);

      // permet de "reload" le jeu
      myMonstre.life = 50;
      myMonstre2.life = 50;
      myMonstre3.life = 50;
      myMonstre4.life = 100; 
      myMonstre5.life = 100; 
      myMonstre6.life = 100;
      myMonstre7.life = 100; 
      myMonstre8.life = 100; 
      myMonstre9.life = 100;
      myBoss.life = 150;
      myBoss2.life = 300;
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
      cursor(mouseNoCursorImg);
      noCursor();
      
      // mannequin
      if (millis() - timerMilliMannequin > 200) {  // en milliseconde 1000 = 1s
         mannequinImg = loadImage("../image/mannequin.png");
         timerMilliMannequin = millis();
      }

      // png
      myPnjGuide.afficherNom();
      myPnjGuide.conversationGuideDepart();
      
      if (myBoss.life <= 0){
        image(myPnjHommeApeure.img, myPnjHommeApeure.posX = 110, myPnjHommeApeure.posY = 110);
        myPnjHommeApeure.afficherNom();
        myPnjHommeApeure.conversationHommeApeure();
      }
      
      return etat;
  }
  if (etat == 9){ // zone du départ maison en haut à gauche
      etat = 9;
       
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(loadImage("../image/maisonDonjon.png"));
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();
      
      if (myBoss.life <= 0){
          background(loadImage("../image/maisonDonjonOuvert.png"));
          myPersonnage.stop = true;
          image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
          cursor(mouseNoCursorImg);
          noCursor();
      }

      return etat;
  }
  if (etat == 10){ // zone du départ maison en bas à gauche
      etat = 10;
       
      myPersonnage.stop = true; // permet remise en marche du personnage
      background(maisonInterieurImg);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();
              
      // son
      
      return etat;
  }
  if (etat == 11){ // donjon2
      etat = 11; 
     
      myMonstre4.speed = 10; 
      myMonstre5.speed = 10; 
      myMonstre6.speed = 10;
      myMonstre7.speed = 10; 
      myMonstre8.speed = 10; 
      myMonstre9.speed = 10;
      myPersonnage.stop = true;
      background(donjon2Img);
      image(myMonstre4.img, myMonstre4.posX, myMonstre4.posY);
      image(myMonstre5.img, myMonstre5.posX, myMonstre5.posY);
      image(myMonstre6.img, myMonstre6.posX, myMonstre6.posY);
      image(myMonstre7.img, myMonstre7.posX, myMonstre7.posY);
      image(myMonstre8.img, myMonstre8.posX, myMonstre8.posY);
      image(myMonstre9.img, myMonstre9.posX, myMonstre9.posY);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();
      
      myDonjon.eauMagique();

      // personnage
      myPersonnage.afficherVie();
              
      // monstre
      myMonstre4.deplacementMonstre2();
      myMonstre5.deplacementMonstre2();
      myMonstre6.deplacementMonstre2();
      myMonstre7.deplacementMonstre2();
      myMonstre8.deplacementMonstre2();
      myMonstre9.deplacementMonstre2();
      
      myMonstre4.afficherNomVie2();
      myMonstre5.afficherNomVie2();
      myMonstre6.afficherNomVie2();
      myMonstre7.afficherNomVie2();
      myMonstre8.afficherNomVie2();
      myMonstre9.afficherNomVie2();
      
      return etat;
  }
  if (etat == 12){ // zone départ attaqué
      etat = 12;
     
     if (myBoss2.life == 300){ // ne marche pas, à voir pour jouer avec les colisions
        image(loadImage("../image/pnjDialogue.png"), 160, 470);
        textSize(15);
        text("AU SECOURS !!!", 265, 500);
        text("Nous sommes attaqué ...!", 265, 525);
        text("Aidez-nous je vous en prie Aventurier !", 265, 550);
      }
      
      myBoss2.speed = 10; 
      myPersonnage.stop = true;
      background(zoneDepartImg);
      image(myBoss2.img, myBoss2.posX, myBoss2.posY);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      cursor(mouseNoCursorImg);
      noCursor();

      // personnage
      myPersonnage.afficherVie();
              
      // monstre
      myBoss2.deplacementBoss2();
      
      myBoss2.afficherNomVie2();
      
      return etat;
  }
  return etat;
}

void ecranChargement(){
    background(0);
    fill(#FFFFFF);
    textSize(35);
    text("..Loading..", 800, 500);
}
