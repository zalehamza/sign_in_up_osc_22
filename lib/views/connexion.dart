import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sign_in_up_osc_22/routes/routes.dart';
import '../app_custom_button.dart';
import '../constants/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/sign_in_controller.dart';
import 'package:get/get.dart';


class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    bool erroBorder = false;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView(

            padding: EdgeInsets.only( left: 30, right: 30),
            children: <Widget>[
              Text('Connexion',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ).center(),
              20.height,
              Text(
                  'Numéro de téléphone',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
              ),
              5.height,
              IntlPhoneField(
                controller: authController.phoneController,
                initialCountryCode: 'BF',
                style: TextStyle(
                  fontSize: 18,
                ),
                dropdownTextStyle: TextStyle(
                    fontSize: 18
                ),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  // errorBorder: OutlineInputBorder(borderSide: BorderSide(
                  //      color: erroBorder? Colors.yellow :Colors.black
                  // )),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(7),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                        color: Colors.black54
                    ))
                ),
                dropdownIconPosition: IconPosition.trailing,
                showCountryFlag: false,
                onCountryChanged: (country){
                  authController.countryDial = "+" +country.name;
                },
                invalidNumberMessage: 'Numéro incorrect',
                searchText: 'Cherchez un pays',
                // dropdownDecoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black54,
                //   )
                //)
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCustomButton(
                      bgColor: AppColors.customGray,
                      onTap: (){},
                      isFilled: true,
                      textColor:Colors.black54,
                      text: 'Annuler',
                    ),
                    AppCustomButton(
                      bgColor: AppColors.customAmber,
                      onTap: (){
                        authController.verifyPhone(
                          phoneNumber:authController.countryDial+authController.phoneController.text,
                        );
                      },
                      isFilled: true,
                      textColor: AppColors.white,
                      text: 'Commencer',
                    ),
                  ],
                ),
              ),
              20.height,
              Text(
                  'Vous n\'avez pas de compte',

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
              ).center(),
              20.height,
              AppCustomButton(
                bgColor: AppColors.customGreen,
                onTap: (){
                },
                isFilled: true,
                textColor: AppColors.white,
                text: 'Inscrivez-vous',
              )
            ],
          ),
        ),
      ),
    );
  }
}



