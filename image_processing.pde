//img is an low resolution image in black and white.
//palette is an array of colors, with index 0 being the darkest color, and the highest index being the brightest color
PImage processImage(PImage img, color[] pallete, float ditherAmount){
  int colorAmount=pallete.length;
  for(int i=0;i<img.width;i++){
    for(int j=0; j<img.height;j++){
      int originalColor=int(red(img.get(i,j)));
      color newColor=pallete[int(map(originalColor+random(-ditherAmount,ditherAmount),0,255,0,colorAmount-0.5))];
      println(originalColor);
      img.set(i,j,newColor);
    }
  }
  return img;
}
