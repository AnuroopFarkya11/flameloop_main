import 'dart:developer';
import 'dart:io';

import 'package:flameloop/app/screens/chat_screens/widgets/CommunityWidgets/add_Participitants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';



 String pickedImageSrc="";
createCommunity(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: Theme.of(context).colorScheme.primary),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      "New community",
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
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                // image picker
                GestureDetector(
                  onTap: () {
                    pickImageDialog(context);
                  },
                  child: CircleAvatar(
                    // child: Icon(Icons.camera, size: 30),
                    backgroundImage: pickedImageSrc==""?Image.asset("assets/addCommunity/takepicture.png",fit: BoxFit.fitWidth,).image:Image.file(File(pickedImageSrc)).image,
                    backgroundColor: Colors.transparent,
                    child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.add_circle,color: Colors.white,size: 32.0,)),
                    radius: 70.r,
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Community Name",
                      hintStyle: GoogleFonts.poppins(color: Colors.white30)),
                )
              ],
            ),
          ),
        );
      });
}

void pickImageDialog(context) async {
  showModalBottomSheet(backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                selectGalleryImage();
              }, child: Text("Gallery",style: TextStyle(color: Colors.black),)),
              ElevatedButton(onPressed: () {
                selectCameraImage();
              }, child: Text("Camera",style: TextStyle(color: Colors.black),),)
            ],
          ),
        );
      });

}

void selectCameraImage() async{

  XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
  if(file!=null)
  {
    log("Selected");
    await cropImage(file);

  }
  else
  {
    log("FAIL TO SELECT IMAGEE");
  }
  




}


void selectGalleryImage() async{
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

  if(file!=null)
    {
      log("Selected");
      await cropImage(file);
    }
  else
    {
      log("FAIL TO SELECT IMAGEE");
    }


}

cropImage(XFile file) async{

final croppedImage =await ImageCropper().cropImage(sourcePath: file.path,
cropStyle:CropStyle.circle,

);
if(croppedImage!=null)
  {
    imageCache.clear();
    pickedImageSrc = croppedImage.path;
    // todo call setstate
  }

}
