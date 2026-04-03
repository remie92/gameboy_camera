int[] generateRandomPalette(int amount) {
  int[] palette=new int[amount];
  colorMode(HSB, 255);

  int hue=int(random(0, 255));
  for (int i=0; i<amount; i++) {
    float factor=i/(amount-0.5);
    palette[i]=color(hue, 150+factor*105, 30+factor*225);
  }


  colorMode(RGB, 255);
  return palette;
}
