Firework[] fireworks;
void setup()
{
  fireworks = new Firework[10];
  size(700,700);
	//your code here
  for(int i = 0; i < 10;i++){
    fireworks[i] = new Firework();
  }
}
void draw()
{
  background(0);
  for (Firework f: fireworks){
    f.move();
    f.show();
  }
}

void mousePressed(){
  for(Firework f: fireworks){
    f.reset();
  }
}
class Firework
{
  Particle[] particles;
  double x, y;
  
  Firework(){
    particles = new Particle[100];
    x = (int)(Math.random() * 601) + 50;
    y = (int)(Math.random() * 601) + 50;
    fillFirework();

  }
  void reset(){
    x = (int)(Math.random() * 601) + 50;
    y = (int)(Math.random() * 601) + 50;
    for (Particle p: particles){
      p.reset(x, y);
    }
  }
  void fillFirework(){
    particles[0] = new OddBallParticle(x, y);
    for(int i = 1; i < particles.length;i++){
      particles[i] = new Particle(x, y);
    }
  }
  
  void show(){
    for (Particle p:particles){
      p.show();
    }
  }
  
  void move(){
    for (Particle p:particles){
      p.move();
    }
  }

}

class Particle
{
  int col, alpha;
  double x, y, angle, speed;
  Particle(double xx, double yy){
    alpha = 255;
    x = xx;
    y = yy;
    angle = Math.random() * 2 * Math.PI;
    speed = Math.random() * 4  +1;
    col = color((int)(Math.random() * 255),(int)(Math.random() * 255),(int)(Math.random()  *255));
  }
  
  void reset(double xx, double yy){
    alpha = 255;
    x = xx;
    y = yy;
    angle = Math.random() * 2 * Math.PI;
    speed = Math.random() * 4  +1;
    col = color((int)(Math.random() * 255),(int)(Math.random() * 255),(int)(Math.random()  *255));
  }
  
  void move(){
    x+=Math.cos(angle) * speed;
    y+=Math.sin(angle) * speed;
  }
  void show(){
    stroke(col, alpha);
    fill(col, alpha);
    ellipse((float)x, (float)y, 10,10);
    alpha-=4;
  }
	//your code here
}

class OddBallParticle extends Particle{
  OddBallParticle(double xx, double yy){
    super(xx, yy);
    col = color(255,255,255);
  }
  void show(){
    stroke(col, alpha);
    fill(col, alpha);
    ellipse((float)x, (float)y, 10,10);
    alpha-=2;
  }
  void move(){
    x+=Math.cos(angle) * speed;
    y+=Math.sin(angle) * speed;
    angle+=0.1;
  }
}
