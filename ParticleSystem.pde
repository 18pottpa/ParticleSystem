ParticleSystem ps;

void setup() {
  size(640, 360);
  ps = new ParticleSystem();
}

void draw() {
  background(255);
  ps.addParticle();
  ps.run();
}
class Particle {
  float locationX, locationY;
  float velocityX, velocityY;
  float accelerationX, accelerationY;
  float lifespan = 255;

  Particle() {
    accelerationX = 0;
    accelerationY = 0.05;
    velocityX = (float)(Math.random() * 2 - 1);
    velocityY = (float)(Math.random() * 2 - 2);    
    locationX = width / 2;
    locationY = 30;
  }

  void update() { //same as move()
    velocityX += accelerationX;
    velocityY += accelerationY;   
    locationX += velocityX;
    locationY += velocityY;
    lifespan -= 2;
  }
  boolean isDead() {
    if (lifespan <=0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    stroke(0, lifespan);
    fill(127, lifespan);
    ellipse(locationX, locationY, 8, 8);
  }
}
class ParticleSystem {
  ArrayList<Particle>particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

void addParticle(){
  particles.add(new Particle());
}

  void run() {
    for (int i = particles.size() -1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
