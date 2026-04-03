import android.os.Environment;
import android.media.MediaScannerConnection;
import android.content.Context;
import android.os.Vibrator;
Vibrator vibrator;
PImage printIcon;
PImage trashIcon;
PImage saveIcon;
PImage lowIcon;
PImage highIcon;
PImage randomIcon;
PImage randomSelectedIcon;
PImage flashOffIcon;
PImage flashOnIcon;

color[][] palettes={
  {//Warm Red
    color(94, 0, 6),
    color(155, 15, 6),
    color(213, 62, 15),
    color(238, 217, 185)
  },
  {//Cool Green
    color(9, 20, 19),
    color(40, 90, 72),
    color(64, 138, 113),
    color(176, 228, 204)
  },
  {//Dutch
    color(49, 44, 219),
    color(240, 240, 250),
    color(242, 68, 68)
  },
  {//Blossom
    color(2, 26, 84),
    color(255, 133, 187),
    color(255, 206, 227),
    color(245, 245, 245)
  },
  {//Synthwave
    color(14, 33, 160),
    color(77, 47, 178),
    color(177, 83, 215),
    color(243, 117, 194)
  },
  {//Racing
    color(0, 0, 0),
    color(70, 92, 136),
    color(255, 122, 48),
    color(233, 227, 223)
  },
  {//Rainbow
    color(204, 82, 82), // Red
    color(210, 140, 80), // Orange
    color(200, 190, 90), // Yellow
    color(88, 160, 110), // Green
    color(75, 120, 180), // Blue
    color(90, 80, 150), // Indigo
    color(130, 90, 160)    // Violet
  },
  {//Retro Brown
    color(40, 30, 50), // Deep purple-black
    color(80, 55, 90), // Dark plum
    color(130, 80, 120), // Mauve
    color(180, 110, 130), // Dusty rose
    color(220, 160, 130), // Peach
    color(240, 210, 170)   // Warm cream
  },
  {//Retro Blue
    color(20, 35, 50), // Deep navy
    color(40, 75, 100), // Dark teal
    color(60, 120, 140), // Steel blue
    color(90, 170, 170), // Seafoam
    color(160, 210, 200), // Pale aqua
    color(220, 240, 235)   // Misty white
  },
  {//
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
  }, {
    color(89, 69, 69),
    color(129, 91, 91),
    color(158, 118, 118),
    color(255, 248, 234)
  },
  {
    color(0, 48, 73),
    color(214, 40, 40),
    color(247, 127, 0),
    color(252, 191, 73)
  },
  {
    color(27, 12, 12),
    color(49, 62, 23),
    color(76, 92, 45),
    color(255, 222, 66)
  },
  {
    color(53, 41, 97),
    color(119, 65, 129),
    color(230, 178, 198),
    color(246, 229, 229)
  },
  {
    color(97, 97, 97),
    color(138, 174, 146),
    color(196, 227, 203),
    color(244, 249, 244)
  },
  {
    color(0, 26, 110),
    color(7, 71, 153),
    color(0, 153, 144),
    color(255, 255, 187)
  },
  {
    color(43, 42, 76),
    color(179, 19, 18),
    color(234, 144, 108),
    color(238, 226, 222)
  },
  {
    color(2, 2, 2),
    color(13, 40, 24),
    color(4, 71, 28),
    color(5, 140, 66),
    color(22, 219, 101)
  }, {
    color(64, 31, 62),
    color(63, 46, 86),
    color(69, 63, 120),
    color(117, 154, 171),
    color(250, 242, 161)
  },
  {
    color(33, 26, 29),
    color(99, 32, 238),
    color(128, 117, 255),
    color(248, 240, 251),
    color(202, 213, 202)
  },
  {
    color(69, 5, 12),
    color(114, 14, 7),
    color(139, 98, 32),
    color(213, 172, 78),
    color(238, 207, 109),
  },
  {
    color(3, 37, 108),
    color(37, 65, 178),
    color(23, 104, 172),
    color(6, 190, 225),
    color(255, 255, 255),
  },
  {
    color(78, 1, 16),
    color(136, 22, 0),
    color(193, 98, 0),
    color(227, 227, 106),
    color(203, 255, 140),
  },
  {
    color(31, 47, 22),
    color(57, 91, 80),
    color(90, 118, 132),
    color(146, 175, 215),
    color(197, 209, 235),
  },
  {
    color(37, 22, 5),
    color(197, 123, 87),
    color(241, 171, 134),
    color(247, 219, 167),
    color(156, 175, 183),
  },
};

