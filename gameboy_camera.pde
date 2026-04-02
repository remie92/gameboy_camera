//Test
PImage testImage;
color[] test_pallete={
  color(94, 0, 6),
  color(155, 15, 6),
  color(213, 62, 15),
  color(238, 217, 185)
};

import ketai.camera.*;

KetaiCamera cam;

int cameraWidth=176;
int cameraHeight=144;


void setup() {
  cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
  cam.start();
  noSmooth();
  testImage=loadImage("temp_image.jpeg");
  testImage.resize(128, 128);
  testImage.loadPixels();
  for (int i=0; i<testImage.width; i++) {
    for (int j=0; j<testImage.height; j++) {
      int b=int(brightness(testImage.get(i, j)));
      testImage.set(i, j, color(b, b, b));
    }
  }
  testImage.updatePixels();

  PImage processedImage=processImage(testImage, test_pallete);
  image(processedImage, 0, 0, width, height);
}

void draw() {
  background(0);
  int maxWidth=width/2;
  int maxHeight=height;
  float widthFactor=maxWidth/float(cameraWidth);
  float heightFactor=maxHeight/float(cameraHeight);
  float scaleFactor=min(widthFactor, heightFactor);
  println(cam.width,cam.height);
  println(int(cameraWidth*scaleFactor), int(cameraHeight*scaleFactor));
  if (cam != null) {
    image(cam, 0, 0, int(cameraWidth*scaleFactor), int(cameraHeight*scaleFactor));
    PImage grayImage=cam.copy();
    grayImage.loadPixels();
    for (int i=0; i<grayImage.width; i++) {
      for (int j=0; j<grayImage.height; j++) {
        int b=int(brightness(grayImage.get(i, j)));
        grayImage.set(i, j, color(b, b, b));
      }
    }
    grayImage.updatePixels();
    PImage processingImage=processImage(grayImage, test_pallete);
    image(processingImage, width/2, 0, int(cameraWidth*scaleFactor), int(cameraHeight*scaleFactor));
  } else {
    background(128);
    text("Waiting for camera to activate", 100, height/2);
  }
}

void onCameraPreviewEvent() {
  cam.read();
}
