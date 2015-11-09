//declare variables
float gravity, airResistance;
int count = 30;
//declare array
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
 
 for(int i = 0; i < count; i++) {
  x[i] = width/2;
  y[i] = height/2;
  diam[i] = 80;
  velX[i] = random(-5, 5);
  velY[i] = random(-5, 5);
  colorMode(HSB,800,600,100);
 }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < count; i++){
    gravity = 0.45;
    airResistance = 0.99;
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);
  
    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
    fill(x[i],y[i],100);
    
    velY[i] += gravity; //add gravity
    velY[i] *= airResistance; //make sure the ball doesn't get higher than starting point
    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    
  if (y[i] >= height) { //make sure ball doesn't escape from bottom of screen
    y[i] = height - velY[i];
    velY[i] = -abs(velY[i]);
  }  
    
  }

}