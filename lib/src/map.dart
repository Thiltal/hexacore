part of hexacore;

class CircleSector {
  List<Field> fields;
  int centerX;
  int centerY;
  // floored half size of map
  int size;

  CircleSector(this.centerX, this.centerY, this.size) {
    size = 2;
    centerX = 3;
    centerY = 3;
    int startX = centerX-size;
    int startY = centerY-size~/2;
    if(centerX%2==0){
      startY++;
    }
    int length = 3*size*size+3*size+1;
    int a = size+1;
    int columns = 2*size+1;
    fields = new List<Field>(length);
    for(int x = 0;x<columns;x++){
      
      fields[x]=new Field(1,1);
    }
  }
  
  bool isInMap(int x, int y) {
    return distance(centerX, centerY, x,y)<=size;
  }

  static int distance(int x, int y, int xx, int yy) {
    if(x==xx){
      return (y-yy).abs();
    }
    
    // fix odd column shift
    if(x%2==1){
      y++;
    }
    int dx=(xx-x).abs();
    
    yy +=(dx+1)~/2;
    
    int dy=yy-y;
    if (dy < 0) {
      return dx + dy.abs();
    } else {
      if(dy<dx){
        return dx;
      }else{
        return dy;        
      }
    }
  }

}
