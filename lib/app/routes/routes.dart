import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/screens/auth_screens/otp_verification_screen.dart';
import 'package:flameloop/app/screens/chat_screens/available_users.dart';
import 'package:flameloop/app/screens/chat_screens/getx_helper/chat_space_helper/chat_space_library.dart';
import 'package:flameloop/app/screens/chat_screens/getx_helper/recent_chat_helper/recent_chat_library.dart';
import 'package:flameloop/app/screens/chat_screens/recent_chat_screen.dart';
import 'package:flameloop/app/screens/home_screens/home_screen.dart';
import 'package:flameloop/app/screens/user_profile_setup/getx_helper/binding.dart';
import 'package:flameloop/app/screens/user_profile_setup/select_interest_screen.dart';
import 'package:flameloop/app/screens/user_profile_setup/setup_profile_screen.dart';
import 'package:flameloop/app/screens/welcome_screen/get_started.dart';
import 'package:flameloop/app/screens/welcome_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/auth_screens/getx_helper/auth_binding.dart';
import '../screens/auth_screens/mobile_auth_screen.dart';
import '../screens/chat_screens/chat_space_screen.dart';

class RouteClass {
  static String getSlashScreen() => RoutePaths.splashScreen;

  static String getStartedScreen() => RoutePaths.getStarted;

  static String getMobileScreen() => RoutePaths.mobileAuthScreen;

  static String getSetUpProfileScreen() => RoutePaths.setUpProfile;

  static String getSelectInterestScreen() => RoutePaths.selectInterest;

  static String getMessageScreen() => RoutePaths.messageScreen;

  static String getAvailableScreen() => RoutePaths.availableUserScreen;

  static String getHomeScreen() => RoutePaths.availableUserScreen;



  static List<GetPage> routes = [

    GetPage(
      name: RoutePaths.splashScreen,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: RoutePaths.mobileAuthScreen,
      page: () => const MobileAuthScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: RoutePaths.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
    ),

    GetPage(
      name: RoutePaths.setUpProfile,
      page: () => SetUpProfile(),
      binding: SetProfileBinding()
    ),

    GetPage(
      name: RoutePaths.selectInterest,
      page: () => const SelectInterest(),
    ),

    GetPage(
      name: RoutePaths.getStarted,
      page: () => const GetStarted(),
    ),

    GetPage(
      name: RoutePaths.recentChatScreen,
      page: () => const RecentChatScreen(),
      binding: ChatRoomBinding()
    ),

    GetPage(
      name: RoutePaths.chatScreen,
      page: () => const ChatSpace(),
      binding: ChatSpaceBinding()
    ),


    GetPage(
      name: RoutePaths.availableUserScreen,
      page: () => const AvailableUsers(),
      binding: ChatRoomBinding()
    ),
    GetPage(
        name: RoutePaths.homeScreen,
        page: () => const HomeScreen(),

    ),
  ];
}
