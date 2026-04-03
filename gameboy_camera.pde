import android.os.Environment;
import android.media.MediaScannerConnection;
PImage printIcon;
PImage trashIcon;
PImage saveIcon;
PImage lowIcon;
PImage highIcon;

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

int[][][] dithers=new int[0][0][0];
PImage processedImage;
void setup(){
  test_pallete=loadPallete("purple");
  dithers=loadDithers();
  if (lowRes) {
    cameraWidth=cameraWidth2;
    cameraHeight=cameraHeight2;
  } else {
    cameraWidth=cameraWidth1;
    cameraHeight=cameraHeight1;
  }
  cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
  cam.start();
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
