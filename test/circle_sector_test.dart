 library hexacore_test;  
   
 import 'package:hexacore/hexacore.dart';  
 import 'package:unittest/unittest.dart';
 import 'dart:math';
 
 main() {
  
  test("distance", (){
    expect(CircleSector.distance(0, 1, 1, 1), equals(1));
    expect(CircleSector.distance(0, 1, 2, 2), equals(2));
    expect(CircleSector.distance(0, 1, 1, 2), equals(1));
    expect(CircleSector.distance(0, 1, 1, 3), equals(2));
    expect(CircleSector.distance(0, 1, 0, 4), equals(3));
    expect(CircleSector.distance(3, 3, 0, 4), equals(4));
    expect(CircleSector.distance(3, 3, 2, 4), equals(2));
    expect(CircleSector.distance(3, 3, 2, 3), equals(1));
    expect(CircleSector.distance(3, 3, 4, 3), equals(1));
    expect(CircleSector.distance(3, 3, 3, 2), equals(1));
    expect(CircleSector.distance(3, 3, 4, 4), equals(1));
    
    int iterations = 10000000;
    
    int numbers = iterations*4;
    
    Random r = new Random(333);
    List<int> test = new List(numbers);
    for(int i=0;i<numbers;i++){
      test[i] = r.nextInt(500);
    }
    Stopwatch sw1 = new Stopwatch()..start();
        for(int i=0;i<numbers;i+=4){
              test[i];
              test[i+1];
              test[i+2];
              test[i+3];
         }
    sw1.stop();
    
    Stopwatch sw = new Stopwatch()..start();
    for(int i=0;i<numbers;i+=4){
          CircleSector.distance(test[i], test[i+1], test[i+2], test[i+3]);
     }
    print("distances per second ${(1000/(sw.elapsedMilliseconds-sw1.elapsedMilliseconds)*iterations~/1000000).toInt()}M");
    
  });
  
  test("isInMap", (){
    
  });
  
  test("createMap",(){
    CircleSector cs = new CircleSector(2, 2, 2);
    
    expect(cs.fields.length, equals(19));
    expect(cs.fields.first.x, equals(0));
    expect(cs.fields.first.y, equals(0));
    
    Field f = cs.fields[5];
    expect(f.x, equals(2));
    expect(f.y, equals(1));
    
    f = cs.fields[10];
    expect(f.x, equals(3));
    expect(f.y, equals(2));
    
    f = cs.fields[15];
    expect(f.x, equals(4));
    expect(f.y, equals(3));
    
    cs = new CircleSector(1, 1, 1);
    expect(cs.fields.first.x, equals(1));
    expect(cs.fields.first.y, equals(1));
    
    cs = new CircleSector(3, 2, 3);
    expect(cs.fields.first, equals(null));
  });
  
 } 