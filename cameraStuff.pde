void setupCamera() {
  switch (resolutionType) {
  case 0:
    cameraWidth=cameraWidth1;
    cameraHeight=cameraHeight1;
    break;
  case 1:
    cameraWidth=cameraWidth1;
    cameraHeight=cameraHeight1;
    break;
  case 2:
    cameraWidth=cameraWidth2;
    cameraHeight=cameraHeight2;
    break;
  case 3:
    cameraWidth=cameraWidth3;
    cameraHeight=cameraHeight3;
    break;
  }
  cam = new KetaiCamera(this, cameraWidth, cameraHeight, 10);
  cam.start();
}
