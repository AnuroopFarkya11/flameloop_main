import 'package:flameloop/ContentStrings.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends GetView<AppController>{
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "BEST SOCIAL MEDIA APP TO MAKE NEW FRIENDS"
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 0),
              child: Text(
                ContentStrings.getStartedstr1,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),

            // Next line
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 20, right: 20, bottom: 40),
              child: Text(
                ContentStrings.getStartedstr2,
                style:
                    GoogleFonts.poppins(color: const Color(0xffBDBCBC), fontSize: 15),
              ),
            ),

            //  Image
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/getstartedscreen/gettry.png")),

            const SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(onPressed: () {}, child: Text("Get Started"), ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RoutePaths.mobileAuthScreen);
          },
          child: const Text(
            "Get Started",
            style: TextStyle(color: Colors.black),
          ),
          // style: ElevatedButton.styleFrom(primary: Colors.white,),
        ),
      ),
    );
  }
}
