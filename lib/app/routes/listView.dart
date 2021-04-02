import 'package:flutter/material.dart';
import 'package:flutter_demo/app/modules/controller.dart';
import 'package:get/get.dart';

class ListViewSample extends StatelessWidget {
  ListViewSample({Key key}) : super(key: key);
  final ListController listController = Get.put(ListController());
  // final List widgets = [];

  // void initState() {
  //   super.initState();
  //   loadData();
  // }

  _showLoadingDialog() {
    return listController.widgets.length == 0;
  }

  Widget _getBody(List widgets) {
    print(widgets.length);
    if (_showLoadingDialog()) {
      return _getProgressDialog();
    } else {
      return _getListView(widgets);
    }
  }

  Widget _getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View With Progress"),
      ),
      body: Obx(() => _getBody(listController.widgets)),
    );
  }

  ListView _getListView(List widgets) => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return _getRow(position);
      });

  Widget _getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0), //
      child: Text("Row $i: ${listController.widgets[i]['title']}"),
    );
  }
}
