import 'package:flameloop/app/widgets/interest_bubble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Work',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        //BACKGROUND
        color: Colors.black12,
        child: Column(
          children: [
            //    FOR YOU + FILTER BUTTON
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //   opportunities for you
                  Text(
                    'Opportunities for you',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),

                  // filter button
                  InkWell(
                    onTap: () {
                      // TODO: MAKE FILTER UI/LAYOUT
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Filter',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(Icons.filter_alt_outlined)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            Expanded(

              child: ListView.builder(itemCount: 4,itemBuilder: (context,index){
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    padding: EdgeInsets.all(5),

                    // constraints: BoxConstraints(
                    //   maxHeight: size.height * 0.25,
                    //     // minHeight: size.height * 0.15,
                    //     maxWidth: size.width,
                    //     minWidth: size.width),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //  Listtile + lastseen
                            Expanded(
                              // width: size.width * 0.5,
                                child: ListTile(
                                  dense: true,
                                  // visualDensity: VisualDensity(horizontal: -4),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/setupprofilescreen/avatar.png'),
                                        radius: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Anuroop Farkya',
                                            style: GoogleFonts.poppins(),
                                          ),
                                          Text(
                                            '1h ago',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black38),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),

                            // bubbles
                            Row(
                              children: [
                                Container(
                                  // constraints: BoxConstraints(maxHeight: 30),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.limeAccent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    'New',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(maxHeight: 30),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.limeAccent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    'Monthly',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // TITLE
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 2),
                          child: Text(
                            'Technical Co-Founder for my start-up',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                          ),
                        ),

                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Wrap(
                            runSpacing: 15,
                            spacing: 5,
                            children: List.generate(
                                5,
                                    (index) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/setupprofilescreen/avatar.png',
                                        height: 13,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('SQL')
                                    ],
                                  ),
                                )),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(color: Colors.grey[200],thickness: 2,),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text('WhatsApp',style: GoogleFonts.poppins(color: Colors.green),),
                        ),

                        SizedBox(height: 10,)




                      ],
                    ));
              }),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),

    );
  }
}
