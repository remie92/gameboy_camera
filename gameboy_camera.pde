//Test
PImage testImage;

color[][] palettes={
  {
    color(94, 0, 6),
    color(155, 15, 6),
    color(213, 62, 15),
    color(238, 217, 185)
  },
  {
    color(9, 20, 19),
    color(40, 90, 72),
    color(64, 138, 113),
    color(176, 228, 204)
  },
  {
    color(49, 44, 219),
    color(240, 240, 250),
    color(242, 68, 68)
  },
  {
    color(2, 26, 84),
    color(255, 133, 187),
    color(255, 206, 227),
    color(245, 245, 245)
  },
  {
    color(14, 33, 160),
    color(77, 47, 178),
    color(177, 83, 215),
    color(243, 117, 194)
  },
  {
    color(0, 0, 0),
    color(70, 92, 136),
    color(255, 122, 48),
    color(233, 227, 223)
  },
  {
    color(204, 82, 82), // Red
    color(210, 140, 80), // Orange
    color(200, 190, 90), // Yellow
    color(88, 160, 110), // Green
    color(75, 120, 180), // Blue
    color(90, 80, 150), // Indigo
    color(130, 90, 160)    // Violet
  },
  {
    color(40, 30, 50), // Deep purple-black
    color(80, 55, 90), // Dark plum
    color(130, 80, 120), // Mauve
    color(180, 110, 130), // Dusty rose
    color(220, 160, 130), // Peach
    color(240, 210, 170)   // Warm cream
  },
  {
    color(20, 35, 50), // Deep navy
    color(40, 75, 100), // Dark teal
    color(60, 120, 140), // Steel blue
    color(90, 170, 170), // Seafoam
    color(160, 210, 200), // Pale aqua
    color(220, 240, 235)   // Misty white
  },
  {
    color(35, 20, 15), // Deep charcoal-brown
    color(90, 45, 25), // Dark ember
    color(160, 80, 40), // Burnt sienna
    color(200, 130, 60), // Amber
    color(225, 180, 100), // Golden
    color(245, 225, 175)   // Warm ivory
  },
  {
    color(20, 30, 20), // Near black green
    color(45, 70, 45), // Dark forest
    color(80, 115, 70), // Moss
    color(130, 160, 100), // Sage
    color(180, 205, 150), // Soft lime
    color(225, 235, 205)   // Pale chartreuse
  },
  {
    color(0, 0, 0),
    color(255)
  },
};


color[] color_palette=palettes[0];
PImage[] paletteImages=new PImage[palettes.length];

int dithering_value=7;

import ketai.camera.*;

KetaiCamera cam;

int cameraWidth=176;
int cameraHeight=144;


void setup() {
  cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
  cam.start();
  noSmooth();
  for (int i=0; i<palettes.length; i++) {
    paletteImages[i]=imgFromPallete(palettes[i]);
  }
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

  PImage processedImage=processImage(testImage, color_palette, dithering_value);
  image(processedImage, 0, 0, width, height);
}


PImage getProcessedImage() {
  PImage grayImage=cam.copy();
  grayImage.loadPixels();
  for (int i=0; i<grayImage.width; i++) {
    for (int j=0; j<grayImage.height; j++) {
      int b=int(brightness(grayImage.get(i, j)));
      grayImage.set(i, j, color(b, b, b));
    }
  }
  grayImage.updatePixels();
  PImage processingImage=processImage(grayImage, color_palette, dithering_value);
  return processingImage;
}


void draw() {
  background(0);
  int maxWidth=width/2;
  int maxHeight=height-paletteIconHeight;
  float widthFactor=maxWidth/float(cameraWidth);
  float heightFactor=maxHeight/float(cameraHeight);
  float scaleFactor=min(widthFactor, heightFactor);
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
    PImage processingImage=processImage(grayImage, color_palette, dithering_value);
    image(processingImage, width/2, 0, int(cameraWidth*scaleFactor), int(cameraHeight*scaleFactor));
  } else {
    background(128);
    text("Waiting for camera to activate", 100, height/2);
  }

  for (int i = 0; i < palettes.length; i++) {
    float slotWidth = float(width) / palettes.length;
    float x = slotWidth * i + (slotWidth - paletteIconHeight) / 2;
    if (selectedIndex==i) {
      fill(255);
      noStroke();
      rect(x-7, height - paletteIconHeight-14, paletteIconHeight+14, paletteIconHeight+14);
    } else {
      fill(100);
      noStroke();
      rect(x-7, height - paletteIconHeight-14, paletteIconHeight+14, paletteIconHeight+14);
    }
    image(paletteImages[i], x, height - paletteIconHeight-7, paletteIconHeight, paletteIconHeight);
  }
}


int selectedIndex=0;
int paletteIconHeight=160;
void mouseReleased() {


  for (int i=0; i<palettes.length; i++) {
    float slotWidth = float(width) / palettes.length;
    float paletteDistance = slotWidth * i + (slotWidth - paletteIconHeight) / 2;
    int x=int(paletteDistance);
    int y=height-paletteIconHeight;
    if (mouseX>x&&mouseY>y&&mouseX<x+paletteIconHeight&&mouseY<y+paletteIconHeight) {
      selectedIndex=i;
      color_palette=palettes[i];
    }
  }
}

void onCameraPreviewEvent() {
  cam.read();
}

PImage imgFromPallete(color[] cols) {
  PImage icon=new PImage(cols.length*4, cols.length*4);
  for (int i=0; i<icon.width; i++) {
    for (int j=0; j<icon.height; j++) {
      int index=int((i/4.0+j/4.0)/sqrt(cols.length));
      index=max(0, min(index, cols.length-1));
      icon.set(i, j, cols[index]);
    }
  }
  return icon;
}
