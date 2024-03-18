class Donjon {
    float posX, posY;
    PImage img;
    int timerMil = millis();  // ne pas toucher pour le bon fonctionnement du jeu
    
    Donjon(PImage img){
    this.img = img;
  }
  
  void eauMagique(){
    if (testColisionEauMagique() == 1){
      //println("heal");
      if (lifePersonnage < 30){
        image(effetEauMagique, 832, 83);
      }
      if (millis() - this.timerMil > 1200) {  // en milliseconde 1000 = 1s
        if (lifePersonnage < 30){
           lifePersonnage += 2;
           fill(#FFFFFF);
           textSize(22);
           text("+2", myPersonnage.posX + 30, myPersonnage.posY + 10);
           if(healSon.isPlaying() == true){
           
           }
           if(healSon.isPlaying() == false){
              healSon.play();
              healSon.rate(1.5);
           }
        }
        if (lifePersonnage >= 30){
           lifePersonnage = 30;
           healSon.pause();
        }
        this.timerMil = millis();
      }
    }
  }
  
}
