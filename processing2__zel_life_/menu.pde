class Menu {
  PImage img;
  float posX, posY;
  long timerMil = millis();  // ne pas toucher pour le bon fonctionnement du jeu
  
  Menu(float posX, float posY, PImage img){
    this.posX = posX;
    this.posY = posY;
    this.img = img;
  }
}
