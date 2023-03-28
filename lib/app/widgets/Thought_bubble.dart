import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThoughtBubble extends StatelessWidget {
  const ThoughtBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(alignment: Alignment.center,
        children: [

          Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/setupprofilescreen/avatar.png",),

              ),
              SizedBox(height: 10,),
              Text("User",style: GoogleFonts.poppins(),),
            ],

          ),
          Container(
            constraints: BoxConstraints(minWidth: 20,maxWidth: 70),
            decoration: BoxDecoration(
                color: Colors.blue,

                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hii! I am anuroop',overflow: TextOverflow.ellipsis,),
            ),
          ),
          // Container(
          //   width: 80,
          //   decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.primary,
          //
          //       borderRadius: BorderRadius.all(Radius.circular(15.0))
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text("I had a good day."),
          //   ),
          // )
        ],
      ),
    );
  }
}
