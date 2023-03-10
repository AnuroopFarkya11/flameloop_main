import 'package:firebase_core/firebase_core.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/services/firebase.dart';
import 'app/services/storage.dart';
import 'app/services/user.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<FirebaseFireStore>(FirebaseFireStore());
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<UserStore>(UserStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          )
        )
      ),
      initialRoute: RoutePaths.splashScreen,
      getPages: RouteClass.routes,
    );
  }
}
