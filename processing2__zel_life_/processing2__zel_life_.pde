Mouse myMouse;
Personnage myPersonnage;
PImage persoFaceImg;
PImage mapImg;
PImage mouseImg;
boolean gameStatus = true;

void setup(){
  hint(ENABLE_KEY_REPEAT);
  size(1000, 600, P2D);
  
  mouseImg = loadImage("../image/mouse.png");
  myMouse = new Mouse(mouseImg);
  
  persoFaceImg = loadImage("../image/persoFace.png");
  myPersonnage = new Personnage("Zel", (width-persoFaceImg.width/2), height-persoFaceImg.height-12, persoFaceImg);
}

void draw(){
  cursor(myMouse.img);
  background(#FCFCFC);
  if (gameStatus == true) {
      image (myPersonnage.img, myPersonnage.posX, myPersonnage.posY);
      fill(#F5F065);
      textSize(60);
      textAlign(LEFT);
      //text("Score : " + str(score), 0, 50);
      
      fill(#DE1975);
      textSize(60);
      textAlign(RIGHT);
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
