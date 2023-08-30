import 'package:get/get.dart';

class HomePageController extends GetxController {
  final hasilBMI = RxDouble(0.0);
  var hasilCategoryBMI = RxString("initial");

  void calculateBMI(double beratBadan, double tinggiBadan) {
    double calculateBMI = beratBadan / (tinggiBadan * tinggiBadan);
    hasilBMI.value = calculateBMI;
    print("hasil " + hasilBMI.value.toString());

    if (hasilBMI.value < 18.5) {
      hasilCategoryBMI.value = "Underweight ";
    } else if (hasilBMI.value >= 18.5 && hasilBMI.value < 24.9) {
      hasilCategoryBMI.value = "Normal ";
    } else if (hasilBMI.value >= 25 && hasilBMI.value < 29.9) {
      hasilCategoryBMI.value = "Overweight ";
    } else {
      hasilCategoryBMI.value = "Obese ";
    }
  }
}
