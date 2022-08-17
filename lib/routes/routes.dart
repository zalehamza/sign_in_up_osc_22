import 'package:get/get.dart';
import 'package:sign_in_up_osc_22/bindings/sign_in_binding.dart';
import 'package:sign_in_up_osc_22/views/connexion.dart';

import '../views/verification_otp.dart';


class RouteName {
  static String init = '/';
  static String verify = '/verify';

}



// bool firstLaunch = true;

List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: RouteName.init,
    page: ()=> Connexion(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: RouteName.verify,
    page: ()=> PinCodeVerificationScreen(),
    binding: SignInBinding(),
  ),


];