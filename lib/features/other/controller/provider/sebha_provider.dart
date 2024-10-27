import 'package:flutter/foundation.dart';
import 'package:siraj/core/services/storage/shared_preferences.dart';
import 'package:siraj/core/utils/constants/storage_keys.dart';

class SebhaProvider with ChangeNotifier {
  int countEsghfar = SharedPreferencesManager.getInt(key: sebha1);
  int countTakber = SharedPreferencesManager.getInt(key: sebha2);
  int countHamed = SharedPreferencesManager.getInt(key: sebha3);
  int countHowkala = SharedPreferencesManager.getInt(key: sebha4);
  int countSallah = SharedPreferencesManager.getInt(key: sebha5);
  int countTasbeh = SharedPreferencesManager.getInt(key: sebha6);
  int countTesbehKamel = SharedPreferencesManager.getInt(key: sebha7);
  int allahIsGod = SharedPreferencesManager.getInt(key: sebha8);

  saveCounters() {
    SharedPreferencesManager.storeInt(key: sebha2, value: countTakber);
    SharedPreferencesManager.storeInt(key: sebha3, value: countHamed);
    SharedPreferencesManager.storeInt(key: sebha4, value: countHowkala);
    SharedPreferencesManager.storeInt(key: sebha5, value: countSallah);
    SharedPreferencesManager.storeInt(key: sebha6, value: countTasbeh);
    SharedPreferencesManager.storeInt(key: sebha7, value: countTesbehKamel);
    SharedPreferencesManager.storeInt(key: sebha8, value: allahIsGod);
  }

  void estghfer() {
    countEsghfar++;
    notifyListeners();
  }

  void allahGod() {
    allahIsGod++;
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

  void resetsebhaofAllah() {
    allahIsGod = 0;
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
