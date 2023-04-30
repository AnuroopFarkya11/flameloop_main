import 'dart:developer';
import 'dart:io';

import 'package:flameloop/app/services/firebase.dart';
import 'package:flameloop/app/services/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/enum/phone_auth_user_state.dart';
import '../../../models/interest_model/interest_model.dart';
import '../../../models/users/user_model.dart';

class SetProfileController extends GetxController {
  RxList<InterestModel> interestList = <InterestModel>[].obs;
  RxList<bool> skillsBool = <bool>[].obs;
  RxList<InterestModel> skillsSelected = <InterestModel>[].obs;
  UserModel userModel = UserStore.to.profile;
  Rx<String> imagePath = ''.obs;
  Rx<bool> isSaving = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllSkills();
  }

  getAllSkills() async {
    interestList.clear();
    skillsBool.clear();
    var response = FirebaseFireStore.to.getAllSkillsOptions();
    response.listen(
      (snapshot) {
        for (var element in snapshot.docs) {
          interestList.add(
            InterestModel.fromJson(element.data() as Map<String, dynamic>),
          );
          skillsBool.add(false);
        }
      },
    );
  }

  saveUserData() async {
    try {
      isSaving.value = true;
      if(imagePath.isNotEmpty){
        final ref = FirebaseFireStore.to.storage
            .ref()
            .child("${UserStore.to.uid}/${nameController.text}");

        await ref.putFile(File(imagePath.value));
        imagePath.value = await ref.getDownloadURL();
      }
      userModel = UserStore.to.profile.copyWith(
        username: nameController.text,
        email: emailController.text,
        aboutUser: aboutController.text,
        photoId: imagePath.value,
      );
      log('setting up data: $userModel');
      isSaving.value = false;
    } catch (error) {
      imagePath.value = '';
    }
  }

  selectSkills() {
    for (int i = 0; i < skillsBool.length; i++) {
      if (skillsBool[i]) {
        skillsSelected.add(interestList[i]);
      }
    }
  }

  updateUserProfile() async {
    log('user data: $userModel');
    bool response = await FirebaseFireStore.to.updateUserData(
      userModel.copyWith(
          skills: skillsSelected, userState: AuthUserState.existingUser),
    ).then((value){
      return true;
    });
  }
}
