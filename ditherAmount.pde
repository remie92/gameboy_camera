float ditherAmount(int original, int xTotal, int yTotal, int colorAmount){
  //float ditherAmount=0;
  int x=xTotal%4;
  int y=yTotal%4;
  //float[][] dither=new float[4][4];
  float colorNumber=255.0/colorAmount;
  //float baseThreshHold=colorNumber/2;
  float t = map(original%(255/colorAmount),0,255/colorAmount,0,1);
  int index = int(t * 9);
  index=9-index;
  if(index<=0){
    index=1;
  }
  index--;
  
  if(index!=-1){
    return dithers[index][x][y]-0.5;
  }else{
    return 0;
  }
}
