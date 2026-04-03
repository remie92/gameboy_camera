int[][][] loadDithers(){
  //amount of black; dither1=8/16, dither2=4/16, dither3=12/16, dither4=6/16, dither5=10/16, dither6=2/16, dither7=14/16
  //in order for failed attempt
  //String[] ditherNames={"dither1","dither2","dither3","dither4","dither5","dither6","dither7"};
  //in order from bright to dark
  String[] ditherNames={"dither8","dither6","dither2","dither4","dither1","dither5","dither3","dither7","dither9"};
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