String[] names={
  "Warm Red",
  "Cool Green",
  "Dutch",
  "Blossom",
  "Synthwave",
  "Racing",
  "Rainbow",
  "Retro Pink",
  "Retro Blue",
  "Retro Orange",
  "Retro Green",
  "TwoTone",
  "Coffee",
  "Flame",
  "Retro",
  "Purpley",
  "Soft Green",
  "Sea",
  "Carpet",
  "Heavy Green",
  "Old Poster",
  "Heavy Purple",
  "Red Coffee",
  "Ocean",
  "Gross",
  "Cool Blue",
  "Cappuccino",
};

PFont pixelFont;
color[] color_palette=palettes[0];
PImage[] paletteImages=new PImage[palettes.length];

int dithering_value=7;

import ketai.camera.*;

KetaiCamera cam;

int cameraWidth=176;
int cameraHeight=144;
int cameraWidth1=352;
int cameraHeight1=288;
int cameraWidth2=176;
int cameraHeight2=144;
boolean lowRes=false;
void setup() {
  paletteText=names[0];
  pixelFont = createFont("PixelifySans-VariableFont_wght.ttf", 32);
  textFont(pixelFont);
  textSize(32);
  randomPaletteImage=new PImage(1, 1);
  if (lowRes) {
    cameraWidth=cameraWidth2;
    cameraHeight=cameraHeight2;
  } else {
    cameraWidth=cameraWidth1;
    cameraHeight=cameraHeight1;
  }
  vibrator = (Vibrator) getActivity().getSystemService(Context.VIBRATOR_SERVICE);
  cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
  cam.start();

  noSmooth();
  for (int i=0; i<palettes.length; i++) {
    paletteImages[i]=imgFromPallete(palettes[i]);
  }
  printIcon=loadImage("print.png");
  saveIcon=loadImage("save.png");
  trashIcon=loadImage("trash.png");
  lowIcon=loadImage("low_res.png");
  highIcon=loadImage("high_res.png");
  randomIcon=loadImage("random.png");
  randomSelectedIcon=loadImage("randomSelected.png");
  flashOffIcon=loadImage("flashOff.png");
  flashOnIcon=loadImage("flashOn.png");
  background(0);
}

boolean flashEnabled=false;

void vibrate(int duration) {
  int amplitude = 150 + (int)random(-100, 100);         // 0–255 amplitude range
  amplitude=constrain(amplitude, 0, 255);

  if (android.os.Build.VERSION.SDK_INT >= 26) {
    vibrator.vibrate(android.os.VibrationEffect.createOneShot(duration, amplitude));
  } else {
    vibrator.vibrate(duration);
  }
}

void vibrate(int duration, int amplitude) {
  amplitude=constrain(amplitude, 0, 255);

  if (android.os.Build.VERSION.SDK_INT >= 26) {
    vibrator.vibrate(android.os.VibrationEffect.createOneShot(duration, amplitude));
  } else {
    vibrator.vibrate(duration);
  }
}
PImage getProcessedImage() {
  if (cam != null) {
    image(cam, -10, -10, 2, 2);
  }
  PImage grayImage=cam.copy();
  grayImage.loadPixels();
  for (int i=0; i<grayImage.width; i++) {
    for (int j=0; j<grayImage.height; j++) {
      int b=int(brightness(grayImage.get(i, j)));
      grayImage.set(i, j, color(b, b, b));
    }
  }
  grayImage.updatePixels();
  PImage processingImage=processImage(grayImage, color_palette);
  return processingImage;
}

PImage finalImage;

int drawingMode=0;

void onResume() {
  super.onResume();



  if (lowRes) {
    cameraWidth = cameraWidth2;
    cameraHeight = cameraHeight2;
  } else {
    cameraWidth = cameraWidth1;
    cameraHeight = cameraHeight1;
  }

  cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
  cam.start();
  if (flashEnabled) {
    cam.enableFlash();
  }
}

PImage randomPaletteImage;

String paletteText="DEFAULT_TEXT";

