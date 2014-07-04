  float g = 0.021f;
  int score = 0;
  int high_score = 0;
  int chain_num = 0;
  int flash_pace = 6;
  
  class Score{
   float x,y;
   float vy;
   int live_time;
   boolean isAlive;
   String s;
   int col;
   Score(float _x, float _y){
     x = _x;
     y = _y;
     vy = -1;
     isAlive = true;
     live_time = 120;
     s = "+" + 100*chain_num*chain_num;
     if(chain_num<10){
      col = 0;
     }
     else if(chain_num<20&&chain_num>=10){
      col = 1;
     }
     else if(chain_num<30&&chain_num>=20){
      col = 2;
     }
     else if(chain_num<40&&chain_num>=30){
      col = 3;
     }
   }
   void draw(){
     switch(col){
      case 0:
       fill( 1 * (live_time/flash_pace % 2) ,1 * (live_time /flash_pace % 2),255 * (live_time /flash_pace % 2));
       break;
      case 1:
       fill( 1 * (live_time/flash_pace % 2) ,255 * (live_time /flash_pace % 2),1 * (live_time /flash_pace % 2));
       break;
      case 2:
       fill( 255 * (live_time/flash_pace % 2) ,255 * (live_time /flash_pace % 2),1 * (live_time /flash_pace % 2));
       break;
      case 3:
       fill( 255 * (live_time/flash_pace % 2) ,1 * (live_time /flash_pace % 2),1 * (live_time /flash_pace % 2));
       break;
     }
    textSize(16);
    text(s,x,y);
   }
   void update(){
    y += vy;
    vy += 0.03f;
    live_time--;
    if(live_time <= 0){
     isAlive = false;
    } 
   }
  }
  
  ArrayList<Score> scores;
  
  class FireWorks{
    float x,y;
    float velocity;
    float direc;
    float size;
    boolean isAlive;
    int live_time;
    FireWorks(float _x, float _y,float fire_ball_size){
     x = _x;
     y = _y;
     velocity = random(3)+2;
     direc = random(360);
     size = fire_ball_size/3;
     isAlive = true;
     live_time = 120;
    }
    void draw(){
     fill(240*live_time/120,0,0);
     ellipse(x,y,size,size);
    }
    void update(){
      x += velocity * cos(direc/180*PI);
      y += velocity * sin(direc/180*PI);
      live_time-=2;
      if(live_time < 10){
       isAlive=false;
      }
    }
  }
  
  ArrayList<FireWorks> fire_works;
  
  class FireBall{
   float x,y;
   float vy;
   float size;
   FireBall(){
    init();
   }
   
   //initialize speed and radius.
   void init(){
    x = random(width);
    y = height;
    vy = -5-random(2); 
    size = 15+random(10);
   }
   
   void CreateFireWorks(int num){
     int n = num;
    if(n<=0){n=1;}
    for(int i = 0; i < n ; i++){
     FireWorks fw = new FireWorks(x,y,size);
     fire_works.add(fw);
    }
   }
   
   //draw yellow circle.
   void draw(){
    fill(255,140,20);
    ellipse(x,y,size,size);
   }
   
   //take a gravity,and off screen object init.
   void update(){
    y += vy;
    vy += g;
    if(y<0-size){
     init();
    } 
    
    if(fire_works.size()==0){
     //Collision of FireBall and Mouse
     if((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)<=(size+2)*(size+2)){
      //Explode FireBall that was clicked.
      if(mouseButton == LEFT){
       CreateFireWorks(100);
       score+=100*chain_num*chain_num;
       chain_num++;
       Score sco = new Score(x,y);
       scores.add(sco);
       init();
      }
     }
    }
    else{
     //Collision of FireWorks and FireBall
     int fw_length = fire_works.size();
     for(int i = fw_length-1; i >= 0; i--){
      FireWorks fw = fire_works.get(i);
      if( y < height - 50 && fw.live_time > 40 ){
       if((fw.x-x)*(fw.x-x)+(fw.y-y)*(fw.y-y)<=(size+fw.size)*(size+fw.size)){
        score+=100*chain_num*chain_num;
        chain_num++;
        Score sco = new Score(x,y);
        scores.add(sco);
        CreateFireWorks(100-score/10);
        init();
       }
      }
     }
    }
    
    if(fire_works.size()==0){
      if(score>high_score){
       high_score = score; 
      }
      score=0;
      chain_num = 0;
    }
   }
  }
  
  ArrayList<FireBall> fire_balls;
  
  void setup(){
   size(500,500);
   fire_balls = new ArrayList<FireBall>();
   fire_works = new ArrayList<FireWorks>();
   scores = new ArrayList<Score>();
   for(int i = 0; i < 8; i++){
    FireBall fb = new FireBall();
    fire_balls.add(fb);
   } 
  }
  
  void draw(){
   //noStroke();
   //fill(100, 100, 100, 10);
   //rect(0, 0, width, height);
   //stroke(1);
   //fill(255);
   background(0);

   int fb_length = fire_balls.size();
   for(int i = 0; i <fb_length; i++){
    FireBall fb = fire_balls.get(i);
    fb.update();
    fb.draw();
   }
   
   int fw_length = fire_works.size();
   for(int i = fw_length-1; i >= 0; i--){
    FireWorks fw = fire_works.get(i);
    fw.update();
    fw.draw();
    if(fw.isAlive==false){
     fire_works.remove(i);
    }
   }
   
   int score_length = scores.size();
   for(int i = score_length-1; i >= 0; i--){
    Score sco = scores.get(i);
    sco.update();
    sco.draw();
    if(sco.isAlive==false){
     scores.remove(i);
    }
   }
   String s1 = "HIGH SCORE  " + high_score;
   String s2 = "SCORE  " + score;
   String s3 = chain_num + " COMBO";
   fill(0,200,200);
   textSize(20);
   text(s1,10,20);
   text(s2,10,40);
   textSize(30);
   text(s3,10,height-30);
   if(fire_works.size()!=0){
    fill(255,0,0);
    text("You can't click now",width-300,60);
   }
  }
