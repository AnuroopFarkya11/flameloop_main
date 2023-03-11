
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/firebase.dart';

class PhoneAuthController extends GetxController {
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
            .length == 6) {
      isLoading.value = true;
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
    }else{
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
