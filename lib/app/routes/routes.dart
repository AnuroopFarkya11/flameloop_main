import 'package:flameloop/app/layouts/enter_otp_screen.dart';
import 'package:flameloop/app/layouts/splash_screen.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:get/get.dart';
import 'package:flameloop/app/layouts/splash_screen.dart';

import '../layouts/mobile_number.dart';

class RouteClass{



  static String getSlashScreen()=>RoutePaths.splah_screen;
  static String getStartedScreen()=>RoutePaths.get_started;
  static String getMobileScreen()=>RoutePaths.get_Mobile;


  static List<GetPage> routes = [

    GetPage(name: RoutePaths.splah_screen, page:()=>const Splash_Screen()),
    GetPage(name: RoutePaths.get_Mobile, page: ()=>const GetMobile_Screen()),
    GetPage(name: RoutePaths.enter_Otp, page: ()=> const Enter_Otp_Screen())

  ];


}