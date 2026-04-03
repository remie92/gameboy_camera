//Test, in process_develop
PImage testImage;
color[] test_pallete=new color[0];
int[][][] dithers=new int[0][0][0];
PImage processedImage;
void setup(){
  test_pallete=loadPallete("purple");
  dithers=loadDithers();
  size(1000,500);
  noSmooth();
  testImage=loadImage("testGradient.png");
  testImage=new PImage(256,1);
  for(int i=255;i>0;i--){
    testImage.set(i,0,color(255-i));
  }
  testImage.filter(GRAY);
  testImage.resize(256,256);
  processedImage=processImage(testImage,test_pallete);
  testImage=loadImage("testGradient.png");
  testImage.filter(GRAY);
  testImage.resize(256,256);
}

void draw(){
  background(0);
  image(testImage,0,0,500,500);
  image(processedImage,500,0,500,500);
  println("processed; ",processedImage.get(int((mouseX-500)/(500.0/256)),int(mouseY/(500.0/256))), "original; ",red(testImage.get(int((mouseX-500)/(500.0/256)),int(mouseY/(500.0/256)))),"mouseCoords; ",(mouseX-500)/(500.0/256)," ",mouseY/(500.0/256));
  fill(255,0,0);
  ellipse(mouseX-500,mouseY,5,5);
}
