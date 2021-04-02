import 'package:flutter/material.dart';
import 'package:flutter_demo/app/routes/dateCounterView.dart';
import 'package:get/get.dart';
import 'app/modules/controller.dart';
import 'app/routes/listView.dart';
import 'app/routes/textView.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
    ),
    defaultTransition: Transition.fade,
    //home: GetXDemo(),
    getPages: [
      GetPage(name: '/', page: () => GetXDemo()),
      GetPage(name: '/list', page: () => ListViewSample()),
      GetPage(name: '/image', page: () => GetXDemo()),
      GetPage(name: '/draw', page: () => GetXDemo()),
      GetPage(name: '/text', page: () => TextView()),
      GetPage(name: '/catalog', page: () => GetXDemo()),
      GetPage(name: '/cart', page: () => GetXDemo()),
      GetPage(name: '/date', page: () => DateCounter()),
    ],
  ));
}

class GetXDemo extends StatelessWidget {
  final MyController myController = Get.put(MyController());

  addItemToWidgets() async {
    myController.add('List View With Progress');
    await Future.delayed(Duration(seconds: 1));
    myController.add('Image View');
    await Future.delayed(Duration(seconds: 2));
    myController.add('Draw View');
    await Future.delayed(Duration(seconds: 1));
    myController.add('Text Edit View');
    myController.add('Shopping Card View');
    myController.add('Date Counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: getBody(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btnAdd",
            child: Icon(Icons.add),
            onPressed: () {
              addItemToWidgets();
            },
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btnRemove",
            child: Icon(Icons.ac_unit_outlined),
            onPressed: () {
              myController.delete();
            },
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Obx(() => getListView(myController.pagesList)),
          ),
          Switch(
            value: Get.isDarkMode,
            onChanged: (isLight) => Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            ),
          ),
          Text('isLight: ${!Get.isDarkMode}'),
        ],
      ),
    );
  }

  ListView getListView(List<String> widgets) => ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position, widgets);
        },
      );

  Widget getRow(int i, List<String> widgets) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Function ${i + 1} ${widgets[i]}'),
              onPressed: () {
                getFunction(i);
              },
            ),
          ),
        ],
      ),
    );
  }

  getFunction(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/list');
        break;
      case 1:
        Get.toNamed('/image');
        break;
      case 2:
        Get.toNamed('/draw');
        break;
      case 3:
        Get.toNamed('/text');
        break;
      case 4:
        Get.toNamed('/catalog');
        break;
      case 5:
        Get.toNamed('/date');
        break;
      default:
        break;
    }
  }
}
