//Test, in dither_developement.
PImage testImage;
color[] test_pallete=new color[0];
int[][][] dithers=new int[0][0][0];
void setup(){
  test_pallete=loadPallete("purple");
  dithers=loadDithers();
  size(1000,500);
  noSmooth();
  testImage=loadImage("temp_image.jpeg");
  testImage.filter(GRAY);
  testImage.resize(128,128);
  image(testImage,0,0,500,height);
  PImage processedImage=processImage(testImage,test_pallete);
  image(processedImage,500,0,500,height);
}
