import 'dart:developer';
import 'dart:io';

import 'package:flameloop/app/services/firebase.dart';
import 'package:flameloop/app/services/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/interest_model/interest_model.dart';
import '../../../models/users/user_model.dart';

class SetProfileController extends GetxController {
  RxList<InterestModel> interestList = <InterestModel>[].obs;
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
    var response = FirebaseFireStore.to.getAllSkillsOptions();
    response.listen((snapshot) {
      for (var element in snapshot.docs) {
        interestList.add(
            InterestModel.fromJson(element.data() as Map<String, dynamic>));
      }
    });
  }

  saveUserData() async {
    try{
      isSaving.value = true;
      final dateTime = DateTime.now().toIso8601String();
      final ref = FirebaseFireStore.to
          .storage.ref().child("${UserStore.to.uid}/${nameController.text}");
      final uploadTask = ref.putFile(File(imagePath.value));
      uploadTask.whenComplete(() async {
        imagePath.value = await ref.getDownloadURL();
      });
      userModel = userModel.copyWith(
        username: nameController.text,
        email: emailController.text,
        aboutUser: aboutController.text,
        photoId: imagePath.value,
      );
      isSaving.value = false;
    }catch(error){
      imagePath.value = '';
    }
  }

  selectSkills(InterestModel skill) {
    if(skillsSelected.contains(skill)){
      skillsSelected.remove(skill);
      log('removing item');
    }else{
      skillsSelected.add(skill);
      log('adding item');
    }
  }
}
