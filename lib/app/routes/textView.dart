import 'package:flutter/material.dart';
import 'package:flutter_demo/app/modules/controller.dart';
import 'package:get/get.dart';

class TextView extends StatelessWidget {
  TextView({Key key}) : super(key: key);

  final TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editor Sample'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      child: Column(
        children: [
          _showText(),
          //Size
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: SizedBox(
                width: double.infinity,
                child: Obx(() => Text('Size: ${textController.size}'))),
          ),
          Obx(
            () => Slider(
              value: textController.size.value,
              min: 10.0,
              max: 40.0,
              divisions: 40,
              onChanged: (double value) {
                textController.setSize(value);
              },
            ),
          ),
          //Red
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: SizedBox(
                width: double.infinity,
                child: Obx(() => Text('Size: ${textController.red}'))),
          ),
          Obx(
            () => Slider(
              value: textController.red.value.toDouble(),
              activeColor: Colors.red,
              min: 0,
              max: 255,
              divisions: 255,
              onChanged: (double value) {
                textController.setRed(value.toInt());
              },
            ),
          ),
          //Green
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: SizedBox(
                width: double.infinity,
                child: Obx(() => Text('Size: ${textController.red}'))),
          ),
          Obx(
            () => Slider(
              value: textController.green.value.toDouble(),
              activeColor: Colors.green,
              min: 0,
              max: 255,
              divisions: 255,
              onChanged: (double value) {
                textController.setGreen(value.toInt());
              },
            ),
          ),
          //Blue
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: SizedBox(
                width: double.infinity,
                child: Obx(() => Text('Size: ${textController.blue}'))),
          ),
          Obx(
            () => Slider(
              value: textController.blue.value.toDouble(),
              activeColor: Colors.blue,
              min: 0,
              max: 255,
              divisions: 255,
              onChanged: (double value) {
                textController.setBlue(value.toInt());
              },
            ),
          ),
          //Opacity
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: SizedBox(
                width: double.infinity,
                child: Obx(() => Text('Size: ${textController.opacity}'))),
          ),
          Obx(
            () => Slider(
              value: textController.opacity.value,
              activeColor: Colors.black,
              min: 0,
              max: 1,
              divisions: 100,
              onChanged: (double value) {
                textController.setOpacity(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _showText() {
    return Obx(
      () => Text(
        'Edit me please!',
        style: TextStyle(
          fontSize: textController.size.value,
          color: textController.getColor(),
        ),
      ),
    );
  }
}
