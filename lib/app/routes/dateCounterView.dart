import 'package:flutter/material.dart';
import 'package:flutter_demo/app/modules/controller.dart';
import 'package:get/get.dart';

class DateCounter extends StatelessWidget {
  // const DateCounter({Key key}) : super(key: key);
  final DateController dateController = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Date Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ..._beginDate(context),
              ..._endDate(context),
              ..._calculateTime(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _beginDate(BuildContext context) {
    return <Widget>[
      Obx(() => Text(
          "${dateController.beginDate.value.toLocal()}".split(' ')[0],
          style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold))),
      SizedBox(height: 20.0),
      ElevatedButton(
        onPressed: () => dateController.selectBeginDate(context),
        child: Text(
          'Select Date',
        ),
      ),
    ];
  }

  List<Widget> _endDate(BuildContext context) {
    return <Widget>[
      Obx(() => Text("${dateController.endDate.value.toLocal()}".split(' ')[0],
          style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold))),
      SizedBox(height: 20.0),
      ElevatedButton(
        onPressed: () => dateController.selectEndDate(context),
        child: Text(
          'Select Date',
        ),
      ),
    ];
  }

  List<Widget> _calculateTime() {
    return <Widget>[
      Obx(() => Text('Total Day: ${dateController.totalDays}',
          style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold))),
      Obx(() => Text('Work Day: ${dateController.workDays}',
          style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold))),
    ];
  }
}
