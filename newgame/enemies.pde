class Enemy {
  color c;
  float xpos,ypos,direction,speed,delay;
  boolean alive;
  Enemy() {
   xpos = random(0,width);
   ypos = random(0,height);
   speed = random(2,4);
   delay = random(0,1000);
   alive = true;
  }
  
  void drawEnemy(){
    if(delay <= 0){
      if(alive){
        direction = atan2(y-ypos,x-xpos);
        pushMatrix();
        translate(xpos,ypos);
        rotate(direction);
        rect(0,0,20,20);
        rect(20,0,10,10);
        popMatrix();
        xpos += cos(direction)*(speed*gameSpeed);
        ypos += sin(direction)*(speed*gameSpeed);
      }
    }
    else delay-=1*gameSpeed;
  }
  void updateEnemy(){
    for(int i =0; i < bullet.length -1;i++){
      if(bullet[i] != null && delay <= 0){
        if(xpos < bullet[i].bx+bullet[i].bw/2 && xpos > bullet[i].bx-bullet[i].bw/2){
          if(ypos < bullet[i].by+bullet[i].bh/2 && ypos > bullet[i].by-bullet[i].bh/2){
            alive = false;
            points++;
          }
        }
      }
    }
  }
}