import 'package:flutter/material.dart';
class ChatInput extends StatelessWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if(_imageUrl.isNotEmpty)
          //   Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Image.network(_imageUrl,height: 50,),
          //   ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {

                    // showModalBottomSheet(context: context, builder: (context){
                    //   return NetworkImagePickerBody(imagePicked: ImagePicked,);
                    // }
                    // );


                  }, icon: Icon(Icons.add, color: Colors.white)),
              Expanded(
                  child: TextField(
                    cursorColor: Colors.white,
                    // controller: widget.textEditingController,
                    // keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message',
                        hintStyle: TextStyle(
                            color: Colors.blueGrey, fontWeight: FontWeight.w400)),
                  )
              ),
              IconButton(
                  onPressed: () {
                    // onMessageSent();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ))
            ],
          ),


        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    );
  }
}
