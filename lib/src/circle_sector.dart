part of hexacore;


class CircleSector {
  List<Field> fields;
  int centerX;
  int centerY;
  // floored half size of map
  int size;
  int _field_width;
  int _field_height;

  CircleSector(this.centerX, this.centerY, this.size, this._field_width) {
    
    _field_height = (_field_width * 0.866025).round();
    
    int startX = centerX - size;
    int startY = centerY - size ~/ 2;

    int fieldsLength = 3 * size * size + 3 * size + 1;

    fields = new List(fieldsLength);

    int yBound = centerY + size;
    int zeroXBound = centerX + size;
    int xBound;
    int xStart = centerX - size;
    int i = 0;
    for (int y = centerY - size; y <= yBound; y++) {
      if(y<=centerY){
        xBound = zeroXBound - (centerY - y).abs();        
      }
      if(y>centerY){
        xStart = y-centerY;
      }
      for (int x = xStart; x <= xBound; x++) {
        fields[i] = new Field(x, y);
        i++;
      }
    }
    
    for(Field f in fields){
      f.top = (f.x + f.y)*(_field_height/2).ceil();
      f.left = (f.y - f.x +size)*(3*_field_width/4).ceil();
    }
    
  }


  Field getField(int x, int y) {
//    int a = 0;
//    int strana = size+1;
//
//    if (x >= 0 && x <= strana && y >= 0 && y - x <= strana) {
//      a = ((x * x + x) / 2 + x * strana + y).toInt();
//      return fields[a];
//    }
//    if (x > strana && x < 15 && y < 15 && x - y <= strana) {
//      a = ((15 * (x - strana - 1) - x / 2 * (x - 2 * strana + 1) + strana * (strana + 3) + 1 + y)).toInt();
//      return this.fields[a];
//    }
    return null;
  }

  bool isInMap(int x, int y) {
    return distance(centerX, centerY, x, y) <= size;
  }

  static int distance(int sx, int sy, int cx, int cy) {
    int dx = cx - sx;
    int dy = cy - sy;
    if (dy > 0) {
      if (dx < 0) {
        return dy - dx;
      } else if (dx < dy) {
        return dy;
      } else {
        return dx;
      }
    } else {
      if (dx > 0) {
        return dx - dy;
      } else if (dx < dy) {
        return -dx;
      } else {
        return -dy;
      }
    }
  }
}

