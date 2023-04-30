import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/models/community_model/community_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class UserTile extends StatelessWidget {
  final ParticipantModel participant;

  const UserTile({Key? key, required this.participant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.r,
        child: participant.userProfile != ''
            ? CachedNetworkImage(
                imageUrl: participant.userProfile,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44.r),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container();
                },
              )
            : CircleAvatar(
                radius: 25.r,
                backgroundImage: const AssetImage(
                  'assets/setupprofilescreen/avatar.png',
                ),
              ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            participant.username,
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ],
      ),
      subtitle: Text(
        participant.userRole,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(color: Colors.black),
      ),
    );
    // return ListTile(
    //
    //   leading: CircleAvatar(
    //     backgroundImage: Image.asset("assets/setupprofilescreen/avatar.png").image,
    //     maxRadius: 20,
    //   ),
    //   title: Text("User Name"),
    //   subtitle: Text("Caption"),
    //   trailing: Icon(Icons.arrow_forward_ios_rounded),
    //   isThreeLine: true,
    //   iconColor: Colors.black,
    //   style: ListTileStyle.drawer,
    //
    //
    // );
  }
}
