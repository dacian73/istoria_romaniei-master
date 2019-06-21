import 'package:istoria_romaniei/data/continut/liste.dart';
import 'package:istoria_romaniei/data/continut/strings.dart';

getContinutLectie (int i, String title) {
  switch (title) {
    case Strings.epoca1: {
      switch(i){
        case 0: {return Liste.continutE1L1;} break;
    case 1: {return Liste.continutE1L2;} break;
    case 2: {return Liste.continutE1L3;} break;
//    case 3: {return Liste.continutE1L4;} break;
//    case 4: {return Liste.continutE1L5;} break;
//    case 5: {return Liste.continutE1L6;} break;
//    case 6: {return Liste.continutE1L7;} break;
//    case 7: {return Liste.continutE1L8;} break;
        default: {return Liste.continutE1L1;} break;
      }
    } break;
    default: {
      switch(i){
        case 0: {return Liste.continutE1L1;} break;
    case 1: {return Liste.continutE1L2;} break;
    case 2: {return Liste.continutE1L3;} break;
//    case 3: {return Liste.continutE1L4;} break;
//    case 4: {return Liste.continutE1L5;} break;
//    case 5: {return Liste.continutE1L6;} break;
//    case 6: {return Liste.continutE1L7;} break;
//    case 7: {return Liste.continutE1L8;} break;
        default: {return Liste.continutE1L1;} break;
      }
    } break;
  }



}