PImage backgroundImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

float soldierX;
float soldierY;

float robotX;
float robotY;

float laserBeginX;
float laserLastX;
float laserY;
float laserWidth;
float laserSpeed;

void setup() {
	size(640, 480, P2D);

	// images
  backgroundImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg = loadImage("img/robot.png");
  soilImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");
  
  //soldier show
  soldierX = 0;
  soldierY = floor(random(2,6))*80;
  
  //robot show
  robotX = floor(random(2,8))*80;
  robotY = floor(random(2,6))*80;
  
  //robot laser
  laserBeginX=robotX+25;
  laserLastX=robotX+25;
  laserY = robotY+37;
  laserSpeed = 2;
  
}

void draw() {
	// background
  image(backgroundImg,0,0);
  
  //soil
  image(soilImg,0,160);
  
  //grass
  noStroke();
  fill(124, 204, 25); //grass color
  rect(0,145,640,15);
  
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(590,50,120,120);
  
    //groundhog
  image(groundhogImg,width/2-40,80);
  
  //life
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  //soldier
  image(soldierImg,soldierX-80,soldierY);
  
  //soldier move
  soldierX+=4;
  soldierX%=640+80;
  
  //robot show
  image(robotImg,robotX,robotY);
  
  //robot laser
  stroke(255,0,0);
  strokeWeight(10);
  line(laserBeginX, laserY, laserLastX, laserY);
  
    //robot laser width
  laserWidth=laserLastX-laserBeginX;
  
  //laser start to move
  laserBeginX-=laserSpeed;
  
  //laser width equal 40
  if(laserWidth==40){
    laserLastX-=laserSpeed;
  }
  
    //laser gone
  if(laserBeginX<=robotX-160){
    laserBeginX=robotX+25;
    laserLastX=robotX+25;
  }
}
