//img is a low resolution image in black and white.
//palette is an array of colors, with index 0 being the darkest color, and the highest index being the brightest color\

int debugMode=-1;
PImage processImage(PImage img, color[] palette) {
  int colorAmount=palette.length;
  PImage output=img.copy();
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      float value=brightness(img.get(i, j))/255.0;
      value+=random(-0.03,0.03);
      value=constrain(value,0,1);



      //int colorIndex=constrain((colorAmount)-int(value*(colorAmount)), 1, colorAmount-1);
      float colValue=value*(colorAmount-1.0001);
      int colorIndex=int(colValue);
      colorIndex=constrain(colorIndex, 0, colorAmount-2);
      float inBetweenValue=colValue%1;
      //img.set(i, j, color(value, value, 0));
      int ditherPattern=getDitherPattern(inBetweenValue);

      if (j==0) {
        println(i, colorIndex, ditherPattern, colValue, value, brightness(img.get(i, j)));
      }

      img.set(i, j, getColor(palette[colorIndex], palette[colorIndex+1], i, j, ditherPattern));
    }
  }








  if (debugMode==1) {
    for (int i=0; i<img.width; i++) {
      for (int j=0; j<img.height; j++) {
        int value=int(red(img.get(i, j)));
        if (i==0||i==1) {
          println(value, i);
        }

        img.set(i, j, getColor(color(0, 255, 0), color(0, 0, 255), i, j, getDitherPattern(value/255.0)));
      }
    }
  }
  return img;
}

int getDitherPattern(float factor) {

  return constrain(int(factor*ditherPatterns.length), 0, ditherPatterns.length-1);
}

color getColor(color col1, color col2, int x, int y, int ditherPattern) {
  x=x%ditherPatterns[ditherPattern].length;
  y=y%ditherPatterns[ditherPattern][0].length;
  if (ditherPatterns[ditherPattern][x][y]==1) {
    return col2;
  } else {
    return col1;
  }
}



//int[][][] ditherPatterns={

//  {
//    {0, 0},
//    {0, 1},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 1, 0, 0},
//    {1, 0, 1, 0},
//    {0, 0, 0, 1}
//  },
//  {
//    {1, 0},
//    {0, 1},
//  },
//  {
//    {0, 1, 0, 1},
//    {1, 0, 1, 1},
//    {0, 1, 0, 1},
//    {1, 1, 1, 0}
//  },
//  {
//    {1, 1},
//    {1, 0},
//  },
//  {{1}}

//};




//int[][][] ditherPatterns={
//{
//  {0,0,0},
//  {0,0,0},
//  {0,0,0},
//},
//{
//  {1,0,0},
//  {0,0,0},
//  {0,0,0},
//},
//{
//  {1,0,0},
//  {0,0,0},
//  {0,1,0},
//},
//{
//  {1,0,0},
//  {0,0,1},
//  {0,1,0},
//},
//{
//  {1,0,0},
//  {0,1,1},
//  {0,1,0},
//},
//{
//  {1,0,0},
//  {1,1,1},
//  {0,1,0},
//},
//{
//  {1,0,0},
//  {1,1,1},
//  {0,1,1},
//},
//{
//  {1,0,1},
//  {1,1,1},
//  {0,1,1},
//},
//{
//  {1,0,1},
//  {1,1,1},
//  {1,1,1},
//},

//};



int[][][] ditherPatterns={

  {
    {0, 0},
    {0, 0},
  },
  {
    {0, 0},
    {0, 1},
  },
  {
    {1, 0},
    {0, 1},
  },
  {
    {1, 0},
    {1, 1},
  },
};






//int[][][] ditherPatterns={
//  {
//    {0,1}
//  },
//};
