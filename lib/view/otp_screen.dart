import 'dart:developer';

import 'package:algorthimi/view/AuthScreens/Widgets/scan_id_freelancer_screen.dart';
import 'package:algorthimi/view/Widgets/regex-email.dart';
import 'package:algorthimi/view/Widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:algorthimi/utils/app_color.dart';
import 'package:algorthimi/view/AuthScreens/Widgets/scan_id_camera_screen.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';




class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  String phoneNumbers = '';

  Future<void> verifyPhoneNumber(BuildContext context) async {
    PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      Get.snackbar(
        'Processing',
        'Phone number automatically verified.',
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(pink),
        colorText: Colors.white,
      );
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
          Get.snackbar(
            'Error',
            'Phone number verification failed.',
            duration: const Duration(seconds: 3),
            backgroundColor: const Color(pink),
            colorText: Colors.white,
          );
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      Get.snackbar(
        'Success',
        'Please check your phone for the verification code.',
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(pink),
        colorText: Colors.white,
      );
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumbers,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to Verify Phone Number: $e',
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(pink),
        colorText: Colors.white,
      );
    }
  }

  void signInWithPhoneNumber(BuildContext context) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );
      await _auth.signInWithCredential(credential);
      Get.snackbar(
        'Success',
        'Phone number successfully verified.',
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(pink),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to verify phone number: $e',
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(pink),
        colorText: Colors.white,
      );
    }
  }


  StreamController<ErrorAnimationType>? errorController;
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');

  var currentStep = 3.obs;
  StepperType stepperType = StepperType.horizontal;

  back() {
    isScannedFreelancerId.value = false;
    isScannedShopOwnerId.value = false;
    isScannedShopOwnerLicense.value = false;
    Get.back();
    // Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Contact info',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: const Color(purple),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            getCustomTextW6S20(
                text: 'Please enter your required information',
                color: Colors.black),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber num) {
                  number = num;
                  phoneNumbers = number.phoneNumber!;
                  log(number.phoneNumber.toString());
                  print(
                      "phone number input ${number} ${_phoneNumberController}");
                },
                onInputValidated: (bool value) {
                  log(value.toString());
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: _phoneNumberController,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                isEnabled: true,
                inputDecoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: backgroundColor, width: 1.0.px),
                      borderRadius: BorderRadius.circular(10.0.px)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: backgroundColor, width: 1.0.px),
                      borderRadius: BorderRadius.circular(10.0.px)),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0.px)),
                  fillColor: backgroundColor,
                  hintText: '     Enter your Number'.tr,
                  hintStyle: getCustomTextStyleW5S15(
                    color: textBlackColor,
                  ),
                  enabled: true,
                ),
                cursorColor: textBlackColor,
                onSaved: (PhoneNumber number) {
                  log('On Saved: $number');
                },
              ),
            ),
            Divider(
              color: subTextColor,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 10, 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: getCustomTextW6S15(
                        text: 'Email'.tr, color: Colors.black),
                  ),
                  Expanded(
                      flex: 2,
                      child: getCustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        hintText: 'Enter Your Email'.tr,
                        controller: emailController,
                        validator: (value) => EmailReg.isValidEmail(value)
                            ? null
                            : 'Please enter a valid email'.tr,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  print('phone controller value ${phoneNumbers}');
                  verifyPhoneNumber(context);
                  Get.to(() => const ScanIdFreelancerScreen());
                },
                child: fillColorButton(
                  color: const Color(pink),
                  text: 'Next'.tr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
