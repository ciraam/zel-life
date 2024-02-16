Mouse myMouse;
Personnage myPersonnage;
Donjon myDonjon;
Monstre myMonstre;
Boss myBoss;
PImage persoFaceImg;
PImage mapImg;
PImage donjonImg;
PImage mouseImg;
PImage bossDonjonImg;
PImage monstreDonjonImg;
boolean gameStatus = true;

void setup(){
  hint(ENABLE_KEY_REPEAT);
  size(1000, 600, P2D);
  
  mouseImg = loadImage("../image/mouse.png");
  myMouse = new Mouse(mouseImg);
  
  persoFaceImg = loadImage("../image/persoFace.png");
  myPersonnage = new Personnage("Zel", (width-persoFaceImg.width/2), height-persoFaceImg.height-12, persoFaceImg);
  
  donjonImg = loadImage("../image/donjon.png");
  myDonjon = new Donjon(donjonImg);
  donjonImg.resize(1000,600);
  
  monstreDonjonImg = loadImage("../image/monstreFace.png");
  myMonstre = new Monstre("Squelette", 100, 100, monstreDonjonImg);
  
  bossDonjonImg = loadImage("../image/boss.png");
  myBoss = new Boss("Roi squellete", 120, 120, bossDonjonImg);
}

void draw(){
  cursor(myMouse.img);
  background(myDonjon.img);
  
  if (gameStatus == true) {
      image(myMonstre.img, myMonstre.posX, myMonstre.posY);
      image(myBoss.img, myBoss.posX, myBoss.posY);
      image(myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      
      //fill(#F5F065);
      //textSize(60);
      //textAlign(LEFT);
      //text("Score : " + str(score), 0, 50);
      
      //fill(#DE1975);
      //textSize(60);
      //textAlign(RIGHT);
      //text("Vies : " + str(lives), width, 50);
    
    }
}

void keyPressed(){
  if (keyCode == LEFT) {
   myPersonnage.posX -= myPersonnage.speed;
   myPersonnage.img = loadImage("../image/persoGauche.png");
  }
  else if (keyCode == RIGHT){
   myPersonnage.posX += myPersonnage.speed;
   myPersonnage.img = loadImage("../image/persoDroite.png");
  }
  else if (keyCode == UP){
   myPersonnage.posY -= myPersonnage.speed;
   myPersonnage.img = loadImage("../image/persoDos.png");
  }
  else if (keyCode == DOWN){
   myPersonnage.posY += myPersonnage.speed;
   myPersonnage.img = loadImage("../image/persoFace.png");
  }
}
