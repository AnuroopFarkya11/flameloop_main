import 'package:flameloop/app/layouts/get_started.dart';
import 'package:flameloop/app/layouts/splash_screen.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/app_controller.dart';

void main() {
  Get.put<AppController>(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(




        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.white
          )
          )
        ),


      // initialRoute: RouteClass.getSlashScreen(),

      initialRoute: RoutePaths.splah_screen,
      getPages: RouteClass.routes,



    );

  }
}
