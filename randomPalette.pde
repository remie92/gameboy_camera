int[] generateRandomPalette(int amount) {
  int[] palette=new int[amount];
  int genType=int(random(0, 2));
  genType=0;
  colorMode(HSB, 255);
  int baseHue=int(random(0, 255));
  switch (genType) {
  case 0:

    for (int i=0; i<amount; i++) {
      float factor=i/(amount-0.5);
      palette[i]=color(baseHue-factor*100, 200-factor*180, 40+sqrt(i*11500));
    }
    break;
  }



  colorMode(RGB, 255);
  return palette;
}