void draw() {
  background(0);
  if (drawingMode==0) {

    int maxWidth=width-600;
    int maxHeight=height-paletteIconHeight;
    float widthFactor=maxWidth/float(cameraWidth);
    float heightFactor=maxHeight/float(cameraHeight);
    float scaleFactor=min(widthFactor, heightFactor);
    if (cam != null) {
      image(cam, width/2-(int(cameraWidth*scaleFactor)/2), 0, 2, 2);
      PImage grayImage=cam.copy();
      grayImage.resize(grayImage.width/2, grayImage.height/2);
      grayImage.filter(POSTERIZE, 5);
      grayImage.loadPixels();
      for (int i=0; i<grayImage.width; i++) {
        for (int j=0; j<grayImage.height; j++) {
          int b=int(brightness(grayImage.get(i, j)));
          grayImage.set(i, j, color(b, b, b));
        }
      }
      grayImage.updatePixels();
      image(grayImage, width/2-(int(cameraWidth*scaleFactor)/2), 0, int(cameraWidth*scaleFactor), int(cameraHeight*scaleFactor));
    } else {
      background(128);
      text("Waiting for camera to activate", 100, height/2);
    }

    pushMatrix();
    // Coast after release
    if (!paletteDragging && abs(paletteVelocity) > 0.5) {
      float totalPaletteWidth = palettes.length * paletteSlotWidth;
      float maxScroll = max(0, totalPaletteWidth - width);
      paletteScrollOffset = constrain(paletteScrollOffset + paletteVelocity, 0, maxScroll);
      paletteVelocity *= FRICTION;
      if (paletteScrollOffset <= 0 || paletteScrollOffset >= maxScroll) {
        paletteVelocity = 0;
      }
    } else if (!paletteDragging) {
      paletteVelocity = 0;
    }
    translate(-paletteScrollOffset, 0);
    for (int i = 0; i < palettes.length; i++) {
      float x = paletteSlotWidth * i + (paletteSlotWidth - paletteIconHeight) / 2;
      if (selectedIndex == i) {
        fill(255);
      } else {
        fill(100);
      }
      noStroke();
      rect(x-7, height - paletteIconHeight-14-16, paletteIconHeight+14, paletteIconHeight+14);
      image(paletteImages[i], x, height - paletteIconHeight-7-16, paletteIconHeight, paletteIconHeight);
    }
    popMatrix();
    // Draw scrollbar
    float totalPaletteWidth = palettes.length * paletteSlotWidth;
    float maxScroll = max(0, totalPaletteWidth - width);

    if (maxScroll > 0) {
      float barAreaW  = width;          // scrollbar track width
      float barAreaX  = 0;
      float barAreaY  = height - 16;           // sits at the very bottom
      float barH      = 16;

      float thumbW    = barAreaW * (width / totalPaletteWidth);
      float thumbX    = barAreaX + (paletteScrollOffset / maxScroll) * (barAreaW - thumbW);

      // Track
      noStroke();
      fill(255, 40);
      rect(barAreaX, barAreaY, barAreaW, barH, barH);

      // Thumb
      fill(255, 140);
      rect(thumbX, barAreaY, thumbW, barH, barH);
      fill(140);
      textSize(width*0.022);
      text(paletteText, width*0.01, height*0.77);
    }
    image(printIcon, width-280, height/2-(240/2), 240, 240);
    if (lowRes) {
      image(lowIcon, width-280, height/2-(240/2)-320, 240, 240);
    } else {
      image(highIcon, width-280, height/2-(240/2)-320, 240, 240);
    }

    if (selectedIndex!=-1) {
      image(randomIcon, 40, height/2-(240/2), 240, 240);
      //image(randomPaletteImage, 110, height/2-(100/2), 100, 100);
    } else {
      image(randomSelectedIcon, 40, height/2-(240/2), 240, 240);
      //image(randomPaletteImage, 110, height/2-(100/2), 100, 100);
    }
    if (flashEnabled) {
      image(flashOnIcon, 40, height/2-(240/2)-320, 240, 240);
    } else {
      image(flashOffIcon, 40, height/2-(240/2)-320, 240, 240);
    }

    if (animationProgress<1) {
      animationProgress+=0.015;
    } else {
      animationProgress=1;
    }
    fill(0, 0, 0, 255-animationProgress*255);
    rect(0, 0, width, height);
  } else if (drawingMode == 1) {
    int maxWidth = width - (240 * 2);
    int maxHeight = height;

    float ratio = min((float)maxWidth / finalImage.width, (float)maxHeight / finalImage.height);
    int imgW = (int)(finalImage.width * ratio);
    int imgH = (int)(finalImage.height * ratio);

    int x = 240 + (maxWidth - imgW) / 2;
    int y = (maxHeight - imgH) / 2;

    image(finalImage, x, y, imgW, imgH);

    fill(0);
    noStroke();
    rect(x, y+(animationProgress*imgH), imgW, imgH);
    if (random(0, 12)<1) {
      float progressAdded=random(0.01, 0.1);
      animationProgress+=progressAdded;
      vibrate(int(1000*progressAdded));
    }
    if (animationProgress>=1) {
      drawingMode=2;
    }
  } else if (drawingMode == 2) {
    int maxWidth = width - (240 * 2);
    int maxHeight = height;

    float ratio = min((float)maxWidth / finalImage.width, (float)maxHeight / finalImage.height);
    int imgW = (int)(finalImage.width * ratio);
    int imgH = (int)(finalImage.height * ratio);

    int x = 240 + (maxWidth - imgW) / 2;
    int y = (maxHeight - imgH) / 2;

    image(finalImage, x, y, imgW, imgH);
    image(saveIcon, width-280, height/2-(240/2), 240, 240);
    image(trashIcon, 40, height/2-(240/2), 240, 240);
  } else if (drawingMode==3) {
    int maxWidth = width - (240 * 2);
    int maxHeight = height;

    float ratio = min((float)maxWidth / finalImage.width, (float)maxHeight / finalImage.height);
    int imgW = (int)(finalImage.width * ratio);
    int imgH = (int)(finalImage.height * ratio);

    int x = 240 + (maxWidth - imgW) / 2;
    int y = (maxHeight - imgH) / 2;

    pushMatrix();
    translate(x+imgW/2, y+imgH+(animationProgress*height*1.2));
    rotate(sin(animationProgress*13*2.2)/10.0);
    translate(-imgW/2, -imgH-(animationProgress*height*1.2));
    image(finalImage, 0, (animationProgress*height*1.2), imgW, imgH);
    popMatrix();
    animationProgress+=0.004;
    if (random(0, 1.5)<1&&animationProgress<0.6) {
      color col=color_palette[int(random(0, color_palette.length-0.001))];
      particles.add(new Particle(random(width/2-imgW/1.8, width/2+imgW/1.8), height+5, col, new PVector(random(-24, 24), random(-30, 0))));
    }
    for (int i = 0; i < particles.size(); i++) {
      Particle part = particles.get(i);
      part.tick();
      part.display();
    }
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle part = particles.get(i);
      if (part.finished()) {
        particles.remove(i);
      }
    }
    if (animationProgress>=1) {
      drawingMode=0;
      animationProgress=0;
      if (flashEnabled) {
        cam.enableFlash();
      }
    }
    noStroke();
    fill(0, 0, 0, map(animationProgress, 0, 1, -1024, 255));
    rect(-5, -5, width+10, height+10);
  } else if (drawingMode==4) {
    int maxWidth = width - (240 * 2);
    int maxHeight = height;

    float ratio = min((float)maxWidth / finalImage.width, (float)maxHeight / finalImage.height);
    int imgW = (int)(finalImage.width * ratio);
    int imgH = (int)(finalImage.height * ratio);

    int x = 240 + (maxWidth - imgW) / 2;
    int y = (maxHeight - imgH) / 2;
    image(finalImage, x, y, imgW, imgH);
    animationProgress+=0.004;


    fill(255, 0, 0, 128);
    stroke(255, 0, 0, 70);
    strokeWeight(10);
    rect(x, height/2+(sin(animationProgress*15)*imgH/2), imgW, 10);

    noStroke();
    fill(0, 0, 0, map(animationProgress, 0, 1, -1024, 250));
    rect(-5, -5, width+10, height+10);
    if (animationProgress>=1) {
      drawingMode=0;
      animationProgress=0;
      if (flashEnabled) {
        cam.enableFlash();
      }
      background(0);
    }
    if (animationProgress>0.99) {
      background(0);
    }
  }
}

