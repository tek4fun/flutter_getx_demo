import 'package:get/get_connect/connect.dart';

class ApiProvider extends GetConnect {
  Future<Response<List>> getData() =>
      get('https://jsonplaceholder.typicode.com/posts');
}
