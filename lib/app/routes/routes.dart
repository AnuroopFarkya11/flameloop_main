import 'package:flameloop/app/screens/welcome_screen/get_started.dart';
import 'package:flameloop/app/screens/auth_screens/otp_verification_screen.dart';
import 'package:flameloop/app/screens/user_profile_setup/select_interest_screen.dart';
import 'package:flameloop/app/screens/user_profile_setup/setup_profile_screen.dart';
import 'package:flameloop/app/screens/welcome_screen/splash_screen.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:get/get.dart';

import '../screens/auth_screens/getx_helper/auth_binding.dart';
import '../screens/auth_screens/mobile_auth_screen.dart';

class RouteClass {
  static String getSlashScreen() => RoutePaths.splashScreen;

  static String getStartedScreen() => RoutePaths.getStarted;

  static String getMobileScreen() => RoutePaths.mobileAuthScreen;

  static String getSetUpProfileScreen() => RoutePaths.setUpProfile;

  static String getSelectInterestScreen() => RoutePaths.selectInterest;

  static List<GetPage> routes = [
    GetPage(name: RoutePaths.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: RoutePaths.mobileAuthScreen,
      page: () => const MobileAuthScreen(),
      binding: MobileAuthBinding()
    ),
    GetPage(
        name: RoutePaths.otpVerificationScreen,
        page: () => const OtpVerificationScreen()),
    GetPage(name: RoutePaths.setUpProfile, page: () => const SetUpProfile()),
    GetPage(
        name: RoutePaths.selectInterest, page: () => const SelectInterest()),
    GetPage(name: RoutePaths.getStarted, page: () => const GetStarted()),
  ];
}
