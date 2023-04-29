import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/community_model/community_model.dart';
import '../../../models/users/user_model.dart';
import '../../../services/firebase.dart';
import '../../../services/user.dart';

class CreateCommunityController extends GetxController {
  Rx<String> communityLogo = ''.obs;
  TextEditingController communityNameController = TextEditingController();
  TextEditingController communityDescController = TextEditingController();
  RxList<UserModel> users = <UserModel>[].obs;
  RxList<UserModel> selectedUser = <UserModel>[].obs;
  RxList<bool> selectionTrace = <bool>[].obs;
  var loadingUser = false.obs;
  var posting = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  loadUsers() async {
    log('Fetching user data');
    var usersData = FirebaseFireStore.to.getAllUsers();
    usersData.listen((userSnapshot) {
      log('Fetching user data complete');
      loadingUser.value = true;
      users.value = [];
      for (var userElement in userSnapshot.docs) {
        users.add(
            UserModel.fromJson(userElement.data() as Map<String, dynamic>));
      }
      for (var element in users) {
        selectionTrace.add(false);
      }
      loadingUser.value = false;
    });
  }

  void pickImageDialog(context) async {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectGalleryImage();
                },
                child: const Text(
                  "Gallery",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  selectCameraImage();
                },
                child: const Text(
                  "Camera",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void selectCameraImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      log("Selected");
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        cropStyle: CropStyle.circle,
      );
      if (croppedImage != null) {
        imageCache.clear();
        communityLogo.value = croppedImage.path;
      }
    } else {
      log("FAIL TO SELECT IMAGEE");
    }
  }

  void selectGalleryImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      log("Selected");
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        cropStyle: CropStyle.circle,
      );
      if (croppedImage != null) {
        imageCache.clear();
        communityLogo.value = croppedImage.path;
      }
    } else {
      log("FAIL TO SELECT IMAGEE");
    }
  }

  maintainSelection(UserModel user) {
    if (selectedUser.contains(user)) {
      selectedUser.remove(user);
    } else {
      selectedUser.add(user);
    }
  }

  createCommunity() async {
    posting.value = true;
    if (communityLogo.isNotEmpty) {
      final ref = FirebaseFireStore.to.storage.ref().child(
          "${UserStore.to.uid}/${communityNameController.text}");

      await ref.putFile(File(communityLogo.value));
      communityLogo.value = await ref.getDownloadURL();
    }
    List<ParticipantModel> participants = selectedUser
        .map(
          (element) => ParticipantModel(
            uid: element.uid,
            username: element.username,
            userProfile: element.photoId,
            userRole: 'Participant',
          ),
        )
        .toList()
      ..add(
        ParticipantModel(
          uid: UserStore.to.uid,
          username: UserStore.to.profile.username,
          userProfile: UserStore.to.profile.photoId,
          userRole: 'ADMIN',
        ),
      );
    await FirebaseFireStore.to.createCommunity(
      CommunityModel(
        participantsList: participants,
        lastMessage: '',
        lastMessageBy: '',
        lastMessageTm: DateTime.now(),
        communityId: '',
        communityIcon: communityLogo.value,
        communityName: communityNameController.text,
        communityDescription: communityDescController.text,
      ),
    );
    posting.value = false;
  }
}
