int[][][] loadDithers(){
  String[] ditherNames={"dither1","dither2","dither3"};
  int[][][] allDithers=new int[ditherNames.length][4][4];
  for(int i=0;i<ditherNames.length;i++){
    PImage loadedDither=loadImage(ditherNames[i]+".png");
    for(int j=0;j<loadedDither.width;j++){
      for(int k=0;k<loadedDither.height;k++){
        allDithers[i][j][k]=int(map(red(loadedDither.get(j,k)),0,255,0,1));
      }
    }
  }
  return allDithers;
}
//i is number of current PImage dither
//j is current x of current PImage dither
//k is current y of current PImage dither
