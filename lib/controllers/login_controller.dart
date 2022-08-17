import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sign_in_up_osc_22/routes/routes.dart';

class AuthController extends GetxController{

  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  String verificationId = "";
  String countryDial = "+226";

  int? forceResendingToken;

  codeSent(String? verificationId, [int? forceResendingToken]) async{
    toast("Le code OTP à été envoyé au numéro renseigné.");
    verificationId = verificationId;
    this.forceResendingToken = forceResendingToken;
    debugPrint("VerificationId ==> $verificationId");
    //Get.toNamed(RouteName.verify);
    Get.toNamed(
        RouteName.verify,
        arguments: {
          'phoneNumber': countryDial + phoneNumber.text,
          'verificationId': verificationId,
        }
    );

  }

  verificationCompleted(PhoneAuthCredential phoneAuthCredential) async{
    toast("Le code OTP à été bien envoyé au numéro ${phoneNumber.text}.");
  }

  verificationFailed (FirebaseAuthException e) async {
  toast('Authenfication du numéro échoué');
  }

  codeAutoRetrievalTimeout(String verificationId) async {
  verificationId = verificationId;
  }





Future<void> verifyPhone() async{


    try{
      String fullPhoneNumber = countryDial + phoneNumber.text;
      await _auth.verifyPhoneNumber(
          phoneNumber: fullPhoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
           //    (PhoneAuthCredential credential){
           //  toast("Le code OTP à été envoyé au numéro ${phoneNumber.text}.");
           // },
          verificationFailed: verificationFailed,
           codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          //     (String verificationId){
          //   verificationId = verificationId;
          // }
      );

    }catch(e){
      toast("Nous avons pas pu vérifier le numéro. Veuillez tenter à nouveau !\n$e");
    }

  }
}