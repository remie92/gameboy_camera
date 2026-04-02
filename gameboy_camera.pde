//Test
PImage testImage;
color[] test_pallete={
color(94,0,6),
color(155,15,6),
color(213,62,15),
color(238,217,185)
};
void setup(){
size(700,700);
noSmooth();
testImage=loadImage("temp_image.jpeg");
testImage.filter(GRAY);
testImage.resize(128,128);
PImage processedImage=processImage(testImage,test_pallete,10);
image(processedImage,0,0,width,height);
}