float animationProgress=0;


ArrayList<Particle> particles = new ArrayList<Particle>();


int selectedIndex=0;
int paletteIconHeight=160;
float paletteSlotWidth = 200;        // fixed px per palette slot
float paletteScrollOffset = 0;
float paletteDragStartX = 0;
float paletteDragStartOffset = 0;
boolean paletteDragging = false;
static final int DRAG_THRESHOLD = 12;
float paletteVelocity = 0;       // current scroll velocity (px/frame)
float lastMouseX = 0;            // mouseX on the previous frame
static final float FRICTION = 0.91;  // velocity multiplier per frame (0–1)

void mousePressed() {
  if (drawingMode == 0 && mouseY > height - paletteIconHeight - 28) {
    paletteDragging       = true;
    paletteDragStartX     = mouseX;
    paletteDragStartOffset = paletteScrollOffset;
    paletteVelocity       = 0;   // kill any ongoing coast
    lastMouseX            = mouseX;
  }
}

void mouseDragged() {
  if (paletteDragging) {
    float totalPaletteWidth = palettes.length * paletteSlotWidth;
    float maxScroll = max(0, totalPaletteWidth - width);
    paletteScrollOffset = constrain(
      paletteDragStartOffset - (mouseX - paletteDragStartX),
      0, maxScroll
      );
    paletteVelocity = lastMouseX - mouseX;  // positive = scrolling right
    lastMouseX = mouseX;
  }
}

