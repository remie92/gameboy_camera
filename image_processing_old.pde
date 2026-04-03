//img is a low resolution image in black and white.
//palette is an array of colors, with index 0 being the darkest color, and the highest index being the brightest color
PImage processImage_old(PImage img, color[] pallete){
  int colorAmount=pallete.length;
  for(int i=0;i<img.width;i++){
    for(int j=0; j<img.height;j++){
      int originalColor=int(red(img.get(i,j)));
      int selectedPalleteColor=int(map(originalColor,0,255,0,colorAmount-0.5)+ditherAmount(originalColor,i,j,colorAmount));
      if(selectedPalleteColor>=pallete.length){selectedPalleteColor--;}
      color newColor=pallete[selectedPalleteColor];
      img.set(i,j,newColor);
    }
  }
  return img;
}
