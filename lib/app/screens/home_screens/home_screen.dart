import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/widgets/Thought_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetView {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "FlameLoop",
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
        elevation: 0,
      ),
      body: Container(
        width: size.width,

        // root container
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            Container(
                width: size.width,
                // height: size.height * 0.25
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.15,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                // height: 50,
                                // width: 50,
                                padding: EdgeInsets.all(10),

                                // color: Colors.black,

                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage(
                                          "assets/setupprofilescreen/avatar.png"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Club Name")
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Discussions",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Wrap(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                            child: Text("Explore"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                            child: Text("My Discussions"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                            child: Text("Saved"),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Expanded(
                child: Container(
              color: Colors.white60,
              child: Container(
                color: Colors.white, 
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/setupprofilescreen/avatar.png"),
                      ),
                      title: Text("User user"),
                    ),
                    
                    
                    Text("What are the digital products we can sell")
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
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
