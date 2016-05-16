//-- variables
int max_x = 400;
int max_y = 600;
int min_x = 0;
int min_y = 0;
int score = 0;
float rand;
float rand1;
float rand2;
int grid_size = 10;
int leftwallbound = 40;
int rightwallbound = max_x - (leftwallbound + 10);
ObstacleBlock obstacle;
AI aileft;
AI airight;
TetrisBlocks block;
ArrayList<TetrisBlocks> blocks;

void settings()
{
size( max_x, max_y);
}

void setup()
{
  aileft = new AI(new PVector(leftwallbound,50,0), 10, max_y, 0, true, true, leftwallbound, rightwallbound);
  airight = new AI(new PVector(rightwallbound, max_y - 40, 0), 10, max_y, 0, true, false, leftwallbound, rightwallbound);
  block = new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 60, 0), 10, rightwallbound, leftwallbound, max_y);
  obstacle = new ObstacleBlock(new PVector(leftwallbound + 40, 450, 0), 10);

}

void draw()
{
   background( #000000 );
   
  //-- draw the side walls.
 for ( int x=min_x; x<=max_x; x+=grid_size )
 {
    for ( int y=min_y; y<=max_y; y+=grid_size )
     {
       if(x < leftwallbound || x > rightwallbound)
       {
         rand = random(255);
         rand1 = random(255);
         rand2 = random(255);
         fill(rand, rand1, rand2);
         rect(x,y, grid_size, grid_size);
         fill(255,255,255);
         textSize(30);
         textAlign(CENTER);
         text("SCORE : " + score, width/2, 40);
       }
     }
  }
  aileft.getActiveTarget(block.getPosition());
  airight.getActiveTarget(block.getPosition());
  aileft.draw(block.getPosition());
  airight.draw(block.getPosition());
  block.draw();
  obstacle.draw();
  println("collide : " + obstacle.collide(block.getPosition()));
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
      block.goLeft();
      
    if (keyCode == LEFT) 
      block.goRight();
  }
}