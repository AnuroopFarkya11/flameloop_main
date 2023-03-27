import 'package:flameloop/app/screens/chat_screens/Chat_Screen.dart';
import 'package:flameloop/app/screens/chat_screens/message_screen.dart';
import 'package:flameloop/app/screens/home_screens/home_screen.dart';
import 'package:flameloop/app/screens/welcome_screen/get_started.dart';
import 'package:flameloop/app/screens/auth_screens/otp_verification_screen.dart';
import 'package:flameloop/app/screens/user_profile_setup/select_interest_screen.dart';
import 'package:flameloop/app/screens/user_profile_setup/setup_profile_screen.dart';
import 'package:flameloop/app/screens/welcome_screen/splash_screen.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:get/get.dart';

import '../screens/auth_screens/getx_helper/auth_binding.dart';
import '../screens/auth_screens/mobile_auth_screen.dart';
import '../screens/chat_screens/StartNew_Chat.dart';

class RouteClass {
  static String getSlashScreen() => RoutePaths.splashScreen;

  static String getStartedScreen() => RoutePaths.getStarted;

  static String getMobileScreen() => RoutePaths.mobileAuthScreen;

  static String getSetUpProfileScreen() => RoutePaths.setUpProfile;

  static String getSelectInterestScreen() => RoutePaths.selectInterest;

  static String getMessageScreen() => RoutePaths.messageScreen;

  static String getStartNewChatScreen() => RoutePaths.startNewChatScreen;

  static String getChatScreen() => RoutePaths.ChatScreen;

  static String getHomeScreen() => RoutePaths.HomeScreen;



  static List<GetPage> routes = [
    GetPage(name: RoutePaths.splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: RoutePaths.mobileAuthScreen,
        page: () => const MobileAuthScreen(),
        binding: AuthBinding()),
    GetPage(
        name: RoutePaths.otpVerificationScreen,
        page: () => const OtpVerificationScreen()),
    GetPage(name: RoutePaths.setUpProfile, page: () => const SetUpProfile()),
    GetPage(name: RoutePaths.selectInterest, page: () => SelectInterest()),
    GetPage(name: RoutePaths.getStarted, page: () => const GetStarted()),
    GetPage(name: RoutePaths.messageScreen,page: ()=>Message_Screen()),
    GetPage(name: RoutePaths.startNewChatScreen, page: ()=>StartChat_Screen()),
    GetPage(name: RoutePaths.ChatScreen, page: ()=>Chat_Screen(userName: "user")),
    GetPage(name: RoutePaths.HomeScreen, page: ()=>HomeScreen()),


  ];
}
