import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flameloop/app/models/enum/phone_auth_user_state.dart';
import 'package:flameloop/app/services/user.dart';
import 'package:get/get.dart';

import '../models/chat_room_model/chat_room_model.dart';
import '../models/users/user_model.dart';

class FirebaseFireStore extends GetxController {
  static FirebaseFireStore get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String verificationId = '';

  /* This is the user services */
  Future<void> addUser(UserModel user) async {
    await fireStore.collection("Users").doc(user.uid).set(user.toJson());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await fireStore.collection("Users").doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Future<void> updateUserData(UserModel userModel) async {
    log('user: $userModel');
    await fireStore
        .collection('Users')
        .doc(userModel.uid)
        .update(userModel.toJson());
    UserStore.to.saveProfile(userModel.uid);
  }

  Stream<QuerySnapshot> getAllUsers() {
    return fireStore
        .collection("Users")
        // .where("uid", isNotEqualTo: UserStore.to.uid)
        .snapshots();
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) =>
          log(exception.toString()),
      codeSent: (String verificationId, int? token) async {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  Future<bool> verifySMSCode(String phoneNumber, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    final value = await auth.signInWithCredential(credential);
    if (value.user != null) {
      UserModel? userModel = await getUser(value.user!.uid);
      if (userModel == null) {
        userModel = UserModel(
          uid: value.user!.uid,
          username: '',
          email: '',
          photoId: '',
          aboutUser: '',
          skills: [],
          phoneNumber: phoneNumber,
          userState: AuthUserState.newUser,
        );
        await addUser(userModel);
      }
      await UserStore.to.saveProfile(userModel.uid);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> handleSignInByEmail(String email, String password) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userModel = await getUser(userValue.user!.uid);
      await UserStore.to.saveProfile(userModel!.uid);
      return true;
    } catch (e) {
      log('$e Occurred');
      return false;
    }
  }

  Future<bool> handleSignUpByEmail(String email, String password,
      String username, String phoneNumber) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      userModel = UserModel(
        uid: userValue.user!.uid,
        username: username,
        email: email,
        photoId: '',
        aboutUser: '',
        skills: [],
        phoneNumber: phoneNumber,
        userState: AuthUserState.newUser,
      );
      await addUser(userModel);
      await UserStore.to.saveProfile(userModel.uid);
      return true;
    } catch (e) {
      log('$e Occurred');
      return false;
    }
  }

  Stream<QuerySnapshot> getAllSkillsOptions() {
    return fireStore.collection('skills').snapshots();
  }

  Future<void> sendMessage(
      Map<String, dynamic> messageContent, String chatRoomId) async {
    return await fireStore
        .collection('chats')
        .doc(chatRoomId)
        .collection("chatList")
        .doc()
        .set(messageContent);
  }

  Future<void> updateMessage(Map<String, dynamic> lastMessage, String chatRoomId) async {
    return await fireStore
        .collection('chats')
        .doc(chatRoomId)
        .update(lastMessage);
  }

  Stream<QuerySnapshot> readMessage(String docId) {
    return fireStore
        .collection("chats")
        .doc(docId)
        .collection("chatList")
        .orderBy("messageTm", descending: false)
        .snapshots();
  }

  Future<QuerySnapshot> getChatRoom() async {
    var data = fireStore
        .collection("chats")
        .where("users", arrayContains: UserStore.to.uid);

    return data.orderBy("lastMessageTm", descending: false).get();
  }

  Future<void> createChatRoom(ChatRoomModel chatRoom) async {
    final doc = await fireStore.collection("chats").doc(chatRoom.chatRoomId).get();
    if (!doc.exists) {
      await fireStore
          .collection("chats")
          .doc(chatRoom.chatRoomId)
          .set(chatRoom.toJson());
    }
  }
}
