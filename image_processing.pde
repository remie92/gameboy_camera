//img is a low resolution image in black and white.
//palette is an array of colors, with index 0 being the darkest color, and the highest index being the brightest color\

int debugMode=-1;
PImage processImage(PImage img, color[] palette) {
  int colorAmount=palette.length;
  PImage output=img.copy();
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      float value=brightness(img.get(i, j))/255.0;
      value+=random(-0.03, 0.03);
      value=constrain(value, 0, 1);



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
//  {
//    {0, 0, 0, 0},
//    {0, 0, 0, 0},
//    {0, 0, 0, 0},
//    {0, 0, 0, 0},
//  },
//  {
//    {1, 0, 0, 0},
//    {0, 0, 0, 0},
//    {0, 0, 0, 0},
//    {0, 0, 0, 0},
//  },
//  {
//    {1, 0, 0, 0},
//    {0, 0, 0, 0},
//    {0, 0, 1, 0},
//    {0, 0, 0, 0},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 0, 0, 0},
//    {0, 0, 1, 0},
//    {0, 0, 0, 0},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 0, 0, 0},
//    {1, 0, 1, 0},
//    {0, 0, 0, 0},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 1, 0, 0},
//    {1, 0, 1, 0},
//    {0, 0, 0, 0},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 1, 0, 0},
//    {1, 0, 1, 0},
//    {0, 0, 0, 1},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 1, 0, 1},
//    {1, 0, 1, 0},
//    {0, 0, 0, 1},
//  },
//  {
//    {1, 0, 1, 0},
//    {0, 1, 0, 1},
//    {1, 0, 1, 0},
//    {0, 1, 0, 1},
//  },
//  {
//    {1, 1, 1, 0},
//    {0, 1, 0, 1},
//    {1, 0, 1, 0},
//    {0, 1, 0, 1},
//  },
//  {
//    {1, 1, 1, 0},
//    {0, 1, 0, 1},
//    {1, 0, 1, 1},
//    {0, 1, 0, 1},
//  },
//  {
//    {1, 1, 1, 1},
//    {0, 1, 0, 1},
//    {1, 0, 1, 1},
//    {0, 1, 0, 1},
//  },
//  {
//    {1, 1, 1, 1},
//    {0, 1, 0, 1},
//    {1, 1, 1, 1},
//    {0, 1, 0, 1},
//  },
//  {
//    {1, 1, 1, 1},
//    {1, 1, 0, 1},
//    {1, 1, 1, 1},
//    {0, 1, 0, 1},
//  },
//  {
//    {1, 1, 1, 1},
//    {1, 1, 0, 1},
//    {1, 1, 1, 1},
//    {0, 1, 1, 1},
//  },
//  {
//    {1, 1, 1, 1},
//    {1, 1, 1, 1},
//    {1, 1, 1, 1},
//    {0, 1, 1, 1},
//  },


//};





//  int[][][] ditherPatterns={
//    {
//      {0, 0, 0},
//      {0, 0, 0},
//      {0, 0, 0},
//    },
//    {
//      {1, 0, 0},
//      {0, 0, 0},
//      {0, 0, 0},
//    },
//    {
//      {1, 0, 0},
//      {0, 0, 0},
//      {0, 1, 0},
//    },
//    {
//      {1, 0, 0},
//      {0, 0, 1},
//      {0, 1, 0},
//    },
//    {
//      {1, 0, 0},
//      {0, 1, 1},
//      {0, 1, 0},
//    },
//    {
//      {1, 0, 0},
//      {1, 1, 1},
//      {0, 1, 0},
//    },
//    {
//      {1, 0, 0},
//      {1, 1, 1},
//      {0, 1, 1},
//    },
//    {
//      {1, 0, 1},
//      {1, 1, 1},
//      {0, 1, 1},
//    },
//    {
//      {1, 0, 1},
//      {1, 1, 1},
//      {1, 1, 1},
//    },

//};



//int[][][] ditherPatterns={

//  {
//    {0, 0},
//    {0, 0},
//  },
//  {
//    {0, 0},
//    {0, 1},
//  },
//  {
//    {1, 0},
//    {0, 1},
//  },
//  {
//    {1, 0},
//    {1, 1},
//  },
//};






//int[][][] ditherPatterns={
//  {
//    {0,1}
//  },
//};

int[][][] generateDitherPatterns(int n) {
  int size = n * n;
  int bits = (int)(log(n) / log(2)); // log2(n) — n must be a power of 2
  
  // Step 1: compute the Bayer matrix using the formula
  int[][] bayer = new int[n][n];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      int interleaved = bitInterleave(i ^ j, i, bits);
      bayer[i][j] = bitReverse(interleaved, bits * 2);
    }
  }
  
  // Step 2: sort cell positions by their Bayer rank (fill order)
  int[][] pos = new int[size][2];
  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      pos[i * n + j] = new int[]{i, j};
  
  for (int a = 0; a < size - 1; a++)
    for (int b = a + 1; b < size; b++)
      if (bayer[pos[b][0]][pos[b][1]] < bayer[pos[a][0]][pos[a][1]]) {
        int[] tmp = pos[a]; pos[a] = pos[b]; pos[b] = tmp;
      }
  
  // Step 3: build patterns — patterns[k] has exactly k cells set to 1
  // patterns[0] = all zeros, patterns[n²-1] = all filled except the last cell
  int[][][] patterns = new int[size][n][n];
  for (int k = 1; k < size; k++) {
    for (int i = 0; i < n; i++)
      patterns[k][i] = patterns[k-1][i].clone();
    patterns[k][pos[k-1][0]][pos[k-1][1]] = 1;
  }
  
  return patterns;
}

// Interleaves bits: a → even positions (0,2,4...), b → odd positions (1,3,5...)
int bitInterleave(int a, int b, int bits) {
  int result = 0;
  for (int k = 0; k < bits; k++) {
    result |= ((a >> k) & 1) << (2 * k);
    result |= ((b >> k) & 1) << (2 * k + 1);
  }
  return result;
}

// Reverses the lowest numBits bits of val
int bitReverse(int val, int numBits) {
  int result = 0;
  for (int k = 0; k < numBits; k++)
    result |= ((val >> k) & 1) << (numBits - 1 - k);
  return result;
}
