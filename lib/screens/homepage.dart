import 'package:animate_icons/animate_icons.dart';
import 'package:boliyeg/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../constants/sizer.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AnimateIconController c1 = AnimateIconController();

  bool onEndIconPress(BuildContext context) {
    setState(() {
      drawer=false;
    });
    return true;
  }

  bool onStartIconPress(BuildContext context) {
    setState(() {
      drawer=true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.12,
              child: const Center(
                  child: Text(
                name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              )),
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.03,
                      left: displayWidth(context) * 0.35),
                  child: GestureDetector(
                    onTap: () {
                      // ImagePicker image = ImagePicker();
                      // try {
                      //   XFile? filePath =
                      //       await image.pickImage(
                      //       source:
                      //       ImageSource.gallery);
                      //   print(filePath);
                      // } catch (e) {
                      //   print(e);
                      // }
                    },
                    child: Container(
                      width: displayWidth(context) * 0.3,
                      height: displayHeight(context) * 0.3,

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                          color: Colors.black12,
                          image: const DecorationImage(
                              image: NetworkImage(avatar))),
                      // height: displayHeight(context)*0.1,
                      // child: OutlinedButton(
                      //
                      //     onPressed:() {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ChatPage(
                      //             )),
                      //       );
                      //     },
                      //     child: const Text(outlineButton)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.3),
              //height: displayHeight(context) * 0.73,
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(90),
                      topLeft: Radius.circular(90))),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.9,
                  left: displayWidth(context) * 0.8),
              child: FloatingActionButton(
                elevation: 20.0,
                backgroundColor: Colors.black,
                child: const Icon(Icons.message_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.35,
                  left: displayWidth(context) * 0.05,
                  right: displayWidth(context) * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search by name",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black87,
                ),
              ),
            ),
            Column(
              children: [
                AnimatedContainer(
                        width:drawer
                            ?  displayWidth(context) * 0.5:0,
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ), duration: const Duration(seconds: 3),
                      ),
                drawer?Padding(
                  padding:  EdgeInsets.only(top: displayHeight(context)*0.5,right: displayWidth(context)*0.1),
                  child: Container(
                    child: Text("ghh",style: TextStyle(fontSize: 24),),
                  ),
                ):SizedBox(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.03),
              child: AnimateIcons(
                duration: const Duration(milliseconds: 300),
                startIcon: Icons.menu_rounded,
                endIcon: Icons.close_rounded,
                startIconColor: Colors.black,
                endIconColor: Colors.black,
                controller: c1,
                size: displayWidth(context) * 0.07,
                onEndIconPress: () => onEndIconPress(context),
                onStartIconPress: () => onStartIconPress(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
