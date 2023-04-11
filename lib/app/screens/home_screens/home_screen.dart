import 'package:flameloop/app/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetView {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Work",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          Padding(
            //TODO WHATSAPP ICON
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.whatshot),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search_rounded),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.toNamed(RoutePaths.messageScreen);
              },
              icon: Icon(Icons.messenger_outline_rounded),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(
                icon: Icon(Icons.connect_without_contact_outlined),
                label: "Network",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: "Work"),

            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_rounded),
                label: "Nostification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),

          ],
          iconSize: 20.0,
          selectedItemColor: Colors.indigo,
          type: BottomNavigationBarType.fixed),
    );
  }
}
