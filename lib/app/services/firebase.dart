import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flameloop/app/models/enum/phone_auth_user_state.dart';
import 'package:flameloop/app/services/user.dart';
import 'package:get/get.dart';

import '../models/users/user_model.dart';

class FirebaseFireStore extends GetxController{
  static FirebaseFireStore get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';


  /* This is the user services */
  Future<void> addUser(UserModel user)async{
    await fireStore.collection("Users").doc(user.uid).set(user.toJson());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await fireStore.collection("Users").doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Future<String?> getUserState(String phoneNumber) async {
    var doc = await fireStore
        .collection("Users")
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    return doc.docs[0].data()['userState'];
  }


  Future<void> verifyPhoneNumber(String phoneNumber) async {

    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) async {
          //TODO: Have to implement the newUser detection feature
        });
      },
      verificationFailed: (FirebaseAuthException exception) =>log(exception.toString()),
      codeSent: (String verificationId, int? token) async {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId){},
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> verifySMSCode(String phoneNumber, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    final value = await auth.signInWithCredential(credential);
    if (value.user != null) {
      //TODO: Have to implement the newUser detection feature
    }else{

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return false;
      }
      else if (e.code == 'invalid-credential') {
        return false;
      }
      return false;
    } catch (e) {
      log('$e Occurred');
      return false;
    }
  }

  Future<bool> handleSignUpByEmail(String email, String password, String username, String phoneNumber) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      userModel = UserModel(
        uid: userValue.user!.uid,
        username: username,
        email: email,
        photoId: '',
        phoneNumber: phoneNumber,
        userState: AuthUserState.newUser
      );
      await addUser(userModel);
      await UserStore.to.saveProfile(userModel.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return false;
      }
      else if (e.code == 'invalid-credential') {
        return false;
      }
      return false;
    } catch (e) {
      log('$e Occurred');
      return false;
    }
  }


  // Future<void> sendMessage(Map<String, dynamic> messageContent, String chatRoomId) async {
  //   return await fireStore
  //       .collection('message')
  //       .doc(chatRoomId)
  //       .collection("messageList")
  //       .doc()
  //       .set(messageContent);
  // }
  //
  // Future<void> updateMessage(Map<String, dynamic> lastMessage, String chatRoomId) async {
  //   return await fireStore
  //       .collection('message')
  //       .doc(chatRoomId)
  //       .update(lastMessage);
  // }
  //
  //  Stream<QuerySnapshot> readMessage(String docId) {
  //   return fireStore
  //       .collection("message")
  //       .doc(docId)
  //       .collection("messageList")
  //       .orderBy("messageTm", descending: false)
  //       .snapshots();
  // }
  //
  // Future<QuerySnapshot> getChatRoom() async {
  //   var data =  fireStore
  //       .collection("message")
  //       .where("users", arrayContains: UserStore.to.uid);
  //
  //   return data
  //       .orderBy("lastMessageTm", descending: false)
  //       .get();
  // }
  //
  // Future<void> createChatRoom(ChatRoomModel chatRoom) async {
  //   final doc = await fireStore.collection("message").doc(chatRoom.chatRoomId).get();
  //   if(!doc.exists){
  //     await fireStore
  //         .collection("message")
  //         .doc(chatRoom.chatRoomId)
  //         .set(chatRoom.toJson());
  //   }
  // }

}