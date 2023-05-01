import 'dart:io';
import 'package:boliyeg/constants/sizer.dart';
import 'package:boliyeg/constants/strings.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (showEmoji) {
              setState(() {
                showEmoji = !showEmoji;
              });
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: Scaffold(
            body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  _chatInput(),
                  if (showEmoji)
                    SizedBox(
                      height: displayHeight(context) * 0.35,
                      child: EmojiPicker(
                        textEditingController: _textController,
                        config: Config(
                          bgColor: Colors.white,
                          columns: 9,
                          emojiSizeMax: 20 * (Platform.isAndroid ? 1.30 : 1.0),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _chatInput() {
    return Padding(
      padding: EdgeInsets.only(top: displayHeight(context) * 0.89),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          showEmoji = !showEmoji;
                        });
                      },
                      icon: const Icon(Icons.emoji_emotions_rounded)),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onTap: () {
                        if (showEmoji) {
                          setState(() {
                            showEmoji = !showEmoji;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Type Something ...",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(onPressed: () async {
                    ImagePicker image = ImagePicker();
                    try {
                      XFile? filePath =
                          await image.pickImage(
                          source:
                          ImageSource.gallery);
                      print(filePath);
                    } catch (e) {
                      print(e);
                    }
                  }, icon: const Icon(Icons.photo)),
                  IconButton(
                      onPressed: () async {
                        ImagePicker image = ImagePicker();
                        try {
                          XFile? filePath =
                              await image.pickImage(
                              source:
                              ImageSource.camera);
                          print(filePath);
                        } catch (e) {
                          print(e);
                        }
                      },
                      icon: const Icon(Icons.camera_alt_rounded)),
                  SizedBox(
                    width: displayWidth(context) * 0.02,
                  )
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 0,
            padding: EdgeInsets.only(top: 10, right: 5, left: 10, bottom: 10),
            shape: const CircleBorder(),
            color: Colors.white,
            child: const Icon(
              Icons.send,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
