float ditherAmount(int original, int xTotal, int yTotal, int colorAmount){
  float ditherAmount=0;
  int x=xTotal%4;
  int y=yTotal%4;
  float[][] dither=new float[4][4];
  if(original%(255/colorAmount)>(255/colorAmount)/2-(255/colorAmount)/8&&original%(255/colorAmount)<(255/colorAmount)/2+(255/colorAmount)/8){
    for(int i=0; i<4; i++){
      for(int j=0; j<4; j++){
        dither[i][j]=dithers[0][i][j];
      }
    }
    ditherAmount=dither[x][y]-0.5;
  }
  if(original%(255/colorAmount)>(255/colorAmount)/2+(255/colorAmount)/16&&original%(255/colorAmount)<(255/colorAmount)/2+(255/colorAmount)/5){
    for(int i=0; i<4; i++){
      for(int j=0; j<4; j++){
        dither[i][j]=dithers[1][i][j];
      }
    }
    ditherAmount=dither[x][y]-0.5;
  }
  if(original%(255/colorAmount)>(255/colorAmount)/2-(255/colorAmount)/6&&original%(255/colorAmount)<(255/colorAmount)/2-(255/colorAmount)/16){
    for(int i=0; i<4; i++){
      for(int j=0; j<4; j++){
        dither[i][j]=dithers[2][i][j];
      }
    }
    ditherAmount=dither[x][y]-0.5;
  }
  return ditherAmount;
}
