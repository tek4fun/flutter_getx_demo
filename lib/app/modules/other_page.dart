import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Other extends StatelessWidget {
  final MyController myController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: Text("${myController.count}"),
      ),
    );
  }
}
