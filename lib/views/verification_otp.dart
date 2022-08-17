import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../app_custom_button.dart';
import '../constants/constants.dart';
import '../controllers/sign_in_controller.dart';
import 'package:get/get.dart';

class PinCodeVerificationScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final String? phoneNumber = '';
    bool hasError = false;
    String currentText = "";
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 3,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(30),
              //     child: Image.asset(Constants.otpGifImage),
              //   ),
              // ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Verification Code OTP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Entrez le code à 6 chiffres envoyé au",
                      children: [
                        TextSpan(
                            text: authController.phoneController.text,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style:
                      const TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30),
                  child:  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    onChanged: (value){
                      authController.otpPin = value;
                    },
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.black54,
                      activeColor: Colors.black54,
                      inactiveFillColor: Colors.white,
                      selectedColor: AppColors.customAmber,
                      selectedFillColor: Colors.white,

                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,

                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "SVP entrez un code otp correct" : "",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: AppCustomButton(
                  bgColor: AppColors.customAmber,
                  onTap: (){
                    if(authController.otpPin.length >=6){
                      authController.verifyOTP();
                    }
                    else{
                      Get.snackbar('Code OTP', 'Renseigner correctement le code OTP');
                    }
                  },
                  isFilled: true,
                  textColor: AppColors.white,
                  text: 'Vérification',
                ),
                decoration: BoxDecoration(
                  color: AppColors.customAmber,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "RESEND",
                      style: TextStyle(
                          color: Color(0xFF91D3B3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}