import 'dart:io';

import 'package:boliyeg/bubbles/bubble_normal.dart';
import 'package:boliyeg/bubbles/bubble_normal_audio.dart';
import 'package:boliyeg/bubbles/bubble_normal_image.dart';
import 'package:boliyeg/bubbles/bubble_special_one.dart';
import 'package:boliyeg/bubbles/bubble_special_three.dart';
import 'package:boliyeg/bubbles/bubble_special_two.dart';
import 'package:boliyeg/constants/sizer.dart';
import 'package:boliyeg/constants/strings.dart';
import 'package:boliyeg/date_chips/date_chip.dart';
import 'package:boliyeg/message_bar/message_bar.dart';
import 'package:boliyeg/screens/private_page.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // AudioPlayer audioPlayer = new AudioPlayer();
  // Duration duration = new Duration();
  // Duration position = new Duration();
  // bool isPlaying = false;
  // bool isLoading = false;
  // bool isPause = false;
  final _textController = TextEditingController();
final _chat=[{
  'isSender':false,'type':0,'msg':'hello'
}];
  @override
  Widget build(BuildContext context) {

    final now = new DateTime.now();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
         iconTheme: IconThemeData(color: Colors.black),
         title: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Container(
               width: displayWidth(context) * 0.1,
               height: displayHeight(context) * 0.1,
               decoration: BoxDecoration(
                   border: Border.all(color: Colors.black),
                   shape: BoxShape.circle,
                   color: Colors.black,
                   image: const DecorationImage(image: NetworkImage(avatar))),
             ),
             SizedBox(
               width: displayWidth(context)*0.02,
             ),
             Container(
               height: displayHeight(context) * 0.03,
               width: displayWidth(context)*0.5,
               child: Text(userName,style: TextStyle(color: Colors.black),),
             ),

           ],
         ),
         actions: [
           IconButton(
               onPressed: (){
                 Navigator.push(
                     context,
                     PageTransition(
                       alignment: Alignment.center,
                         type: PageTransitionType.rotate,
                         child: PrivatePage(),duration: Duration(milliseconds: 300)));
               },
               icon: Icon(Icons.lock_outline_rounded,color: Colors.black,))
         ],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView.builder(
                itemCount: _chat.length,
                itemBuilder: (context,index){
                  final chat=_chat.elementAt(index);
              return BubbleSpecialThree(
                  text: chat['msg']as String,
                color: const Color(0xFFE8E8EE),
                tail: true,
                isSender: chat['isSender']as bool,
              );
            }),
            MessageBar(
              onSend: (_) {
                _chat.add({
                  'isSender':true,'type':0,'msg':_
                });
                setState(() {

                });
              },
              actions: [
                // InkWell(
                //   child: Icon(
                //     Icons.photo,
                //     color: Colors.white,
                //     size: 24,
                //   ),
                //    onTap: () {  },
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.01),
                  child: InkWell(
                    child: const Icon(
                      Icons.emoji_emotions_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    onTap: ()  {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        showEmoji = !showEmoji;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.01,
                      right: displayWidth(context) * 0.01),
                  child: InkWell(
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    onTap: () async {

                      ImagePicker image = ImagePicker();
                      try {
                        XFile? filePath = await image.pickImage(
                            source: ImageSource.camera);
                        print(filePath);
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

// Widget _image() {
//   return Container(
//     constraints: BoxConstraints(
//       minHeight: 20.0,
//       minWidth: 20.0,
//     ),
//     child: CachedNetworkImage(
//       imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
//       progressIndicatorBuilder: (context, url, downloadProgress) =>
//           CircularProgressIndicator(value: downloadProgress.progress),
//       errorWidget: (context, url, error) => const Icon(Icons.error),
//     ),
//   );
// }
//
// void _changeSeek(double value) {
//   setState(() {
//     audioPlayer.seek(new Duration(seconds: value.toInt()));
//   });
// }
//
// void _playAudio() async {
//   final url =
//       'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
//   if (isPause) {
//     await audioPlayer.resume();
//     setState(() {
//       isPlaying = true;
//       isPause = false;
//     });
//   } else if (isPlaying) {
//     await audioPlayer.pause();
//     setState(() {
//       isPlaying = false;
//       isPause = true;
//     });
//   } else {
//     setState(() {
//       isLoading = true;
//     });
//     await audioPlayer.play(url);
//     setState(() {
//       isPlaying = true;
//     });
//   }
//
//   audioPlayer.onDurationChanged.listen((Duration d) {
//     setState(() {
//       duration = d;
//       isLoading = false;
//     });
//   });
//   audioPlayer.onAudioPositionChanged.listen((Duration p) {
//     setState(() {
//       position = p;
//     });
//   });
//   audioPlayer.onPlayerCompletion.listen((event) {
//     setState(() {
//       isPlaying = false;
//       duration = new Duration();
//       position = new Duration();
//     });
//   });
// }
}
//   final _textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: SafeArea(
//         child: WillPopScope(
//           onWillPop: () {
//             if (showEmoji) {
//               setState(() {
//                 showEmoji = !showEmoji;
//               });
//               return Future.value(false);
//             } else {
//               return Future.value(true);
//             }
//           },
//           child: Scaffold(
//             backgroundColor: Colors.black,
//             body: SingleChildScrollView(
//               reverse: true,
//               child: Column(
//                 children: [
//                   _chatInput(),
//                   if (showEmoji)
//                     SizedBox(
//                       height: displayHeight(context) * 0.35,
//                       child: EmojiPicker(
//                         textEditingController: _textController,
//                         config: Config(
//                           bgColor: Colors.white,
//                           columns: 9,
//                           emojiSizeMax: 20 * (Platform.isAndroid ? 1.30 : 1.0),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _chatInput() {
//     return Padding(
//       padding: EdgeInsets.only(top: displayHeight(context) * 0.89),
//       child: Row(
//         children: [
//           Expanded(
//             child: Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50)),
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           FocusScope.of(context).unfocus();
//                           showEmoji = !showEmoji;
//                         });
//                       },
//                       icon: const Icon(Icons.emoji_emotions_rounded)),
//                   Expanded(
//                     child: TextField(
//                       controller: _textController,
//                       keyboardType: TextInputType.multiline,
//                       maxLines: null,
//                       onTap: () {
//                         if (showEmoji) {
//                           setState(() {
//                             showEmoji = !showEmoji;
//                           });
//                         }
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Type Something ...",
//                         hintStyle: TextStyle(color: Colors.black),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   // IconButton(onPressed:
//                   // (){
//                   //
//                   // },
//                   //     icon:const Icon(Icons.add)),
//                   IconButton(onPressed: () async {
//                     ImagePicker image = ImagePicker();
//                     try {
//                       XFile? filePath =
//                           await image.pickImage(
//                           source:
//                           ImageSource.gallery);
//                       print(filePath);
//                     } catch (e) {
//                       print(e);
//                     }
//                   }, icon: const Icon(Icons.photo)),
//                   IconButton(
//                       onPressed: () async {
//                         ImagePicker image = ImagePicker();
//                         try {
//                           XFile? filePath =
//                               await image.pickImage(
//                               source:
//                               ImageSource.camera);
//                           print(filePath);
//                         } catch (e) {
//                           print(e);
//                         }
//                       },
//                       icon: const Icon(Icons.camera_alt_rounded)),
//                   SizedBox(
//                     width: displayWidth(context) * 0.02,
//                   )
//                 ],
//               ),
//             ),
//           ),
//
//           MaterialButton(
//             onPressed: () {},
//             minWidth: 0,
//             padding: const EdgeInsets.only(top: 10, right: 5, left: 10, bottom: 10),
//             shape: const CircleBorder(),
//             color: Colors.white,
//             child: const Icon(
//               Icons.send,
//               size: 28,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
