library hexacore_perf;  
   
 import '../lib/hexacore.dart';  
 import 'dart:math';
 import 'dart:typed_data';
 
 main() {
  
    int iterations = 130000000;
    
    int numbers = iterations*4;
    
    Random r = new Random(333);
//    List<int> test = new List<int>(numbers);
    Uint16List test = new Uint16List(numbers);
    for(int i=0;i<numbers;i++){
      test[i] = r.nextInt(500);
    }
    int a,b,c,d;
    Stopwatch sw1 = new Stopwatch()..start();
        for(int i=0;i<numbers;i+=4){
              a = test[i];
              b= test[i+1];
              c= test[i+2];
              d= test[i+3];
         }
    sw1.stop();
    print(sw1.elapsedMilliseconds);
    Stopwatch sw = new Stopwatch()..start();
    for(int i=0;i<numbers;i+=4){
          CircleSector.distance(test[i], test[i+1], test[i+2], test[i+3]);
     }
    print(sw.elapsedMilliseconds);
    print("distances per second ${(1000/(sw.elapsedMilliseconds-sw1.elapsedMilliseconds)*iterations~/1000000).toInt()}M");
    
  
 } 