import 'package:get/get.dart';
import 'package:stocket/services/http_service.dart';

Future<void> registerService() async{
  Get.put(
    HttpService(),
  );
}