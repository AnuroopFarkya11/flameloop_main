import 'package:flameloop/app/Widgets/Chat_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartChat_Screen extends StatelessWidget {
  const StartChat_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Start new chat",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)),
              child: ListTile(
                leading: Icon(Icons.search),
                tileColor: Colors.white,
                title: Text(
                  "Search",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            Text("Releated User",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
            Expanded(
                child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return ChatUser(index: index);
                        })))
          ],
        ),
      ),
    );
  }
}
