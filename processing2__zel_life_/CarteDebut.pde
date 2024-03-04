class CarteDebut {
  PImage carteDebutImg;

  CarteDebut(String cheminImage) {
    carteDebutImg = loadImage(cheminImage);
  }

  void afficher() {
    image(carteDebutImg, 0, 0, width, height);
  }
}
