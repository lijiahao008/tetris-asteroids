//-- Ernst Natahniel blanchard
//-- Jiahao Li
//-- Date  May 16, 2016
//-- Game Design Project
AI aileft;
AI airight;
float rand;
float rand1;
float rand2;
boolean win;
boolean lose;
int min_x = 0;
int min_y = 0;
int score = 0;
int max_x = 400;
int max_y = 600;
Collide collide;
TetrisBlocks block;
int grid_size = 10;
int leftwallbound = 40;
ObstacleBlock obstacle;
ObstacleBlock obstacle2;
ArrayList<TetrisBlocks> blocks;
int rightwallbound = max_x - (leftwallbound + 10);

//-- sets the size of the screen.
void settings()
{
  //-- sets the size of the screen.
size( max_x, max_y);
}

//-- sets up all the variables.
void setup()
{
  //-- initializes the ai. It takes in the initial position of the ai, the size of the ai, 
  //-- the next two variables will place the ai either on the top or the bottom of the screen
  //-- the next variable will indicate if the game should make the ai go downward when it start out
  //-- or should the ai start going upward. The next variable will indicate what direction the bullets 
  //-- should shoot. The last two variables will set bounds of the screen so when the bullet hits the wall it 
  //-- will destory itself.
  aileft = new AI(new PVector(leftwallbound,50,0), 10, max_y, 0, true, true, leftwallbound, rightwallbound);
  airight = new AI(new PVector(rightwallbound, max_y - 40, 0), 10, max_y, 0, true, false, leftwallbound, rightwallbound);
  block = new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 60, 0), 10, rightwallbound, leftwallbound, max_y);
  obstacle = new ObstacleBlock(new PVector(leftwallbound + random(10,60), random(200,450), 0), 10);
  obstacle2 = new ObstacleBlock(new PVector(rightwallbound - random(10,60), random(200,450), 0), 10);
  collide = new Collide();
  blocks = new ArrayList();
  blocks.add(block);
}

void draw()
{
   background( #000000 );
   
   //-- if the player didnt win or lose then continue the game.
   if(!lose && !win)
   {
  //-- draw the side walls that changes colors.
  //-- also draw the score text.
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
    airight.setColor(blocks.get(blocks.size()-1).colorR(), blocks.get(blocks.size()-1).colorG(), blocks.get(blocks.size()-1).colorB());
    aileft.getActiveTarget(blocks.get(blocks.size()-1).getPosition());
    airight.getActiveTarget(blocks.get(blocks.size()-1).getPosition());
    aileft.draw(blocks.get(blocks.size()-1).getPosition());
    airight.draw(blocks.get(blocks.size()-1).getPosition());
    obstacle.draw();
    obstacle2.draw();
    
    //--drawing all the blocks
    for (int i = 0; i < blocks.size(); i++){
      blocks.get(i).draw();
    }
    
          //--detecting if the current block is on top of any blocks
          //--only start comparing when there are two more blocks in the array
          if(blocks.size()>=2){
            //--comparing the last block with all the previous blocks
            for (int i = 0; i < blocks.size()-1; i++){
            
              if(collide.collide(blocks.get(blocks.size()-1).getPosition(), blocks.get(i).getTopPosition(), 15)){
                //--if collided, the current block stops and generate a new block
                blocks.get(blocks.size()-1).stop();
                score += 10;
                blocks.add(new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 60, 0), 10, rightwallbound, leftwallbound, max_y) );
              }
            }
          }
    
          //--if the current block stopped then add 10 points and a new block
          if (blocks.get(blocks.size()-1).stopped()){
            score += 10;
            blocks.add(new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 60, 0), 10, rightwallbound, leftwallbound, max_y) );
          }
    
          //--Detects obstacle collision
          if(collide.collide(blocks.get(blocks.size()-1).getPosition(), obstacle.getPosition(), 20))
                lose = true;
          if(collide.collide(blocks.get(blocks.size()-1).getPosition(), obstacle2.getPosition(), 20))
                lose = true;
          
          //-- if the player is hit by a bullet from the ai on the left then
          //--
          for(int i = 0; i < aileft.getBullet().size() ;i++)
          {
            if(collide.collide(blocks.get(blocks.size()-1).getPosition(), aileft.getBullet().get(i), 10)){
                blocks.remove(blocks.size()-1);
                score -= 5;
                blocks.add(new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 60, 0), 10, rightwallbound, leftwallbound, max_y) );
            }
          }
          
          //-- if the player is hit by a bullet from the ai on the right then
          //--
          for(int i = 0; i < airight.getBullet().size() ;i++)
          {
            if(collide.collide(blocks.get(blocks.size()-1).getPosition(), airight.getBullet().get(i), 10)){
                blocks.remove(blocks.size()-1);
                score -= 5;
                blocks.add(new TetrisBlocks(new PVector(((rightwallbound - leftwallbound) / 2), 60, 0), 10, rightwallbound, leftwallbound, max_y) );
            }
          }
   }
   
   //--scoreing rules
   if(score >= 100)
     win = true;
   else if (score < 0)
     lose = true;
   
   //--wining and losing screen
   if(win)
   {
         fill(255,255,255);
         textSize(30);
         textAlign(CENTER);
         text("You Win! SCORE : " + score, width/2, height/2);
   }
   if(lose)
   {
         fill(255,255,255);
         textSize(30);
         textAlign(CENTER);
         text("You Lose :( SCORE : " + score, width/2, height/2);
   }
}

//--key controls
void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
      blocks.get(blocks.size()-1).goLeft();
      
    if (keyCode == LEFT) 
      blocks.get(blocks.size()-1).goRight();
      
    if (keyCode == DOWN) 
      blocks.get(blocks.size()-1).goDown();
  }
}