class TetrisBlocks
{
    TetrisBlocks(PVector position, int size, int leftwall, int rightwall, int floor)
  {
    this.size = size;
    this.position = position;
    r = random(255);
    g = random(255);
    b = random(255);
    float pickblock = random(-1,2);
    createBlocks((int)pickblock);
    this.rightwall = rightwall;
    this.leftwall = leftwall;
    this.floor = floor;
  }
  
  //-- draws the tetris block.
  void draw()
{
  fill(r,g,b);
  //-- draws the rectangle.
  for(int i = 0; i < 3; i++)
  {
    rect(blocks[i].x, blocks[i].y, size, size);
  //-- makes sure the block hits the bottom of the screen or the top of
  //-- another tetris piece.
  if(!stopped_var){
    if(floor > this.blocks[lowestpoint].y + this.size)
      this.blocks[i].y++;
    else if (floor<= this.blocks[lowestpoint].y + 2*this.size)
       stop();
  }  
}
  

}

//-- create blocks based on the three variations
void createBlocks(int i)
{
  switch(i)
  {
    case 0:
    //--  __   __
    //-- |  | |  |
    //--  --   --
    //--  __
    //-- |  |
    //--  --
    //-- create the shape above for tetris piece.
    blocks[0] = new PVector(position.x + size, position.y, 0);
    blocks[1] = new PVector(position.x + size , position.y + size ,0);
    blocks[2] = new PVector(position.x + (size * 2), position.y , 0);
    //-- block #1 is the lowest point of the shape.
    lowestpoint = 1;
    rightmostpoint = 2;
    leftmostpoint = 1;
    topmost = 1;
    break;
    case 1:
    //--       __
    //--      |  |
    //--       --
    //--  __   __
    //-- |  | |  |
    //--  --   --
    //-- create the shape above for tetris piece.
    blocks[0] = new PVector(position.x + size, position.y, 0);
    blocks[1] = new PVector(position.x + size , position.y + size ,0);
    blocks[2] = new PVector(position.x, position.y + size, 0);
    //-- block #1 is the lowest point of the shape.
    lowestpoint = 1;
    rightmostpoint = 0;
    leftmostpoint = 2;
    topmost = 0;
    break;
    case 2:
    //--  __   __   __
    //-- |  | |  | |  |
    //--  --   --   --
    //-- create the shape above for tetris piece.
    for(int z = 0; z < 3; i++)
      blocks[z] = new PVector(position.x + (size * z), position.y, 0);
    //-- block #1 is the lowest point of the shape.
    lowestpoint = 1;
    rightmostpoint = 2;
    leftmostpoint = 0;
    topmost = 0;
    break;
  }
  
  println(i);
}

//-- get the blocks location.
PVector getPosition(){return this.blocks[lowestpoint];}

PVector getTopPosition(){return this.blocks[topmost];}

//-- makes the block go right until it hits the end of the wall.
void goRight()
{
  if(blocks[rightmostpoint].x > rightwall)
  {
    for(int i= 0; i < 3; i++)
        blocks[i].x-=this.size;
  }
}

//-- makes the block go left until it hits the end of the wall.
void goLeft()
{
  if(blocks[leftmostpoint].x < leftwall)
  {
    for(int i= 0; i < 3; i++)
        blocks[i].x+=this.size;
  }
    
}

void goDown()
{
  
    
    for(int i= 0; i < 3; i++)
        blocks[i].y+=this.size;
  
}

void stop()
{

      for(int i = 0; i < 3; i++){
        blocks[i].y = this.blocks[i].y;
        blocks[i].x = this.blocks[i].x;
      } 
      stopped_var = true;

}

boolean stopped()
{
      
      if(stopped_var)
        return true;
      else
        return false;
}

//-- get the color from this class.
float colorR(){return r;}
float colorG(){return g;}
float colorB(){return b;}

//-- set the color of the tetris block.
void setColor(float r1, float g1, float b1)
{ 
this.r = r1;
this.g = g1;
this.b = b1;
}
  
  PVector position;
  PVector[] blocks = new PVector[3];
  color blockcolor;
  int size;
  int leftwall;
  int rightwall;
  int lowestpoint;
  int rightmostpoint;
  int leftmostpoint;
  int topmost;
  int floor;
  boolean stopped_var = false;
  float r, r1, b, b1, g, g1;
}