import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ContentStrings.dart';

class SelectInterest extends StatelessWidget {
  const SelectInterest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ContentStrings.getSelectCatedoriesStr1,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: Colors.black,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search Categories",
                  hintStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ))),
            )
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: ElevatedButton(onPressed: (){},child: Text('Next',style: GoogleFonts.poppins(color: Colors.black),),),
      ),

    );
  }
}
