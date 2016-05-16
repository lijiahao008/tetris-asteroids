//-- variables
int max_x = 400;
int max_y = 600;
int min_x = 0;
int min_y = 0;
int grid_size = 10;
int leftwallbound = 40;
int rightwallbound = max_x - (leftwallbound + 10);
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
  aileft = new AI(new PVector(leftwallbound,50,0), 10, max_y, 0, true);
  airight = new AI(new PVector(rightwallbound, max_y - 40, 0), 10, max_y, 0, true);
  block = new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 0, 0), 10);
}

void draw()
{
   background( #ffffff );
  //-- draw the side walls.
 for ( int x=min_x; x<=max_x; x+=grid_size )
 {
    for ( int y=min_y; y<=max_y; y+=grid_size )
     {
       if(x < leftwallbound || x > rightwallbound)
        rect(x,y, grid_size, grid_size);
     }
  }
  aileft.getActiveTarget(block.getPosition());
  airight.getActiveTarget(block.getPosition());
  aileft.draw();
  airight.draw();
  block.draw();
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