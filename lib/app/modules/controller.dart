import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/app/core/utils/api_provider.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0.obs;
  increment() => count++;

  var pagesList = <String>[].obs;

  add(String page) => pagesList.add(page);

  delete() => pagesList.clear();
}

class ListController extends GetxController {
  List widgets = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    var response = await ApiProvider().getData();
    widgets.clear();
    widgets.addAll(response.body);
    print('data loaded!');
  }
}

class TextController extends GetxController {
  var size = 20.0.obs;
  var red = 0.obs;
  var green = 0.obs;
  var blue = 0.obs;
  var opacity = 1.0.obs;

  setSize(double size) => this.size.value = size;
  setRed(int size) => this.red.value = size;
  setGreen(int green) => this.green.value = green;
  setBlue(int blue) => this.blue.value = blue;
  setOpacity(double opcity) => this.opacity.value = opcity;

  Color getColor() =>
      Color.fromRGBO(red.value, green.value, blue.value, opacity.value);
}

class DateController extends GetxController {
  var beginDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var totalDays = 0.obs;
  var workDays = 0.obs;

  _beginDateDidUpdate() {
    endDate.value = beginDate.value;
  }

  selectBeginDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: beginDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2099),
    );
    if (picked != null && picked != beginDate.value) {
      beginDate.value = picked;
      if (endDate.value.isBefore(beginDate.value)) {
        _beginDateDidUpdate();
      }
    }
  }

  selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: endDate.value,
      firstDate: beginDate.value,
      lastDate: DateTime(2099),
    );
    if (picked != null && picked != endDate.value) {
      endDate.value = picked;
      _calculateTotalDay();
      _calculateWorkDay();
    }
  }

  _calculateTotalDay() {
    totalDays.value = endDate.value.difference(beginDate.value).inDays + 1;
    workDays.value = totalDays.value;
  }

  _calculateWorkDay() {
    final daysToGenerate = endDate.value.difference(beginDate.value).inDays;

    List<DateTime> days = List.generate(
        daysToGenerate,
        (i) => DateTime(beginDate.value.year, beginDate.value.month,
            beginDate.value.day + (i)));

    for (DateTime currentDay in days) {
      if (currentDay.weekday == DateTime.saturday ||
          currentDay.weekday == DateTime.sunday) {
        print('currentday $currentDay, ${currentDay.weekday}');
        workDays.value--;
      }
    }
  }
}
