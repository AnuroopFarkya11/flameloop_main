import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

addParticipants(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: Theme.of(context).colorScheme.primary),
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                // App bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Text(
                      textAlign: TextAlign.center,
                      "Add Participants",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          addParticipants(context);
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                Center(
                  child: Text("Add Participants!",style: TextStyle(color: Colors.white,fontSize: 30),),
                )


              ],

            ),
          ),

        );
      });
}
