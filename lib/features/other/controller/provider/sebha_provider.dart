import 'package:flutter/foundation.dart';

class SebhaProvider with ChangeNotifier {
  int countEsghfar = 0;
  int countTakber = 0;
  int countHamed = 0;
  int countHowkala = 0;
  int countSallah = 0;
  int countTasbeh = 0;
  int countTesbehKamel = 0;

  void estghfer() {
    countEsghfar++;
    notifyListeners();
  }

  void resetEstgher() {
    countEsghfar = 0;
    notifyListeners();
  }

  void kber() {
    countTakber++;
    notifyListeners();
  }

  void resetKeber() {
    countTakber = 0;
    notifyListeners();
  }

  void hamed() {
    countHamed++;
    notifyListeners();
  }

  void resetHamed() {
    countHamed = 0;
    notifyListeners();
  }

  void sebeh() {
    countTasbeh++;
    notifyListeners();
  }

  void resetSbeh() {
    countTasbeh = 0;
    notifyListeners();
  }

  void hawkel() {
    countHowkala++;
    notifyListeners();
  }

  void resetHawkel() {
    countHowkala = 0;
    notifyListeners();
  }

  void sebeh2() {
    countTesbehKamel++;
    notifyListeners();
  }

  void resetsebeh2() {
    countTesbehKamel = 0;
    notifyListeners();
  }

  void sallah() {
    countSallah++;
    notifyListeners();
  }

  void resetSallah() {
    countSallah = 0;
    notifyListeners();
  }
}
