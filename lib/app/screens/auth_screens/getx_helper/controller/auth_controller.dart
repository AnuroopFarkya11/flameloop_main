import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../services/firebase.dart';

class AuthController extends GetxController {
  Rx<int> seconds = 60.obs;
  Rx<bool> isLoading = false.obs;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  TextEditingController thirdNumber = TextEditingController();
  TextEditingController fourthNumber = TextEditingController();
  TextEditingController fifthNumber = TextEditingController();
  TextEditingController sixthNumber = TextEditingController();

  handleSignInByPhone() async {
    await FirebaseFireStore.to.verifyPhoneNumber(phoneNumber.text);
  }

  validateOtp() async {
    if ((firstNumber.text +
                secondNumber.text +
                thirdNumber.text +
                fourthNumber.text +
                fifthNumber.text +
                sixthNumber.text)
            .length ==
        6) {
      isLoading.value = true;
      try {
        var response = await FirebaseFireStore.to.verifySMSCode(
            phoneNumber.text,
            firstNumber.text +
                secondNumber.text +
                thirdNumber.text +
                fourthNumber.text +
                fifthNumber.text +
                sixthNumber.text);
        isLoading.value = false;
        return response;
      } catch (error) {
        isLoading.value = false;
        log('Error caught: $error');
        Get.snackbar(
          "Auth Failed",
          'The input OTP is either invalid or expired',
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.person,
            color: Color(0xff28282B),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[200],
          borderRadius: 10.r,
          margin: EdgeInsets.all(10.w),
          padding: EdgeInsets.all(15.w),
          colorText: const Color(0xff28282B),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } else {
      return false;
    }
  }

  bool validate() {
    return (int.tryParse(phoneNumber.text) != null) &&
        phoneNumber.text.length == 10;
  }

  void decrementSeconds() async {
    seconds.value = 60;
    while (seconds.value > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (isClosed) {
        return;
      } else {
        seconds.value--;
      }
    }
  }
}
