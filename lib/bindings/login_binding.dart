import 'package:get/get.dart';
import '../controllers/login_controller.dart';


class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}