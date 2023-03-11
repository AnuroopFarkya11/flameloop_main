import 'package:flameloop/ContentStrings.dart';
import 'package:flameloop/app/Widgets/input_textfields.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SetUpProfile extends GetView {
  const SetUpProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const StepProgressIndicator(
                  totalSteps: 4,
                  currentStep: 3,
                  selectedColor: Colors.white,
                  unselectedColor: Colors.white24,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/setupprofilescreen/titlepage.png",
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Content line Yay

                    Text(
                      ContentStrings.getSetUpProfileStr1,
                      style: GoogleFonts.poppins(
                          color: Colors.white60, fontSize: 15),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    // Content line 2
                    Text(
                      ContentStrings.getSetUpProfileStr2,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //  IMAGE AVATAR
                    GestureDetector(
                      onTap: () {
                        print("Add photos");
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 40,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                                "assets/setupprofilescreen/avatar.png"),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Input_TextField(
                      labelText: 'Name',
                      inputType: "text",
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Input_TextField(
                      labelText: 'Email',
                      inputType: "text",
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Input_TextField(
                      labelText: 'Something About you',
                      inputType: "text",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ContentStrings.getSetUpProfileStr3,
                        style: GoogleFonts.poppins(
                            color: Colors.white60, fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(RoutePaths.selectInterest);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Complete Setup",
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
