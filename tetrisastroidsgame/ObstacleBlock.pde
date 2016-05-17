class ObstacleBlock
{
    ObstacleBlock(PVector position, int size)
  {
    this.size = size;
    this.position = position;
  }
  
  void draw()
  {
  fill(255, 0, 0);
  rect(position.x, position.y, size, size);
  }

  PVector getPosition(){return this.position;}
  
  PVector position;
  int size;
}