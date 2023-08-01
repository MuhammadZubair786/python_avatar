import 'package:chatbot_app/export_all.dart';

class DietController extends GetxController {
  //
  List mealData = [];

  addMealData(dynamic data) {
    mealData.add(data);
    update();
  }

  deleteMealData(int index) {
    mealData.removeAt(index);
    update();
  }

  //
  List vegData = [];

  List exampleDat = [];

  setVegData(data) {
    vegData = [];
    vegData.addAll(data);
    update();
  }

  List nonVegData = [];

  setNonVegData(data) {
    nonVegData = [];
    nonVegData.addAll(data);
    update();
  }

  List cropData = [];

  setCropData(data) {
    cropData = [];
    cropData.addAll(data);
    update();
  }

  var counter = 1.obs;
  var kCal = 0.obs;
  var finalkCal = 0.obs;

  setKCal(val) {
    kCal.value = val;
    update();
  }

  void increaseCounter() {
    
    counter.value++;
    finalkCal.value = counter.value * kCal.value;
    update();
  }

  void decrementCounter() {
    if (counter.value > 1) {
      counter.value--;
    }
    finalkCal.value = counter.value * kCal.value;
    update();
  }

  var nonVegcounter = 1.obs;
  var nonVegkCal = 0.obs;
  var nonVegfinalkCal = 0.obs;

  nonVegSetKCal(val) {
    nonVegkCal.value = val;
    update();
  }

  void nonVegIncreaseCounter() {
    nonVegcounter.value++;
    nonVegfinalkCal.value = nonVegcounter.value * nonVegkCal.value;
    update();
  }

  void nonVegDecrementCounter() {
    if (nonVegcounter.value > 1) {
      nonVegcounter.value--;
    }
    nonVegfinalkCal.value = nonVegcounter.value * nonVegkCal.value;
    update();
  }

  // crop

  var cropCounter = 1.obs;
  var cropkCal = 0.obs;
  var cropfinalkCal = 0.obs;

  cropSetKCal(val) {
    cropkCal.value = val;
    update();
  }

  void cropIncreaseCounter() {
    cropCounter.value++;
    cropfinalkCal.value = cropCounter.value * cropkCal.value;
    update();
  }

  void cropDecrementCounter() {
    if (cropCounter.value > 1) {
      cropCounter.value--;
    }
    cropfinalkCal.value = cropCounter.value * cropkCal.value;
    update();
  }

  var totalKCal = 0.obs;

  totalval() {
    totalKCal.value = finalkCal.value + nonVegfinalkCal.value + cropfinalkCal.value;
    update();
  }

  var mealCount = 1.obs;
  void increaseMealCount() {
    mealCount.value++;
    update();
  }

  void mealDelete() {
    if (mealCount.value > 1) {
      mealCount.value--;
    } else {
      Get.snackbar("Add at least 1 meal", "");
    }

    update();
  }

  var addMoreCount = 0.obs;
  void increaseaddMoreCount() {
    addMoreCount.value++;
    update();
  }

// how to add multiple objects in list
}
