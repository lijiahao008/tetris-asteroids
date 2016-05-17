class TetrisBlocks
{
    TetrisBlocks(PVector position, int size, int leftwall, int rightwall, int floor)
  {
    this.size = size;
    this.position = position;
    float r = random(2);
    bulletColor = new Color((int)r);
    //float pickblock = random(2);
    createBlocks(int(random(2)));
    this.rightwall = rightwall;
    this.leftwall = leftwall;
    this.floor = floor;
  }
  
  //-- draws the tetris block.
  void draw()
{
  fill(bulletColor.getR(),bulletColor.getG(),bulletColor.getB());
  //-- draws the rectangle.
  for(int i = 0; i < 3; i++)
  {
    rect(blocks[i].x, blocks[i].y, size, size);
  //-- makes sure the block hits the bottom of the screen or the top of
  //-- another tetris piece.
  if(!stopped_var){
    if(floor > this.blocks[lowestpoint].y + this.size)
      this.blocks[i].y++;
    else if (floor<= this.blocks[lowestpoint].y + this.size)
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
    blocks[2] = new PVector(position.x + (2 * size), position.y , 0);
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



PVector getLowestPosition(){return new PVector(this.blocks[lowestpoint].x,this.blocks[lowestpoint].y + this.size,this.blocks[lowestpoint].z) ;}

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
float colorR(){return bulletColor.getR();}
float colorG(){return bulletColor.getG();}
float colorB(){return bulletColor.getB();}

//-- set the color of the tetris block.
void setColor(float r1, float g1, float b1)
{ 
this.bulletColor.setR(r1);
this.bulletColor.setG(g1);
this.bulletColor.setB(b1);
}
  
  PVector position;
  PVector[] blocks = new PVector[3];
  color blockcolor;
  Color bulletColor;
  int size;
  int leftwall;
  int rightwall;
  int lowestpoint;
  int rightmostpoint;
  int leftmostpoint;
  int topmost;
  int floor;
  boolean stopped_var = false;
  float  r1,  b1,  g1;
}