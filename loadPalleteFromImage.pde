color[] loadPallete(String name){
  color[] newPallete=new color[0];
  PImage pallete=loadImage(name+".png");
  for(int i=pallete.width;i>0;i--){
    newPallete = append(newPallete, pallete.get(i, 0));
  }
  return newPallete;
}
