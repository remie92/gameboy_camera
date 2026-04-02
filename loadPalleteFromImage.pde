color[] loadPallete(String name){
  color[] newPallete=new color[0];
  PImage pallete=loadImage(name+".png");
  for(int i=pallete.width-1;i>-1;i--){
    newPallete = append(newPallete, pallete.get(i, 0));
  }
  return newPallete;
}
