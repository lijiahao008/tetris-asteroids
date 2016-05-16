class AI
{
  AI(PVector position, int size, int bottom, int top, boolean start)
{
  this.position = position;
  this.size = size;
  this.top = top + size;
  this.bottom = bottom - (size * 2);
  this.start = start;
  if(start)
    move = 2;
  else
    move = -2;
}

void getActiveTarget(PVector position)
{

}

void draw()
{
   rect(position.x,position.y, size, size + 10);
   //-- ai move down
   position.y+=move;
  
  if(position.y > bottom || position.y < top)
    move = move * -1;
}

//-- variables
PVector position;
boolean start;
int size;
int move;
int bottom;
int top;
}