void mouseReleased() {
  if (drawingMode == 0) {
    paletteDragging = false;
    // velocity keeps its value so it coasts after release

    if (abs(mouseX - paletteDragStartX) < DRAG_THRESHOLD) {
      for (int i = 0; i < palettes.length; i++) {
        float x = paletteSlotWidth * i + (paletteSlotWidth - paletteIconHeight) / 2
          - paletteScrollOffset;
        int y = height - paletteIconHeight - 7;
        if (mouseX > x && mouseY > y &&
          mouseX < x + paletteIconHeight && mouseY < y + paletteIconHeight) {
          selectedIndex = i;
          color_palette = palettes[i];
          randomPaletteImage=new PImage(1, 1);
          paletteText=names[i];
        }
      }
    }
    if (mouseX>width-280&&mouseY>height/2-(240/2)&&mouseX<width-280+240&&mouseY<height/2-(240/2)+240) {
      if (selectedIndex==-1) {
        int[] palette=generateRandomPalette(int(random(3, 7)));
        color_palette=palette;
        randomPaletteImage=imgFromPallete(palette);
      }
      drawingMode=1;
      finalImage=getProcessedImage();
      animationProgress=0;
      if (flashEnabled) {
        cam.disableFlash();
        delay(100);
        cam.enableFlash();
        delay(200);
        cam.disableFlash();
      }
    }
    if (mouseX>width-280&&mouseY>height/2-(240/2)-320&&mouseX<width-280+240&&mouseY<height/2-(240/2)+240-320) {
      lowRes=!lowRes;
      if (lowRes) {
        cameraWidth=cameraWidth2;
        cameraHeight=cameraHeight2;
      } else {
        cameraWidth=cameraWidth1;
        cameraHeight=cameraHeight1;
      }
      cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
      cam.start();
    }
    if (mouseX>40&&mouseY>height/2-(240/2)-320&&mouseX<40+240&&mouseY<height/2-(240/2)+240-320) {
      flashEnabled=!flashEnabled;
      if (flashEnabled) {
        cam.enableFlash();
      } else {
        cam.disableFlash();
      }
    }
    if (mouseX>40&&mouseY>height/2-(240/2)&&mouseX<40+240&&mouseY<height/2-(240/2)+240) {
      int[] palette=generateRandomPalette(int(random(3, 7)));
      color_palette=palette;
      randomPaletteImage=imgFromPallete(palette);
      selectedIndex=-1;
      paletteText="Random";
    }
  } else if (drawingMode==1) {
    animationProgress+=0.25;
  } else if (drawingMode==3||drawingMode==4) {
    animationProgress=0.8;
    vibrator.cancel();
  } else if (drawingMode==2) {
    if (mouseX>width-280&&mouseY>height/2-(240/2)&&mouseX<width-280+240&&mouseY<height/2-(240/2)+240) {
      drawingMode=4;
      animationProgress=0;
      PImage upscaled = createImage(finalImage.width * 10, finalImage.height * 10, ARGB);
      finalImage.loadPixels();
      upscaled.loadPixels();
      for (int y = 0; y < finalImage.height; y++) {
        for (int x = 0; x < finalImage.width; x++) {
          color c = finalImage.pixels[y * finalImage.width + x];
          for (int dy = 0; dy < 10; dy++) {
            for (int dx = 0; dx < 10; dx++) {
              upscaled.pixels[(y * 10 + dy) * upscaled.width + (x * 10 + dx)] = c;
            }
          }
        }
      }
      upscaled.updatePixels();

      String folder = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).getAbsolutePath();
      String fileName = "palette_" + year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ".png";
      String filePath = folder + "/" + fileName;

      upscaled.save(filePath);
      MediaScannerConnection.scanFile(getActivity(), new String[]{ filePath }, null, null);
    }
    if (mouseX>40&&mouseY>height/2-(240/2)&&mouseX<40+240&&mouseY<height/2-(240/2)+240) {
      drawingMode=3;
      animationProgress=0;
      vibrate(3800, 10);
    }
  }
}

void stopVibration() {
  if (vibrator != null) {
    vibrator.cancel();
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
