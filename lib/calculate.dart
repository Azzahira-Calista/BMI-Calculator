import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomePageController.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final HomePageController controller = Get.put(HomePageController());
  late TextEditingController heightValueCtr;
  late TextEditingController widthValueCtr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heightValueCtr = new TextEditingController();
    widthValueCtr = new TextEditingController();
  }

  void resetInputs() {
    setState(() {
      widthValueCtr.clear();
      heightValueCtr.clear();
    });
  }

  Widget myText({
    required String label,
    required TextEditingController controller,
  }) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Color.fromARGB(255, 82, 215, 191),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Calculate BMI",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            myText(
                label: "Input tinggi badan (cm)", controller: heightValueCtr),
            SizedBox(height: 2),
            myText(label: "Input berat badan (kg)", controller: widthValueCtr),
            SizedBox(height: 25),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 82, 215, 191),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () => controller.calculateBMI(
                    double.parse(widthValueCtr.text),
                    double.parse(heightValueCtr.text)),
                child: Text("calculate")),
            Obx(
              () => Text(
                "hasil BMI " + controller.hasilBMI.value.toStringAsFixed(2),
              ),
            ),
            Obx(
              () => Text(
                "category BMI " + controller.hasilCategoryBMI.value,
              ),
            ),
            SizedBox(height: 10),
            Spacer(),
            ElevatedButton(
              onPressed: resetInputs,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 82, 215, 191),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                "Reset",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
