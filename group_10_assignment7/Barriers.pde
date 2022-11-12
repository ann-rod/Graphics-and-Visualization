class Barriers{
  ArrayList<Block> blocks;
  PVector pos;
  int dim = 3;
  boolean recharge = true;
  
  
  
  
  Barriers(PVector pos){
    blocks = new ArrayList<Block>();
    this.pos = pos;
    initializeBlocks();
    
  }
  
  void initializeBlocks(){
    for(int i = 0; i < 9+dim; i++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x, this.pos.y)));
    }
    for(int i = 0;i < 11+dim; i++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - dim, this.pos.y+dim)));
      
    }
     for(int i = 0;i < 13+dim; i++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 2*dim, this.pos.y+ 2*dim)));
      
    }
    
    for(int i = 0;i < 15+dim; i++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y+ 3*dim)));
      
    }
    
    for(int j = 1; j < 5; j++){
      for(int i = 0; i < 15+dim; i++){
         blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y + (3+j)*dim)));
        
      }
      
    }
    
    for(int i = 0; i < 3 + dim; i ++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x + 9*dim, this.pos.y + 8*dim)));
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y + 8*dim)));
      
      
    }
    for(int i = 0; i < 2 + dim; i ++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x + 10*dim, this.pos.y + 9*dim)));
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y + 9*dim)));
      
      
    }
    
    for(int i = 0; i < 1 + dim; i ++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x + 11*dim, this.pos.y + 10*dim)));
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y + 10*dim)));
      
      
    }
    
    for(int i = 0; i < dim; i ++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x + 12*dim, this.pos.y + 11*dim)));
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y + 11*dim)));
      
      
    }
    for(int j = 0; j < 4; j++){
      
    for(int i = 0; i < dim - 1; i ++){
      blocks.add(new Block(new PVector((i*dim) + this.pos.x + 13*dim, this.pos.y + (j+12)*dim)));
      blocks.add(new Block(new PVector((i*dim) + this.pos.x - 3*dim, this.pos.y + (j+12)*dim)));
      
    }
  }
    
    
    
    
    
    
  }
  void display(){
    for (int i = blocks.size() - 1; i >= 0; i--){
      Block block = blocks.get(i);
      block.update();
      block.display();
      
      
    }
    
    
  }
  
  void checkCollision(Projectile bullet){
    float x = bullet.bullet_pos.x;
    float y = bullet.bullet_pos.y;
    for(int i = blocks.size() - 1; i >= 0; i-- ){
      Block bl = blocks.get(i);
      if(dist(x, y, bl.pos.x, bl.pos.y) < 7){
          blocks.remove(i);
          bullet.resetProjectile();
        
      }
      
    }
    
  }
  
  void recharge(int x, int y){
    for(int i = blocks.size() - 1; i >= 0; i-- ){
      Block bl = blocks.get(i);
      if(dist(x, y, bl.pos.x +5, bl.pos.y + 5) <10 && recharge == true){
        blocks.clear();
        initializeBlocks();
        recharge = false;
        break;
        
        
      }
      
    }
    
    
    
  }
  
  
  
  
}
